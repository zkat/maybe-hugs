#lang racket

(struct cuttie (name type))

(define (empathic a-name)
  (cuttie a-name 'Empathic))

(define (huggable a-name)
  (cuttie a-name 'Huggable))

(define (hug a-cuttie)
  (cond
       [(eq? (cuttie-type a-cuttie) 'Empathic) "Cutie prefers empathy!"]
       [(eq? (cuttie-type a-cuttie) 'Huggable) "HUG !"]))

(define katie (huggable 'katie))
(define john  (empathic 'john))

(println
  (hug katie))
(println
  (hug john))