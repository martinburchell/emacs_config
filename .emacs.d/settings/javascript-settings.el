(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(provide 'javascript-settings)
