class TerminalGameEngine::EngineProxy
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
