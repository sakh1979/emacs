;---------------;
;;;   magit   ;;;
;---------------;

(include-plugin "magit")
(require 'magit)

(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'magit-settings)
