defmodule GameOfLife.GameTest do
  use ExUnit.Case, async: true

  alias GameOfLife.{Game, Grid}

  @tag :done
  test "will_thrive/3 glider top" do
    size = 5

    game =
      Game.new(size)
      |> Grid.activate(3, 1)
      |> Grid.activate(4, 2)
      |> Grid.activate(2, 3)
      |> Grid.activate(3, 3)
      |> Grid.activate(4, 3)

    expected_result =
      Game.new(size)
      |> Grid.activate(2, 2)
      |> Grid.activate(4, 2)
      |> Grid.activate(3, 3)
      |> Grid.activate(4, 3)
      |> Grid.activate(3, 4)

    game_on_gen2 = Game.advance_generation(game)

    assert 1 == game.generation
    assert 2 == game_on_gen2.generation
    assert expected_result.world === game_on_gen2.world
    assert [{1, ^game.world}] === game_on_gen2.previous_generation
  end
end
