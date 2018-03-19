;------------------------;
;;;   elisp settings   ;;;
;------------------------;

(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'paredit-mode)

(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'rainbow-delimiters-mode)


(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)


(provide 'elisp-settings)
