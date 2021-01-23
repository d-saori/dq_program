class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    puts "#{@name} の攻撃!"

    damage = @offense - monster.defense / 2
    monster.hp -= damage
    monster.hp = 0 if monster.hp < 0
    
    puts "#{monster.name} に #{damage} のダメージを与えた!"
  end
end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(brave)
    puts "#{@name} の攻撃!"

    damage = @offense - brave.defense / 2
    brave.hp -= damage
    brave.hp = 0 if brave.hp < 0

    puts "#{brave.name} は #{damage} のダメージを受けた!"
  end
end

brave = Brave.new(name: "ゆうしゃ", hp: 238, offense: 203, defense: 129)
monster = Monster.new(name: "アークデーモン", hp: 210, offense: 140, defense: 80)
# monster = Monster.new(name: "シドー", hp: 250, offense: 255, defense: 255)

puts "#{monster.name} があらわれた!"

while brave.hp > 0 && monster.hp > 0
  brave.attack(monster)
  break if monster.hp <= 0

  monster.attack(brave)
  break if brave.hp <= 0

  puts <<~TEXT
  *=*=*=*=*=*=*=*=*=*=*
  【#{brave.name}】HP: #{brave.hp}
  【#{monster.name}】HP: #{monster.hp}
  *=*=*=*=*=*=*=*=*=*=*
  TEXT
end

puts <<~TEXT
*=*=*=*=*=*=*=*=*=*=*
【#{brave.name}】HP: #{brave.hp}
【#{monster.name}】HP: #{monster.hp}
*=*=*=*=*=*=*=*=*=*=*
TEXT
puts brave.hp > 0 ? "#{monster.name} をやっつけた!" : "#{brave.name} はしんでしまった!"