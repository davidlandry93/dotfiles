
;; Disable the annoying message about .bashrc variables.
(setq exec-path-from-shell-check-startup-files nil)

;; Load my personal dictionary.
(setq ispell-personal-dictionary "~/insync/aspell.en.pws")

;; Add ignored directories to the project search.
(setq helm-grep-ignored-directories '(".git/" "build/"))
(setq helm-ag-use-grep-ignore-list t)

;; Keybindings
(defun dl93/find-dot-spacemacs ()
  (interactive)
  (let ((dot-spacemacs "~/repos/dotfiles/spacemacs/spacemacs"))
    (find-file dot-spacemacs)))
(global-set-key (kbd "<f12>") 'dl93/find-dot-spacemacs)

(evil-leader/set-key "om" 'toggle-frame-maximized)
(evil-leader/set-key "ot" 'terminal-here)
(evil-leader/set-key "w1" 'delete-other-windows)

;; File type associations
(add-to-list 'auto-mode-alist '("\\.launch\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))
