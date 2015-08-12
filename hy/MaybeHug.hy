(defclass MaybeHug [object]
  [[--init-- (fn [self cutie]
    (setv self._cutie cutie)
    None)]
  [hug (fn [self]
    (if (callable (getattr self._cutie "hug" None))
      (.hug self._cutie)
      (print "Cutie prefers emphaty! ")))]])

(defclass Huggable [MaybeHug]
  [[hug (fn [self]
    (print "HUG!"))]])

(defclass Empathic [MaybeHug] [])

(do
  (setv kate (Empathic "kate"))
  (setv john (Huggable "john"))

(do
  (.hug kate)
  (.hug john))
