defmodule GameOfLife.Game do
  @moduledoc """
  Module Game
  """

  defstruct [:world, :generation, :previous_generations]

  alias GameOfLife.Grid

  def new(options) do
    size = Keyword.get(options, :size, 32)

    grid = Grid.new(size)

    %__MODULE__{
      world: grid,
      generation: 1,
      previous_generations: []
    }
  end

  def advance_generation(game) do
    current_state = game.grid

    result =
      for x <- 1..size, y <- 1..size do
        current_state
        |> Grid.will_thrive?(x, y)
      end
  end
end
