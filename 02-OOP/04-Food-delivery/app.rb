require_relative 'restaurant'
require_relative 'manager'
require_relative 'delivery_guy'
require_relative 'customer'
require_relative 'order'
require_relative 'view'
require_relative 'employee'

chez_tony = Restaurant.new("Chez Tony", "Little Italy", "555-444-333")
tony = Manager.new("Tony", "tonybg")
chez_tony.add_manager(tony)

giuseppe = DeliveryGuy.new("Giuseppe", "gigi")
chez_tony.add_delivery_guy(giuseppe)
pauli = DeliveryGuy.new("Pauli", "popo")
chez_tony.add_delivery_guy(pauli)

eugene = Customer.new("Eugène", "à l'angle de la 5ème")
chez_tony.add_customer(eugene)

lucabrazzi = Customer.new("Lucabrazzi", "à l'angle de la 5ème")
chez_tony.add_customer(lucabrazzi)

commande1 = Order.new(["calzon","regina"], eugene, giuseppe)
commande2 = Order.new(["calzon","calzon", "regina"], lucabrazzi, pauli)
chez_tony.add_order(commande1)
chez_tony.add_order(commande2)

view = View.new

chez_tony.delete_order(2)

puts view.display_orders(chez_tony)

