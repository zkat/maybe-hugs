;;;; maybe-hugs.lisp

(in-package #:maybe-hugs)

(defclass maybe-hug ()
  ((accepts-hugs :accessor accepts-hugs
    :type boolean
    :initform nil
    :initarg :accepts-hugs)))

(defmethod hug ((m maybe-hug))
  (if (eql (accepts-hugs m) nil)
    (format t "Empathy!")
  (format t "HUG!")))
