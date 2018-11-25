class Pirata
  def initialize(unaEnergia)
    @energia = unaEnergia
  end

  def poderDeMando
  end

  def tomarRonCon(pirata)
    @energia -= 50
  end

  def esFuerte?
    self.poderDeMando > 100
  end

  def resultarHerido
    @poderDePelea /= 2
  end

  def estaCansado?
    @energia < 20
  end
end


class Guerrero < Pirata
  def initialize(unaEnergia, unPoderDePelea, unaVitalidad)
    super(unaEnergia)
    @poderDePelea = unPoderDePelea
    @vitalidad = unaVitalidad
  end

  def poderDeMando
    @poderDePelea * @vitalidad
  end
end

class MonstruoHumanoide < Pirata
  @poderDePelea

  def initialize(unaEnergia, unPoderDePelea)
    super(unaEnergia)
    @poderDePelea = unPoderDePelea
  end

  def poderDeMando
    @poderDePelea
  end
end

class Navegador < Pirata
  def initialize(unaEnergia, unaInteligencia)
    super(unaEnergia)
    @inteligencia = unaInteligencia
  end

  def poderDeMando
    @inteligencia**2
  end

  def resultarHerido
    @inteligencia /= 2
  end
end

class Cocinero < Pirata
  def initialize(unaEnergia, unaMoral, unosIngredientes)
    super(unaEnergia)
    @moral = unaMoral
    @ingredientes = unosIngredientes
  end

  def poderDeMando
    @moral*@ingredientes.length
  end

  def tomarRonCon(pirata)
    super(pirata)
    self.perderIngrediente(@ingredientes.sample, pirata)
  end

  def perderIngrediente(unIngrediente, pirataLadron)
    pirataLadron.recibirIngrediente(unIngrediente)
    @ingredientes.delete(unIngrediente)
  end

  def resultarHerido
    @moral /= 2
  end
end

jackSparrow = Pirata.new(500)
class << jackSparrow
  def agregarCaracteristicas
    @poderDePelea = 200
    @inteligencia = 300
    @ingredientes = ["botellaDeRon"]
  end

  def poderDeMando
    @energia*@inteligencia*@poderDePelea
  end

  def tomarRonCon(pirata)
    @energia += 100
    pirata.tomarRonCon(self)
  end

  def recibirIngrediente(unIngrediente)
    @ingredientes.push(unIngrediente)
  end
end
jackSparrow.agregarCaracteristicas
