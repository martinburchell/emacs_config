; Some bits borrowed from https://github.com/jhamrick/emacs

; don't show the startup screen
(setq inhibit-startup-screen 1)

; always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)

(setq-default fill-column 80)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'general-settings)
