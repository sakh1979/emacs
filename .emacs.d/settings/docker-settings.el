;----------------;
;;;  Docker    ;;;
;----------------;

(require 'dockerfile-mode)

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'docker-settings)
