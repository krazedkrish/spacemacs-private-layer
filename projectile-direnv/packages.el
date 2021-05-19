;;; packages.el --- projectile-direnv layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: user <user@user-All-Series>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `projectile-direnv-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `projectile-direnv/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `projectile-direnv/pre-init-PACKAGE' and/or
;;   `projectile-direnv/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst projectile-direnv-packages
  '(
  	;; projectile-direnv
    (projectile-direnv :location (recipe
                   :fetcher github
                   :repo "christianromney/projectile-direnv"
                   :files ("*.el")
                   ))
  	))

(defun projectile-direnv/init-projectile-direnv ()
  (use-package projectile-direnv
    :commands (projectile-direnv-export-variables)
    :init
    (add-hook 'projectile-mode-hook 'projectile-direnv-export-variables)
    ))
;;; packages.el ends here
