(defun my-cpp-setup ()
  (require 'ccls)
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  (setq c-default-style "k&r" c-basic-offset 4)
  (lsp)
)



(add-hook 'c++-mode-hook #'my-cpp-setup)

(provide 'c++-settings)
