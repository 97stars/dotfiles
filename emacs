;;____________________________________________________________________
;;;; Init code

(tool-bar-mode nil)
(scroll-bar-mode nil)

;; window mods
(modify-frame-parameters
 (selected-frame)
 '(
   (left-fringe . 0)
   (right-fringe . 0)))
;; (set-frame-height (selected-frame) 80)
;; (set-frame-width (selected-frame) 120)

;; no line wrapping
(setq-default truncate-lines t)

;; colors
(add-to-list 'load-path "~/elisp/color-theme")
(require 'color-theme)

;; no more splash screen
(setq inhibit-splash-screen t)

;; set garbage collection to 100x default
(setq gc-cons-threshold 50000000)

;; activate font-lock-mode. Yay syntax coloring :D
(global-font-lock-mode t)

;; always flash for parens
(show-paren-mode 1)

;; time in the modeline
(display-time)

;; scroll when 2 lines from top/bottom
(setq scroll-margin 2)

;; push the mouse out of the way
(mouse-avoidance-mode 'jump)

;; ibuffer > buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; Look Ma, no backups!
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(ido-mode)
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
  (define-key ido-completion-map " " 'just-one-space))

;; line numbers
(require 'linum)
(setq linum-format "%d ")

;; display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode)

;;____________________________________________________________________
;;;; PYTHON
(autoload 'pythom-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init))
  (load "~/elisp/flymake-cursor.el"))

(add-hook
 'python-mode-hook 
 (lambda () 
   (unless (eq buffer-file-name nil) (flymake-mode 1)) ;dont invoke flymake on temporary buffers for the interpreter
   (local-set-key [f2] 'flymake-goto-prev-error)
   (local-set-key [f3] 'flymake-goto-next-error)
   ))

;;____________________________________________________________________
;;;; PERL
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(setq cperl-indent-level 4)

;;____________________________________________________________________
;;;; C-like
(setq-default c-basic-offset 4)

;;____________________________________________________________________
;;;; yaml-mode
(add-to-list 'load-path "~/elisp/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;;____________________________________________________________________
;;;; keybindings
(global-set-key (kbd "C-<f1>") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-<f2>") 'clipboard-yank)
(global-set-key (kbd "C-<f3>") (lambda () 
				 (interactive) 
				 (revert-buffer t t)))
(global-set-key (kbd "<f6>") 'linum-mode)
(global-set-key (kbd "<f7>") 'next-buffer)
(global-set-key (kbd "<f8>") 'previous-buffer)
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;;____________________________________________________________________
;;;; org mode
(add-to-list 'load-path "~/elisp/org/")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;;___________________________________________________________________
;;;; local overrides
(load "~/.emacs.local")
(put 'upcase-region 'disabled nil)
