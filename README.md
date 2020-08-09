# GameOfLife

Is a cellular automaton devised by the British mathematician John Horton Conway in 1970.
It is a zero-player game, meaning that its evolution is determined by its initial state,
requiring no further input.

![game_of_life](https://lh3.googleusercontent.com/proxy/rsTJcsWQEl4Oed7doi6S_egwZr2sm9HsrBZPATpyJgH8VopaUqO6rUAPkAEROyUZ4IXyCoWoRvAxFpmMNp2eSHKmcTQ3XkMsuLoLjX0tNnP8tHXvwfuyC7E2EbOAfVA)

## Running

Each game is started running `GameOfLife.Game.new(options)` where `options` is
a Keyword with the follow key/options:

| Options | Type | Required | Description |
| `:size` | `pos_integer` | `no` | The length of side the plan |

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `game_of_life` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:game_of_life, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/game_of_life](https://hexdocs.pm/game_of_life).
