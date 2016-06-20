;;; packages.el --- simple-rtm layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: krazedkrish <krazedkrish@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst simple-rtm-packages
  '(
    simple-rtm))

(defun simple-rtm/init-simple-rtm()
  (autoload 'simple-rtm-mode
    "simple-rtm" "Interactive mode for Remember The Milk" t))
;;; packages.el ends here
