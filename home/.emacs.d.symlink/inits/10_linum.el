(when (require 'linum)
    (setq linum-format "%3d ")
    (global-linum-mode t)
    (setq line-number-mode t)
    (setq column-number-mode t)
    (setq linum-disabled-modes-list
          '(eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode doc-view-mode image-mode erc-mode)))
