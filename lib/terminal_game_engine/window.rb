module TerminalGameEngine
  class Window
    def self.rows
      $stdin.winsize[0]
    end

    def self.columns
      $stdin.winsize[1]
    end
  end
end
