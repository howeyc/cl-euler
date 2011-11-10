#!/usr/local/bin/sbcl --script
(defun permutations (items &aux result)
 (if items
  (dolist (item items result)
   (dolist (permutation (permutations (remove item items)))
    (push (cons item permutation) result)))
  '(nil)))
(defun string-to-number-list (str)
 (let ((lst nil))
  (do ((i 0 (+ 1 i)))
   ((>= i (length str)) (reverse lst))
    (push (parse-integer str :start i :end (+ 1 i)) lst))))
(defun number-to-number-list (num)
 (string-to-number-list (format nil "~A" num)))
(defun make-number-list (limit)
 (let ((lst nil))
  (do ((i 0 (+ 1 i)))
   ((>= i limit) lst)
   (push i lst))))
(defun pandigitalp (num)
 (let ((lst (number-to-number-list num)))
  (dolist (digit (make-number-list (length lst)) t)
  (if (null (find digit lst))
   (return nil)))))
(defun weird-property-helper (lst index1 index2 index3)
 (+ 
  (* (nth index1 lst) 100) 
  (* (nth index2 lst) 10) 
  (* (nth index3 lst) 1)))
(defun weird-propertyp (lst)
 (let ((result t))
  (cond 
   ((not (zerop (mod (weird-property-helper lst 1 2 3) 2))) (setf result nil))
   ((not (zerop (mod (weird-property-helper lst 2 3 4) 3))) (setf result nil))
   ((not (zerop (mod (weird-property-helper lst 3 4 5) 5))) (setf result nil))
   ((not (zerop (mod (weird-property-helper lst 4 5 6) 7))) (setf result nil))
   ((not (zerop (mod (weird-property-helper lst 5 6 7) 11))) (setf result nil))
   ((not (zerop (mod (weird-property-helper lst 6 7 8) 13))) (setf result nil))
   ((not (zerop (mod (weird-property-helper lst 7 8 9) 17))) (setf result nil))
   (t result))))
(defun list-to-number (lst)
 (let ((result 0))
 (do ((i (- (length lst) 1) (- i 1)) (j 0 (+ j 1)))
  ((eql j (length lst)) result)
  (setf result (+ result (* (expt 10 i) (nth j lst)))))))
(defun euler ()
 (let ((panprimes nil))
  (dolist (item (permutations (list 0 1 2 3 4 5 6 7 8 9)) (apply #'+ panprimes))
   (if (weird-propertyp item)
    (push (list-to-number item) panprimes)))))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))
