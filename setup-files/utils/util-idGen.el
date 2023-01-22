;;; util-idGen.el --- 7 letters string random generator -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

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

(provide 'util-idGen)

;;; util-idGen.el ends here
