#!/usr/local/bin/sbcl --script
(defun primep (num)
  (do ((div 2 (+ div 1)))
    ((> div (sqrt num)) t)
    (if (eql (mod num div) 0) (return nil))))
(defun gen-prime-factor-list (n)
  (let ((lst nil))
    (do ((i 1 (+ 1 i)))
      ((or 
         (>= i (sqrt n))
         (eql (apply #'/ (cons n lst)) 1))
       lst)
      (if (and 
            (primep i) 
            (eql (mod n i) 0))
        (push i lst)))))
(defun euler ()
  (first (gen-prime-factor-list 600851475143)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~a" (euler)))
