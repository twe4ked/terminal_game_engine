module TerminalGameEngine
  class Sound
    def self.play(sound)
      case RUBY_PLATFORM
      when /darwin/
        system "afplay assets/sounds/#{sound} &"
      when /linux/
        system "command -v mplayer >/dev/null 2>&1 && mplayer -msglevel all=-1 -nolirc assets/sounds/#{sound} &"
      end
    end
  end
end
