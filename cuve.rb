class Cuve
  attr_accessor :nom, :quantite, :produits
  attr_reader :niveau_de_remplice, :activite_recent


  def initialize(nom, quantite)
    @nom = nom
    @quantite = quantite
    @activite_recent = {}
    @niveau_de_remplice = 0
  end

  # Manage products
  def traitments(produits)
    self.produits = produits
    ecrire_action('traitments')
  end


  # Add vine
  def remplisser(vine_count)
    if (niveau_de_remplice + vine_count) >  quantite
        raise 'Beacoup de vin'
    end

    self.niveau_de_remplice += vine_count
    ecrire_action('remplisser')
  end

  # Remove vine
  def soutirage(vine_count)
    if (niveau_de_remplice - vine_count) <  0
      raise 'Mal de vin'
    end

    self.niveau_de_remplice -= vine_count
    ecrire_action('soutirage')
  end

  # Transfer vine
  def transfert(cuve, vine_count)
    cuve.remplisser(vine_count)
    soutirage(vine_count)
  end


  def self.actions_duree
    {
      traitments: 10,
      remplisser: 10,
      soutirage:  10
    }
  end

  private

  attr_writer :niveau_de_remplice, :activite_recent

  def ecrire_action(action)
    self.activite_recent[action] = Time.now
  end

end

curve = Cuve.new('My curve', 100)

curve.traitments(['1', '2', '3'])

curve.remplisser(30)

curve.soutirage(10)


p curve