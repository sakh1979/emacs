
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; color theme
(load-theme 'zenburn t)

(require 'faces)
(if (system-is-mac)
    (set-face-attribute 'default nil
			:foundry "apple"
			:family "Monaco"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 (if (system-is-mac)
     '(default ((t (:height 130 :foundry "apple" :family "Monaco"))))
   '(default ((t (:height 130 :family "DejaVu Sans Mono")))))

 ;; mark down
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 210))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 190))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 170))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 150))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :slant italic :weight bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :slant italic :weight normal))))
 '(markdown-math-face ((t (:inherit font-lock-string-face :slant italic))))

 ;; mode line
 '(mode-line ((t (:box nil))))
 '(mode-line-inactive ((t (:box nil)))))
