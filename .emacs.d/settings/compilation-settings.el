; https://people.gnome.org/~federico/blog/compilation-notifications-in-emacs.html

(setq compilation-finish-functions
      (append compilation-finish-functions
              '(fmq-compilation-finish)))

(defun fmq-compilation-finish (buffer status)
  (call-process "notify-send" nil nil nil
                "-t" "0"
                "-i" "emacs"
                "Compilation finished in Emacs"
                status))

(provide 'compilation-settings)
