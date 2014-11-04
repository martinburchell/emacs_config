(add-hook 'php-mode-hook (lambda ()
                           (flymake-mode 1)
                           (c-set-style "linux")
                           (flymake-phpcs-load)))

(defun detect-wordpress ()
  (let ((file (find-file-in-hierarchy (buffer-file-name) "wp-config.php")))
    (when file
      (php-enable-wordpress-coding-style)
      (setq flymake-phpcs-standard "WordPress"))
))

(add-hook 'php-mode-hook 'detect-wordpress)

(provide 'php-settings)
