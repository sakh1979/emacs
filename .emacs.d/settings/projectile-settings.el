;----------------;
;;; Projectile ;;;
;----------------;

(require 'projectile)
(require 'helm-projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; enable external indexing
(setq projectile-indexing-method 'alien)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'projectile-settings)
