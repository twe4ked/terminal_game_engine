Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |f| require f }

module TerminalGameEngine
  class EngineProxy
    def on_tick(&block)
      TerminalGameEngine::Engine.tick &block
    end
  end

  def self.run(&block)
    TerminalGameEngine::Frame.setup

    EngineProxy.new.instance_eval &block
  end
end
