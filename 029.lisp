#!/usr/local/bin/sbcl --script
(defun generate-list-to-expts(num start end)
  (if (> num end)
    nil
    (let ((lst nil))
      (do ((a start (+ 1 a)))
        ((> a end) (append (generate-list-to-expts (+ 1 num) start end) lst))
        (push (expt num a) lst)))))
(defun euler ()
 (length (sort (remove-duplicates (generate-list-to-expts 2 2 100)) #'<)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~a" (euler)))
