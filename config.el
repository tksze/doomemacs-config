;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "STK"
      user-mail-address "")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(when IS-MAC
    (add-hook 'window-setup-hook #'toggle-frame-maximized)
)

(when IS-MAC
  (when (display-graphic-p)
    (defun set-font (english chinese english-size chinese-size)
      (set-face-attribute 'default nil :font
                          (format   "%s:pixelsize=%d"  english english-size))
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size chinese-size))))
    (set-font "Mononoki" "LXGW Wenkai Mono" 14 16)
    ))

(when IS-WINDOWS
  (when (display-graphic-p)
    (defun set-font (english chinese english-size chinese-size)
      (set-face-attribute 'default nil :font
                          (format   "%s:pixelsize=%d"  english english-size))
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size chinese-size))))
    (set-font "Mononoki" "霞鹜文楷等宽" 15 18)
    ))
;; The chinese font size please be x1.2 of latin font, other wise the line
;; height will be incompatible



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'tsdh-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(when IS-MAC
    (setq org-directory
          "/Users/user/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org"
          org-agenda-files
          '("/Users/user/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/gtd.org")
          )

    (setq org-plantuml-jar-path (expand-file-name "/usr/local/Cellar/plantuml/1.2023.0/libexec/plantuml.jar"))
)

(when IS-WINDOWS
    (setq org-directory
          "C:\\Users\\josts\\iCloudDrive\\iCloud~com~appsonthemove~beorg\\org"
          org-agenda-files
          '("C:\\Users\\josts\\iCloudDrive\\iCloud~com~appsonthemove~beorg\\org\\gtd.org")
    )
)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-themes-neotree-file-icons 't)

;; Org todo personal setup
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

      ;; log DONE time, `note` value wiil ask you to write a note.
      (setq org-log-done 'time
            org-log-into-drawer 't
            org-tags-column '-80
            org-agenda-window-setup 'other-window
            org-hide-emphasis-markers 't
            org-pretty-entities 't
            )
)
;; org prettier
(add-hook 'org-mode-hook #'valign-mode)

;; (use-package! mixed-pitch
;;    :hook
;;    (text-mode . mixed-pitch-mode))

;; Xenops setting
(setq xenops-font-height '140
      xenops-font-height-code '120)

;; Window spliting
(map! :leader :desc "split window vertically and follow" :e "w \\" #'+evil/window-vsplit-and-follow
      :leader :desc "split window vertically" :e "w |" #'evil-window-vsplit
      :leader :desc "split window horizontally and follow" :e "w -" #'+evil/window-split-and-follow
      :leader :desc "split window horizontally" :e "w _" #'evil-window-split)

;; Set timestamp in org is English
(setq system-time-locale "C")
(set-language-environment 'UTF-8)

(setq find-program "fd")

(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; random id generator
(defun random-alnum ()
  (let* ((alnum "abcdefghijklmnopqrstuvwxyz0123456789")
         (i (% (abs (random)) (length alnum))))
    (substring alnum i (1+ i))))

(defun random-7-letter-string ()
  (interactive)
  (insert
   (concat
    (random-alnum)
    (random-alnum)
    (random-alnum)
    (random-alnum)
    (random-alnum)
    (random-alnum)
    (random-alnum))))

(global-set-key (kbd "<f2>") 'random-7-letter-string)

