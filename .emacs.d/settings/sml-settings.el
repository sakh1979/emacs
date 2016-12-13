;--------------------;
;;;  Standard ML   ;;;
;--------------------;

(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))

(defun sk-sml-mode-hook ()
  "Local defaults for SML mode"
  (setq sml-indent-level 2)        ; conserve on horizontal space
  (setq words-include-escape t)    ; \ loses word break status
  (setq indent-tabs-mode nil))     ; never ever indent with tabs
(add-hook 'sml-mode-hook 'sk-sml-mode-hook)

(defun sk-inf-sml-mode-hook ()
  "Local defaults for inferior SML mode"
  (add-hook 'comint-output-filter-functions 'comint-truncate-buffer)
  (setq      comint-scroll-show-maximum-output t)
  (setq      comint-input-autoexpand nil))
(add-hook 'inferior-sml-mode-hook 'sk-inf-sml-mode-hook)


(provide 'sml-settings)
