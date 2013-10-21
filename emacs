(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(mouse-scroll-delay 0.5)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control))))))

;; Turn on syntax highlight for old emacs versions
(if (< emacs-major-version 23)
    (global-font-lock-mode 1)) 

;;auxtex settings, for writing LaTex with emacs
(eval-after-load "tex-mode" '(progn
(load "auctex.el" nil nil t)
(load "preview-latex.el" nil nil t))) 

(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) 
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(setq TeX-view-program-list '(("Okular" ("okular --unique %o" (mode-io-correlate "#src:%n%b")))))
(setq TeX-view-program-selection 
      '((output-pdf "Okular") (output-dvi "Okular")))

;; make kill/yank behave like copy/paste, using the clipboard
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;; do not make backup files ending with ~ or #
(setq make-backup-files nil)
(setq auto-save-default nil)

;; put the filename in the windowmanager titlebar, or use buffer name
;; otherwise
(setq frame-title-format "%b - emacs")

;; Two real spaces for offsets in c code
(setq c-default-style "bsd" 
      c-basic-offset 2)

;; In text mode use visual line mode (good wrapping)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
;;(add-hook 'text-mode-hook 'flyspell-mode)

;;newline and indent when hitting return in c mode
(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;;default to ssh alone for tramp mode
(setq tramp-default-method "ssh")

;; tab completion!
(global-set-key [(tab)] 'smart-tab)
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
  (if mark-active
      (indent-region (region-beginning)
		     (region-end))
    (if (looking-at "\\_>")
	(dabbrev-expand nil)
      (indent-for-tab-command)))))

;; open with mouse in dired
(add-hook 'dired-mode-hook 'my-dired-mode-hook)
(defun my-dired-mode-hook ()
  (local-set-key (kbd "<mouse-2>") 'dired-mouse-find-file))

(defun dired-mouse-find-file (event)
  "In Dired, visit the file or directory name you click on."
  (interactive "e")
  (require 'cl)
  (flet ((find-file-other-window
          (filename &optional wildcards)
          (find-file filename wildcards)))
    (dired-mouse-find-file-other-window event)))

;; turn on paren match highlighting
(show-paren-mode 1)
;; highlight entire bracket expression
;;(setq show-paren-style 'expression)

;; delete seleted text when typing
(delete-selection-mode 1)

;; display line numbers in margin.
;(if (>= emacs-major-version 23)
;    (global-linum-mode 1)) 

;; use the CUA undo key. Disables suspend in terminal however...
(global-set-key (kbd "C-z") 'undo)

;; add ergoemacs bindings for cursor movement
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-l") 'forward-char)

(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000)) ; 90002000 is just random. you can use `most-positive-fixnum'
    (fill-paragraph nil)))

(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the inverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))

(global-set-key (kbd "C-M-q") 'unfill-region)
;;(global-set-key (kbd "M-i") 'previous-line)
