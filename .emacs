; Some bits borrowed from https://github.com/jhamrick/emacs

; path where settings files are kept

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/settings")

;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

(require 'cl-settings)

;; define various custom functions
(require 'custom-functions)

;; install dependencies with el-get
(require 'el-get-settings)

; configure general settings
(require 'general-settings)

; configure compilation settings
(require 'compilation-settings)

; configure whitespace settings
(require 'whitespace-settings)

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

(global-set-key "\M-g" 'goto-line)


(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2C" [S-right])
(define-key input-decode-map "\e[1;2D" [S-left])
(define-key input-decode-map "\e[1;2F" [S-end])
(define-key input-decode-map "\e[1;2H" [S-home])

(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])
(define-key input-decode-map "\e[1~" [C-home])
(define-key input-decode-map "\e[4~" [C-end])
(define-key input-decode-map "\e[1;5H" [C-home])
(define-key input-decode-map "\e[1;5F" [C-end])

(defun split-horizontally-for-temp-buffers ()
       "Split the window horizontally for temp buffers."
       (when (and (one-window-p t)
     	     (not (active-minibuffer-window)))
         (split-window-horizontally)))


(setq show-paren-mode t)

;; Fix tab complete from putting annoying spaces in gdb
(defun my-gud-gdb-setup ()
  (define-key (current-local-map) "\t" 'my-gud-gdb-complete-command))

(defun my-gud-gdb-complete-command (&optional COMMAND PREDICATE FLAGS)
  (interactive)
  (unless (comint-dynamic-complete-filename)
    (gud-gdb-complete-command COMMAND PREDICATE FLAGS)))

(add-hook 'gdb-mode-hook 'my-gud-gdb-setup)

;---------------;
;;; Utilities ;;;
;---------------;

;; silver searcher settings
(require 'ag-settings)

;; Auto complete
(require 'auto-complete-settings)

;; Geben
(require 'geben-settings)

;-----------;
;;; Modes ;;;
;-----------;

;; Ace jump mode
(require 'ace-jump-mode-settings)

;; C
(require 'c-settings)

;; C++
(require 'c++-settings)

;; Ido mode
(require 'ido)
(ido-mode 1)

;; Flycheck virtualenv
(require 'flycheck-virtualenv)

;; Javascript
(require 'javascript-settings)

;; Magit
(require 'magit-settings)

;; Markdown mode
(require 'markdown-settings)

;; Midnight mode
(require 'midnight-settings)

;; PHP mode
(require 'php-settings)

;; Python mode
(require 'python-settings)

;; SCSS mode
(require 'scss-settings)

;; Web mode
(require 'web-mode-settings)

;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
