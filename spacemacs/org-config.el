
(setq org-directory "~/org")
(spacemacs/toggle-mode-line-org-clock-on)
(setq org-catch-invisible-edits "show")
(setq org-goto-interface "outline-path-completion")
(setq org-default-notes-file "~/insync/org/capture-desktop.org")
(setq org-agenda-files (dl93/find-org-file-recursively "~/org" "org"))
(setq org-todo-keywords '((sequence "TODO" "NEXT" "IN PROGRESS" "WAITING" "|" "DONE" "CANCELLED")
                          (sequence "QUESTION" "|" "ANSWER")))
(setq org-enforce-todo-dependencies t)
(setq org-clock-persist 'history)
(setq org-tags-match-list-sublevels 'indented)
(org-clock-persistence-insinuate)

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs" ((agenda "") (alltodo "")))
        ("o" "Current project" ((tags-todo "work+TODO=\"IN PROGRESS\"")
                                (tags-todo "work+TODO=\"NEXT\"")
                                (tags-todo "work+TODO=\"QUESTION\"")
                                (tags-todo "work-TODO=\"NEXT\"-TODO=\"QUESTION\"-TODO=\"IN PROGRESS\"")))
        ("q" "Questions" todo "QUESTION")))

(setq org-capture-templates
      '(("i" "Idea" entry (file+headline "capture-desktop.org" "Ideas")
          "* %? \nCaptured on %T")
        ("t" "Task" entry (file+headline "capture-desktop.org" "Tasks")
          "* TODO %? \nCaptured on %T")
        ("l" "Activity log" entry (file+datetree "work/log.org")
          "* %?\n")
        ("a" "Agenda entry" entry (file+datetree+prompt "perso-agenda.org")
          "* %?\n")))

(setq org-refile-targets
      '((nil :maxlevel . 9)
        (org-agenda-files :maxlevel . 9)))

(setq org-brain-path "~/insync/org/")
