module TerminalGameEngine
  class Input
    module Keys
      CTRL_C = 3
      ESCAPE = 27
    end

    def self.call(&block)
      begin
        loop do
          key = $stdin.read_nonblock(1)
          block.call key
        end
      rescue Errno::EAGAIN
      end
    end
  end
end
