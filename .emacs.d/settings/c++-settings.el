(require 'flycheck-rtags)
;(require 'ac-rtags)

;; Optional explicitly select the RTags Flycheck checker for c++ major mode.
;; Turn off Flycheck highlighting, use the RTags one.
;; Turn off automatic Flycheck syntax checking rtags does this manually.
(defun my-cpp-setup ()
  "Configure flycheck-rtags for better experience."
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-check-syntax-automatically nil)
  (setq-local flycheck-highlighting-mode nil)

  (setq c-default-style "k&r" c-basic-offset 4)
)



(add-hook 'c++-mode-hook #'my-cpp-setup)

(provide 'c++-settings)
