;; recursively find .org files in provided directory
;; modified from an Emacs Lisp Intro example
(defun dl93/find-org-file-recursively (&optional directory filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
    If FILEXT is provided, return files with extension FILEXT instead."
  (interactive "DDirectory: ")
  (let* (org-file-list
         (case-fold-search t)	      ; filesystems are case sensitive
         (file-name-regex "^[^.#].*") ; exclude dot, autosave, and backup files
         (filext (or filext "org$\\\|org_archive"))
         (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
         (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
        (if (string-match fileregex file-or-dir) ; org files
            (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
        (dolist (org-file (dl93/find-org-file-recursively file-or-dir filext)
                          org-file-list) ; add files found to result
          (add-to-list 'org-file-list org-file)))))))

(setq org-agenda-files (dl93/find-org-file-recursively "~/org/")
      org-catch-invisible-edits "show"
      org-default-notes-file "~/org/inbox.org"
      org-directory "~/org/"
      org-enforce-todo-dependencies t
      org-refile-targets '((org-agenda-files :maxlevel . 4))
      org-tags-match-list-sublevels 'indented
      org-todo-keywords '((sequence "BACKLOG" "TODO" "IN PROGRESS" "WAITING" "|" "DONE" "DROPPED")
                          (sequence "QUESTION" "|" "ANSWER"))
      org-refile-targets '((nil :maxlevel . 4)
                           (org-agenda-files :maxlevel . 4)))

(setq org-agenda-custom-commands '(("q" "Questions" ((tags-todo "work+TODO=\"QUESTION\"")))
                                   ("o" "Current project" ((tags-todo "work+TODO=\"IN PROGRESS\"")
                                                           (tags-todo "work+TODO=\"QUESTION\"")
                                                           (tags-todo "work+TODO=\"TODO\"")
                                                           (tags-todo "work-TODO=\"QUESTION\"-TODO=\"IN PROGRESS\"-TODO=\"TODO\"")))))

(setq org-capture-templates
      '(("t" "Task" entry (file+headline "inbox.org" "Tasks") "* TODO %? \nCaptured on %T")
        ("n" "Note" entry (file+headline "inbox.org" "Notes") "* %? \nCaptured on %T")
        ("w" "Work Journal" entry (file+weektree "work-journal.org") "* %?" :empty-lines 1)))

;; org-ref
(setq org-ref-bibliography-notes "~/insync/work/bibliography/notes.org"
      org-ref-default-bibliography '("~/insync/work/bibliography/library.bib")
      org-ref-pdf-directory "~/insync/work/papers/")

(defun dl93/org-set-default-pdf-app ()
  (delete '("\\.pdf\\'" . default) org-file-apps)
  (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s")))

;; enable various minor modes
(add-hook 'org-mode-hook (lambda()
                           (dl93/org-set-default-pdf-app)
                           (org-indent-mode t)
                           (org-sticky-header-mode t)))
