;;; packages.el --- entertainment layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: codekathmandu <codekathmandu@codekathmandu-pc>
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
;; added to `entertainment-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `entertainment/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `entertainment/pre-init-PACKAGE' and/or
;;   `entertainment/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst entertainment-packages
  '(
    soundklaus
    mingus
    ))

(defun entertainment/init-soundklaus()
  (use-package soundklaus
    :ensure t
    :commands
    (soundklaus-activities
     soundklaus-connect
     soundklaus-my-favorites
     soundklaus-my-playlists
     soundklaus-my-tracks
     soundklaus-playlists
     soundklaus-tracks))
  (require 'emms-setup)
  (emms-standard)
  (emms-default-players)
  )

(defun entertainment/init-mingus()
  )
;;; packages.el ends here
