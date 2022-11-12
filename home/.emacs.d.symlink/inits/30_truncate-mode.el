(defun truncate-mode ()
  "Enable line truncation for this buffer."
  (interactive)
  (if truncate-lines
      (progn (setq-local truncate-lines nil)
             (message "Truncate mode is off"))
    (setq-local truncate-lines t)
    (message "Truncate mode is on")))
