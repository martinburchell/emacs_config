(add-hook 'php-mode-hook (lambda ()
                           (flymake-mode 1)
                           (c-set-style "linux")
                           (flymake-phpcs-load)))

(defun setup-wordpress ()
  (php-enable-wordpress-coding-style)
  (setq flymake-phpcs-standard "WordPress")
)

(defun setup-pear ()
  (php-enable-pear-coding-style)
  (setq flymake-phpcs-standard "PEAR")
)

(defun detect-wordpress ()
  (let ((file (find-file-in-hierarchy (buffer-file-name) "wp-config.php")))
    (if file
        (setup-wordpress)
      (setup-pear)
    )
  )
)

(add-hook 'php-mode-hook 'detect-wordpress)

(provide 'php-settings)
