defprotocol GameOfLife.PetriDish do
  @moduledoc """
  Protocol Petri Dish
  """

  @spec active?(t, pos_integer(), pos_integer()) :: boolean
  def active?(petri_dish, x, y)

  @spec activate(t, pos_integer(), pos_integer()) :: t
  def activate(petri_dish, x, y)

  @spec deactivate(t, pos_integer(), pos_integer()) :: t
  def deactivate(petri_dish, x, y)
end
