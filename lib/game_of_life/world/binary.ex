defmodule GameofLife.World.Binary do
  @moduledoc """
  Module binary
  """
  defstruct [:size, :cells]

  @type t :: %__MODULE__{
          size: pos_integer(),
          cells: binary
        }

  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end

  defp init_cells(size) do
    area = size * size
    <<0::size(area)>>
  end
end

defimpl GameOfLife.PetriDish, for: GameOfLife.World.Binary do
  def activate(t, x, y) do
    position = x + t.size * (y - 1) - 1
    :binary.at(t.cells, position)
  end
end
