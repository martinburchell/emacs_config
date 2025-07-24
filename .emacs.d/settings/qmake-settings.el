(require 'qmake-mode)

(setq auto-mode-alist
      (append
       (list '("\\.pro" . qmake-mode)
	     '("\\.pri" . qmake-mode)
	     )
       auto-mode-alist))

(provide 'qmake-settings)
