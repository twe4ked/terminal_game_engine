require_relative '../lib/terminal_game_engine'

TerminalGameEngine.run do
  on_tick do |tick|
    number = tick.to_s

    height = 3
    width = number.length + 2

    frame = TerminalGameEngine::Frame.new width, height

    # draw number
    frame.draw_center 1, number

    # draw corners
    frame.draw 0, 0, '+'
    frame.draw 0, height-1, '+'
    frame.draw width-1, 0, '+'
    frame.draw width-1, height-1, '+'

    on_input do |key|
      case key
      when 'q', TerminalGameEngine::Input::Keys::ESCAPE, TerminalGameEngine::Input::Keys::CTRL_C
        exit
      else
        frame.draw 0, 1, ' ' * (number.length + 1)
        frame.draw_center 1, key.chr
      end
    end

    frame.render
  end
end
