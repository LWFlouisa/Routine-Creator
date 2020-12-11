# This can learn a new rule, however I haven't figured out how to run each rule non procedurally.
routine_do      = File.readlines("data/possible_routines/routine_set.txt")
routine_perform = File.readlines("data/routines_to_perform/performances.txt")

## Increments a number, appending old automation routine above new routine for performing later.
number      = File.read("data/number/input.txt").strip.to_i
old_routine = File.read("data/archive/routines.txt")
new_routine = "\n\ndef routine_#{number}
  require "finitemachine"

  #{routine_do[number]}

  #{routine_perform[number]}
end

perform = routine_#{number}"

## Creates the script that performs the routines.
open("script.rb", "w") { |f|
  f.puts old_routine
  f.puts new_routine
}
