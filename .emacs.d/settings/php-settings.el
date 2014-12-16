(defun set-up-wordpress ()
  (php-enable-wordpress-coding-style)
  (set (make-local-variable 'flymake-phpcs-standard) "WordPress-Core")
)

(defun set-up-pear ()
  (php-enable-pear-coding-style)
  (set (make-local-variable 'flymake-phpcs-standard) "PEAR")
)

(defun set-up-coding-style ()
  (flymake-mode 1)
  (c-set-style "linux")
  (flymake-phpcs-load)

  (let ((file (find-file-in-hierarchy (buffer-file-name) "wp-config.php")))
    (if file
        (set-up-wordpress)
      (set-up-pear)
    )
  )
)

(add-hook 'php-mode-hook 'set-up-coding-style)

(provide 'php-settings)
