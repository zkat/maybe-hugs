import IO
require Cutie

cutie_person = %{:name => "Jonh",:accepts => true}
empathic_person = %{:name => "Mary",:accepts => false}

puts Cutie.hug(cutie_person)
puts Cutie.hug(empathic_person)
