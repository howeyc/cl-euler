#!/usr/local/bin/sbcl --script
(let ((curinc 0) (lst (list 0)))
 (defun add-triangle-num ()
  (progn
   (setf curinc (+ 1 curinc))
   (push (+ curinc (first lst)) lst)))
 (defun get-latest-triangle()
  (first lst)))
(defun get-divisor-count (num)
  (let ((divcount 0) (limit num))
    (do ((i 1 (+ 1 i)))
      ((> i limit) divcount)
      (if (zerop (mod num i))
        (progn
          (setf divcount (+ 2 divcount))
          (setf limit (/ num i)))))))
(defun euler ()
  (progn
    (loop while (< (get-divisor-count (get-latest-triangle)) 500) do (add-triangle-num))
    (get-latest-triangle)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~a" (euler)))
