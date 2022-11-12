(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "<S-tab>") 'org-indent-line)
            (define-key org-mode-map (kbd "<backtab>") 'org-indent-line)
            (flyspell-mode)
            (flyspell-buffer)))
