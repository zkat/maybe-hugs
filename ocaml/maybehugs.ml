type cuttie = Hug of string | Empathy of string

let empathic = Empathy "Cutie prefers empathy! "
let huggable = Hug "HUG !"

let hug = function
    (Hug(s))     -> s
  | (Empathy(s)) -> s

let katie = huggable ;;
let john = empathic ;;

print_endline (hug katie) ;;
print_endline (hug john) ;;
