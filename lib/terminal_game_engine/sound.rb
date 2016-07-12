module TerminalGameEngine
  class Sound
    def self.play(path)
      case RUBY_PLATFORM
      when /darwin/
        system "afplay #{path} &"
      when /linux/
        system "command -v mplayer >/dev/null 2>&1 && mplayer -msglevel all=-1 -nolirc #{path} &"
      end
    end
  end
end
