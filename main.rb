require './character.rb'
require './brave.rb'
require './monster.rb'

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