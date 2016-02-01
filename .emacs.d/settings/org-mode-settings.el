;--------------------;
;;;    Org Mode    ;;;
;--------------------;

;;; for org mode bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;; for org mode babel clojure
(require 'org)
(require 'ob-clojure)
(setq org-babel-clojure-backend 'cider)
(require 'cider)

;; enabling languages in org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (clojure . t)
   (emacs-lisp . t)
   (java . t)
   (sql . t)
   ))

(defvar sk/fixed-font-family
  (cond ((x-list-fonts "Source Code Pro") "Source Code Pro")
        ((x-list-fonts "Monaco")   "Monaco"))
  "My fixed width font based on what is installed, `nil' if not defined.")

(defvar sk/variable-font-tuple
  (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
        ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
        ((x-list-fonts "Verdana")         '(:font "Verdana"))
        ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
        (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro.")))
  "My variable width font available to org-mode files and whatnot.")

(defun org-src-color-blocks-light ()
  "Colors the block headers and footers to make them stand out more for lighter themes"
  (interactive)
  (custom-set-faces
   '(org-block-begin-line
    ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))
   '(org-block-background
     ((t (:background "#FFFFEA"))))
   '(org-block
     ((t (:background "#FFFFEA"))))
   '(org-block-end-line
     ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))))

(defun org-src-color-blocks-dark ()
  "Colors the block headers and footers to make them stand out more for dark themes"
  (interactive)
  (custom-set-faces
   '(org-block-begin-line
     ((t (:foreground "#008ED1" :background "#073642"))))
   '(org-block-background
     ((t (:background "#00141a"))))
   '(org-block
     ((t (:background "#00141a"))))
   '(org-block-end-line
     ((t (:foreground "#008ED1" :background "#073642"))))))


;;; -----------------------------------------------------------------
;;; org-beautify-theme starts here
(deftheme sk/org-theme "Sub-theme to beautify org mode")

(defun sk/change-theme ()
  "Changes the color scheme and reset the mode line."
  (funcall 'org-src-color-blocks-dark)

  (let* ((sk/fixed-font-tuple (list :font sk/fixed-font-family))
         (base-font-color     (face-foreground 'default nil 'default))
         (background-color    (face-background 'default nil 'default))
         (primary-color       (face-foreground 'mode-line nil))
         (secondary-color     (face-background 'secondary-selection nil 'region))
         (base-height         (face-attribute 'default :height))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces 'sk/org-theme
                            `(org-agenda-structure ((t (:inherit default :height 2.0 :underline nil))))
                            `(org-verbatim ((t (:inherit 'fixed-pitched :foreground "#aef"))))
                            `(org-table ((t (:inherit 'fixed-pitched))))
                            `(org-block ((t (:inherit 'fixed-pitched))))
                            `(org-block-background ((t (:inherit 'fixed-pitched))))
                            `(org-block-begin-line ((t (:inherit 'fixed-pitched))))
                            `(org-block-end-line ((t (:inherit 'fixed-pitched))))
                            `(org-level-8 ((t (,@headline ,@sk/variable-font-tuple))))
                            `(org-level-7 ((t (,@headline ,@sk/variable-font-tuple))))
                            `(org-level-6 ((t (,@headline ,@sk/variable-font-tuple))))
                            `(org-level-5 ((t (,@headline ,@sk/variable-font-tuple))))
                            `(org-level-4 ((t (,@headline ,@sk/variable-font-tuple
                                                          :height ,(round (* 1.1 base-height))))))
                            `(org-level-3 ((t (,@headline ,@sk/variable-font-tuple
                                                          :height ,(round (* 1.25 base-height))))))
                            `(org-level-2 ((t (,@headline ,@sk/variable-font-tuple
                                                          :height ,(round (* 1.5 base-height))))))
                            `(org-level-1 ((t (,@headline ,@sk/variable-font-tuple
                                                          :height ,(round (* 1.75 base-height))))))
                            `(org-document-title ((t (,@headline ,@sk/variable-font-tuple :height 1.5 :underline nil)))))))

(add-hook 'org-mode-hook 'sk/change-theme)

;;; org-beautify-theme.el ends here
;;; -----------------------------------------------------------------

(provide 'org-mode-settings)
