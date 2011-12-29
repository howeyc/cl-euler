;;; http://users.softlab.ece.ntua.gr/~ttsiod/euler31.html
(defun euler-31 ()
  (let ((target 200) (coins (make-array 8 :initial-element 0)) (matrix (make-array (list 201 8) :initial-element 0)))
    (setf (aref coins 0) 1)
    (setf (aref coins 1) 2)
    (setf (aref coins 2) 5)
    (setf (aref coins 3) 10)
    (setf (aref coins 4) 20)
    (setf (aref coins 5) 50)
    (setf (aref coins 6) 100)
    (setf (aref coins 7) 200)
    (loop for row from 0 to target
          do (setf (aref matrix row 0) 1))
    (loop for row from 0 to target
          do (loop for col from 1 to 7
                   do ( if(>= row (aref coins col))
                        (setf (aref matrix row col) (+ (aref matrix row (- col 1)) (aref matrix (- row (aref coins col)) col)))
                        (setf (aref matrix row col) (aref matrix row (- col 1))))))
    (aref matrix 200 7)))
