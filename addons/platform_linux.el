; paths for erlang-mode
(setq erlang-root-dir "/usr/lib/erlang/")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun window-maximize ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
; (toggle-fullscreen)
(if (eq window-system 'X) (window-maximize))
    
;; (load "/usr/share/emacs/site-lisp/site-gentoo.d/50gentoo-syntax-gentoo.el")
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/")
;; (require 'site-gentoo)
