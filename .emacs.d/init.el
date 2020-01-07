;;;; init.el - Emacs 26.2
;;;; Ogi Martinovic, 2019

(setq gc-cons-threshold (* 50 1024 1024))


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

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


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
(windmove-default-keybindings)

;; Buffers
(defalias 'list-buffers 'ibuffer)

;; Keys
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  ;; (setq mac-option-modifier 'super)
  (setq mac-option-modifier 'meta))
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Parens
(show-paren-mode 1)
(defvar show-paren-delay 0)


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

;; Backup & Autosave
(setq make-backup-files nil)
(setq auto-save-default nil)


;;;; THEME / FONT / MODE LINE

;; Disable all bold fonts
(defun disable-bold ()
  (interactive)
  (mapc (lambda (face)
          (when (eq (face-attribute face :weight) 'bold)
            (set-face-attribute face nil :weight 'normal)))
        (face-list)))

;; Font
(set-frame-font "Operator Mono SSm-15")

;; Theme
(use-package doom-themes
  :ensure t
  :pin melpa
  :config
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic nil)
  (load-theme 'doom-gruvbox t)
  ;; (set-face-attribute 'show-paren-match nil
  ;;                     :bold nil :underline t :background nil :foreground "white")
  ;; (set-cursor-color "white")  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; Modeline
(use-package delight :ensure t)


;;;; HELM

(use-package helm
  :ensure t
  :delight helm-mode
  :bind (("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("M-x" . helm-M-x))
  :init
  (setq helm-M-x-fuzzy-match        t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t
        helm-split-window-in-side-p t
        helm-autoresize-max-height 25
        helm-autoresize-min-height 25)
  :config
  (helm-autoresize-mode nil)
  (helm-mode 1)
  (set-face-attribute 'helm-ff-dotted-directory nil
                      :background nil :foreground nil))

(use-package ag
  :ensure t)

(use-package helm-ag
  :ensure t
  :after helm)

(use-package helm-projectile
  :ensure t
  :config
  (setq helm-projectile-fuzzy-match t)
  (helm-projectile-on))

(use-package swiper-helm
  :ensure t
  :defer t
  :bind ("C-;" . 'swiper-helm))


;;;; PROJECT

(use-package projectile
  :ensure projectile
  ;; :delight projectile-mode
  :pin melpa-stable
  :bind ("C-c p" . 'projectile-command-map)
  :config
  (projectile-global-mode)
  (setq projectile-mode-line-function
        '(lambda () (format " Proj:%s" (projectile-project-name))))
  (setq projectile-completion-system 'helm))

(use-package magit
  :ensure magit
  :pin melpa-stable
  :defer t
  :bind ("C-x g" . magit-status))


;;;; PROG MODES

(use-package eldoc :delight eldoc-mode)

(use-package flycheck
  :ensure t
  :defer t
  :pin melpa-stable)

(use-package company
  :ensure t
  :defer 3
  :delight company-mode
  :pin melpa-stable
  :bind ("C-x c" . company-complete)
  :config
  (global-company-mode)
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package yasnippet
  :ensure t
  :defer t
  :delight yas-minor-mode
  :pin melpa
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t
  :pin melpa)

(use-package dockerfile-mode
  :ensure t
  :defer t
  :pin melpa-stable
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package protobuf-mode
  :ensure t
  :defer t
  :pin melpa-stable)

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
  (setq-default whitespace-line-column 120
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
  :pin melpa-stable
  :defer t
  :config
  (setq cider-repl-use-clojure-font-lock t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (setq cider-mode-line " repl"))


;;;; LISP

(use-package slime
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

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

;;; SCHEME

(use-package geiser
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq geiser-chez-binary "chez"))


;;;; PROLOG

(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))


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

  ;; break point insert
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


;;;; C++
;; todo


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


;;;; ORG MODE

(use-package org
  :defer t
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  ;; tasks
  (setq org-log-done t)
  (setq org-todo-keywords
        '((sequence "TODO" "PROG" "HOLD" "|" "DONE" "CANC")))
  (setq org-agenda-window-setup 'current-window)

  ;; agenda
  (setq org-agenda-show-all-dates nil)
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file "inbox.org")
  (setq org-agenda-files `(,(concat org-directory "/inbox.org")
                           ,(concat org-directory "/workframe.org")
                           ,(concat org-directory "/heuristix.org")
                           ,(concat org-directory "/inforisk.org")
                           ,(concat org-directory "/faim.org")
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
  (add-hook 'org-mode-hook 'org-levels-hook)
  (setq org-src-fontify-natively t)
  (setq org-ellipsis "  …")) ;;"  ⤵" "  ►"

(use-package org-bullets
  :ensure t
  :pin melpa-stable
  :defer t
  :hook (org-mode . org-bullets-mode))

;; (setq org-bullets-bullet-list '("⊚" "☉" "○" "◦" "∙"))
;;  "✱" "⊚ *"


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

(use-package auctex
  :ensure t
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-buffer))


;;;; EDITING

(use-package expand-region
  :ensure t
  :pin melpa
  :bind ("C-=" . 'er/expand-region))

(defun backward-kill-line (arg)
  "Kill line backward"
  (interactive "p")
  (kill-line (- 1 arg)))

(defun top-join-line ()
  "Join the current line with the line beneath it"
  (interactive)
  (delete-indentation 1))

(defun open-next-line (arg)
  "Open line below and indent"
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (indent-according-to-mode))

(defun open-previous-line (arg)
  "Open line above and indent"
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(global-set-key (kbd "M-O") 'open-previous-line)
(global-set-key (kbd "M-o") 'open-next-line)
(global-set-key (kbd "C-^") 'top-join-line)
(global-set-key (kbd "C-<backspace>") 'backward-kill-line)
(global-set-key (kbd "C-'") 'delete-backward-char)
(global-set-key (kbd "C-x k") 'kill-this-buffer)


;;;; SERVER

(use-package server
  :ensure nil
  :defer 3
  :config
  (unless (server-running-p)
    (server-start)))

(setq gc-cons-threshold (* 2 1024 1024))
