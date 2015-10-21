;;;; maybe-hugs.asd

(asdf:defsystem #:maybe-hugs
  :version "1.0.0"
  :description "Conditional hugging implementation for Lisp"
  :author "Daijiro Wachi <daijiro.wachi@gmail.com>"
  :license "mit"
  :serial t
  :components ((:file "package")
               (:file "maybe-hugs" :depends-on ("package"))))
