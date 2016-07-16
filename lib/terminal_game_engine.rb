Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |f| require f }

module TerminalGameEngine
  class EngineProxy
    def initialize(tick_sleep: nil)
      @tick_sleep = tick_sleep
    end

    def on_tick(&block)
      TerminalGameEngine::Engine.tick *tick_args, &block
    end

    def on_input(&block)
      TerminalGameEngine::Input.call &block
    end

    private

    def tick_args
      args = []
      args << ({tick_sleep: @tick_sleep}) if @tick_sleep
      args
    end
  end

  def self.run(*args, &block)
    TerminalGameEngine::Frame.setup

    EngineProxy.new(*args).instance_eval &block
  end
end
