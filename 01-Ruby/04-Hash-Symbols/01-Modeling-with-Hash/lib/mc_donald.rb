def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  ingredients = {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130,
    "French fries" => 130,
    "Potatoes" => 130,
    "Coca" => 160,
    "Sprite" => 170
  }
  ingredients[burger] + ingredients[side] + ingredients[beverage]
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
   ingredients = {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130,
    "French fries" => 130,
    "Potatoes" => 130,
    "Coca" => 160,
    "Sprite" => 170
  }

  ingredients["Happy Meal"] = poor_calories_counter("Cheese Burger", "French fries", "Coca")
  ingredients["Best Of Big Mac"] = poor_calories_counter("Big Mac", "French fries", "Coca")
  ingredients["Best Of Royal Cheese"] = poor_calories_counter("Royal Cheese", "Potatoes", "Sprite")

  order = 0
  orders.each do |k|
    order += ingredients[k]
  end
  return order
end
