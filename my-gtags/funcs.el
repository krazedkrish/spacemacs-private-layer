;;; funcs.el --- gtags functions File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defun helm-gtags-dwim-other-window ()
  "helm-gtags-dwim in the other window"
  (interactive)
  (let ((helm-gtags--use-otherwin t)
        (split-height-threshold nil)
        (split-width-threshold 140))
    (helm-gtags-dwim)))

(defun spacemacs/helm-gtags-define-keys-for-mode (mode)
  "Define mouse binding"
  (global-set-key [(meta shift mouse-1)] 'ggtags-find-tag-mouse)

  "Define key bindings for the specific MODE."
  (when (fboundp mode)
    (let ((hook (intern (concat (symbol-name mode) "-hook"))))
      (add-hook hook 'helm-gtags-mode))
    (spacemacs/declare-prefix-for-mode mode "pg" "gtags")
    (spacemacs/declare-prefix-for-mode mode "pgF" "gtags-find")
    (spacemacs/set-leader-keys
      "pgc" 'helm-gtags-create-tags
      "pgd" 'helm-gtags-find-tag
      "pgD" 'helm-gtags-find-tag-other-window
      "pgf" 'helm-gtags-select-path
      "pgg" 'helm-gtags-dwim
      "pgG" 'helm-gtags-dwim-other-window
      "pgi" 'helm-gtags-tags-in-this-function
      "pgl" 'helm-gtags-parse-file
      "pgn" 'helm-gtags-next-history
      "pgp" 'helm-gtags-previous-history
      "pgr" 'helm-gtags-find-rtag
      "pgR" 'helm-gtags-resume
      "pgs" 'helm-gtags-select
      "pgS" 'helm-gtags-show-stack
      "pgu" 'helm-gtags-update-tags
      "pgFf" 'helm-gtags-find-files
      "pgFp" 'helm-gtags-find-pattern
      "pgFs" 'helm-gtags-find-symbol
      "pgFt" 'helm-gtags-find-tag-from-here)))

(defun spacemacs/ggtags-enable-eldoc (mode)
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            (lambda ()
              (ggtags-mode 1)
              (eldoc-mode 1)
              (setq-local eldoc-documentation-function
                          #'ggtags-eldoc-function))))
