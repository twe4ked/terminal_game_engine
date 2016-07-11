module TerminalGameEngine
  class Engine
    DEFAULT_TICK_SLEEP = 0.1

    attr_accessor :tick, :tick_sleep

    def self.tick(*args, &block)
      self.new(*args, &block).tap(&:call)
    end

    def initialize(tick_sleep: DEFAULT_TICK_SLEEP, &block)
      @tick = 0
      @block = block
      @tick_sleep = tick_sleep
    end

    def call
      loop do
        @block.call @tick
        @tick += 1
        sleep tick_sleep
      end
    end
  end
end
