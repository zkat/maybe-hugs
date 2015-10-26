(* A functional implementation of asking about and giving hugs. *)

(* When someone says it's OK to hug, that doesn't mean it's forever OK *)
type time = float
let reasonable_hug_limit = 30.0      (* seconds *)
let is_reasonably_timed t = (t +. reasonable_hug_limit) > Unix.time()

(* Possible kinds of huggability *)
type huggability =
  | Unknown
  | Empathetic
  | Huggable
      
(* Representation of what we know about a person's (value's) huggability. *)

type 'a t = 'a * huggability * time

(* If we've just met, we don't known if they accept hugs. *)

let make x = (x, Unknown, 0.0)

(* For some reason, values decide whether they're huggable based on
   the low bit of their hash. *)

let agrees_to_hugs x = (Hashtbl.hash x land 0x01) == 0x01

(* Ask if someone accepts hugs, and return the new state of our knowledge. *)

let ask_if_hugs (x, _, _) = 
  if agrees_to_hugs x
    then (x, Huggable, Unix.time())    (* keep track of when we asked *)
    else (x, Empathetic, Unix.time())

(* Do something different depending on what we know of whether a person
   accepts hugs. "kh" is called if they do, "ke" if they do not, and
   "ku" if we have not asked recently. *)

let maybe_hug kh ke ku = function
  | (x, Unknown, _) -> ku x
  | (x, Empathetic, t) when is_reasonably_timed t -> ke x
  | (x, Huggable, t) when is_reasonably_timed t -> kh x
  | (x, _, _) -> ku x                 (* you should ask again *)
