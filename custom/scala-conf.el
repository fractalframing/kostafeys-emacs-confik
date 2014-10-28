(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun eval-last-scala-expr ()
  (interactive)
  (let ((prev-str (string (preceding-char))))
    (cond ((equal "}" prev-str)
           (let ((start (point)))
             (save-excursion
               (backward-sexp)
               (beginning-of-line)
               (ensime-inf-eval-region start (point)))))
          ((equal ")" prev-str)
           (let ((start (point)))
             (save-excursion
               (backward-sexp)
               (ensime-inf-eval-region start (point)))))
          (t (ensime-inf-eval-definition)))))

(provide 'scala-conf)
