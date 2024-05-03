;;; _prog-mode.el --- Prog -*- lexical-binding: t -*-

;; Copyright (C) 2022-2023 artjeremie

;; Author: artjeremie <artjeremie@gmail.com>
;; URL: https://github.com/artjeremie

;;; Commentary:

;; This file contains `prog-mode' default configuration.

;;; Code:

(defun _prog-mode ()
  "Initial configuration for `prog-mode'."
  (display-line-numbers-mode)
  (flymake-mode))

(add-hook 'prog-mode-hook '_prog-mode)

(defun _elisp-flymake-byte-compile (old-function &rest arguments)
  "Change `load-path' OLD-FUNCTION ARGUMENTS."
  (let ((elisp-flymake-byte-compile-load-path
         (append elisp-flymake-byte-compile-load-path load-path)))
    (apply old-function arguments)))

(advice-add 'elisp-flymake-byte-compile
            :around '_elisp-flymake-byte-compile)

(with-eval-after-load 'flymake
  (when (boundp 'flymake-mode-map)
    (define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
    (define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)))

;;; _prog-mode.el ends here