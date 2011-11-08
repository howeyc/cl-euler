#!/usr/local/bin/sbcl --script
(defun string-to-number-list (str)
 (let ((lst nil))
  (do ((i 0 (+ 1 i)))
   ((>= i (length str)) (reverse lst))
    (push (parse-integer str :start i :end (+ 1 i)) lst))))
(defun number-to-number-list (num)
 (string-to-number-list (format nil "~A" num)))
(defun primep (num)
  (do ((div 2 (+ div 1)))
    ((> div (sqrt num)) t)
    (if (eql (mod num div) 0) (return nil))))
(defun rotations (items &aux result)
  (if items
    (let ((var 0))
      (dotimes (x (length items) result)
        (progn
          (setf var (pop items))
          (push (cons var items) result)
          (setf items (append items (list var))))))
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
(defun circular-prime (num)
 (if (not (in-prime-array num))
  nil
  (let ((result t) (otherperms (lists-to-numbers (rotations (number-to-number-list num)))))
   (dolist (item otherperms result)
    (if (not (in-prime-array item))
     (setf result nil))))))
(defun list-of-circular-primes (limit)
  (progn
    (make-prime-array limit)
    (let ((result nil))
      (do ((i 2 (+ i 1)))
        ((>= i limit) result)
        (if (circular-prime i)
          (push i result))))))
(defun euler ()
 (length (list-of-circular-primes 1000000)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))
