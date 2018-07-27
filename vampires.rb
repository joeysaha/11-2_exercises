class Vampire

  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.create(name, age)
    new_vamp = self.new(name, age)
    @@coven << new_vamp
    new_vamp
  end

  def drink_blood
    @drank_blood_today = true
  end

  def blood?
    @drank_blood_today
  end

  def self.sunrise
    @@coven.delete_if { |vamp| vamp.blood? == false}
    # @@coven.reject { |vamp| @drank_blood_today == false}
  end

  def in_coffin
    @in_coffin = false
  end

  def drank_blood_today
    @drank_blood_today = false
  end

  def self.sunset
    @@coven.each do |vamp|
      # puts vamp
      # @drank_blood_today = false
      # @in_coffin = false
      vamp.in_coffin
      vamp.drank_blood_today
    end
  end

  def go_home
    @in_coffin = true
  end

  def self.all
    @@coven
  end
end

puts Vampire.all.inspect
vampire1 = Vampire.create("Dracula", 45)
puts Vampire.all.inspect
vampire2 = Vampire.create("Fangers", 423)
vampire3 = Vampire.create("Chompy", 34)
vampire4 = Vampire.create("The Count", 210)
vampire5 = Vampire.create("Vlad", 530)
puts Vampire.all.inspect
Vampire.sunset
puts Vampire.all.inspect
puts '................'
puts vampire3.inspect
vampire3.drink_blood
vampire4.go_home
puts Vampire.all.inspect
puts vampire3.inspect
vampire2.drink_blood
vampire5.drink_blood
Vampire.sunrise
puts Vampire.all.inspect
