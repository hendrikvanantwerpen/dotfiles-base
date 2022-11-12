(setq split-width-threshold 100) ; prefer horizontal splits
(define-key input-decode-map "\e[1;2A" [S-up]) ; fix xterm/console problem
(windmove-default-keybindings)
(winner-mode t)
