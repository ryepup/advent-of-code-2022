(defpackage advent-2022
  (:use :cl :iterate))

(in-package :advent-2022)

(defun most-calories ()
  (iter (for line in-file "src/day1.txt" using #'read-line)
    (for calories = (parse-integer line :junk-allowed t))
    (if calories
        (summing calories into elf)
        (prog1
            (maximize elf)
          (setf elf 0)))))