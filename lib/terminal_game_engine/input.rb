module TerminalGameEngine
  class Input
    def self.call(&block)
      begin
        loop do
          key = $stdin.read_nonblock(1).ord
          block.call key
        end
      rescue Errno::EAGAIN
      end
    end
  end
end
