; set the el-get path, and create it if it doesn't exist
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

; add el-get to the load path, and install it if it doesn't exist
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

; packages to install
(setq 
 my-packages '(company-mode
               color-theme-solarized
               magit
               markdown-mode
               helm
               helm-descbinds
               helm-projectile
               js2-mode
               yasnippet
               cider
               paredit
               rainbow-delimiters
               projectile
               yaml-mode
               nyan-mode
               org-bullets
               ))

; first enable shallow clone, so we don't need to clone the entire
; history of every project
(setq el-get-git-shallow-clone t)

; then intsall!
(el-get 'sync my-packages)

(provide 'el-get-settings)
