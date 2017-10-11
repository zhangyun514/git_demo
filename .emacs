 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		company
		monokai-theme
		hungry-delete
		swiper
		counsel
		smartparens
		js2-mode
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
(load-theme 'monokai t)
(require 'hungry-delete)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(global-hungry-delete-mode)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(set-scroll-bar-mode nil)
(setq inhibit-startup-message t)
(global-linum-mode t)
(setq make-backup-files nil)
(tool-bar-mode -1)
(global-company-mode 1)
(setq-default cursor-type 'bar)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(delete-selection-mode 1)
;;(setq initial-frame-alist(quote((fullscreen . maximized))))
(global-hl-line-mode t)





;;pythonÅäÖÃ
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(counsel-linux-apps-directories
   (quote
    ("/usr/local/share/applications/\" \"/usr/share/applications/")))
 '(custom-safe-themes
   (quote
    ("3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" default)))
 '(package-selected-packages (quote (python-mode elpy company)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package python-mode
  :mode (("SConstruct\\'" . python-mode)
         ("SConscript\\'" . python-mode)
         ("\\.py\\'"      . python-mode))
  :config
  (use-package elpy
    :init
    (elpy-enable)
    (elpy-use-ipython)
    ;; use flycheck not flymake with elpy
    (when (require 'flycheck nil t)
      (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
      (add-hook 'elpy-mode-hook 'flycheck-mode))))
(cd "G:\PythonCode")
(set-default-font "ÎÄÈªæäµÈ¿íÕýºÚ-10") 
