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
      ((eq us them) 3)
      ((eq us (our-move them :win)) 6)
      (t 0))))

(defun decode-outcome (c)
  (ecase c
    ((#\X) :lose)
    ((#\Y) :draw)
    ((#\Z) :win)))

(defun read-guide (decoder)
  (iter (for line in-file "src/day2.txt" using #'read-line)
    (collect (cons (decode (char line 0))
                   (funcall decoder (char line 2))))))

(defun total-score ()
  (iter (for (them . us) in (read-guide #'decode))
    (sum (score them us))))

(defun our-move (them outcome)
  (ecase outcome
    (:draw them)
    (:win (ecase them
            (:rock :paper)
            (:paper :scissors)
            (:scissors :rock)))
    (:lose (ecase them
             (:rock :scissors)
             (:paper :rock)
             (:scissors :paper)))))

(defun total-score-outcome ()
  (iter (for (them . outcome) in (read-guide #'decode-outcome))
    (for us = (our-move them outcome))
    (sum (score them us))))