;;; setup-org.el --- Org setup -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defvar org-directory)
(defvar org-agenda-files)
(defvar org-todo-keywords)
(defvar org-todo-keyword-faces)
(defvar org-log-done)
(defvar org-log-into-drawer)
(defvar org-tags-column)
(defvar org-agenda-window-setup)
(defvar org-hide-emphasis-markers)
(defvar org-pretty-entities)

;; Org directory path
(when (eq system-type 'darwin)
    (setq org-directory
          "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org"
          org-agenda-files
          '("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/gtd.org")
          )

)

(when (memq system-type '(cygwin windows-nt ms-dos))
    (setq org-directory
          "~/iCloudDrive/iCloud~com~appsonthemove~beorg/org"
          org-agenda-files
          '("~/iCloudDrive/iCloud~com~appsonthemove~beorg/org/gtd.org")
    )
)

;; Todo setup
(after! org
      (setq org-todo-keywords
              '((sequence "TODO(t!)" "INPROGRESS(s!)""|" "DONE(d!)" "CANCELLED(c@/!)")))


      (setq org-todo-keyword-faces
              '(("TODO" .   (:foreground "pink" :weight bold))
                ("INPROGRESS" . (:foreground "yellow" :weight bold))
                ("DONE" .      (:foreground "green" :weight bold))
                ("CANCELLED" .     (:foreground "green" :weight bold))
                )
              )

      ;; Relevant settings
      (setq
        org-log-done 'time                          ;; Event when toggle DONE, `note' also provided
        org-log-into-drawer t                      ;; Record status change in log block
        org-pretty-entities t
        org-enforce-todo-dependencies t

        ;; Edit settings
        org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t

        ;; Org styling, hide markup etc.
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis "…"

        ;; Agenda styling
        org-agenda-window-setup 'other-window
        org-agenda-tags-column 0
        org-agenda-block-separator ?─
        org-agenda-time-grid
        '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
        org-agenda-current-time-string
        "⭠ now ─────────────────────────────────────────────────"
            )
)


;; Org Capture



;; Valign: table alignment for Chinese mix English
(add-hook 'org-mode-hook #'valign-mode)

(provide 'setup-org)

;;; setup-org.el ends here
