;; Emacs starts with at 120 x 120 
(when window-system (set-frame-size (selected-frame) 120 120))

;; Hide start menu
(setq inhibit-startup-message t)

;; Ivy starts at the home directory 
(setq default-directory (concat (getenv "HOME") "/"))

;; Show line numbers by default
(global-linum-mode 1)

;; Better searching
(ivy-mode 1)

;; Use Vim
(evil-mode)

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
