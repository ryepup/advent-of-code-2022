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

(defun decode (c)
  (ecase c
    ((#\A #\X) :rock)
    ((#\B #\Y) :paper)
    ((#\C #\Z) :scissors)))

(defun score (them us)
  (+ (ecase us
       (:rock 1)
       (:paper 2)
       (:scissors 3))
     (cond
      ((eq them us) 3)
      ((or (and (eq them :rock) (eq us :paper))
           (and (eq them :paper) (eq us :scissors))
           (and (eq them :scissors) (eq us :rock))) 6)
      (t 0))))

(defun read-guide ()
  (iter (for line in-file "src/day2.txt" using #'read-line)
    (collect (cons (decode (char line 0))
                   (decode (char line 2))))))

(defun total-score ()
  (iter (for (them . us) in (read-guide))
    (sum (score them us))))