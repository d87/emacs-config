(tool-bar-mode -1)
(scroll-bar-mode -1)
(desktop-save-mode -1)
(menu-bar-mode -1)
(kill-buffer (get-buffer "*scratch*"))
(setq-default inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(set-default-font "Consolas-10")

(add-to-list 'default-frame-alist '(font . "Consolas-10"))
(add-to-list 'default-frame-alist '(if (eq window-system 'X) (window-maximize)))


(require 'paren)
(show-paren-mode 1)

(defconst addons-dir "~/.emacs.d/addons/" "")

(byte-recompile-directory addons-dir)

(defun load-config-file (filelist)
  (dolist (file filelist)
    (load (expand-file-name 
           (concat addons-dir file)))
    (message "Loaded config file:%s" file)
    ))

(load-config-file 
 (cons
  (if (equal system-type 'windows-nt) "platform_win.el" "platform_linux.el")
  '("deity-theme.el"
    "addons.el"
    "bindings.el"
    )))




(setq
   backup-by-copying t
   ;backup-directory-alist
   ; '(("." . "~/.saves"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
)
(setq backup-directory-alist
    '((".*" . "~/.saves/backup")))
(setq auto-save-file-name-transforms
    '((".*" "~/.saves" t)))




(server-start)
