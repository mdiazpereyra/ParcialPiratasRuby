source "bandos.rb"
source "pirata.rb"

class Barco
  def initialize(unaResistencia, unPoderDeFuego, unasMuniciones, unaTripulacion, unBando)
    @resistencia = unaResistencia
    @poderDeFuego = unPoderDeFuego
    @municiones = unasMuniciones
    @tripulacion = unaTripulacion
    @bando = unBando
    self.bonus
  end

  def capitan
    @tripulacion.max {|unTripulante, otroTripulante| unTripulante.poderDeMando <=> otroTripulante.poderDeMando}
  end

  def enfrentar(barco)
    if barco.fuerza > self.fuerza
      self.salirPerdedor(barco)
    else
      barco.salirPerdedor(self)
    end
end

  def fuerza
    @tripulacion.sum { |unTripulante| unTripulante.poderDeMando}
  end

  def salirPerdedor(barcoVencedor)
    self.herirTripulacion
    barcoVencedor.recibirTripulacionFuerte(self.tripulacionFuerte)
	@tripulacion.clear
    self.quedarDesolado
  end

  def herirTripulacion
    @tripulacion.each {|unTripulante| unTripulante.resultarHerido}
  end

  def tripulacionFuerte
    @tripulacion.select {|unTripulante| unTripulante.esFuerte?}
  end

  def recibirTripulacionFuerte(tripulantes)
    @tripulacion.concat(tripulantes)
  end

  def quedarDesolado
    @resistencia = 0
    @poderDeFuego = 0
    @municiones = 0
  end

  def dispararCanionazos(cantidad, barcoAtacado)
    if @municiones < cantidad
      raise "Error: cantidad de municiones menor a la cantidad que se quiere disparar."
    end
      @municiones -= cantidad
      barcoAtacado.recibirCanionazos(cantidad)
  end

  def recibirCanionazos(cantidad)
    @resistencia -= 50*cantidad
    @tripulacion.select {|unTripulante| !(unTripulante.estaCansado??)}
  end

  def bonus
    @bando.bonus(self)
  end

  def recibirBonusDeArmadaInglesa
    @municiones += @municiones*0.3
  end

  def recibirBonusDeUnionPirata
    @poderDeFuego += 60
  end

  def recibirBonusDeArmadaDelHolandesErrante
    @tripulacion.concat(@tripulacion)
  end

  def cambiarBando(nuevoBando)
    @bando = nuevoBando
    self.bonus
  end
end
