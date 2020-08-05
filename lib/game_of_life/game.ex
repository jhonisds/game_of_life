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
    current_state = game.world

    next_state =
      current_state
      |> Grid.cells_to_analize()
      |> Enum.filter(fn {x, y} -> will_thrive?(current_state, x, y) end)
      |> Enum.reduce(Grid.new(current_state.size), fn {x, y}, acc ->
        Grid.activate(acc, x, y)
      end)
  end

  def will_thrive?(world, x, y) do
    neighbours = Grid.active_neighbours(world, x, y)
    active? = active?(world, x, y)

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
