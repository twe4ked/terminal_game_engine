module TerminalGameEngine
  class Engine
    attr_accessor :tick

    def self.tick(&block)
      self.new(&block).tap(&:call)
    end

    def initialize(&block)
      @tick = 0
      @block = block
    end

    def call
      loop do
        @block.call @tick
        @tick += 1
        sleep 0.1
      end
    end
  end
end
