defmodule GameOfLife.World.Set do
  @moduledoc """
  Module Set.
  """
  defstruct [:size, :cells]

  @type t :: %__MODULE__{
          size: pos_integer(),
          cells: Set.t()
        }

  def new(size) do
    %__MODULE__{
      size: size,
      cells: MapSet.new()
    }
  end
end
