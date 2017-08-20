;----------------;
;;;  Racket    ;;;
;----------------;

(add-hook 'racket-mode-hook #'racket-unicode-input-method-enable)
(add-hook 'racket-mode-hook #'paredit-mode)
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook #'company-mode)
(add-hook 'racket-mode-hook #'racket-unicode-input-method-enable)

(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'paredit-mode)
(add-hook 'racket-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-repl-mode-hook #'company-mode)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)

(provide 'racket-settings)
