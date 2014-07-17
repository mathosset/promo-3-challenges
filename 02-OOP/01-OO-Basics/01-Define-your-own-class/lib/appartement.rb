class Appartement
  def initialize(ville, superficie, prix, vendu)
    @ville = ville
    @superficie = superficie
    @prix = prix
    @vendu = false
  end

  def vendu?
    return @vendu
  end

  def appartement_vendu
    @vendu = true
  end

end

first_appartement = Appartement.new("Paris", 70, 450000, false)
second_appartement = Appartement.new("Lille", 130, 280000, false)

first_appartement.appartement_vendu

puts first_appartement.vendu?