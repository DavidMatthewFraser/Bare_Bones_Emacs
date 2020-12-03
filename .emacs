;; Emacs starts with at 120 x 120 
(when window-system (set-frame-size (selected-frame) 120 120))

;; Hide start menu
(setq inhibit-startup-message t)

;; Ivy starts at the home directory 
(setq default-directory (concat (getenv "HOME") "/"))

;; Show line numbers by default
(global-linum-mode 1)

;; Enable Ivy for better searching
(ivy-mode 1)

;; Enable Vim
(evil-mode)

;; Enable Which-Key for a guide to keyboard shortcuts
(which-key-mode)

;; restore previous window state ctl-c left/right
(winner-mode 1)

;; Access to Melpa packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; Installed packages 
(use-package evil
:ensure t)

(use-package ivy
  :ensure t)

(use-package which-key
  :ensure t)

;; swap between windows easily
(use-package ace-window
:ensure t
:init
(progn
(global-set-key [remap other-window] 'ace-window)
(windmove-default-keybindings)
(custom-set-faces
'(aw-leading-char-face
((t (:inherit ace-jump-face-foreground :height 3.0)))))
))

;; Better Bullets for org-mode
 (use-package org-bullets
    :ensure t
        :init
        (add-hook 'org-mode-hook (lambda ()
                            (org-bullets-mode 1))))

;; this is were ispell is installed on my machine
(setq ispell-program-name "/usr/local/bin/ispell")

;; Emacs color theme
(load-theme 'tsdh-light)
