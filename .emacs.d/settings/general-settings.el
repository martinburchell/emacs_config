; Some bits borrowed from https://github.com/jhamrick/emacs

; don't show the startup screen
(setq inhibit-startup-screen 1)

; always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)

(setq-default fill-column 80)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Create any missing directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

(desktop-save-mode 1)

(provide 'general-settings)
