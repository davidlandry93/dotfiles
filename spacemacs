;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/repos/layers/")
   dotspacemacs-configuration-layers
   '(
     javascript
     html
     octave
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-private-snippets-directory "~/repos/snippets/")
     (clojure :variables clojure-enable-fancify-symbols t)
     emacs-lisp
     git
     github
     latex
     markdown
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)
     deft
     org
     python
     ranger
     rust
     search-engine
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     sql
     syntax-checking
     version-control
     xkcd
     yaml
     )
   dotspacemacs-additional-packages '(gotham-theme
                                      lush-theme
                                      dracula-theme
                                      flycheck-package
                                      google-this
                                      oceanic-theme
                                      abyss-theme
                                      blackboard-theme
                                      reykjavik-theme
                                      writeroom-mode)
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This functi      (when latex-enable-auto-fill
on is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading t
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents projects bookmarks)
   dotspacemacs-startup-recent-list-size 10
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   dotspacemacs-themes '(gotham
                         reykjavik
                         abyss
                         dracula
                         lush
                         leuven
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         monokai
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font (if (boundp 'dl93-font)
                                 dl93-font
                               '("Mononoki"
                                 :size 18
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1))
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup t))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq latex-enable-auto-fill nil)
  (global-set-key (kbd "C-+") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (load-file "~/insync/tokens.el")

  (set-default 'truncate-lines t)


  ;; C/C++ Config
  (add-hook 'c-mode-common-hook
            (progn
              (setq c-default-style
                  '((java-mode . "java")
                    (awk-mode . "awk")
                    (other . "cc-mode")))
              (auto-complete-mode t)))
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

  (c-set-offset (quote cpp-macro) 0 nil)
  (setq-default helm-make-build-dir "build")

  ;; Markdown config
  (setq markdown-command "pandoc")

  (defun dl93/pop-ielm ()
    (interactive)
    (if (not (get-buffer "*ielm*"))
        (progn
          (split-window-sensibly (selected-window))
          (other-window 1)
          (ielm))
      (switch-to-buffer-other-window "*ielm*"))
    (evil-insert 1))

  (evil-leader/set-key "oi" 'dl93/pop-ielm)
  (evil-leader/set-key "ol" 'ace-link)
  (evil-leader/set-key "om" 'toggle-frame-maximized)
  (evil-leader/set-key "od" 'define-word)
  (evil-leader/set-key "ow" 'writeroom-mode)
  (evil-leader/set-key "w1" 'delete-other-windows)

  (eval-after-load 'flycheck '(flycheck-package-setup))

  (add-to-list 'auto-mode-alist '("\\.launch\\'" . nxml-mode))
  (add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
  (add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))

  (setq deft-directory "~/insync/notes")
  (setq deft-extensions '("md" "txt")))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data blackboard-theme sql-indent minitest hide-comnt seq dracula-theme abyss-theme oceanic-theme yapfify uuidgen rake py-isort org-projectile org org-download live-py-mode link-hint github-search flyspell-correct-helm flyspell-correct package-lint eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff goto-chg undo-tree eshell-z dumb-jump diminish column-enforce-mode color-identifiers-mode clojure-snippets cargo hydra inflections edn multiple-cursors paredit cider powerline rust-mode pcre2el spinner alert log4e gntp markdown-mode parent-mode projectile request gitignore-mode fringe-helper git-gutter+ git-gutter gh marshal logito pcache ht flycheck flx magit magit-popup git-commit with-editor smartparens iedit anzu deferred pos-tip company peg eval-sexp-fu highlight queue pkg-info clojure-mode epl inf-ruby yasnippet packed auctex anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup package-build bind-key bind-map evil zenburn-theme yaml-mode xterm-color xkcd ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toml-mode toc-org spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv ranger rainbow-mode rainbow-identifiers rainbow-delimiters racer quelpa pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file neotree multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate google-this golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flycheck-rust flycheck-pos-tip flycheck-package flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eshell-prompt-extras esh-help engine-mode elisp-slime-nav dockerfile-mode disaster diff-hl define-word cython-mode company-statistics company-racer company-quickhelp company-c-headers company-auctex company-anaconda cmake-mode clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby bundler buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-automatically-star nil)
 '(safe-local-variable-values
   (quote
    ((helm-make-build-dir . "build")
     (helm-make-build-dir "build")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
