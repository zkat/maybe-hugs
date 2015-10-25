This is the stub README.txt for the "maybe-hugs" project.

? (ql:register-local-projects)
NIL

? (ql:quickload "maybe-hugs")
To load "maybe-hugs":
  Load 1 ASDF system:
    maybe-hugs
; Loading "maybe-hugs"
[package maybe-hugs]
("maybe-hugs")

? (setq me (make-instance 'maybe-hugs:maybe-hug :accepts-hugs T))
#<MAYBE-HUGS:MAYBE-HUG #x302000D7BD4D>

? (maybe-hugs:hug me)
"HUG!"
NIL
