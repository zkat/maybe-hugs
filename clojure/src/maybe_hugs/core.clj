(ns maybe-hugs.core
  "Some cuties want hugs, some cuties just want empathy!"
  (:gen-class))

(defprotocol MaybeHuggable
  (huggable? [_] "Ask if they want a hug?"))

(defprotocol Huggable
  (hug [_] "Give them a hug!"))

(defprotocol Empathic
  (empathy [_] "Comfort them with empathy."))

(defrecord HuggableCutie [name]
  MaybeHuggable
  (huggable? [_] true)
  Huggable
  (hug [this] (str (:name this) " gets a hug!")))

(defrecord EmpathicCutie [name]
  MaybeHuggable
  (huggable? [_] false)
  Empathic
  (empathy [this] (str (:name this) " is comforted by your empathy - thank you!")))

(defn conditional-hug
  "Given a cutie, either hug them comfort them."
  [cutie]
  (if (huggable? cutie)
    (hug cutie)
    (empathy cutie)))

(defn cutie
  "Given a name, create a cutie who may or may not want hugs."
  [name]
  (let [cutie-maker (if (even? (rand-int 100)) ->HuggableCutie ->EmpathicCutie)]
    (cutie-maker name)))

(defn -main
  "I create cuties and try to hug them!"
  [& args]
  (if (seq args)
    (doseq [name args]
      (println (conditional-hug (cutie name))))
    (println "usage: lein run {list of cutie names}")))
