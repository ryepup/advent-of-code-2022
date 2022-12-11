(in-package :advent-2022)

(defstruct (section-assignment (:conc-name sa-))
  (start 0 :type integer :read-only t)
  (end 0 :type integer :read-only t))

(defmethod contains ((a section-assignment) (b section-assignment))
  (and (<= (sa-start a) (sa-start b))
       (>= (sa-end a) (sa-end b))))

(defmethod contains ((a section-assignment) (b integer))
  (<= (sa-start a) b (sa-end a)))

(defmethod overlaps ((a section-assignment) (b section-assignment))
  (or (contains a (sa-start b))
      (contains a (sa-end b))))

(defun parse-section-assignment (s)
  (let ((idx (position #\- s)))
    (make-section-assignment
      :start (parse-integer s :start 0 :end idx)
      :end (parse-integer s :start (+ idx 1)))))

(defun parse-assignment (line)
  (let ((idx (position #\, line)))
    (values
      (parse-section-assignment (subseq line 0 idx))
      (parse-section-assignment (subseq line (+ idx 1))))))

(defun day4-1 ()
  (iter (for line in-file "src/day4.txt" using #'read-line)
    (for (values a b) = (parse-assignment line))
    (counting (or (contains a b)
                  (contains b a)))))

(defun day4-2 ()
  (iter (for line in-file "src/day4.txt" using #'read-line)
    (for (values a b) = (parse-assignment line))
    (counting (or (overlaps a b)
                  (overlaps b a)))))