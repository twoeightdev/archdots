;;; early-init.el --- Early Init File -*- lexical-binding: t -*-

;; Copyright (C) 2022-2023 twoeightdev

;; Author: artjeremie <twoeightdev@gmail.com>
;; URL: https://github.com/twoeightdev

;;; Commentary:

;; This file is NOT part of GNU Emacs. Since Emacs 27, an early configuration
;; file early-init.el can be provided to handle initialization to be done
;; before init.el is loaded.

;;; Code:

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(dolist (var '(default-frame-alist initial-frame-alist))
  (add-to-list var '(width . (text-pixels . 1125)))
  (add-to-list var '(height . (text-pixels . 1200)))
  (add-to-list var '(font . "Iosevka-16"))
  (add-to-list var '(alpha . 98))
  (add-to-list var '(top . -91))
  (add-to-list var '(left . 913)))

(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-buffer-menu t)
(setq frame-title-format '("%b"))

(setq-default load-prefer-newer t)
(setq-default package-check-signature nil)
(setq-default native-comp-async-report-warnings-errors 'silent)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'art t)
;;(load-theme 'modus-vivendi)

;;; early-init.el ends here
