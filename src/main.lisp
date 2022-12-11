(defpackage advent-2022
  (:use :cl :iterate))

(in-package :advent-2022)

(defun elf-calories ()
  (iter (for line in-file "src/day1.txt" using #'read-line)
    (for calories = (parse-integer line :junk-allowed t))
    (if calories
        (summing calories into elf)
        (prog1
            (collect elf)
          (setf elf 0)))))


(defun most-calories ()
  (apply #'max (elf-calories)))

(defun sum-of-top-3 ()
  (reduce #'+ (subseq (sort (elf-calories) #'>) 0 3)))