;;; setup-org.el --- Org setup -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'org)
(require 'org-agenda)
(require 'org-capture)
(require 'valign)               ;; Table alignment for mixed chinese and english

;; Org directory path
(cond
        ((eq system-type 'darwin)
        (setq org-directory
                "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org"))

        ((memq system-type '(cygwin windows-nt ms-dos))
        (setq org-directory
                "~/iCloudDrive/iCloud~com~appsonthemove~beorg/org"))
)

(setq org-agenda-files
      (list
       (concat org-directory "/gtd.org")
       (concat org-directory "/inbox.org")
       (concat org-directory "/tickler.org")))


;; Todo setup
(after! org
      (setq org-todo-keywords
              '((sequence "TODO(t!)" "WAITING(s!)""|" "DONE(d!)" "CANCELLED(c@/!)")))


      (setq org-todo-keyword-faces
              '(("TODO" .   (:foreground "pink" :weight bold))
                ("WAITING" . (:foreground "orange" :weight bold))
                ("DONE" .      (:foreground "green" :weight bold))
                ("CANCELLED" .     (:foreground "green" :weight bold))
                )
              )

      ;; Relevant settings
      (setq
        org-log-done 'time                          ;; Event when toggle DONE, `note' also provided
        org-log-into-drawer t                      ;; Record status change in log block
        org-pretty-entities t
        org-enforce-todo-dependencies t         ;; All subtree must be done to toogle done

        ;; Edit settings
        org-auto-align-tags nil
        org-tags-column 0
        org-fold-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t

        ;; Org styling, hide markup etc.
        org-hide-emphasis-markers t
        org-pretty-entities t
        ;;org-ellipsis "…"

        ;; Agenda styling
        org-agenda-window-setup 'other-window
        org-agenda-tags-column 0
        org-agenda-time-grid
        '((daily today require-timed)
        (600 900 1200 1500 1800 2100)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
        org-agenda-current-time-string
        "⭠ now ─────────────────────────"
        org-agenda-start-with-clockreport-mode t
        org-agenda-clockreport-parameter-plist '(:link nil :maxlevel 3)
        org-agenda-start-on-weekday 0
        org-agenda-span 'week
        org-agenda-start-day nil)
)


;;; Org Capture
(after! org
  (setq org-capture-templates
        '(
          ("t" "Todo" entry
           (file "inbox.org")
           "* %^{task} %^G\n%i\n%a" :prepend t)
          ("n" "Notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("j" "Journal" entry
           (file+olp+datetree "journal.org")
           "* %U %?\n%i\n%a")
          ("p" "Password" entry
           (file "password.org.gpg")
           "* %^{title} %^g\n\n  - ACC: %^{ACC}\n  - PW: %^{Password}")
          ("c" "Clipping" entry
           (file+headline "clipping.org" "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          )
        )
)


;;; Valign
(add-hook 'org-mode-hook #'valign-mode)

(provide 'setup-org)

;;; setup-org.el ends here
