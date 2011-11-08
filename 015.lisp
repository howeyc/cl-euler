#!/usr/local/bin/sbcl --script
(let ((arr (make-array '(1 1))))
 (defun check-array-size (erow ecol)
   (if (not (equal (list (+ 1 erow) (+ 1 ecol)) (array-dimensions arr)))
    (setf arr (make-array (list (+ 1 erow) (+ 1 ecol))))))
  (defun unique-paths (srow scol erow ecol)
    (if (or 
          (> srow erow)
          (> scol ecol))
      0
      (if (and 
            (eql srow erow)
            (eql scol ecol))
        1
        (if (not (zerop (aref arr srow scol)))
          (aref arr srow scol)
          (setf (aref arr srow scol) (+ (unique-paths (+ 1 srow) scol erow ecol) (unique-paths srow (+ 1 scol) erow ecol))))))))
(defun euler ()
  (progn
    (check-array-size 20 20)
    (unique-paths 0 0 20 20)))
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))
