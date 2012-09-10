(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
;(setq delete-active-region t)

(defun cool-indent ()
  (interactive)
  (if mark-active
      (indent-rigidly-mod tab-width)
    (tab-to-tab-stop)
    )
  )
(defun cool-unindent ()
  (interactive)
  (save-excursion
    (if (not mark-active)
        (let ((beg (point)))
          (set-mark (point))
          (if (bolp)
              (progn (end-of-line))
            (progn (beginning-of-line))
            )
          (indent-rigidly-mod (- tab-width))
          (deactivate-mark)
          )
      (indent-rigidly-mod (- tab-width))
      )
    )
  )
(defun indent-rigidly-mod (n)
  (interactive)
  (save-excursion
    (let ((deactivate-mark nil))
      (if (< (point) (mark))
	  (progn (beginning-of-line))
	(progn (exchange-point-and-mark)(beginning-of-line)))
      (indent-rigidly (region-beginning) (region-end) n)
      )
    )
  )
    
(defun back-to-indentation-or-beginning ()
   (interactive)
   (if (= (point) (save-excursion (back-to-indentation) (point)))
       (beginning-of-line)
     (back-to-indentation)))

(defun cool-comment (&optional arg)
  (interactive)
  (save-excursion
    (if (not mark-active)
        (progn 
          (beginning-of-line)
          (set-mark (point))
          (end-of-line)
          (comment-or-uncomment-region (region-beginning) (region-end) arg)
          (deactivate-mark)
         )
      (comment-or-uncomment-region (region-beginning) (region-end) arg)
      )
    )
  )

(defun load-workgroups ()
  (interactive)
  (wg-load "~/.emacs.d/wgs.config"))

(defun indent-rigidly-n (n)
  "Indent the region, or otherwise the current line, by N spaces."
  (let* ((use-region (and transient-mark-mode mark-active))
         (rstart (if use-region (region-beginning) (point-at-bol)))
         (rend   (if use-region (region-end)       (point-at-eol)))
         (deactivate-mark "irrelevant")) ; avoid deactivating mark
    (indent-rigidly rstart rend n)))


(defun backspace-unindent (&optional arg)
  (interactive)
  (if (and (not (bolp)) (= (point) (save-excursion (back-to-indentation) (point))))
      (indent-rigidly-n (- tab-width))
    (delete-backward-char 1)))

(global-set-key (kbd "<backspace>") 'backspace-unindent)
(add-hook 'isearch-mode-hook
          (lambda ()
            (define-key isearch-mode-map (kbd "<f3>") 'isearch-repeat-forward)
            (define-key isearch-mode-map (kbd "M-<f3>") 'isearch-repeat-backward)
            (define-key isearch-mode-map (kbd "<backspace>") 'isearch-del-char)
            (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-line)
            )
          )

(setq cua-enable-cua-keys nil) ;; only for rectangles
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "M-Y") (lambda() (interactive) (yank-pop -1)))
(global-set-key (kbd "M-v") 'yank-pop)
(global-set-key (kbd "M-V") (lambda() (interactive) (yank-pop -1)))
;; (setq-default cua-paste-pop-rotate-temporarily t)
(put 'back-to-indentation-or-beginning 'CUA 'move)
(put 'backspace-unindent 'CUA 'move)
;(put 'end-of-line 'CUA 'move)
(setq x-select-enable-clipboard t) ;; make emacs copy & paste work with system's
(cua-mode t)
;; (delete-selection-mode 1)  ;; cua contains it

(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "<home>") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-<home>") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-<end>") 'end-of-line)

(global-set-key (kbd "C-x C-k") 'kill-line)

(global-set-key (kbd "C-h") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-;") 'end-of-line)
(global-set-key (kbd "M-h") 'back-to-indentation-or-beginning)
(global-set-key (kbd "M-;") 'end-of-line)
(global-set-key (kbd "<kp-subtract>") 'cool-comment)
;(global-set-key (kbd "C-v") 'delete-region-and-yank)
;(global-set-key (kbd "C-y") 'delete-region-and-yank)

(global-set-key (kbd "C-x C-<up>") 'windmove-up)
(global-set-key (kbd "C-x C-<down>") 'windmove-down)
(global-set-key (kbd "C-x C-<right>") 'windmove-right)
(global-set-key (kbd "C-x C-<left>") 'windmove-left)

(global-set-key (kbd "C-j") 'backward-char) 
(global-set-key (kbd "C-l") 'forward-char)
(global-set-key (kbd "C-k") 'next-line)
(global-set-key (kbd "C-p") 'previous-line)

(global-set-key (kbd "M-j") 'backward-word)
(global-set-key (kbd "M-l") 'forward-word)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-p") 'previous-line)

(global-set-key (kbd "M-u") 'backward-kill-word)
(global-set-key (kbd "M-<backspace>") 'backward-kill-word)
(global-set-key (kbd "C-u") 'backspace-unindent)
(global-set-key (kbd "M-o") 'kill-word)
(global-set-key (kbd "C-o") 'delete-char)
(global-set-key (kbd "<delete>") 'delete-char)

(global-set-key (kbd "C-M-f") 'replace-string)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "M-f") 'isearch-backward)

(global-set-key (kbd "<f2>") 'previous-buffer)
(global-set-key (kbd "<f3>") 'next-buffer)
(global-set-key (kbd "<f4>") 'switch-to-buffer)
(global-set-key (kbd "C-<f4>") 'kill-this-buffer)
(global-set-key (kbd "<f5>") 'buffer-menu)
(global-set-key (kbd "M-<f3>") 'load-workgroups)


(global-set-key (kbd "M-i") 'previous-line)
;; differentiate tab from C-i
(setq local-function-key-map (delq '(kp-tab . [9]) function-key-map))
;; Translate the problematic key to the function key Hyper:
(keyboard-translate ?\C-i ?\H-i)
;; Rebind accordingly
(global-set-key [?\H-i] 'previous-line)
;; still broken for ssh


(global-set-key (kbd "C-<tab>") 'indent-for-tab-command)
(global-set-key (kbd "S-<tab>") 'cool-unindent)

(defun remap-major-mode ()
    (local-set-key (kbd "TAB") 'cool-indent)
    (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'lisp-mode-hook 'remap-major-mode)
(add-hook 'python-mode-hook 'remap-major-mode)
(add-hook 'lua-mode-hook 'remap-major-mode)

(add-hook 'erlang-mode-hook '(lambda()
  ; (setq indent-line-function 'tab-to-tab-stop)
  (remap-major-mode)
  (local-set-key (kbd "C-c C-k") 'erlang-runescript)
  (local-set-key (kbd "C-c C-c") 'erlang-compile)))

; (global-set-key (kbd "C-;") 'move-end-of-line)

(global-set-key (kbd "C-<f5>") 'linum-mode)
