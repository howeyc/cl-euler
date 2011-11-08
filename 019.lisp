#!/usr/local/bin/sbcl --script
(defun sunday-on-first-of-month (curday)
  (multiple-value-bind
    (secs minute hour date month year day-of-week dst-p tz)
    (decode-universal-time curday)
    (if (and
          (eql 1 date)
          (eql 6 day-of-week))
      1
      0)))
(defun process-days (start end)
 (let ((sum 0))
  (do ((curday start (+ 86400 curday)))
   ((> curday end) sum)
   (setf sum (+ sum (sunday-on-first-of-month curday))))))
(defun euler ()
 (process-days (encode-universal-time 0 0 0 1 1 1901) (encode-universal-time 0 0 0 31 12 2000))
)
(defun output-to-screen (x)
  (write-line x))
(output-to-screen (format nil "~A" (euler)))
