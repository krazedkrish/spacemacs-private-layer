;;; packages.el --- phabricator layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: krazedkrish <krazedkrish@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst phabricator-packages
  '(
    phabricator
    ))

(defun phabricator/init-phabricator()
  (require 'phabricator)
  )
;;; packages.el ends here
