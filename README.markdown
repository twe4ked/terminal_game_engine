# TerminalGameEngine

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'terminal_game_engine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install terminal_game_engine

## Usage

``` ruby
require 'terminal_game_engine'

TerminalGameEngine.run do
  on_tick do |tick|
    width = tick.to_s.length
    height = 1
    frame = TerminalGameEngine::Frame.new width, height

    frame.draw 0, 0, tick.to_s

    on_input do |key_code|
      case key_code
      when TerminalGameEngine::Input::Keys::CTRL_C
        exit
      end
    end

    frame.render
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Origins

Most of this code was originally written as part of [hrdlr](https://github.com/twe4ked/hrdlr) at Railscamp by [@jasoncodes](https://github.com/jasoncodes), [@nathanaelkane](https://github.com/nathanaelkane), and [@twe4ked](https://github.com/twe4ked). It was then mostly copied into [snek](https://github.com/twe4ked/snek) by [@twe4ked](https://github.com/twe4ked) and then extracted into this gem.
