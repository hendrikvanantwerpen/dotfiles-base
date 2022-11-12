(setq coq-one-command-per-line nil)
(setq proof-electric-terminator-enable t)
(setq proof-three-window-mode-policy 'hybrid)
(add-hook 'proof-mode-hook
         (lambda ()
           (setq overlay-arrow-string "")
           (define-key proof-mode-map "\C-c," 'proof-retract-until-point-interactive)
           (define-key proof-mode-map "\C-c." 'proof-assert-until-point-interactive)
           (proof-electric-terminator-toggle t)))
(add-hook 'proof-shell-mode-hook
         (lambda ()
           (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))
(add-hook 'proof-ready-for-assistant-hook
         (lambda ()
           (show-paren-mode 0)))
