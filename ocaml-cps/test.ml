let t0 = Unix.time ()

let print_t f x = begin
  Printf.printf "(T+%d): " (int_of_float (Unix.time () -. t0));
  Printf.printf f x;
  print_newline ();
  flush stdout
end

let try_hug =
  Huggable.maybe_hug
    (print_t "Hugs for %s!")
    (print_t "Empathy for %s.")
    (print_t "You should first ask %s about hugs.")

let try_ask p =
  let p = Huggable.ask_if_hugs p in
  let ka = print_t "You asked %s about hugs!" in begin
    Huggable.maybe_hug ka ka ka p;
    p
  end

let p1 = Huggable.make "Anne"
let p2 = Huggable.make "Mister X"

let t0 = Unix.time ()
let _ = try_hug p1
let _ = try_hug p2
let p1 = try_ask p1
let _ = try_hug p1
let _ = try_hug p2
let _ = Unix.sleep 10
let p2 = try_ask p2
let _ = try_hug p1
let _ = try_hug p2
let _ = Unix.sleep 25
let _ = try_hug p1
let _ = try_hug p2
