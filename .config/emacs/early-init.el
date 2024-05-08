;;; Auto-generated --- DO NOT EDIT -*- lexical-binding: t -*-

;; Copyright (C) 2024 twoeightdev

;; Author: twoeightdev <twoeightdev@gmail.com>
;; URL: https://github.com/twoeightdev

;;; Commentary:

;; This file is NOT part of GNU Emacs.

;;; Code:

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(dolist (var '(default-frame-alist initial-frame-alist))
  (add-to-list var '(font . "Inconsolata Nerd Font-14"))
  (add-to-list var '(alpha . 98))
  (add-to-list var '(background-color . "#1d2021")))

(setq inhibit-x-resources t)
(setq inhibit-compacting-font-caches t)
(setq inhibit-splash-screen t)

(setq-default load-prefer-newer t)
(setq-default native-comp-async-report-warnings-errors 'silent)
(setq-default warning-minimum-level :error)
(setq-default byte-compile-warnings nil)

;;; early-init.el ends here
