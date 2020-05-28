(defun ag-setup ()
  (call-process "update-ag-ignore.py" nil t)
  (setq ag-arguments '("-U" "--smart-case" "--stats"))
)

(add-hook 'ag-mode-hook 'ag-setup)

(provide 'ag-settings)
