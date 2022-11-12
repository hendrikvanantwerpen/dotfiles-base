(add-hook 'js2-mode-hook
          (lambda ()
            (setq ac-sources nil)
            (amd-mode)
            (ac-amd-setup)
            (auto-complete-mode)))
