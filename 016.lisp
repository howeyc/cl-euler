#!/usr/local/bin/sbcl --script
(defun power (a b)
 (let ((result 1))
  (dotimes (i b result)
   (setf result (* result a)))))
(defun string-to-number-list (str)
 (let ((lst nil))
  (do ((i 0 (+ 1 i)))
   ((>= i (length str)) lst)
    (push (parse-integer str :start i :end (+ 1 i)) lst))))
(defun euler ()
 (apply #'+ (string-to-number-list (format nil "~A" (power 2 1000)))))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))