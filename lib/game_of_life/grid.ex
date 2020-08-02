defmodule GameOfLife.Grid do
  @moduledoc """
    Define game plan
  """

  defstruct [:size, :cells]

  @type t :: %__MODULE__{
          size: pos_integer(),
          cells: tuple()
        }

  @doc """
  Build grid.
      iex> Grid.new 3
      %GameOfLife.Grid{
      cells: {{false, false, false}, {false, false, false}, {false, false, false}},
      size: 3
      }
  """
  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end

  @doc """
  Activate specified cell in the grid.
      iex> Grid.activate(grid, 1, 1)
      %GameOfLife.Grid{cells: {{true, false}, {false, false}}, size: 2}
  """
  def activate(grid, x, y) do
    change_cell_state(grid, x, y, true)
  end

  @doc """
    Deactivate specified cell in the grid.
      iex> Grid.activate(grid, 1, 1)
      %GameOfLife.Grid{cells: {{true, false}, {false, false}}, size: 2}
  """
  def deactivate(grid, x, y) do
    change_cell_state(grid, x, y, false)
  end

  defp change_cell_state(grid, x, y, value) do
    new_row =
      grid.cells
      |> elem(x - 1)
      |> put_elem(y - 1, value)

    cells = put_elem(grid.cells, x - 1, new_row)
    %__MODULE__{grid | cells: cells}
  end

  defp init_cells(size) do
    List.duplicate(false, size)
    |> List.to_tuple()
    |> List.duplicate(size)
    |> List.to_tuple()
  end
end
