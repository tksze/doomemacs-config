;;; setup-files/setup-encrypt.el --- encryption setup -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'org-crypt)
(require 'epa-file)
(epa-file-enable)

;; makes sure that when a file is saved any entries that were decrypted are
;; encrypted before the file hits your SSD or harddisk
(org-crypt-use-before-save-magic)

(setq
 ;; ensures things don’t get confused if an encrypted item has children
 org-tags-exclude-from-inheritance (quote ("crypt"))

 ;; Passphrase encryption only
 org-crypt-key nil

 ;; Cache passphrase, no need to enter it on save
 epa-file-cache-passphrase-for-symmetric-encryption t

 ;; MacOS input hack
 ;;epa-pinentry-mode 'loopback
)


(provide 'setup-encrypt)
;;; setup-encrypt.el ends here
