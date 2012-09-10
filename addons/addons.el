(setq load-path (cons  (concat addons-dir "erlang-mode/") load-path))
; (setq erlang-root-dir "h:/soft/erl") ; moved to platform.el
; (setq exec-path (cons "h:/soft/erl/bin" exec-path))
(require 'erlang-start)

(setq load-path (cons  (concat addons-dir "ruby-mode/") load-path))
(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
     '(add-hook 'ruby-mode-hook 'inf-ruby-keys))

(setq load-path (cons  (concat addons-dir "workgroups/") load-path))
(require 'workgroups)
(setq wg-prefix-key (kbd "C-x w"))
(workgroups-mode 1)
;; (add-hook 'window-setup-hook (lambda () 
                               ;; (wg-load "~/.emacs.d/wgs.config")
                               ;; ))

;; yasnippet activation here
;; (add-to-list 'load-path  (concat addons-dir "yasnippet"))
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;; (yas/load-directory   (concat addons-dir "yasnippet/snippets"))




;;         (add-to-list 'load-path (concat addons-dir "django-mode/"))
;; (require 'django-html-mode) ;; using nxhtml django-mumamo instead
;;         (require 'django-mode)
; (yas/load-directory "path-to/django-mode/snippets")
;; (add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mode))

;; nXhtml mode & django-mumamo setup
;; (load (concat addons-dir "nxhtml/autostart.el"))

;; (autoload 'django-nxhtml-mumamo-mode (concat addons-dir "nxhtml/autostart.el"))
;; (setq auto-mode-alist
;;       (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
;; (setq mumamo-background-colors nil) 
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-nxhtml-mumamo-mode))


(setq load-path (cons  (concat addons-dir "lua-mode/") load-path))
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(setq lua-indent-level tab-width)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)
; FlymakeLua
; (require 'flymake-lua)
; (add-hook 'lua-mode-hook 'flymake-lua-load)

(add-to-list 'load-path (concat addons-dir "auto-complete/"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat addons-dir "/auto-complete/dict"))
(ac-config-default)
(define-key ac-completing-map "\r" nil) ;; disable RET completion

;; (setq load-path (cons  (concat addons-dir "pymacs/") load-path))
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;; (require 'auto-complete)
;; (require 'auto-complete-python)
;; (require 'auto-complete-yasnippet)
;; (ac-ropemacs-init)

;; (setq ropemacs-enable-autoimport t)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;; ;;; Auto-completion                                                                                            
;; ;;;  Integrates:                                                                                               
;; ;;;   1) Rope                                                                                                  
;; ;;;   2) Yasnippet                                                                                             
;; ;;;   all with AutoComplete.el                                                                                 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;; (defun prefix-list-elements (list prefix)
;;   (let (value)
;;     (nreverse
;;      (dolist (element list value)
;;       (setq value (cons (format "%s%s" prefix element) value))))))
;; (defvar ac-source-rope
;;   '((candidates
;;      . (lambda ()
;;          (prefix-list-elements (rope-completions) ac-target))))
;;   "Source for Rope")
;; (defun ac-python-find ()
;;   "Python `ac-find-function'."
;;   (require 'thingatpt)
;;   (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
;;     (if (null symbol)
;;         (if (string= "." (buffer-substring (- (point) 1) (point)))
;;             (point)
;;           nil)
;;       symbol)))
;; (defun ac-python-candidate ()
;;   "Python `ac-candidates-function'"
;;   (let (candidates)
;;     (dolist (source ac-sources)
;;       (if (symbolp source)
;;           (setq source (symbol-value source)))
;;       (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
;;              (requires (cdr-safe (assq 'requires source)))
;;              cand)
;;         (if (or (null requires)
;;                 (>= (length ac-target) requires))
;;             (setq cand
;;                   (delq nil
;;                         (mapcar (lambda (candidate)
;;                                   (propertize candidate 'source source))
;;                                 (funcall (cdr (assq 'candidates source)))))))
;;         (if (and (> ac-limit 1)
;;                  (> (length cand) ac-limit))
;;             (setcdr (nthcdr (1- ac-limit) cand) nil))
;;         (setq candidates (append candidates cand))))
;;     (delete-dups candidates)))
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;                  (auto-complete-mode 1)
;;                  (set (make-local-variable 'ac-sources)
;;                       (append ac-sources '(ac-source-rope)))
;;                  (set (make-local-variable 'ac-find-function) 'ac-python-find)
;;                  (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;;                  ;; (set (make-local-variable 'ac-auto-start) nil)
;;                  ))
;;
;;
;; (defadvice ac-start (before advice-turn-on-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) t))
;; (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) nil))






(load (concat addons-dir "haskell-mode/haskell-site-file"))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(if (eq system-type 'windows-nt) ;; better add it to PATH
    (setq haskell-program-name "H:/soft_/HaskellPlatform/bin/ghci.exe"))

(add-to-list 'load-path (concat addons-dir "distel/elisp/"))
(require 'distel)
(distel-setup)

;; Some Erlang customizations
(add-hook 'erlang-mode-hook
	(lambda ()
		;; when starting an Erlang shell in Emacs, default in the node name
		(setq inferior-erlang-machine-options '("-sname" "ec"))
		;; add Erlang functions to an imenu menu
		(imenu-add-to-menubar "imenu")))

;; A number of the erlang-extended-mode key bindings are useful in the shell too
; (defconst distel-shell-keys
; 	'( 	("\C-\M-i"   erl-complete)
; 	    ("\M-?"      erl-complete)	
; 	    ("\M-."      erl-find-source-under-point)
; 	    ("\M-,"      erl-find-source-unwind) 
; 	    ("\M-*"      erl-find-source-unwind) 
;     )
; 	"Additional keys to bind when in Erlang shell.")

; (add-hook 'erlang-shell-mode-hook
; 	(lambda ()
; 		;; add some Distel bindings to the Erlang shell
; 		(dolist (spec distel-shell-keys)
; 			(define-key erlang-shell-mode-map (car spec) (cadr spec)))))
