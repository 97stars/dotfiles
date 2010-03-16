;; UI mods
(tool-bar-mode nil)
(scroll-bar-mode nil)

;;____________________________________________________________________
;;;; Init code

;; default font
(set-face-attribute 'default nil :font "Consolas-11.0")

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
(eval-after-load "color-theme"
    '(progn
        (color-theme-initialize)
        (color-theme-tango)))

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

;; Look Ma, no backups!
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(ido-mode)

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

;;____________________________________________________________________
;;;; PERL
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

;;____________________________________________________________________
;;;; keybindings
(global-set-key (kbd "C-<f1>") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-<f2>") 'clipboard-yank)
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
