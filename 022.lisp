(defun get-file (filename)
  (with-open-file (file filename :direction :input)
    (loop for line = (read-line file nil)
          while line
          collect line)))
(defun open-names ()
  (get-file (make-pathname :directory '(:relative "")
                           :name "022-names"
                           :type "txt")))
(defun word-score (word)
  (let ((score 0) (alphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
    (do ((i 0 (+ i 1)))
      ((= i (length word)) score)
      (incf score (+ 1 (search (subseq word i (+ 1 i)) alphabet))))))
(defun list-score (input-list)
  (let ((score 0))
    (do ((i 0 (+ i 1)))
      ((= i (length input-list)) score)
      (incf score (* (+ i 1) (word-score (nth i input-list)))))))
(defun euler-22 ()
  (list-score (sort (open-names) #'string-lessp)))
