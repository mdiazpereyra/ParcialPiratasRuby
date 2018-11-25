class Bando
  def bonus(barco)
  end
end

armadaInglesa = Bando.new
class << armadaInglesa
  def bonus(barco)
    barco.recibirBonusDeArmadaInglesa
  end
end

unionPirata = Bando.new
class << unionPirata
  def bonus(barco)
    barco.recibirBonusDeUnionPirata
  end
end

armadaDelHolandesErrante = Bando.new
class << armadaDelHolandesErrante
  def bonus(barco)
    barco.recibirBonusDeArmadaDelHolandesErrante
  end
end
