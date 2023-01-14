;;; setup-font.el --- font setting -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(when IS-MAC
  (when (display-graphic-p)
    (set-font "Mononoki" "LXGW Wenkai Mono" 14 16)
    ))

(when IS-WINDOWS
  (when (display-graphic-p)
    (set-font "Mononoki" "霞鹜文楷等宽" 15 18)
    ))

(provide 'setup-font)
;;; setup-font.el ends here
