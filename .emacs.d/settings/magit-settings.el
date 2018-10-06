;---------------;
;;;   magit   ;;;
;---------------;

(include-plugin "magit")
(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'magit-settings)
