(add-hook 'js2-post-parse-callbacks
          (lambda()
            (amd-externs-setup)))
(amd-dojo-plugins-setup)
(ac-amd-dojo-completions-setup)
