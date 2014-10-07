(add-hook 'php-mode-hook (lambda ()
                           (flymake-mode 1)
                           (c-set-style "linux")
                           (php-enable-wordpress-coding-style)
                           (flymake-phpcs-load)
                           (setq flymake-phpcs-standard "WordPress")))

(provide 'php-settings)
