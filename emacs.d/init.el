;; ===========
;; Look & Feel
;; ===========
(cd "~/")
(prefer-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq inhibit-splash-screen t)
(setq kill-whole-line t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(windmove-default-keybindings)
(setq windmove-wrap-around t)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(put 'erase-buffer 'disabled nil)
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; ========
;; Packages
;; ========
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(load "~/.emacs.d/init-packages.el")
(load-theme 'leuven t)

;; ========
;; Mac OS X
;; ========
(when (equal system-type 'darwin)
  (set-default-font "Menlo-12")
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (exec-path-from-shell-initialize))

;; ===================
;; Major & Minor modes
;; ===================
(defalias 'list-buffers 'ibuffer)
(desktop-save-mode)
(semantic-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(setq show-paren-delay 0)
(global-auto-revert-mode 1)
(global-hl-line-mode 1)
;(global-linum-mode 1)

;; Company
(add-hook 'after-init-hook 'global-company-mode)

;; Flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; org
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; restclient-mode
(require 'restclient)
(add-to-list 'auto-mode-alist '("\\.http$" . restclient-mode))

;; python
(elpy-enable)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; sass-mode
(setq scss-compile-at-save nil)

;; dockerfile
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; inf-ruby
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; subword
(add-hook 'prog-mode-hook 'subword-mode)

;; rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; whitespace-cleanup
(require 'whitespace-cleanup-mode)
(add-hook 'prog-mode-hook 'whitespace-cleanup-mode)

;; Ido
;; ===
(ido-mode )
;; (require 'ido)
;; (require 'flx-ido)
;; (ido-mode 1)
;; (flx-ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)
;; (set-default 'imenu-auto-rescan t)
;; (add-to-list 'ido-ignore-directories "target")
;; (add-to-list 'ido-ignore-directories "dest")
;; (add-to-list 'ido-ignore-directories "bower_components")
;; (add-to-list 'ido-ignore-directories "node_modules")
;; (global-set-key (kbd "C-c i") 'idomenu)

;; Helm
;; ====
(require 'helm-config)
(helm-mode 1)

;; Ace Jump
;; ========
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
(autoload 'ace-jump-mode-pop-mark "ace-jump-mode" "Ace jump back:-)" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Haskell
;; =======
(require 'haskell-mode)
(require 'haskell-cabal)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)


;; Clojure
;; =======
(require 'clojure-mode)
(require 'cider)
(setq nrepl-log-messages t)
(setq nrepl-buffer-name-separator "-")
(setq nrepl-buffer-name-show-port t)
(setq cider-repl-history-file "~/.emacs.d/nrepl-history")
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("gantryfile" . clojure-mode))
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)


;; CoffeeScript
;; ============
;; coffeescript
(defun my-coffee-mode-hook ()
  "Hooks for Web mode."
  (setq coffee-tab-width 2)
  (setq coffee-args-compile '("-c" "--bare")))

(add-hook 'coffee-mode-hook  'my-coffee-mode-hook)

(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)))

;; JavaScript
;; ==========
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)

;; Web
;; ===
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-enable-auto-quoting nil))

(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Projectile
;; ==========
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)
(helm-projectile-on)

;; Delight
;; =======
(require 'delight)
(delight '((auto-complete-mode nil "auto-complete")
           (helm-mode nil "helm-mode")
           (haskell-doc-mode nil "haskell-doc")
           (haskell-indentation-mode nil "haskell-indentation")
           (interactive-haskell-mode nil "haskell-process")
           (whitespace-cleanup-mode)))

;; ====
;; Kbds
;; ====
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x c s") 'helm-swoop)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-x g") 'magit-status)
