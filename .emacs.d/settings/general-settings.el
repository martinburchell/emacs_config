; Some bits borrowed from https://github.com/jhamrick/emacs

; don't show the startup screen
(setq inhibit-startup-screen 1)

; always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)

; and if we do, display tabs as four spaces
(setq-default tab-width 4)

(setq-default fill-column 80)

(setq line-number-mode t)
(setq column-number-mode t)

(defun my-before-save-hook ()
  (when (not (string-equal buffer-file-name (expand-file-name "~/signature.txt" )))
    (delete-trailing-whitespace))

  ; Create any missing directories
  (when buffer-file-name
    (let ((dir (file-name-directory buffer-file-name)))
      (when (and (not (file-exists-p dir))
                 (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
        (make-directory dir t)
        )
      )
    )
)

(add-hook 'before-save-hook 'my-before-save-hook)

(desktop-save-mode 1)
(menu-bar-mode -1)

(provide 'general-settings)
