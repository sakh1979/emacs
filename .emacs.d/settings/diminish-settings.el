;------------------;
;;;   diminish   ;;;
;------------------;

(require 'diminish)

(diminish 'company-mode)
(diminish 'helm-mode)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode "()"))

(provide 'diminish-settings)
