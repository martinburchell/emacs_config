; http://www.emacswiki.org/emacs/KillingBuffers

(require 'midnight)
(setq clean-buffer-list-timer (run-at-time t 7200 'clean-buffer-list))

(provide 'midnight-settings)
