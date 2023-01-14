;;; setup-keymap.el --- Key binding -*- lexical-binding: t; -*-

;;; Comment:

;;; Code:
(require 'evil)

;; Window spliting
(map! :leader :desc "split window vertically and follow" :e "w \\" #'+evil/window-vsplit-and-follow
      :leader :desc "split window vertically" :e "w |" #'evil-window-vsplit
      :leader :desc "split window horizontally and follow" :e "w -" #'+evil/window-split-and-follow
      :leader :desc "split window horizontally" :e "w _" #'evil-window-split)

(provide 'setup-keymap)

;;; setup-keymap.el ends here
