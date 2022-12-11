(in-package :advent-2022)

(defun readlines (path)
  (iter (for line in-file path using #'read-line)
    (collect line)))

(defun read-rucksacks ()
  (iter (for line in-file "src/day3.txt" using #'read-line)
    (for n = (/ (length line) 2))
    (collect (cons (subseq line 0 n)
                   (subseq line n)))))

(defun priority (c)
  "importance of each type of item in a sack"
  (let ((cc (char-code c)))
    (- cc (if (> cc (char-code #\a)) 96 38))))

(defun day3-1 ()
  (iter (for (a . b) in (read-rucksacks))
    (for item = (first (intersection (coerce a 'list) (coerce b 'list))))
    (sum (priority item))))

(defun day3-2 ()
  (iter (for (a b c) on (readlines "src/day3.txt") by #'cdddr) ; three rows at once
    (for item = (first (intersection (coerce a 'list)
                                     (intersection (coerce b 'list) (coerce c 'list)))))
    (sum (priority item))))