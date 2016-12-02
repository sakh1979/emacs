;----------------;
;;;  Clojure   ;;;
;----------------;

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)

(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-mode-hook #'company-mode)

(provide 'clojure-settings)
