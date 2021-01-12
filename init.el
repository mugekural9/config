;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;; Increase gc-cons-threshold, depending on your system you may set it back to a
;; lower value in your dotfile (function `dotspacemacs/user-config')

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(defvar my-packages
  '(expand-region
    json-mode
    julia-mode
    julia-shell
    spacemacs-theme
    undo-tree
)
"A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p)) (package-install p)))

(global-visual-line-mode 1)
(global-display-line-numbers-mode)


(setq x-select-enable-clipboard t)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;;(setq gc-cons-threshold 100000000)

;;(defconst spacemacs-version         "0.200.13" "Spacemacs version.")
;;(defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

;;(if (not (version<= spacemacs-emacs-min-version emacs-version))
;;    (error (concat "Your version of Emacs (%s) is too old. "
;;                   "Spacemacs requires Emacs version %s or above.")
;;           emacs-version spacemacs-emacs-min-version)
;;  (load-file (concat (file-name-directory load-file-name)
;;                     "core/core-load-paths.el"))
;;  (require 'core-spacemacs)
;;  (spacemacs/init)
;;  (configuration-layer/sync)
;;  (spacemacs-buffer/display-startup-note)
;;  (spacemacs/setup-startup-hook)
;;  (require 'server)
;;  (unless (server-running-p) (server-start)))


;;(require 'julia-mode)
(load-theme 'spacemacs-light t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode spacemacs-theme julia-shell julia-mode ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree toc-org spaceline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile async aggressive-indent adaptive-wrap ace-window ace-link))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
