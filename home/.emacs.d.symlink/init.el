; setup el-get and MELPA
;
;; Do not use package.el mechanism
;(package-initialize)

(when (file-exists-p "~/.secrets.el")
  (load "~/.secrets.el"))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq el-get-user-package-directory "~/.emacs.d/el-get-user/inits")

(setq my:el-get-packages
      '(
        ac-ghc-mod
        ac-js2
        ac-math
        ac-python
        amd-mode
        auctex
        auto-complete
        auto-complete-auctex
        ;auto-complete-css
        ;auto-complete-emacs-lisp ?deprecated?
        ;auto-complete-latex
        ;auto-complete-ruby
        ;auto-complete-yasnippet
        autopair
        coffee-mode
        ebib
        el-get
        erc
        evil
        evil-org-mode
        ;flyspell ;el-get installs a very old version
        full-ack
        go-mode
        goto-chg ;required for evil?
        gradle-mode
        groovy-emacs-mode
        ;haskell-mode
        init-loader
        js-pkg
        js2-mode
        js2-refactor
        json
        ;latex-pretty-symbols
        linum-off
        load-dir
        lorem-ipsum
        magit
        markdown-mode
        ;mvn
        org-mode
        python-mode
        racket-mode
        rainbow-delimiters
        ;reftex
        sbt-mode
        scala-mode
        semver
        smart-operator
        smartparens
        sml-mode
        smooth-scrolling
        ssh
        undo-tree
        yaml-mode
        yasnippet
        ))

(let ((local-init (format "~/.emacs.d/init-%s.el"
                          (car (split-string system-name "\\.")))))
  (if (file-exists-p local-init)
      (load local-init)))

(el-get-cleanup my:el-get-packages)
(el-get 'sync my:el-get-packages)

(require 'init-loader)
(setq init-loader-byte-compile t)
(init-loader-load "~/.emacs.d/inits")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-active-area-face ((t (:background "cyan"))))
 '(proof-locked-face ((t (:background "color-77"))))
 '(proof-queue-face ((t (:background "color-246")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(load-dir))
 '(safe-local-variable-values '((eval latex-pretty-symbols-mode t))))
