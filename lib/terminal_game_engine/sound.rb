require 'open3'

module TerminalGameEngine
  class Sound
    def self.play(path, logger: Logger.new('/dev/null'))
      case RUBY_PLATFORM
      when /darwin/
        stdin, stdout, stderr, wait_thr = Open3.popen3('afplay', path)
      when /linux/
        stdin, stdout, stderr, wait_thr = Open3.popen3('command -v mplayer >/dev/null 2>&1 && mplayer -msglevel all=-1 -nolirc', path)
      end

      Thread.new do
        while line = stderr.readline
          logger.error line.chomp
        end
      end
    end
  end
end
