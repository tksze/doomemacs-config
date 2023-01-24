;;; setup-plantuml.el --- Plantuml setting -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Plantuml jar path
(when (eq system-type 'darwin)
  (setq org-plantuml-jar-path (expand-file-name "/usr/local/Cellar/plantuml/1.2023.0/libexec/plantuml.jar"))
  )

(when (memq system-type '(cygwin windows-nt ms-dos))
  (setq org-plantuml-jar-path (expand-file-name "~/scoop/apps/plantuml/current/plantuml.jar"))
  )

;; org babel
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

(provide 'setup-plantuml)

;;; setup-plantuml.el ends here
