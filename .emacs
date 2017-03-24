;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
(require 'magit-settings)

;; yasnippet
(require 'yasnippet-settings)

;; Helm
(require 'helm-settings)

;; Projectile
(require 'projectile-settings)

;; Company Mode
(require 'company-settings)

;; Org Mode
(require 'org-mode-settings)


;-----------;
;;; Modes ;;;
;-----------;

;; Markdown mode
(require 'markdown-settings)

;; Javascript
(require 'js-settings)

;; Clojure
(require 'clojure-settings)

;; YAML mode
(require 'yaml-settings)

;; Racket mode
(require 'racket-settings)

;; Ruby mode
(require 'ruby-settings)

;; SML mode
(require 'sml-settings)

;; Nyancat mode!
(nyan-mode 1)


;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
