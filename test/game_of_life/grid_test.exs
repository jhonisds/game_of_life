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
  test "activate/3 will activate to specified cell" do
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

  @tag :done
  test "deactivate/3 will deactivate to specified cell" do
    size = 3

    grid =
      Grid.new(size)
      |> Grid.activate(1, 1)
      |> Grid.activate(2, 2)
      |> Grid.activate(3, 3)
      |> Grid.deactivate(2, 2)
      |> Grid.deactivate(3, 3)

    expected_grid = {
      {true, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid === grid.cells
  end

  @tag :done
  test "will_thrive/3 glider will work as expected" do
    size = 5

    grid =
      Grid.new(size)
      |> Grid.activate_cell(3, 1)
      |> Grid.activate_cell(4, 2)
      |> Grid.activate_cell(2, 3)
      |> Grid.activate_cell(3, 3)
      |> Grid.activate_cell(4, 3)

    expected =
      Grid.new(size)
      |> Grid.activate(2, 2)
      |> Grid.activate(4, 2)
      |> Grid.activate(3, 3)
      |> Grid.activate(4, 3)
      |> Grid.activate(3, 4)

    result =
      for x <- 1..size, y <- 1..size do
        Grid.will_thrive?(grid, x, y)
      end

    result =
      result
      |> Enum.map(&List.to_tuple/1)
      |> List.to_tuple()

    assert expected.cells === result
  end
end
