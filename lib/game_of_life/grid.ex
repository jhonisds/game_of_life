defmodule GameOfLife.Grid do
  @moduledoc """
    Define game plan
  """

  defstruct [:size, :cells]

  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end

  defp init_cells(size) do
    List.duplicate(false, size)
    |> List.to_tuple()
    |> List.duplicate(size)
    |> List.to_tuple()
  end
end
