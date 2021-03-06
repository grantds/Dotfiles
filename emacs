(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'fullscreen)
(global-set-key [f11] 'fullscreen-toggle)




(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("e6d83e70d2955e374e821e6785cd661ec363091edf56a463d0018dc49fbc92dd" default)))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("~/compilers-f14/lab3/compiler" "l3c/"))))
 '(ecb-tip-of-the-day nil)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq evil-want-C-u-scroll t)
(package-initialize)
(evil-mode 1)

 ;; merlin config
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)
(setq merlin-use-auto-complete-mode t)


(add-hook 'tuareg-mode-hook 'merlin-mode)

 ;; enable auto-complete mode
(require 'auto-complete-config)
(ac-config-default)


;; scrolling
(setq scroll-step 1) ;; kb scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; mouse one line a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(scroll-bar-mode -1)

(if (daemonp)
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(load-theme 'wombat t)))
  (load-theme 'wombat t))


;; tabs
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; activate ecb
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-compile-window-height 12)

(when (fboundp 'windmove-default-keybindings)
	(windmove-default-keybindings))


;; highlight matching parens
(show-paren-mode 1)

;; column-numbers
(column-number-mode 1)

(global-auto-revert-mode 1)


;; (setenv "GOPATH" "/home/grantds/School/440/p2/15-440-p2")
(add-to-list 'load-path "~/Misc/emacs/go-mode.el/")
(add-to-list 'load-path "~/goprojects/src/github.com/dougm/goflymake")
(require 'go-mode-load)
(require 'go-flymake)
(add-hook 'before-save-hook 'gofmt-before-save)


(require 'go-autocomplete)

;; stuff for rust
(setq racer-rust-src-path "usr/local/src/rust/src")
(setq racer-cmd "/home/grantds/.cargo/bin/racer")

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

;; Set path to racer binary
(setq racer-cmd "/home/grantds/.cargo/bin/racer")

;; Set path to rust src directory
(setq racer-rust-src-path "/usr/local/src/rust/src")

;; Load rust-mode when you open `.rs` files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Setting up configurations when you load rust-mode
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)


;; set path to clang-format
(setq clang-format "/usr/bin/clang-format-3.7")


