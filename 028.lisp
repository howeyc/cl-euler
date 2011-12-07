;; The Four corners:
;; n2 - 1(n - 1)     n2
;; n2 - 2(n - 1)     n2 - 3(n-1)
;; Total:
;; 4n2 - 6n + 6
(defun corner-total (dimension)
  (if (= dimension 1)
    1
    (+ (* 4 (* dimension dimension)) (* -6 dimension) 6)))
(defun all-corner-total (limit)
  (loop for n from 1 to limit by 2 
        sum (corner-total n)))
(defun euler-28 ()
  (all-corner-total 1001))
