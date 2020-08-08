defmodule GameOfLife.Game do
  @moduledoc """
  Module Game
  """
  alias GameOfLife.Grid

  defstruct [:world, :generation, :previous_generations]

  def new(options) do
    size = Keyword.get(options, :size, 32)

    grid = Grid.new(size)

    %__MODULE__{
      world: grid,
      generation: 1,
      previous_generations: []
    }
  end

  def activate_cell(game, x, y) do
    %{game | world: Grid.activate(game.world, x, y)}
  end

  def advance_generation(game) do
    current_state = game.world

    next_state =
      current_state
      |> Grid.cells_to_analyze()
      |> Enum.filter(fn {x, y} -> will_thrive?(current_state, x, y) end)
      |> Enum.reduce(Grid.new(current_state.size), fn {x, y}, acc ->
        Grid.activate(acc, x, y)
      end)

    %__MODULE__{
      world: next_state,
      generation: game.generation + 1,
      previous_generations: [{game.generation, current_state} | game.previous_generations]
    }
  end

  def will_thrive?(world, x, y) do
    neighbours = Grid.active_neighbours(world, x, y)
    active? = Grid.active?(world, x, y)

    cond do
      active? and neighbours < 2 ->
        false

      active? and neighbours > 3 ->
        false

      not active? and neighbours == 3 ->
        true

      active? and neighbours in 2..3 ->
        true

      not active? ->
        false
    end
  end
end
