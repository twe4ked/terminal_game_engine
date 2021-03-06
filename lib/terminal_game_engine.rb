Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |f| require f }

module TerminalGameEngine
  def self.run(*args, &block)
    TerminalGameEngine::Frame.setup(disable_cursor: false)

    EngineProxy.new(*args).instance_eval &block
  end
end
