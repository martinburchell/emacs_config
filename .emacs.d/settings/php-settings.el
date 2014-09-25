(add-hook 'php-mode-hook (lambda ()
                           (flymake-mode 1)
                           (c-set-style "linux")
                           (php-enable-wordpress-coding-style)))

(provide 'php-settings)
