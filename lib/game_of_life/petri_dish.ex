defprotocol GameOfLife.PetriDishable do
  @moduledoc """
  Protocol Petri Dish
  """

  @spec active?(t, pos_integer(), pos_integer()) :: boolean
  def active?(petri_dish, x, y)

  def change_state(petri_dish, x, y, expected_state)

  @spec cells_to_analyze(t) :: [{pos_integer(), pos_integer()}]
  def cells_to_analyze(petri_dish)

  @spec active_neighbours(t, pos_integer(), pos_integer()) :: non_neg_integer()
  def active_neighbours(petri_dish, x, y)

  @spec clean(t) :: t
  def clean(petri_dish)
end

defmodule GameOfLife.PetriDish do
  @moduledoc """
  Module Petri dish.
  """
  def activate(t, x, y) do
    PetriDish.change_state(t, x, y, true)
  end

  def deactivate(t, x, y) do
    PetriDish.change_state(t, x, y, false)
  end
end
