;;; _config.el --- Emacs Personal Configuration -*- lexical-binding: t -*-

;; Copyright (C) 2022-2024 twoeightdev

;; Author: artjeremie <twoeightdev@gmail.com>
;; URL: https://github.com/twoeightdev

;;; Commentary:

;; This file is NOT part of GNU Emacs.
;; This file has been generated from `README.org' *DO NOT EDIT*.

;;; Code:

(setq-default gc-cons-threshold (* 8 1024 1024))
(setq-default read-process-output-max (* 1024 1024))
(setq-default ad-redefinition-action 'accept)
(setq-default inhibit-compacting-font-caches t)
(setq-default initial-scratch-message "")
(setq-default initial-major-mode 'org-mode)
(setq-default ring-bell-function 'ignore)
(setq-default help-window-select t)
(setq-default delete-by-moving-to-trash t)
(setq-default window-combination-resize t)
(setq-default comment-multi-line t)
(setq-default sentence-end-double-space nil)
(setq-default electric-pair-preserve-balance nil)
(setq-default auto-revert-verbose nil)
(setq-default column-number-mode t)
(setq-default display-line-numbers-width 3)
(setq-default fill-column 80)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default cursor-in-non-selected-windows nil)
(setq-default cursor-type '(bar . 3))
(setq-default mouse-yank-at-point t)
(setq-default scroll-margin 1)
(setq-default scroll-step 1)
(setq-default scroll-conservatively 101)
(setq-default scroll-preserve-screen-position 1)

(blink-cursor-mode 0)
(electric-pair-mode 1)
(save-place-mode 1)
(global-auto-revert-mode)
(mouse-avoidance-mode 'exile)
(set-default-coding-systems 'utf-8)

(require 'no-littering)

(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file nil t))

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq version-control t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 2)
(setq kept-old-versions 2)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq auto-save-list-file-prefix nil)
(setq mode-require-final-newline nil)
(setq large-file-warning-threshold nil)

(add-function :after after-focus-change-function
              (defun _garbage-collect-maybe ()
                (unless (frame-focus-state)
                  (garbage-collect))))

(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

(windmove-default-keybindings 'ctrl)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-h K") 'describe-keymap)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-set)

(set-face-attribute 'default nil :family "Inconsolata Nerd Font Mono" :height 160)
(set-face-attribute 'fixed-pitch nil :family "Inconsolata Nerd Font Mono")
(set-face-attribute 'variable-pitch nil :family "Iosevka Aile")

(set-fontset-font t 'unicode (font-spec
                              :family "FontAwesome") nil 'prepend)

(modify-all-frames-parameters
 '((right-divider-width . 40)
   (internal-border-width . 40)))

(setq window-divider-default-right-width 2)
(setq window-divider-default-bottom-width 1)

(window-divider-mode t)

(add-hook 'before-make-frame-hook 'window-divider-mode)

(with-eval-after-load 'dired
  (require 'dired-narrow)
  (setq-default dired-auto-revert-buffer t)
  (setq-default dired-dwim-target t)
  (setq-default dired-deletion-confirmer 'y-or-n-p)
  (setq-default dired-hide-details-hide-symlink-targets nil)
  (setq-default dired-kill-when-opening-new-dired-buffer t)
  (when (boundp 'dired-mode-map)
    (define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)
    (define-key dired-mode-map (kbd "/") 'dired-narrow))
  (add-hook 'dired-mode-hook 'dired-hide-details-mode))

(with-eval-after-load 'dired
  (require 'dired-subtree)
  (setq-default dired-subtree-use-backgrounds nil)
  (when (boundp 'dired-mode-map)
    (define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)))

(global-set-key (kbd "C-c t") 'dired-sidebar-toggle-sidebar)

(defconst _notes-path
  (expand-file-name "notes.org" "~/.local/work/orgdata/notes")
  "Path to personal notes file.")

(defun _find-notes ()
  "Find and open notes."
  (interactive)
  (find-file _notes-path))

(setq-default org-directory "~/.local/work/orgdata/org")
(setq-default org-default-notes-file _notes-path)
(setq-default org-startup-indented nil)
(setq-default org-edit-src-content-indentation 0)
(setq-default org-src-window-setup 'current-window)
(setq-default org-tags-column -92)
(setq-default org-return-follows-link t)
(setq-default org-image-actual-width nil)
(setq-default org-link-descriptive t)
(setq-default org-hide-emphasis-markers t)
(setq-default org-hide-leading-stars t)
(setq-default org-special-ctrl-a/e t)
(setq-default org-catch-invisible-edits 'show-and-error)

;; (setq-default org-display-custom-times t)
(setq-default org-time-stamp-custom-formats
              '("<%b-%d-%y %a>" . "<%b-%d-%y %a %I:%M %p>"))

(defvar org-mode-map)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-,") nil))

(global-set-key (kbd "C-;") '_find-notes)

(add-hook 'text-mode-hook 'auto-fill-mode)
;; (add-hook 'org-mode-hook 'org-indent-mode)

(defun _org-agenda-view-startup ()
  "Agenda view schedule on Emacs startup."
  (org-agenda nil "c"))

(setq-default org-agenda-files (list "gtd.org" "purge.org"))
(setq-default org-agenda-start-on-weekday 1)
(setq-default org-agenda-timegrid-use-ampm 1)
(setq-default org-agenda-show-all-dates nil)
(setq-default org-agenda-remove-tags t)
(setq-default org-agenda-tags-column -92)
(setq-default org-agenda-window-setup 'current-window)
(setq-default org-agenda-skip-deadline-if-done t)
(setq-default org-agenda-skip-schedule-if-done t)
(setq-default org-log-repeat nil)
(setq-default org-log-done 'time)
(setq-default org-log-into-drawer t)

(setq-default org-tag-alist
              '(("@home" . ?h)
                ("@family" . ?f)
                ("@bills" . ?b)
                ("@windows" . ?w)
                ("@mac" . ?m)
                ("@emacs" . ?e)
                ("@linux" . ?l)
                ("Toc:Quote" . ?t)
                ("@games" . ?g)))

(setq-default org-todo-keywords
              '((sequence "TODO(t)" "|" "DONE(d)" "KILL(k)")))

(setq-default org-agenda-time-grid
              '((daily today require-timed)
                (700 1000 1300 1600 1900 2200)
                " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"))

(setq-default org-agenda-current-time-string " Now")

(setq-default org-agenda-scheduled-leaders
              '("" "%2dx"))

(setq-default org-agenda-deadline-leaders
              '("" "In-%1dd" "Overdue %1dd"))

(setq-default org-agenda-prefix-format
              '((agenda  . "  %?-8T %?-16t% s")
                (todo   . "  %i")
                (tags   . "  %i")
                (search . "  %i")))

(setq-default org-agenda-custom-commands
              `(("c" "Custom Agenda View"
                 ((agenda ""
                          ((org-agenda-block-separator nil)
                           (org-agenda-format-date "%A %d %b %Y")
                           (org-agenda-include-diary t)
                           (org-agenda-time-grid nil)
                           (org-agenda-span 2)
                           (org-agenda-skip-function
                            '(org-agenda-skip-entry-if 'scheduled 'deadline))
                           (org-agenda-overriding-header "Special Events")))
                  (agenda ""
                          ((org-agenda-block-separator nil)
                           (org-agenda-format-date "%A %d %b %Y")
                           (org-scheduled-past-days 0)
                           (org-agenda-span 0)
                           (org-agenda-entry-types '(:scheduled))
                           (org-agenda-overriding-header "\nToday's Schedule")))
                  (agenda ""
                          ((org-agenda-block-separator nil)
                           (org-agenda-format-date "%A %d %b %Y")
                           (org-agenda-time-grid nil)
                           (org-scheduled-past-days 0)
                           (org-deadline-warning-days 0)
                           (org-agenda-entry-types '(:scheduled))
                           (org-agenda-overriding-header "\nWeekly Schedule")))
                  (agenda ""
                          ((org-agenda-block-separator nil)
                           (org-agenda-format-date "%A %d %b %Y")
                           (org-agenda-time-grid nil)
                           (org-agenda-span 0)
                           (org-deadline-past-days 60)
                           (org-deadline-warning-days 60)
                           (org-agenda-entry-types '(:deadline))
                           (org-agenda-overriding-header "\nDeadlines")))))))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-'") 'org-cycle-agenda-files)

(add-hook 'after-init-hook '_org-agenda-view-startup)

(setq-default org-refile-targets
              '((nil :maxlevel . 1)
                (org-agenda-files :maxlevel . 1)))

(setq-default org-capture-templates
              '(("a" "Agenda Entries")
                ("ae" "Entry Task" entry (file "gtd.org")
                 "* TODO %? %^G")
                ("as" "Scheduled Task" entry (file "gtd.org")
                 "* TODO %? %^G\nSCHEDULED: %^t")
                ("ad" "Deadline Task" entry (file "gtd.org")
                 "* TODO %? %^G\nDEADLINE: %^t")))

(advice-add 'org-refile :after 'org-save-all-org-buffers)

(global-set-key (kbd "C-c c") 'org-capture)

(setq-default org-appear-autolinks t)

(add-hook 'org-mode-hook 'org-appear-mode)

(setq-default org-modules '(org-habit))
(setq-default org-habit-graph-column 40)
(setq-default org-habit-show-habits-only-for-today nil)

(setq-default diary-file "~/.local/work/orgdate/diary/diary")
(setq-default calendar-mark-diary-entries-flag t)
(setq-default calendar-mark-holidays-flag t)

(setq holiday-bahai-holidays nil)
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-oriental-holidays nil)
(setq holiday-solar-holidays nil)

(setq holiday-christian-holidays
      '((holiday-fixed 1 6 "Feast of the Three Kings")
        (holiday-easter-etc -46 "Ash Wednesday")
        (holiday-easter-etc -7 "Palm Sunday")
        (holiday-easter-etc -2 "Holy Friday")
        (holiday-easter-etc 0 "Easter Sunday")
        (holiday-easter-etc 1 "Easter Monday")
        (holiday-fixed 11 1 "All Saint's Day")
        (holiday-fixed 11 2 "Day of the Dead")
        (holiday-fixed 12 25 "Christmas Day")))

(setq holiday-general-holidays
      '((holiday-fixed 1 1 "New Year's Day")
        (holiday-fixed 2 14 "Valentine's Day")
        (holiday-fixed 10 31 "Halloween")))

(setq holiday-local-holidays
      '((holiday-fixed 2 24 "EDSA People Power Revolution")
        (holiday-fixed 4 10 "Day of Valor")
        (holiday-fixed 5 1 "Labor Day")
        (holiday-float 5 0 2 "Mother's Day")
        (holiday-fixed 6 12 "Independence Day")
        (holiday-float 6 0 3 "Father's Day")
        (holiday-fixed 8 21 "Ninoy Aquino Day")
        (holiday-fixed 8 28 "National Heroes Day")
        (holiday-fixed 11 27 "Bonifacio Day")
        (holiday-fixed 12 8 "Feast of the Immaculate Conception of Mary")
        (holiday-fixed 12 30 "Rizal Day")))

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(setq-default yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq-default yas-verbosity 2)

(global-set-key (kbd "C-c s") 'yas-insert-snippet)

(add-hook 'after-init-hook 'yas-global-mode)

(setq-default corfu-auto t)
(setq-default corfu-quit-no-match 'separator)
(setq-default corfu-popupinfo-delay 0.2)
(setq-default corfu-cycle t)
(setq-default corfu-auto-prefix 2)
(setq-default corfu-auto-delay 0.2)

(add-hook 'after-init-hook 'global-corfu-mode)
(add-hook 'after-init-hook 'corfu-popupinfo-mode)

(advice-add 'pcomplete-completions-at-point :around 'cape-wrap-silent)
(advice-add 'pcomplete-completions-at-point :around 'cape-wrap-purify)
(add-to-list 'completion-at-point-functions 'cape-dabbrev)
(add-to-list 'completion-at-point-functions 'cape-file)

(setq-default vertico-count-format '("%-5s " . "%2$s"))
(setq-default vertico-resize nil)
(setq-default vertico-cycle t)

(with-eval-after-load 'vertico
  (when (boundp 'vertico-map)
    (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-char)))

(add-hook 'after-init-hook 'vertico-mode)

(setq completion-styles '(orderless basic))
(setq-default orderless-component-separator
              'orderless-escapable-split-on-space)
(setq completion-category-overrides
      '((file (styles basic partial-completion))))

(setq-default consult-buffer-sources
              '(consult--source-buffer))

(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-r") 'consult-ripgrep)
(global-set-key (kbd "C-x b") 'consult-buffer)

(add-hook 'after-init-hook 'marginalia-mode)

(setq-default lua-indent-level 4)

(add-to-list 'auto-mode-alist '("\\.lua$'" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(setq-default python-shell-interpreter "python")
(setq-default python-indent-guess-indent-offset-verbose nil)

(let* ((height (frame-char-height))
       (width 2)
       (ones (1- (expt 2 width)))
       (bits (make-vector height ones)))
  (define-fringe-bitmap '_diff-hl-bitmap bits height width))

(setq-default diff-hl-show-staged-changes nil)
(setq-default diff-hl-fringe-bmp-function
              (lambda (_type _pos)
                '_diff-hl-bitmap))

(add-hook 'text-mode-hook 'diff-hl-mode)
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(add-hook 'text-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)

(add-hook 'text-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(setq-default emojify-display-style 'unicode)
(setq-default emojify-emoji-styles '(unicode))

(global-set-key (kbd "C-c e") 'emojify-insert-emoji)

(add-hook 'after-init-hook 'global-emojify-mode)

(setq-default helpful-max-buffers 2)

(global-set-key [remap describe-key] 'helpful-key)
(global-set-key [remap describe-command] 'helpful-command)
(global-set-key [remap describe-variable] 'helpful-variable)
(global-set-key [remap describe-function] 'helpful-callable)

(add-hook 'org-mode-hook 'toc-org-mode)
(add-hook 'markdown-mode-hook 'toc-org-mode)

(global-set-key (kbd "C-c o") 'olivetti-mode)

(add-hook 'olivetti-mode-hook
          (lambda ()
            (interactive)
            (setq-default olivetti-body-width 80)))

(provide '_config)

;;; _config.el ends here
