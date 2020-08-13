defmodule GameOfLife.World.MultidimensionalTuple do
  @moduledoc """
  Module Multidimensional
  """

  defstruct [:size, :cells]

  @type t :: %__MODULE__{
          size: pos_integer(),
          cells: tuple()
        }

  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end
end
