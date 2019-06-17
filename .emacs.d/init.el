;;;; init.el - Emacs 26.2
;;;; Ogi Martinovic, 2019

(setq gc-cons-threshold (* 50 1000 1000))

;;;; PACKAGE MANAGER

;; Package Sites
(setq package-archives
      '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("gnu" . 10)
        ("org" . 10)
        ("melpa" . 0)))

;; Package Init
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;;; UI

;; Frame
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(if (not (display-graphic-p))
      (menu-bar-mode 0))
(setq ns-pop-up-frames nil)
(setq ns-use-srgb-colorspace t)
(setq default-frame-alist '((width . 120) (height . 60)))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)
(setq inhibit-splash-screen t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq x-underline-at-descent-line t)

;; Buffers
(defalias 'list-buffers 'ibuffer)

;; Keys
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Parens
(show-paren-mode 1)
(defvar show-paren-delay 0)

;; Visual Bell
(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

;; Line Numbers
(defun relative-line-numbers ()
  (interactive)
  (setq-local display-line-numbers 'visual))

(defun absolute-line-numbers ()
  (interactive)
  (setq-local display-line-numbers 't))

(defun off-line-numbers ()
  (interactive)
  (setq-local display-line-numbers 'nil))


;;;; FILES

(global-auto-revert-mode t)
(setq tramp-default-method "ssh")
(setq vc-follow-symlinks t)
(setq custom-file "~/.emacs.d/custom.el")
(setq ispell-program-name "/usr/local/bin/aspell")
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))

;; Read File
(defun read-lines (file-name)
  (if (file-exists-p file-name)
      (with-temp-buffer
        (insert-file-contents file-name)
        (split-string (buffer-string) "\n" t))
    nil))

;; Backup
(defvar --backup-dir (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-dir))
    (make-directory --backup-dir t))
(setq backup-directory-alist `(("." . ,--backup-dir)))
(setq make-backup-files t          ; backup of a file the first time it is saved
      backup-by-copying t          ; copy
      version-control t            ; version numbers for backup files
      delete-old-versions t        ; delete excess backup files silently
      delete-by-moving-to-trash t  ; move to trash
      auto-save-default t          ; auto-save every buffer that visits a file
      )


;;;; THEME / FONT

;; Disable all bold fonts
(defun disable-bold ()
  (interactive)
  (mapc (lambda (face)
          (when (eq (face-attribute face :weight) 'bold)
            (set-face-attribute face nil :weight 'normal)))
        (face-list)))

;; Font Sizes
(defun sm-font () (interactive) (set-frame-font "Operator Mono-15"))
(defun md-font () (interactive) (set-frame-font "Operator Mono-17"))
(defun lg-font () (interactive) (set-frame-font "Operator Mono-19"))
(md-font)

;; Solarized Themes
(use-package solarized-theme
  :ensure t
  :config
  (setq solarized-distinct-fringe-background nil)
  (setq solarized-use-variable-pitch nil)
  (setq solarized-high-contrast-mode-line nil)
  (setq solarized-use-less-bold t)
  (setq solarized-use-more-italic nil)
  (setq solarized-emphasize-indicators nil)
  (setq solarized-scale-org-headlines nil))

(defun day-theme ()
  (interactive)
  (if window-system
      (progn (load-theme 'solarized-light t)
             (set-cursor-color "#073642"))
    (load-theme 'adwaita))
  (disable-bold)
  (set-face-attribute 'show-paren-match nil :underline nil :bold t))

(defun night-theme ()
  (interactive)
  (if window-system
      (progn (load-theme 'solarized-dark t)
             (set-cursor-color "#FDF6E3"))
    (load-theme 'wombat))
  (disable-bold)
  (set-face-attribute 'show-paren-match nil :underline nil :bold t))

(night-theme)


;;;; MODE LINE

(use-package delight :ensure t)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (setq sml/shorten-directory t)
  (setq sml/shorten-modes t)
  (sml/setup))


;;;; IVY / SWIPER

(use-package flx :ensure t)

(use-package ivy
  :ensure t
  :delight ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-format-function 'ivy-format-function-arrow))

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-;" . 'swiper)
  :config
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy))))


;;;; PROJECT

(use-package ag
  :ensure ag
  :defer t)

(use-package projectile
  :ensure projectile
  :delight projectile-mode
  :pin melpa-stable
  :bind ("C-c p" . 'projectile-command-map)
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

(use-package magit
  :ensure magit
  :pin melpa-stable
  :defer t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-completing-read-function 'ivy-completing-read))


;;;; PROG MODES

(use-package eldoc :delight eldoc-mode)

(use-package flycheck
  :ensure t
  :defer t
  :pin melpa-stable)

(use-package company
  :ensure t
  :delight company-mode
  :pin melpa-stable
  :bind ("C-x c" . company-complete)
  :config
  (global-company-mode)
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package yasnippet
  :ensure t
  :delight yas-minor-mode
  :pin melpa
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t
  :pin melpa)

(use-package dockerfile-mode
  :ensure t
  :pin melpa-stable
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package yaml-mode
  :ensure t
  :pin melpa
  :mode ("\\.yml\\'" . yaml-mode))

(use-package restclient
  :ensure t
  :pin melpa
  :mode ("\.rest$" . restclient-mode))

(use-package company-restclient
  :ensure t
  :defer t
  :pin melpa
  :config
  (after 'company
    (add-to-list 'company-backends 'company-restclient)))

(use-package highlight-numbers
  :ensure t
  :defer t
  :pin melpa
  :config
  (add-hook 'elisp-mode-hook 'highlight-numbers-mode))

(use-package highlight-quoted
  :ensure t
  :defer t
  :pin melpa)

(use-package whitespace
  :delight whitespace-mode
  :config
  (add-hook 'prog-mode-hook 'whitespace-mode)
  (setq-default whitespace-line-column 100
                whitespace-style '(face lines-tail trailing)))


;;;; CLOJURE

(use-package clojure-mode
  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook 'highlight-numbers-mode)
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode))

(use-package cider
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq cider-repl-use-clojure-font-lock t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (setq cider-mode-line "repl"))

(use-package clj-refactor
  :ensure t
  :defer t
  :init
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (yas-minor-mode 1)
              (cljr-add-keybindings-with-prefix "C-c r"))))


;;;; LISP / SCHEME

(use-package lisp-mode
  :defer t
  :init
  (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'lisp-mode-hook 'highlight-quoted-mode))

(use-package emacs-lisp
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode))


;;;; PYTHON

(use-package python
  :defer t
  :bind (:map python-mode-map
              ("C-c i" . i-python-interpreter)
              ("C-c d" . python-interpreter)
              ("C-c C-t" . ipdb:insert-trace))
  :config
  (setq python-shell-interpreter "python3")

  (defun i-python-interpreter ()
    (interactive)
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--simple-prompt -i")
    (message "interpreter: ipython"))

  (defun python-interpreter ()
    (interactive)
    (setq python-shell-interpreter "python3"
          python-shell-interpreter-args "")
          ;; (concat (projectile-project-root) ""))
    (message "interpreter: python3"))

  ;; ;; break point insert
  (defun ipdb:insert-trace (arg)
    (interactive "p")
    (open-previous-line arg)
    (insert "import ipdb; ipdb.set_trace()")
    (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))

  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'turn-on-eldoc-mode))

(use-package anaconda-mode
  :ensure t
  :defer t
  :pin melpa
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :defer t
  :pin melpa
  :config
  ;; (add-to-list 'company-backends 'company-anaconda)
  (add-to-list 'company-backends '(company-anaconda :with company-capf))
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package pyenv-mode
  :ensure t
  :defer t
  :config
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
          (pyenv-mode-set project)
        (pyenv-mode-unset))))
  (add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
  (add-hook 'python-mode-hook 'pyenv-mode))


;;;; GO

(use-package go-mode
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'gofmt-before-save)
              (setq tab-width 4)
              (setq indent-tabs-mode 1))))

(use-package go-eldoc
  :ensure t
  :pin melpa
  :defer t
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package company-go
  :ensure t
  :defer t
  :pin melpa-stable
  :init
  (add-hook 'go-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-go)))))


;;;; SQL

(use-package sql
  :bind ("C-c q" . sql-connect)
  :defer t
  :config
  (defun psql:connection-alist (pgpass)
    (let ((value))
      (dolist (element pgpass value)
        (setq srv-element (split-string element ":"))
        (setq value (cons (list (intern (nth 0 srv-element))
                                `(sql-server ,(nth 0 srv-element))
                                `(sql-port ,(string-to-number
                                             (nth 1 srv-element)))
                                `(sql-database ,(nth 2 srv-element))
                                `(sql-user ,(nth 3 srv-element))
                                `(sql-password ,(nth 4 srv-element)))
                          value)))))

  (setq sql-product 'postgres)
  (setq sql-connection-alist
        (reverse (psql:connection-alist (read-lines "~/.pgpass"))))

  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t)
              (sql-highlight-postgres-keywords))))


;;;; TERMINAL

;; Git Branch
(defun git-prompt-branch-name ()
  (let ((args '("symbolic-ref" "HEAD" "--short")))
    (with-temp-buffer
      (apply #'process-file "git" nil (list t nil) nil args)
      (unless (bobp)
        (goto-char (point-min))
        (buffer-substring-no-properties (point) (line-end-position))))))

;; EShell
(use-package eshell
  :defer t
  :bind ("C-c e" . eshell)
  :init
  (add-hook 'eshell-mode-hook
            (lambda ()
              (add-to-list 'eshell-visual-commands "ssh")
              (add-to-list 'eshell-visual-commands "tail")
              (add-to-list 'eshell-visual-commands "htop")
              (add-to-list 'eshell-visual-commands "tree")))

  (defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))

  (setq eshell-prompt-function
        (lambda ()
          (concat "\n"
                  (with-face (concat "[" (getenv "USER") "@" (system-name) "] ")
                             :foreground
                             (face-attribute 'font-lock-keyword-face :foreground))
                  (with-face (concat "[" (eshell/pwd) "] ")
                             :foreground
                             (face-attribute 'font-lock-function-name-face :foreground))
                  (with-face (concat "[" (git-prompt-branch-name) "] ")
                             :foreground
                             (face-attribute 'font-lock-string-face :foreground))
                  (with-face "\n❯ ")))
        eshell-prompt-regexp (concat "^" (regexp-quote "❯ "))))


;; ORG MODE

(use-package org
  :defer t
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  ;; tasks
  (setq org-log-done t)
  (setq org-todo-keywords
        '((sequence "TODO" "PROG" "HOLD" "|" "DONE" "CNCL")))
  ;; TODO PROG HOLD CANC
  (setq org-agenda-window-setup 'current-window)

  ;; agenda
  (setq org-agenda-show-all-dates nil)
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file "inbox.org")
  (setq org-agenda-files `(,(concat org-directory "/inbox.org")
                           ,(concat org-directory "/heuristix.org")
                           ,(concat org-directory "/inforisk.org")
                           ,(concat org-directory "/faim.org")
                           ,(concat org-directory "/canoa.org")
                           ,(concat org-directory "/private.org")))
  (setq org-refile-targets '((nil :maxlevel . 1)
                             (org-agenda-files :maxlevel . 1)))
  (setq org-capture-templates
        '(("t" "todo"
           entry (file+headline org-default-notes-file "Tasks")
           "** TODO [#B] %? :task:\n")
          ("a" "appointment"
           entry (file+headline org-default-notes-file "Appointments")
           "** %? :appointment:\n   SCHEDULED: %t" :scheduled t)))

  ;; theme
  (defun org-levels-hook ()
    "Set org-level headers size"
    (dolist
        (face '(org-level-1 org-level-2 org-level-3 org-level-4 org-level-5))
      ;; (set-face-attribute face nil :height 1.0 :background "black")
      ))
  (add-hook 'org-mode-hook 'org-levels-hook)
  (setq org-src-fontify-natively t)
  (setq org-ellipsis "  …")) ;;"  ⤵" "  ►"

(use-package org-bullets
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("⊚" "☉" "○" "◦" "∙"))) ;;  "✱" "⊚"


;; DOCUMENTS

(use-package markdown-mode
  :ensure t
  :pin melpa-stable
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-open-command "/usr/local/bin/marked2"))

;; To open Marked 2 create /usr/local/bin/marked2 shellscript
;;
;; #!/bin/sh
;; if [ $1 ]; then
;;     open -a "Marked 2" $1;
;; else
;;     open -a "Marked 2";
;; fi
;;
;; Open command: C-c C-c o

(use-package tex
  :ensure auctex
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-buffer))


;; EDITING

(use-package expand-region
  :ensure t
  :pin melpa
  :bind ("C-=" . 'er/expand-region))


;; EVIL

(use-package evil
  :ensure t
  :pin melpa-stable
  :delight undo-tree-mode
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration nil)
  :config
  (evil-mode 1)
  (add-to-list 'evil-emacs-state-modes 'ag-mode)
  ;; (add-to-list 'evil-emacs-state-modes 'dired)
  (add-to-list 'evil-emacs-state-modes 'flycheck-error-list-mode)
  (add-to-list 'evil-emacs-state-modes 'git-rebase-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :delight undo-tree-mode
  :config
  (evil-collection-init))

(use-package evil-leader
  :after evil
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    ;; emacs
    "b" 'switch-to-buffer
    "f" 'find-file
    "w" 'save-buffer
    "c" 'comment-line
    "a" 'ansi-term
    "g" 'magit-status
    "e" 'eshell
    "s" 'sql-connect
    "k" 'kill-this-buffer
    "l" 'swiper
    ;; line numbers
    "nr" 'relative-line-numbers
    "na" 'absolute-line-numbers
    "no" 'off-line-numbers
    ;; projectile
    "pp" 'projectile-switch-project
    "pf" 'projectile-find-file
    "pa" 'projectile-ag))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


;;;; SERVER

(use-package server
  :ensure nil
  :defer 3
  :config
  (unless (server-running-p)
    (server-start)))

(setq gc-cons-threshold (* 2 1000 1000))
