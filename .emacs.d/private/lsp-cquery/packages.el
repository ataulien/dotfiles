;;; packages.el --- lsp-cquery layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: scturtle <scturtle@gmail.com>
;; URL: https://github.com/scturtle/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

(defconst lsp-cquery-packages
  '((cquery)
    ))

;;;;;###autoload
;; (defun ff-find-other-file-other-window ()
;;     (interactive)
;;   (ff-find-other-file t))

(defun lsp-cquery/init-cquery ()
  (use-package cquery
    :init
    (progn
      (spacemacs|add-company-backends :backends company-lsp :modes c-mode-common)
      (spacemacs/add-to-hooks #'lsp-cquery-enable '(c-mode-hook c++-mode-hook))
      (dolist (mode '(c-mode c++-mode))
        (evil-leader/set-key-for-mode mode
          ;; Faster without projectile caching but not as reliable
          ;; "ga" #'ff-find-other-file
          ;; "gA" #'ff-find-other-file-other-window
          ","  #'lsp-ui-sideline-apply-code-actions
          "fd" #'lsp-ui-peek-find-definitions
          "fr" #'lsp-ui-peek-find-references
          "fp" #'lsp-ui-peek-jump-backward
          "fn" #'lsp-ui-peek-jump-forward
		  "tl" #'cquery-code-lens-mode
		  "ff" #'clang-format-buffer
          ;; "qb" (lambda () (interactive) (lsp-ui-peek-find-custom 'base "$cquery/base"))
          ;; "qc" (lambda () (interactive) (lsp-ui-peek-find-custom 'base "$cquery/callers"))
          ;; "qd" (lambda () (interactive) (lsp-ui-peek-find-custom 'base "$cquery/derived"))
          ;; "qv" (lambda () (interactive) (lsp-ui-peek-find-custom 'base "$cquery/vars"))
          ;; "R"  #'cquery-freshen-index
          ;; "hm" #'cquery-member-hierarchy
          ;; "hi" #'cquery-inheritance-hierarchy
          ;; "hI" (lambda () (interactive) (cquery-inheritance-hierarchy t))
          ;; "hc" #'cquery-call-hierarchy
          ;; "hC" (lambda () (interactive) (cquery-call-hierarchy t))
          "ll" #'lsp-ui-imenu
	        "lr" #'lsp-rename
          )))))

;;; packages.el ends here
