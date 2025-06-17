(defun flycheck-shell-setup ()
  (flycheck-select-checker 'sh-shellcheck)
  (flycheck-mode t)
)

(add-hook 'sh-mode-hook #'flycheck-shell-setup)

(provide 'shell-settings)
