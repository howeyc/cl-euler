#!/usr/local/bin/sbcl --script
(defun permutations (items &aux result)
 (if items
  (dolist (item items result)
   (dolist (permutation (permutations (remove item items)))
    (push (cons item permutation) result)))
  '(nil)))
(defun list-to-number (lst)
 (let ((result 0))
 (do ((i (- (length lst) 1) (- i 1)) (j 0 (+ j 1)))
  ((eql j (length lst)) result)
  (setf result (+ result (* (expt 10 i) (nth j lst)))))))
(defun permutations-to-numbers (perms &aux result)
 (dolist (item perms result)
  (push (list-to-number item) result)))
(defun euler ()
 (nth 999999 (sort (permutations-to-numbers (permutations (list 0 1 2 3 4 5 6 7 8 9))) #'<)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))