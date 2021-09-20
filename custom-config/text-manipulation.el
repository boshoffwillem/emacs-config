(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package multiple-cursors
  :bind (
         ("C-S-c s" . set-rectangular-region-anchor)
         ("C-S-c e" . #'mc/edit-lines)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ))

;; Create shortcut for duplicating a line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  ;;(open-line 1)
  ;;(next-line 1)
  (previous-line 1)
  (yank))
(global-set-key (kbd "C-S-d") 'duplicate-line)

(bind-key "C-c /" #'comment-dwim)

(electric-pair-mode 1)
(electric-pair-local-mode 1)

(defun wb/eol-then-newline ()
  "Go to end of line, then newline-and-indent."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(bind-key "C-<return>" #'wb/eol-then-newline)

(provide 'text-manipulation)
