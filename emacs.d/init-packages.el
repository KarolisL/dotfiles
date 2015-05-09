(require 'cl)
(defvar prelude-packages
  '(
    ace-jump-mode
    clojure-mode
    cider
    auto-complete
    buffer-move
    coffee-mode
    company-tern
    dash
    delight
    dockerfile-mode
    elpy
    exec-path-from-shell
    find-file-in-project
    flycheck
    flx-ido
    fuzzy
    gitconfig-mode
    haskell-mode
    helm
    helm-projectile
    helm-swoop
    highlight-indentation
    idomenu
    iedit
    inf-ruby
    javadoc-lookup
    json-mode
    tern
    less-css-mode
    magit
    markdown-mode
    nose
    popup
    pyvenv
    rainbow-delimiters
    restclient
    rust-mode
    toml-mode
    sml-mode
    scss-mode
    projectile
    web-mode
    zenburn-theme
    yaml-mode
    yasnippet
    whitespace-cleanup-mode
    )
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))
