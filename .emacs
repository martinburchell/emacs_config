; Some bits borrowed from https://github.com/jhamrick/emacs

; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")

;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

(require 'cl-settings)

;; define various custom functions
(require 'custom-functions)

; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

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

(defun split-horizontally-for-temp-buffers ()
       "Split the window horizontally for temp buffers."
       (when (and (one-window-p t)
     	     (not (active-minibuffer-window)))
         (split-window-horizontally)))


(setq show-paren-mode t)

(require 'flymake)

(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))

;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))

;; Fix tab complete from putting annoying spaces in gdb
(defun my-gud-gdb-setup ()
  (define-key (current-local-map) "\t" 'my-gud-gdb-complete-command))

(defun my-gud-gdb-complete-command (&optional COMMAND PREDICATE FLAGS)
  (interactive)
  (unless (comint-dynamic-complete-filename)
    (gud-gdb-complete-command COMMAND PREDICATE FLAGS)))

(add-hook 'gdb-mode-hook 'my-gud-gdb-setup)

;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
(require 'ido)
(ido-mode 1)

;; Markdown mode
(require 'markdown-settings)

;; Python mode
(require 'python-settings)

;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
