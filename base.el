;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Display tweaks
(scroll-bar-mode -1)
(set-default-font "Inconsolata-14")

;;; Additional packages
(prelude-require-packages '(neotree
                            rspec-mode
                            multiple-cursors))

;;; Ignored directories
(setq projectile-globally-ignored-directories
      (append '("node_modules" "_build")
              projectile-globally-ignored-directories))

(defun jg-make-font-big ()
  (interactive)
  (message "Setting font to Inconsolata 18")
  (set-default-font "Inconsolata-18")
  (message "Done Setting font to Inconsolata 18"))

(defun jg-make-font-normal ()
  (interactive)
  (message "Setting font to Inconsolata 14")
  (set-default-font "Inconsolata-14")
  (message "Done Setting font to Inconsolata 14"))

(global-set-key (kbd "C-c =") 'jg-make-font-big)
(global-set-key (kbd "C-c -") 'jg-make-font-normal)

;;; Multi-cursor
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'base.el)
;;; base.el ends here
