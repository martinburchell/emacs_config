(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(scroll-bar-mode (quote right))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 91 :width normal :foundry "B&H" :family "LucidaTypewriter")))))

; C editing
; (defun whitesmith-c-mode-common-hook () "Set default C style to Whitesmith."
;  (c-set-style "Whitesmith"))
; (setq c-mode-common-hook 'whitesmith-c-mode-common-hook)

(defconst my-c-style
  '(
    (c-basic-offset . 4)
    (c-comment-only-line-offset . 0)
     (c-offsets-alist . ((knr-argdecl-intro . +)
             (label . 0)
             (statement-cont . +)
             (substatement-open . 0)
             (block-open . 0)
             (statement-block-intro . +)
             (block-close . c-lineup-whitesmith-in-block)
             (inline-open . +)
             (defun-open . 0)
             (defun-block-intro . +)
             (defun-close . c-lineup-whitesmith-in-block)
             (brace-list-open . 0)
             (brace-list-intro . +)
             (brace-entry-open . c-indent-multi-line-block)
             (brace-list-close . c-lineup-whitesmith-in-block)
             (class-open . 0)
             (inclass . +)
             (class-close . -)
             (inexpr-class . 0)
             (extern-lang-open . +)
             (inextern-lang . c-lineup-whitesmith-in-block)
             (extern-lang-close . +)
             (namespace-open . +)
             (innamespace . c-lineup-whitesmith-in-block)
             (namespace-close . +)
             ))
     )
  "My programming style")

(defun set-my-c-style ()
  (c-add-style "my-c-style" my-c-style t)
  (setq tab-width 8)
  (setq indent-tabs-mode nil)
  )

(add-hook 'c-mode-hook 'set-my-c-style) 
(add-hook 'c++-mode-hook 'set-my-c-style) 

(require 'uniquify)

(defun pi-gdb () "gdb for palm"
        (interactive)
        (setq gdb-command-name "m68k-palmos-gdb")
        (call-interactively 'gdb))

(setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)
;;================================================ ============
;; minibuffer space completion
;;================================================ ============
(define-key minibuffer-local-filename-completion-map (kbd "SPC")
'minibuffer-complete-word)

(define-key minibuffer-local-must-match-filename-map (kbd "SPC")
'minibuffer-complete-word)

(global-set-key [C-tab] 'other-window)
(setq x-select-enable-clipboard t)

(add-to-list 'load-path "~/ace-jump-mode/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key "\M-g" 'goto-line)

