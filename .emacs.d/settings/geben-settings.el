;; http://www.dave-cohen.com/node/1000010
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)

;; This controls whether geben stops before running anything.
(setq geben-pause-at-entry-line nil)

;; geben won't connect because its "Already in debugging"  This might help.
(defun my-geben-release ()
  (interactive)
  (geben-stop)
  (dolist (session geben-sessions)
    (ignore-errors
      (geben-session-release session))))

(provide 'geben-settings)
