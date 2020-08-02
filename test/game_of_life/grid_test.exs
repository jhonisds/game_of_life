defmodule GameOfLife.GridTest do
  use ExUnit.Case, async: true

  alias GameOfLife.Grid

  @tag :done
  test "new/1 creates a grid with specified size" do
    size = 300
    grid = Grid.new(size)

    assert size === grid.size
  end

  @tag :done
  test "new/1 initiates a multidimensional array of size" do
    size = 3
    grid = Grid.new(size)

    expected_grid = {
      {false, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid === grid.cells
  end

  @tag :done
  test "activate/3 will give live to specifield cell" do
    size = 3

    grid =
      Grid.new(size)
      |> Grid.activate(1, 1)
      |> Grid.activate(2, 2)
      |> Grid.activate(3, 3)

    expected_grid = {
      {true, false, false},
      {false, true, false},
      {false, false, true}
    }

    assert expected_grid === grid.cells
  end
end
