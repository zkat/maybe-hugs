import IO
require Cutie

cutie_person = %{:name => "Jonh",:accepts => true}
not_cutie_person = %{:name => "Mary",:accepts => false}

puts Cutie.hug(cutie_person)
puts Cutie.hug(not_cutie_person)
