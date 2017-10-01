;---------------------------;
;;;  Mode Line Settings   ;;;
;---------------------------;

(require 'spaceline-config)

(spaceline-emacs-theme)
(spaceline-helm-mode)
(spaceline-toggle-version-control-on)
(spaceline-toggle-line-column-on)

(setq powerline-default-separator 'arrow)
(setq powerline-height 25)
(setq powerline-default-separator 'utf-8)

(provide 'mode-line-settings)
