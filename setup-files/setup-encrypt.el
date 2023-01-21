;;; setup-files/setup-encrypt.el --- encryption setup -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'org-crypt)
(require 'epa-file)
(epa-file-enable)

;; makes sure that when a file is saved any entries that were decrypted are
;; encrypted before the file hits your SSD or harddisk
(org-crypt-use-before-save-magic)

;; ensures things don’t get confused if an encrypted item has children
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

;; Passphrase encryption only
(setq org-crypt-key nil)


;;(setq epa-pinentry-mode 'loopback) ;; MacOS input hack

(provide 'setup-encrypt)
;;; setup-encrypt ends here
