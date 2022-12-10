(defpackage "advent-2022/tests"
  (:use :cl
        :advent-2022
        :fiveam))
(in-package "advent-2022/tests")

(in-suite* :advent-2022)

(test do-tests-work
      (is (= 2 (+ 1 1))))