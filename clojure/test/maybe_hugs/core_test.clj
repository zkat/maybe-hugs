(ns maybe-hugs.core-test
  (:require [clojure.test :refer :all]
            [maybe-hugs.core :refer :all]))

(deftest hug-tests
  (testing "HuggableCutie likes hugs"
    (let [cutie (->HuggableCutie "Test")]
      (is (huggable? cutie))
      (is (= "Test gets a hug!" (hug cutie)))))
  (testing "EmpathicCutie doesn't want hugs"
    (let [cutie (->EmpathicCutie "Test")]
      (is (not (huggable? cutie)))
      (is (thrown? IllegalArgumentException (hug cutie))))))

(deftest empathy-tests
  (testing "EmpathicCutie likes empathy"
    (let [cutie (->EmpathicCutie "Test")]
      (is (not (huggable? cutie)))
      (is (= "Test is comforted by your empathy - thank you!" (empathy cutie)))))
  (testing "HuggableCutie doesn't want empathy"
    (let [cutie (->HuggableCutie "Test")]
      (is (huggable? cutie))
      (is (thrown? IllegalArgumentException (empathy cutie))))))
