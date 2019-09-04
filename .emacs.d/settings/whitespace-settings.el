; https://github.com/p-lambert/emacs-dotfiles/blob/master/lisp/init-whitespace.el
(defun custom/toggle-whitespace-removal ()
  (interactive)
  (if (member 'delete-trailing-whitespace before-save-hook)
      (progn
        (remove-hook 'before-save-hook 'delete-trailing-whitespace)
        (message "Remove trailing whitespace DISABLED."))
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
    (message "Remove trailing whitespace ENABLED.")))

;; automatic whitespace removal
(custom/toggle-whitespace-removal)

(provide 'whitespace-settings)
