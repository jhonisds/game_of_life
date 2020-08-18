defmodule GameOfLife.World.MultidimensionalTupleTest do
  use ExUnit.Case, async: true

  alias GameOfLife.PetriDish
  alias GameOfLife.World.MultidimensionalTuple

  @tag :done
  test "new/1 creates a grid with specified size" do
    size = 300
    grid = MultidimensionalTuple.new(size)

    assert size === grid.size
  end

  @tag :done
  test "new/1 initiates a multidimensional array of size" do
    size = 3
    grid = MultidimensionalTuple.new(size)

    expected_grid = {
      {false, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid === grid.cells
  end

  @tag :done
  test "activate/3 will activate to specified cell" do
    size = 3

    grid =
      MultidimensionalTuple.new(size)
      |> PetriDish.activate(1, 1)
      |> PetriDish.activate(2, 2)
      |> PetriDish.activate(3, 3)

    expected_grid = {
      {true, false, false},
      {false, true, false},
      {false, false, true}
    }

    assert expected_grid === grid.cells
  end

  @tag :done
  test "deactivate/3 will deactivate to specified cell" do
    size = 3

    grid =
      MultidimensionalTuple.new(size)
      |> PetriDish.activate(1, 1)
      |> PetriDish.activate(2, 2)
      |> PetriDish.activate(3, 3)
      |> PetriDish.deactivate(2, 2)
      |> PetriDish.deactivate(3, 3)

    expected_grid = {
      {true, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid === grid.cells
  end
end
