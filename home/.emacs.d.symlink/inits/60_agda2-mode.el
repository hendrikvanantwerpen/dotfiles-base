(if (executable-find "agda-mode")
  (load-file (let ((coding-system-for-read 'utf-8))
                  (shell-command-to-string "agda-mode locate"))))
(when (require 'agda2-mode nil t)
  (defun my-agda2-mode-hook ()
    "Modify keys and input-mode for agda mode"
    (local-set-key (kbd "C-c .") 'agda2-goal-and-context-and-inferred)
    (local-set-key (kbd "C-c ,") 'agda2-goal-and-context)
    (local-set-key (kbd "C-c ?") 'agda2-show-goals)
    (local-set-key (kbd "C-c =") 'agda2-show-constraints)
    (local-set-key (kbd "C-c C-@") 'agda2-give)
    (add-hook 'evil-insert-state-entry-hook
              (lambda () (set-input-method "Agda")))
    (add-hook 'evil-insert-state-exit-hook
              (lambda () (set-input-method nil))))
  (add-hook 'agda2-mode-hook 'my-agda2-mode-hook))
