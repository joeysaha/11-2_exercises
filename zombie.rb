class Zombie

  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  #instance methods
  def initialize(spd, str)
    if spd > @@max_speed
      @speed = @@default_speed
    else
      @speed = spd
    end
    if str > @@max_strength
      @strength = @@default_strength
    else
      @strength = str
    end
  end

  def encounter
    # @randomzombie = @@horde[rand(@@horde.length)]
    # puts @randomzombie
    # puts @randomzombie.speed
    # puts @randomzombie.strength
    if self.outrun_zombie? == true
      puts "You got away."
    else
      if self.survive_attack? == false
        puts "You're dead."
      else
        @@horde << Zombie.new(@my_speed, @my_strength)
        puts "You're a zombie now."
      end
    end
  end

  def outrun_zombie?
    @my_speed = rand(@@max_speed)
    if @my_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    @my_strength = rand(@@max_strength)
    if @my_strength > @strength
      return true
    else
      return false
    end
  end

  #class methods
  def self.all
    @@horde
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def self.some_die_off
    rand(10).times { @@horde.delete_at(rand(@@horde.length)) }
  end

  def self.spawn
    rand(3..@@plague_level).times { @@horde << self.new(rand(@@max_speed), rand(@@max_strength)) }
  end

  def self.increase_plague_level
    @@plague_level += rand(2)
  end


end
# puts Zombie.all.inspect # []
# Zombie.new_day
# # Zombie.spawn
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
# zombierando = Zombie.all[rand(Zombie.all.length)]
# puts zombierando.inspect
# puts zombierando.encounter # You are now a zombie
# Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
# zombierandom = Zombie.all[rand(Zombie.all.length)]
# puts zombierandom.encounter # You are now a zombie

puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
