(setenv "PAGER" "cat")

(setq eshell-scroll-to-bottom-on-input 'all
      eshell-error-if-no-glob t
      eshell-hist-ignoredups t
      eshell-save-history-on-exit t
      eshell-prefer-lisp-functions nil)

(add-hook 'eshell-mode-hook (lambda ()
    (add-to-list 'eshell-visual-commands "ssh")
    (add-to-list 'eshell-visual-commands "tail")
    (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (if (> (length git-output) 0)
          (concat " :" (substring git-output 0 -1))
        "(no branch)"))))

(defun pwd-replace-home (pwd)
  "Replace home in PWD with tilde (~) character."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun pwd-shorten-dirs (pwd)
  "Shorten all directory names in PWD except the last two."
  (let ((p-lst (split-string pwd "/")))
    (if (> (length p-lst) 2)
        (concat
         (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                               (substring elm 0 1)))
                    (butlast p-lst 2)
                    "/")
         "/"
         (mapconcat (lambda (elm) elm)
                    (last p-lst 2)
                    "/"))
      pwd)))  ;; Otherwise, we just return the PWD


(defun split-directory-prompt (directory)
  (if (string-match-p ".*/.*" directory)
      (list (file-name-directory directory) (file-name-base directory))
    (list "" directory)))

(defun ruby-prompt ()
  "Returns a string (may be empty) based on the current Ruby Virtual Environment."
  (let* ((executable "~/.rvm/bin/rvm-prompt"))
    (if (file-exists-p executable)
        ;; Need to trim the carriage return, but re-add a space:
        (string-trim (shell-command-to-string executable)))))

(defun python-prompt ()
  "Returns a string (may be empty) based on the current Python Virtual Environment."
  (when (functionp #'pyenv-mode-version)
      ;; Need to trim the carriage return, but re-add a space:
    (concat "Py:" (pyenv-mode-version))))

(setq eshell-prompt-function
      (lambda ()
        (let* ((directory (split-directory-prompt
                           (pwd-shorten-dirs
                            (pwd-replace-home (eshell/pwd)))))
               (parent (car directory))
               (name (cadr directory))
               (branch (or (curr-dir-git-branch-string (eshell/pwd)) ""))
               (ruby (ruby-prompt))
               (python (python-prompt))

               (dark-env (eq 'dark (frame-parameter nil 'background-mode)))
               (for-bars                 `(:weight bold))
               (for-parent  (if dark-env `(:foreground "#8888FF") `(:foreground "blue")))
               (for-dir     (if dark-env `(:foreground "#AAAAFF" :weight bold)
                                         `(:foreground "blue" :weight bold)))
               (for-git                  `(:foreground "#AAAA11" :weight ultra-bold))
               (for-ruby                 `(:foreground "red"))
               (for-python               `(:foreground "#5555FF")))

          (concat
           (propertize "┌─ "    'face for-bars)
           (propertize parent   'face for-parent)
           (propertize name     'face for-dir)
           (propertize " ──"    'face for-bars)
           (propertize branch   'face for-git)
           (when ruby
             (concat (propertize " ── " 'face for-bars)
                     (propertize ruby   'face for-ruby)))
           (when python
             (concat (propertize " ── " 'face for-bars)
                     (propertize python 'face for-python)))
           (propertize "\n"     'face for-bars)
           (propertize "└→"     'face for-bars)
           (propertize (if (= (user-uid) 0) " #" " $") 'face `(:weight ultra-bold))
           (propertize " "    'face `(:weight bold))))))

(setq eshell-highlight-prompt nil)

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

(defun ha/eshell-quit-or-delete-char (arg)
  (interactive "p")
  (if (and (eolp) (looking-back eshell-prompt-regexp))
      (progn
        (eshell-life-is-too-much) ; Why not? (eshell/exit)
        (ignore-errors
          (delete-window)))
    (delete-forward-char arg)))

(add-hook 'eshell-mode-hook (lambda ()
   (define-key eshell-mode-map (kbd "C-d")
                               'ha/eshell-quit-or-delete-char)))

(provide 'eshell-settings)
