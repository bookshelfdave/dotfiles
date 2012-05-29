(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.6.5/emacs"
                      load-path))
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/Users/dparfitt/basho/erlang/r14b04/lib/eqc-1.25.1")

(setq  compilation-scroll-output t)
(setq indicate-empty-lines t)
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)

;; load dtl files in html-mode
(add-to-list 'auto-mode-alist '("\\.dtl\\'" . html-mode))

;; no tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; 4 space indent
(setq c-basic-offset 4)

;; Erlang binary-syntax macros
;; C-, == <<"
;; C-. == ">>
(fset 'erlang-binary-start "<<\"")
(global-set-key (kbd "C-,") 'erlang-binary-start)
(fset 'erlang-binary-end "\">>")
(global-set-key (kbd "C-.") 'erlang-binary-end)

(global-set-key (kbd "C-=") 'recompile)

(global-set-key [C-backspace] 'backward-kill-word)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; if indent-tabs-mode is off, untabify before saving
(add-hook 'before-save-hook
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))))