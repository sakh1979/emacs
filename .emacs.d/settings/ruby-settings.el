;----------------;
;;;    Ruby    ;;;
;----------------;

(add-to-list
 'auto-mode-alist
 '("\\.\\(rb\\|Rakefile\\|Gemfile\\|Berksfile\\|Vagrantfile\\)\\'" . ruby-mode))

(setq ruby-indent-level 2
      ruby-indent-tabs-mode nil)

(add-hook 'ruby-mode 'superword-mode)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(provide 'ruby-settings)
