;; Copyright (C) 2010-2011 Free Software Foundation, Inc.

;; Author: Roman K <r90d87@gmail.com>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(deftheme deity
  "Dark theme, mostly of red hue")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'deity
   `(cursor ((,class (:background "green"))))
   `(border-color ((,class (:background "black"))))
   `(default ((,class (:background "#040404" :foreground "#bbbbbb"))))
   `(fringe ((,class (:background "#101010"))))
   `(mode-line ((,class (:box (:line-width -1 :style released-button)
			 :background "#333333" :foreground "white"))))
   `(mode-line-inactive ((,class (:foreground "white" :background "#1A1A1A"))))
   `(header-line ((,class (:foreground "white" :background "#222244"))))

   `(minibuffer-prompt ((,class (:foreground "#5555FF"))))
   `(region ((,class (:foreground unspecified :background "#444444"))))
   ; `(dired-header ((,class (:bold t :foreground "#0084C8"))))
   ; `(widget-button ((,class (:bold t :foreground "#0084C8"))))

   `(success ((,class (:bold t :foreground "#55FF55"))))
   `(warning ((,class (:foreground "#5555FF"))))
   `(error ((,class (:foreground "#FF5555"))))

   `(font-lock-comment-face ((,class (:foreground "#65614E"))))
   `(font-lock-doc-face ((,class (:foreground "#efbe9d"))))
   `(font-lock-string-face ((,class (:foreground "#bf7e52")))) ;f2d182
   `(font-lock-keyword-face ((,class (:foreground "#7d70b4"))));"#c95b9e"))))
   `(font-lock-builtin-face ((,class (:foreground "#d974c0" :background "#160b2e")))) ; "#e984d0" :background "#1e1335"))))
   `(font-lock-function-name-face ((,class (:foreground "#bf7a91" :background "#0d070f"))))
   `(font-lock-variable-name-face ((,class (:foreground "#bbbbbb"))))
   `(font-lock-type-face ((,class (:foreground "#bf86bf"))))
   `(font-lock-constant-face ((,class (:foreground "#819cff"))))
   `(font-lock-preprocessor-face ((,class (:foreground "#AE81FF"))))
   `(font-lock-negation-char-face ((,class (:bolt t :foreground "#Pink"))))
   `(font-lock-warning-face ((,class (:foreground "#d98d6b"))))
   

   ; `(link ((,class (:underline t :foreground "#0066CC"))))
   ; `(link-visited ((,class (:underline t :foreground "#6799CC"))))
   `(show-paren-match ((,class (:underline t))))
   `(highlight ((,class (:foreground "white" :background "#03031e"))))
   `(isearch ((,class (:foreground "white" :background "#5450ee"))))
   `(isearch-lazy-highlight-face ((,class (:background "#2a2873" :foreground "white"))))
   ; `(erc-action-face ((,class (:foreground "#F5666D"))))
   ; `(erc-button ((,class (:foreground "#A8799C"))))
   ; `(erc-current-nick-face ((,class (:bold t :foreground "#FF7092"))))
   ; `(erc-error-face ((,class (:foreground "#F5666D" :bold t))))
   ; `(erc-input-face ((,class (:foreground "black"))))
   ; `(erc-keyword-face ((,class (:foreground "#F5666D"))))
   ; `(erc-my-nick-face ((,class (:bold t :foreground "#FF8CA7"))))
   ; `(erc-nick-default-face ((,class (:bold t :foreground "#0084C8"))))
   ; `(erc-notice-face ((,class (:foreground "#0084C8"))))
   ; `(erc-prompt-face ((,class (:foreground "black"))))
   ; `(erc-timestamp-face ((,class (:foreground ,"#4CB64A"))))

   ; `(magit-log-sha1 ((,class (:foreground "#FF7092"))))
   ; `(magit-log-head-label-local ((,class (:foreground "#4F78B5"))))
   ; `(magit-log-head-label-remote ((,class (:foreground ,"#4CB64A"))))
   ; `(magit-branch ((,class (:bold t :foreground "#0084C8"))))
   ; `(magit-section-title ((,class (:bold t :foreground "#00578E"))))
   ; `(magit-item-highlight ((,class (:background "#FEFFBF"))))
   ; `(magit-diff-add ((,class (:bold t :foreground "#4CB64A"))))
   ; `(magit-diff-del ((,class (:bold nil :foreground "#F5666D"))))

   ; `(gnus-group-mail-1-empty ((,class (:foreground "#00578E"))))
   ; `(gnus-group-mail-1 ((,class (:bold t :foreground "#4F78B5"))))
   ; `(gnus-group-mail-3-empty ((,class (:foreground "#00578E"))))
   ; `(gnus-group-mail-3 ((,class (:bold t :foreground "#9CBB43"))))
   ; `(gnus-group-news-3-empty ((,class (:foreground "#00578E"))))
   ; `(gnus-group-news-3 ((,class (:bold t :foreground "#9CBB43"))))
   ; `(gnus-header-name ((,class (:bold t :foreground "#0084C8"))))
   ; `(gnus-header-subject ((,class (:bold t :foreground "#FF7092"))))
   ; `(gnus-header-content ((,class (:foreground "#FF7092"))))
   ; `(gnus-button ((,class (:bold t :foreground "#00578E"))))
   ; `(gnus-cite-1 ((,class (:foreground "#00578E"))))
   ; `(gnus-cite-2 ((,class (:foreground "#0084C8"))))

   `(diff-added ((,class (:bold t :foreground "#55FF55"))))
   `(diff-removed ((,class (:bold t :foreground "#FF5555"))))))

(provide-theme 'deity)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; deity-theme.el  ends here
