#!/usr/local/bin/sbcl --script
(defun primep (num)
  (do ((div 2 (+ div 1)))
    ((> div (sqrt num)) t)
    (if (eql (mod num div) 0) (return nil))))
(defun gen-prime-list (limit)
  (let ((lst nil))
    (do ((i 2 (+ 1 i)))
      ((>= i limit) lst)
      (if (primep i) 
        (push i lst)))))
(defun euler ()
  (apply #'+ (gen-prime-list 2000000)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~a" (euler)))
