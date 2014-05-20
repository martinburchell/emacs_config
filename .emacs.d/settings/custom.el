(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffers-menu-max-size 20)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vc-follow-symlinks t))

(if (equal system-name "lap-e330-mb") 
    (custom-set-faces
     '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 91 :width normal :foundry "b&h" :family "Lucida Sans Typewriter")))))
  (custom-set-faces
   '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 91 :width normal :foundry "B&H" :family "LucidaTypewriter"))))))
