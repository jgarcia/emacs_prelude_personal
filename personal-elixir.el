;;; package --- Summary

;;; Commentary:

;;; Code:
;;; Elixir Stuff
(setq alchemist-goto-elixir-source-dir "~/src/elixir/")
(setq alchemist-goto-erlang-source-dir "~/src/otp/")

(defun t-elixir-mode-hook ()
  (yas/minor-mode +1)
  (smartparens-mode +1))

(defun my-elixir-do-end-close-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (forward-line -1)
    (indent-according-to-mode)))

(sp-with-modes '(elixir-mode)
  (sp-local-pair "->" "end"
                 :when '(("RET"))
                 :post-handlers '(:add my-elixir-do-end-close-action)
                 :actions '(insert)))

(sp-with-modes '(elixir-mode)
  (sp-local-pair "do" "end"
                 :when '(("SPC" "RET"))
                 :post-handlers '(:add my-elixir-do-end-close-action)
                 :actions '(insert)))

(defun t-erlang-mode-hook ()
  (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back))

(defun t-alchemist-custom-keybindings ()
  (define-key alchemist-mode-map (kbd "M-w") 'alchemist-goto-list-symbol-definitions))

(defun alchemist-my-iex-keys ()
  (define-key alchemist-iex-mode-map (kbd "C-d") 'windmove-right))

(add-hook 'alchemist-iex-mode-hook 'alchemist-my-iex-keys)
(add-hook 'alchemist-mode-hook 't-alchemist-custom-keybindings)
(add-hook 'elixir-mode-hook  't-elixir-mode-hook)
(add-hook 'erlang-mode-hook 't-erlang-mode-hook)

;; Display alchemist buffers always at the bottom
;; Source: http://www.lunaryorn.com/2015/04/29/the-power-of-display-buffer-alist.html
(add-to-list 'display-buffer-alist
             `(,(rx bos (or "*alchemist test report*"
                            "*alchemist mix*"
                            "*alchemist help*"
                            "*alchemist elixir*"
                            "*alchemist elixirc*"))
                    (display-buffer-reuse-window
                     display-buffer-in-side-window)
               (reusable-frames . visible)
               (side            . right)
               (window-width   . 0.5)))


(provide 'personal-elixir.el)
;;; personal-elixir.el ends here
