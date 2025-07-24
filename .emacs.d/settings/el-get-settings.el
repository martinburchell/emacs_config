; set the el-get path, and create it if it doesn't exist
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

; add el-get to the load path, and install it if it doesn't exist
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

; packages to install
(setq
 my-packages '(ace-jump-mode
               ag
               apache-mode
               auto-complete
               ccls
               color-theme-solarized
               ein
               flycheck
               geben
               ghub
               git-timemachine
               graphql
               haml-mode
               jedi
               js2-mode
               lsp-mode
               lsp-ui
               magit
               magit-popup
               markdown-mode
               php-eldoc
               php-mode
               python-black
               pyvenv
               qmake-mode
               scss-mode
               sublime-themes
               transient
               virtualenvwrapper
               web-mode
               yaml-mode
               ))

; first enable shallow clone, so we don't need to clone the entire
; history of every project
(setq el-get-git-shallow-clone t)

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

; then install!
(el-get 'sync my-packages)

(provide 'el-get-settings)
