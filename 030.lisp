#!/usr/local/bin/sbcl --script
(defun string-to-number-list (str)
 (let ((lst nil))
  (do ((i 0 (+ 1 i)))
   ((>= i (length str)) lst)
    (push (parse-integer str :start i :end (+ 1 i)) lst))))
(defun number-to-number-list (num)
 (string-to-number-list (format nil "~A" num)))
(defun to-this-expt (exponent)
  (lambda (num)
    (expt num exponent)))
(defun sum-of-digits-to-power (num power)
 (apply #'+ (mapcar (to-this-expt power) (number-to-number-list num))))
(defun sum-of-digits-to-power-eql-num (num power)
 (eql num (sum-of-digits-to-power num power)))
(defun list-of-numbers-eql-sum-to-power (limit power)
 (let ((lst nil))
  (do ((i 2 (+ 1 i)))
   ((>= i limit) lst)
   (if (sum-of-digits-to-power-eql-num i power)
    (push i lst)))))
(defun euler ()
 (apply #'+ (list-of-numbers-eql-sum-to-power 1000000 5)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))
