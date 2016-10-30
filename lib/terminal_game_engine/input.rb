module TerminalGameEngine
  class Input
    module Keys
      CTRL_C = ?\C-c
      ESCAPE = "\e"
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
