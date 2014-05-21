; Some bits borrowed from https://github.com/jhamrick/emacs

; don't show the startup screen
(setq inhibit-startup-screen 1)

(setq-default fill-column 80)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'general-settings)
