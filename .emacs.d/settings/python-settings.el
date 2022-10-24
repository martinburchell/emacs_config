; Some bits borrowed from https://github.com/jhamrick/emacs

;------------------------;
;;; Python Programming ;;;
;------------------------;

;; -----------------------
;; python.el configuration
;; -----------------------

; from python.el
(require 'python)

;; ------------------
;; misc python config
;; ------------------

;; jedi python completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; https://archive.zhimingwang.org/blog/2015-04-26-using-python-3-with-emacs-jedi.html
(setq jedi:environment-root "jedi")
(when (load "jedi" t)
  (define-key jedi-mode-map (kbd "<C-tab>") nil))

(defun flycheck-python-setup ()
  (setq-default flycheck-disabled-checkers '(python-mypy python-pycompile python-pylint python-pyright))
  (flycheck-select-checker 'python-flake8)
  (flycheck-mode t)
)

(add-hook 'python-mode-hook #'flycheck-python-setup)

(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))

; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

(if window-system (set-python-path-from-shell-PYTHONPATH))

(setq auto-mode-alist
      (append
       (list '("\\.pyx" . python-mode))
       auto-mode-alist))

; keybindings
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c !") 'python-shell-switch-to-shell))
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))

(setq python-black-extra-args '("--line-length=79"))

(provide 'python-settings)
