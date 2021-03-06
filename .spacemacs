;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs) dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation
   'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation
   t
   ;; If non-nil layers with lazy install support are lazy installed.
  ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path
   '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(windows-scripts
     rust
     ;; lsp-rust
     yaml

     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     shell
     ;; my-irony
     lsp
     ;; lsp-cquery
     (auto-completion :variables spacemacs-default-company-backends '(company-files ;; company-irony
                                                                                    company-lsp))
     (python :variables python-enable-yapf-format-on-save t)

     semantic
     ;; better-defaults
     ;; emacs-lisp
     git
     ;; version-control
     markdown
     pandoc
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     ;; gtags
     umlauts
     ranger
     zone-matrix
     themes-megapack
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     (c-c++ :variables
            ;; c-c++-enable-clang-format-on-save t
            c-c++-backend 'lsp-cquery
            c-c++-lsp-executable "D:/tools/cquery/bin/cquery.exe"
            c-c++-lsp-sem-highlight-method 'font-lock
            c-c++-lsp-sem-highlight-rainbow t
            c-c++-lsp-extra-init-params '(:cacheFormat "json"))

     (cmake :variables cmake-enable-cmake-ide-support t)
     ;; (c-c++ :variables c-c++-enable-clang-support
     ;;        t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(evil-smartparens
     exec-path-from-shell
     lsp-rust
     yasnippet-snippets)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages
   '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages
   'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t) dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout
   5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you st(custom-set-variables
   dotspacemacs-check-for-update
   nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory
   nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style
   'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading
   nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner
   'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists
   '((recents . 5)
     (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive
   t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode
   'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key
   "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key
   ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key
   "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key
   ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key
   "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab
   nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$
   nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift
   t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text
   nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global
   nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name
   "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout
   nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size
   1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location
   'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots
   5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize
   nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header
   nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position
   'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy
   'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state
   nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay
   0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position
   'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar
   t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup
   nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native
   nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup
   nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency
   90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency
   90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title
   t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide
   t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols
   nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling
   t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers
   nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method
   'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode
   nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis
   nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters
   'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server
   nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup
   nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
 
  (setq exec-path (append exec-path '("/home/andre/.cargo/bin")))
  (setq shell-file-name "zsh")
  (setq shell-command-switch "-ic")
  (exec-path-from-shell-initialize)  
  (setq python-shell-interpreter "python3")
  (setq flycheck-python-pycompile-executable "python3")
  (setq-default git-enable-magit-svn-plugin t)
  ;; (setq cquery-extra-args '("--log-file=d:/cqemacs.log"))
  ;; (setq cquery-executable "D:/tools/cquery/bin/cquery.exe")
  ;; (setq cquery-cache-dir ".cquery_cached_index")
  (setq dotspacemacs-elpa-https nil)
  ;; (setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|10.*\\)")
  ;;                            ("http" . "172.17.1.20:8080")
  ;;                            ("https" . "172.17.1.20:8080")))
;;  (setq url-proxy-services '(("no_proxy" . "127.0.0.1")
 ;;                            ("http" . "172.17.1.20:8080")
  ;;                           ("https" . "172.17.1.20:8080")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (put 'helm-make-build-dir 'safe-local-variable
       'stringp)
  (setq c-default-style "bsd"
        c-basic-offset 4)

  ; Look in rustups install directory for rust sources
  (setq racer-rust-src-path "/home/andre/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

  (evil-goggles-mode)
  (setq evil-goggles-duration 0.01)

  ;; Make SPC-p-F find a file and put it into a new window
  (spacemacs/set-leader-keys "pF" 'projectile-find-file-other-window)

  ;; Make "M" key do what "," did in Vim, execute the opposite of last move command
  (define-key evil-normal-state-map (kbd "M") 'evil-repeat-find-char-reverse)

  ;; (global-evil-mc-mode 1)

  ;; Reduce delay of SPC-j-j
  (setq avy-timeout-seconds 0.25)

  ;; Make room for nyan cat
  (spaceline-toggle-minor-modes-off)

  ;; Zone out after some time
  ;; (setq zone-timer (run-with-idle-timer 180 t 'zone))

  ;; Enable all Zone programs
  (setq zone-programs [
                       zone-sl
                       zone-matrix
                       zone-pgm-rainbow
                       zone-pgm-putz-with-case
                       ;; zone-pgm-whack-chars
                       zone-pgm-five-oclock-swan-dive
                       zone-pgm-rat-race
                       ;; zone-pgm-random-life
                       ])

  ;; See emacs symbols as "word" in evil
  (with-eval-after-load 'evil
    (defalias #'forward-evil-WORD #'forward-evil-symbol))

  ;; (setq cquery-sem-highlight-method 'font-lock)
  (setq projectile-enable-caching t)

  (setq-default color-identifiers-coloring-method 'hash)
  (setq-default color-identifiers:min-color-saturation 0.7)
  (setq-default color-identifiers:num-colors 15)

  ;; I highly suggest setting ‘flyspell-issue-message-flag’ to nil, as printing messages
  ;; for every word (when checking the entire buffer) causes an enormous slowdown. – nschum
  (setq flyspell-issue-message-flag nil)

  ;; Get recent-files faster by ignoring files on remote that are gone
  (setq recentf-keep '(file-remote-p file-readable-p))

  ;; try to improve slow performance on windows.
  (setq w32-get-true-file-attributes nil)

  ;; Don't delete files right away
  (setq delete-by-moving-to-trash t)

  ;; Longer lines in python
  (setq-default flycheck-flake8-maximum-line-length 99)

  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
  ;; (setq cquery-extra-args '("--log-file=d:/cq.log"))
  (setq cquery-cache-dir ".cquery_cached_index")
  ;; (setq cquery-executable "D:/tools/cquery/bin/cquery.exe")
  (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "json"))

  (setq helm-ff-skip-boring-files t)
  (setq-default git-enable-magit-svn-plugin t)
  (setq helm-make-arguments "-j8")
  ;; (add-hook 'c-mode-hook 'irony-mode)
  ;; (add-hook 'c-mode-hook 'smartparens-strict-mode)
  ;; (add-hook 'c-mode-hook 'evil-smartparens-mode)

  ;; (setq eclim-eclipse-dirs '((shell-command-to-string ""C:/Program Files (x86)/Atollic/TrueSTUDIO for ARM 8.1.0/ide""))
  ;;       eclim-executable (shell-command-to-string ""C:/Program Files (x86)/Atollic/TrueSTUDIO for ARM 8.1.0/ide/eclim.bat""))

  (global-centered-cursor-mode t)

  ;; (cquery-use-default-rainbow-sem-highlight)
  ;; (setq cquery-sem-macro-colors '("#cf6d49"))

  ;; (setq cquery-sem-parameter-colors
  ;;   '("#429921" "#58c1a4" "#5ec648" "#36815b" "#83c65d"
  ;;     "#417b2f" "#43cc71" "#7eb769" "#58bf89" "#3e9f4a"
  ;;     "#e1afc3" "#d533bb" "#9b677f" "#e350b6" "#a04360"
  ;;     "#dd82bc" "#de3864" "#ad3f87" "#dd7a90" "#e0438a"
  ;;     "#e79528" "#c5373d" "#e8a272" "#d84f2b" "#a67245"
  ;;     "#e27a33" "#9b4a31" "#b66a1e" "#e27a71" "#cf6d49"
  ;;     "#e5b124" "#927754" "#eb992c" "#e2bf8f" "#d67c17"
  ;;     "#88651e" "#e4b953" "#a36526" "#b28927" "#d69855"))

  ;; (setq cquery-sem-variable-colors '("#429921" "#58c1a4" "#5ec648" "#36815b" "#83c65d"
  ;;                                   "#417b2f" "#43cc71" "#7eb769" "#58bf89" "#3e9f4a"
  ;;                                   "#e1afc3" "#d533bb" "#9b677f" "#e350b6" "#a04360"
  ;;                                   "#dd82bc" "#de3864" "#ad3f87" "#dd7a90" "#e0438a"
  ;;                                   "#e79528" "#c5373d" "#e8a272" "#d84f2b" "#a67245"
  ;;                                   "#e27a33" "#9b4a31" "#b66a1e" "#e27a71" "#cf6d49"
  ;;                                   "#e5b124" "#927754" "#eb992c" "#e2bf8f" "#d67c17"
  ;;                                   "#88651e" "#e4b953" "#a36526" "#b28927" "#d69855"))
  ;; (setq cquery-sem-function-colors '("#bc6ec5"))

  ;; (set-face-attribute 'cquery-sem-face-function nil
  ;;                     :weight 'extra-bold)

  ;; (setq cquery-sem-highlight-method 'font-lock)

  (defun ignored-c-files-extensions ()
    (setq-default helm-grep-ignored-files
                  (append '(
                            "*.al"
                            "*.list"
                            "*.lst"
                            "*.map"
                            "*.su") helm-grep-ignored-files))

    (setq-default helm-boring-file-regexp-list
                  (append '("\\.DS_Store$"
                            "\\.svn$"
                            "\\.al$"
                            "\\.su$"
                            "\\.elf$"
                            "\\.hex$"
                            "\\.list$"
                            "\\.map$"
                            "\\.svn-base$"
                            "\\.swp$") helm-boring-file-regexp-list))
    )

  ;; Ignore some project specific files
  (add-hook 'c++-mode-hook 'ignored-c-files-extensions)
  (add-hook 'c-mode-hook 'ignored-c-files-extensions)
  ;; (add-hook 'after-init-hook 'global-color-identifiers-mode)
  ;; (add-hook 'after-init-hook '(color-identifiers:set-declaration-scan-fn 'c-mode nil)) ;; Does this work?
  ;; (add-hook 'c-mode-hook 'ignored-c-files-extensions)

  ;; Windows performance tweaks (irony)
  ;;
  (when (boundp 'w32-pipe-read-delay)
    (setq w32-pipe-read-delay 0))
  ;; Set the buffer size to 64K on Windows (from the original 4K)
  (when (boundp 'w32-pipe-buffer-size)
    (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" "66f32da4e185defe7127e0dc8b779af99c00b60c751b0662276acaea985e2721" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(global-centered-cursor-mode t)
 '(helm-gtags-display-style (quote detail))
 '(lsp-response-timeout 1)
 '(helm-make-build-dir "Debug-DEVELOPMENT_VERSION/")
 '(package-selected-packages
   (quote
    (yasnippet-snippets eclim web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode evil-smartparens git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl helm-gtags ggtags company-irony flycheck-irony company-irony-c-headers irony ranger helm-rtags flycheck-rtags company-rtags rtags stickyfunc-enhance srefactor org-plus-contrib helm-cscope xcscope smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor disaster company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async evil-unimpaired f s dash)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" "66f32da4e185defe7127e0dc8b779af99c00b60c751b0662276acaea985e2721" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(global-centered-cursor-mode t)
 '(helm-gtags-display-style 'detail)
 '(helm-make-build-dir "Debug-DEVELOPMENT_VERSION/")
 '(lsp-response-timeout 1)
 '(package-selected-packages
   '(counsel swiper ivy yasnippet-snippets eclim web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode evil-smartparens git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl helm-gtags ggtags company-irony flycheck-irony company-irony-c-headers irony ranger helm-rtags flycheck-rtags company-rtags rtags stickyfunc-enhance srefactor org-plus-contrib helm-cscope xcscope smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor disaster company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async evil-unimpaired f s dash))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

