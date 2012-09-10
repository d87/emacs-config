; Start Maximized on Windows
(defun maximize-win32 ()
  "Called from term-setup-hook after the default
terminal setup is
done or directly from startup if term-setup-hook not
used.  The value
0xF030 is the command for maximizing a window."
  (interactive)
  (w32-send-sys-command #xf030)
  ;; (ecb-redraw-layout)
  ;(calendar)
)
;(setq term-setup-hook 'jbr-init)
;(setq window-setup-hook 'jbr-init)
(add-hook 'window-setup-hook 'maximize-win32 t)

; paths for erlang-mode
(setq erlang-root-dir "h:/soft/erl")
(setq exec-path (cons "h:/soft/erl/bin" exec-path))
