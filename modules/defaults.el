;;; defaults.el --- default settings for emacs -*- lexical-binding: t -*-
;; Author: Willem Boshoff <boshoffwillem@protonmail.com>
;; URL: https://github.com/boshoffwillem/.emacs.d

;;; Commentary:

;;; Code:

(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(setq custom-safe-themes t)

(setq ring-bell-function 'ignore)

;; Always scroll.
(setq compilation-scroll-output t)
;; Keyboard scroll one line at a time.
(setq scroll-step 8)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 101)
(setq scroll-margin 0)
(setq scroll-preserve-screen-position t)

;; Mouse scrolling
(setq mouse-wheel-scroll-amount '(4 ((shift) . 4))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(defun open-init-file ()
  "Open this very file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(define-key global-map (kbd "C-c e") 'open-init-file)
(define-key global-map (kbd "RET") 'newline-and-indent)

(defun dired-up-directory-same-buffer ()
  "Go up in the same buffer."
  (find-alternate-file ".."))
(defun my-dired-mode-hook ()
  (put 'dired-find-alternate-file 'disabled nil) ; Disables the warning.
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^") 'dired-up-directory-same-buffer))
(add-hook 'dired-mode-hook #'my-dired-mode-hook)
(setq dired-use-ls-dired nil)

(global-display-line-numbers-mode 1)
(column-number-mode)
(setq display-line-numbers-type 'relative)
;; Disable visual line mode (this causes issues with $ and a few other things in evil)
(global-visual-line-mode -1)

(setq default-directory "~/code/")
(setq large-file-warning-threshold nil)
;; Set default bookmarks directory.
(setq bookmark-default-file "~/emacs-files/bookmarks")
;; Delete selected text instead of inserting.
(setq delete-selection-mode t)
;; Emacs has problems with very long lines. so-long detects them and takes appropriate action.
;; Good for minified code and whatnot.
(global-so-long-mode)
;; I want recent files
(require 'recentf)
(recentf-mode)

(global-auto-revert-mode t)
(setq auto-revert-interval 2)
(setq auto-revert-check-vc-info t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose t)

(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))

(provide 'defaults)

;;; defaults.el ends here
