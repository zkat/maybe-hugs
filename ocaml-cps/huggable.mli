(*

Huggable:
  Some people (values) like hugs.
  Some people (values) do not.
  You should ask a person before you try to hug them.
  You should do different things depending on what you know about
    how they would like to be treated.
  You should check again to see if the answer has changed if it's
    been a while since you last asked.

*)

(* A data type to keep track of whether a person (value) is huggable, and
   whether they've been asked *)

type 'a t

(* make x
   Take a value x and return a Huggable.t for it *)

val make : 'a -> 'a t

(* ask_if_hugs h
   Take a Huggable.t and ask the value if they hug, and remember that
   in the new Huggable.t that is returned. *)

val ask_if_hugs : 'a t -> 'a t

(* maybe_hug kh ke ku h
   Given a Huggable.t h and three continuations:
     kh is a continuation called with h's value if h is huggable
     ke is a continuation called with h's value if h is empathetic
     ku is a continuation called with h's value if you haven't asked h recently
   Applies the appropriate continuation and returns the result. *)

val maybe_hug : ('a -> 'b) -> ('a -> 'b) -> ('a -> 'b) -> ('a t -> 'b)
