class Samochod
  attr_accessor :marka, :model, :rok
  def initialize(marka, model, rok)
    @marka=marka
    @model=model
    @rok=rok
  end

  def wyswietl
    puts "Marka: #{@marka}, Model: #{@model}, Rok: #{@rok}"
  end
end

class Ciezarowka < Samochod
  attr_accessor :ladownosc
  
  def initialize(marka,model,rok,ladownosc)
    super(marka,model,rok)
    @ladownosc=ladownosc
  end

  def wyswietl_ladownosc
    puts "Ladownosc: #{@ladownosc} kg"
  end
end

samochod1=Samochod.new("Peugot", "308", 2017)
samochod1.wyswietl
samochod1.marka="Toyota"
puts samochod1.marka
samochod1.wyswietl
ciezarowka1=Ciezarowka.new("Volvo", "FH16", 2020, 25000)
ciezarowka1.wyswietl
ciezarowka1.wyswietl_ladownosc
    