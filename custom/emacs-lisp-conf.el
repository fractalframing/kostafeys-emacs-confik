;;=============================================================================
;; Byte-compilation
;;
(setq max-specpdl-size 100000) ;for byte-compile
(setq max-lisp-eval-depth 500000)
;; cd ~/.emacs.d; emacs --batch -f batch-byte-compile **/*.el

(setq eval-expression-print-level nil)

(defun byte-recompile-custom-files()
  (interactive)
  (progn
    (byte-recompile-directory custom-conf-lisp-path 0 t)
    (byte-recompile-directory (concat site-lisp-path "my-task-centric/") 0 t)))

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)

;;------------------------------------------------------------
;; pprint
(define-derived-mode elisp-result-mode emacs-lisp-mode "elisp-result"
  "Major mode for emacs lisp result.")

(defun pprint (form)
  (let ((result-buffer-name "*elisp-result*"))
    (if (buffer-live-p (get-buffer-create result-buffer-name))
        (kill-buffer result-buffer-name))
    (let ((buffer (get-buffer-create result-buffer-name)))
      (temp-buffer-window-show
       buffer
       (with-current-buffer buffer
         (princ (cl-prettyprint form))
         (elisp-result-mode)
         (let ((map (current-local-map)))
           (define-key map "q" 'quit-window)))))))

(defun k/el-pprint-eval-last-sexp ()
  (interactive)
  (pprint (eval (elisp--preceding-sexp))))

;;=============================================================================
;; ElDoc
;;
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(defun ted-frob-eldoc-argument-list (string)
  "Upcase and fontify STRING for use with `eldoc-mode'."
  (propertize (upcase string)
              'face 'font-lock-variable-name-face))
(setq eldoc-argument-case 'ted-frob-eldoc-argument-list)

(defun eldoc-get-arg-index ()
  (save-excursion
    (let ((fn (eldoc-fnsym-in-current-sexp))
          (i 0))
      (unless (memq (char-syntax (char-before)) '(32 39)) ; ? , ?'
        (condition-case err
            (backward-sexp)             ;for safety
          (error 1)))
      (condition-case err
          (while (not (equal fn (eldoc-current-symbol)))
            (setq i (1+ i))
            (backward-sexp))
        (error 1))
      (max 0 i))))

(defun eldoc-highlight-nth-arg (doc n)
  (cond ((null doc) "")
        ((<= n 0) doc)
        (t
         (let ((i 0))
           (mapconcat
            (lambda (arg)
              (if (member arg '("&optional" "&rest"))
                  arg
                (prog2
                    (if (= i n)
                        (put-text-property 0 (length arg) 'face 'underline arg))
                    arg
                  (setq i (1+ i)))))
            (split-string doc) " ")))))

(provide 'emacs-lisp-conf)
