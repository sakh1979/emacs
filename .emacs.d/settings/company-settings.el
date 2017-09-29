;--------------------;
;;;  Company Mode  ;;;
;--------------------;

(global-company-mode)

(setq company-dabbrev-ignore-case t
      company-show-numbers t)

; In case I don't want to wait
(global-set-key (kbd "C-:") 'company-complete)

(provide 'company-settings)
