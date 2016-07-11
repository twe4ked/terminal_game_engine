require 'logger'
require 'socket'
require 'yaml'

module TerminalGameEngine
  class Network
    PORT = 47357

    attr_reader :logger

    def initialize(logger: Logger.new('/dev/null'))
      @logger = logger
    end

    def open_socket
      @socket = UDPSocket.new
      @socket.bind '0.0.0.0', PORT
      @socket.setsockopt Socket::SOL_SOCKET, Socket::SO_REUSEADDR, true
      @socket.setsockopt Socket::SOL_SOCKET, Socket::SO_BROADCAST, true
    rescue Errno::EADDRINUSE
      $stderr.puts "Game is already running."
      exit 1
    end

    def receive_updates(&block)
      loop do
        begin
          data, addr = @socket.recvfrom_nonblock 8192
          data = YAML.load(data)
          block.call(data)
        rescue Psych::SyntaxError => error
          logger.error error
        end
      end
    rescue Errno::EAGAIN
    end

    def send_update(data)
      data = data.merge(hostname: hostname)

      begin
        @socket.send data.to_yaml, 0, '255.255.255.255', PORT
      rescue Errno::EHOSTUNREACH, Errno::ENETUNREACH, Errno::EMSGSIZE, Errno::ENETDOWN => error
        logger.error error
      end
    end

    def hostname
      @hostname ||= `hostname -s`.strip
    end
  end
end
