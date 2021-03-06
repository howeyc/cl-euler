#!/usr/local/bin/sbcl --script
(defun string-to-number-list (str)
 (let ((lst nil))
  (do ((i 0 (+ 1 i)))
   ((>= i (length str)) (reverse lst))
    (push (parse-integer str :start i :end (+ 1 i)) lst))))
(defun number-to-number-list (num)
 (string-to-number-list (format nil "~A" num)))
(defun primep (num)
 (if (eql num 1)
  nil
  (do ((div 2 (+ div 1)))
    ((> div (sqrt num)) t)
    (if (eql (mod num div) 0) (return nil)))))
(defun truncates-from-left (items &aux result)
  (if items
    (dotimes (x (length items) result)
      (progn
        (pop items)
        (if (not (null items))
        (push items result))))
    '(nil)))
(defun truncates-from-right (items &aux result)
  (if items
   (let ((ritems (reverse items)))
    (dotimes (x (length items) result)
      (progn
        (pop ritems)
        (if (not (null ritems))
        (push (reverse ritems) result)))))
    '(nil)))
(defun list-to-number (lst)
 (let ((result 0))
 (do ((i (- (length lst) 1) (- i 1)) (j 0 (+ j 1)))
  ((eql j (length lst)) result)
  (setf result (+ result (* (expt 10 i) (nth j lst)))))))
(defun lists-to-numbers (perms &aux result)
 (dolist (item perms result)
  (push (list-to-number item) result)))
(let ((primearr (make-array 1)))
 (defun make-prime-array (limit)
  (progn
   (setf primearr (make-array limit))
   (do ((i 0 (+ 1 i)))
    ((>= i limit) primearr)
    (if (primep i)
     (setf (aref primearr i) 1)))))
 (defun in-prime-array (num)
  (eql (aref primearr num) 1)))
(defun truncatable-prime (num)
 (if (not (in-prime-array num))
  nil
  (let ((result t) (otherperms (lists-to-numbers (append (truncates-from-left (number-to-number-list num)) (truncates-from-right (number-to-number-list num))))))
   (dolist (item otherperms result)
    (if (not (in-prime-array item))
     (setf result nil))))))
(defun list-of-truncatable-primes (limit)
  (progn
    (make-prime-array limit)
    (let ((result nil))
      (do ((i 11 (+ i 1)))
        ((>= i limit) result)
        (if (truncatable-prime i)
          (push i result))))))
(defun euler ()
 (apply #'+ (list-of-truncatable-primes 1000000)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))
