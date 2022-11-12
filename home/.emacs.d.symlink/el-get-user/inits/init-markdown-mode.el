(add-hook 'markdown-mode-hook
          (lambda ()
            (define-key markdown-mode-map (kbd "<S-tab>") 'markdown-indent-line)
            (define-key markdown-mode-map (kbd "<backtab>") 'markdown-indent-line)
            (flyspell-mode)
            (flyspell-buffer)))
