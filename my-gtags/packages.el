;;; packages.el --- my-gtags Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;;    and: Christian E. Hopps <chopps@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst my-gtags-packages
  '(
    ggtags
;;    helm-gtags
    ))

(defun my-gtags/init-ggtags ()
  (use-package ggtags
    :defer t
    :init
    (progn
      ;; modes that do not have a layer, add here.
      (add-hook 'awk-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
      (add-hook 'shell-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
      (add-hook 'tcl-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
      (add-hook 'vhdl-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)

      ;;(dolist (mode 'ggtags-mode)
      ;;"Define mouse binding"
      (global-set-key [(meta shift mouse-1)] 'ggtags-find-tag-mouse)

      (spacemacs/declare-prefix "pw" "ggtags")
      (spacemacs/set-leader-keys
        "pwc" 'ggtags-create-tags
        "pwd" 'ggtags-find-definition
      ;;   "pwf" 'ggtags-find-file
        "pwf" 'ggtags-find-tag-dwim
        "pwF" 'ggtags-find-tag-continue
        "pwg" 'ggtags-grep
        "pwo" 'ggtags-dwim-other-window
      ;;   "pws" 'ggtags-find-other-symbol
        "pwt" 'ggtags-find-tag-continue
      ;;   "pwr" 'ggtags-find-reference
      ;;   "pwn" 'ggtags-next-mark
      ;;   "pwp" 'ggtags-prev-mark
      ;;   "pwR" 'ggtags-read-tag
        "pwu" 'ggtags-update-tags)
        )
    :config
    (when (configuration-layer/package-usedp 'helm-gtags)
      ;; ;; If anyone uses helm-gtags, they would want to use these key bindings.
      ;; ;; These are bound in `ggtags-mode-map', since the functionality of
      ;; ;; `helm-gtags-mode' is basically entirely contained within
      ;; ;; `ggtags-mode-map' --- this way we don't have to enable both.
      ;; ;; Note: all of these functions are autoloadable.
      ;; (define-key ggtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      ;; (define-key ggtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
      ;; (define-key ggtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      ;; (define-key ggtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack)
      )))

;; (defun my-gtags/init-helm-gtags ()
;;   (use-package helm-gtags
;;     :defer t
;;     :init
;;     (progn
;;       (setq helm-gtags-ignore-case t
;;             helm-gtags-auto-update t
;;             helm-gtags-use-input-at-cursor t
;;             helm-gtags-pulse-at-cursor t)
;;       ;; modes that do not have a layer, define here
;;       (spacemacs/helm-gtags-define-keys-for-mode 'tcl-mode)
;;       (spacemacs/helm-gtags-define-keys-for-mode 'vhdl-mode)
;;       (spacemacs/helm-gtags-define-keys-for-mode 'awk-mode)
;;       (spacemacs/helm-gtags-define-keys-for-mode 'dired-mode)
;;       (spacemacs/helm-gtags-define-keys-for-mode 'compilation-mode)
;;       (spacemacs/helm-gtags-define-keys-for-mode 'shell-mode))))
