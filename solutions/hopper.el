;;; hopper.el - simplify code navigation.

;;; Usage:
;;
;; (global-set-key (kbd "C-M-d") 'hop-at-point)
;; (global-set-key (kbd "<C-down-mouse-1>") 'hop-by-mouse)

(defun hop-buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
     major-mode))

(defun hop-strip-text-properties (txt)
  (set-text-properties 0 (length txt) nil txt)
      txt)

(defun hop-default-tag ()
  (let ((default (funcall (or find-tag-default-function
                              (get major-mode 'find-tag-default-function)
                              'find-tag-default))))
    (if default
        (condition-case nil
            (find-tag default)
          (error (find-tag (car (last (split-string default "/")))))))))

(defvar hop-positions (list))
(defvar hop-positions-max-length 20)
(defvar hop-current-pos 0)

(defun hop-update-positions (buffer point reason)
  (let ((new-pos (list buffer point reason)))
    (when (eq reason :hop)
      (setq hop-current-pos 0)
      (setq hop-positions (cons new-pos hop-positions)))
    (when (eq reason :back)
      (if (eq (nth 2 (nth hop-current-pos hop-positions)) :back)
          (setcar (nthcdr hop-current-pos hop-positions) new-pos)
        (setq hop-positions (cons new-pos hop-positions))))
    (if (> (length hop-positions) hop-positions-max-length)
        (delete (car (last hop-positions)) hop-positions))))

(defun hop-in-list ()
  (switch-to-buffer (car (nth hop-current-pos hop-positions)))
  (goto-char (cadr (nth hop-current-pos hop-positions))))

(defun hop-backward ()
  (interactive)
  (hop-update-positions (current-buffer) (point) :back)
  (incf hop-current-pos)
  (hop-in-list))

(defun hop-forward ()
  (interactive)
  (decf hop-current-pos)
  (hop-in-list))

(defun hop-at-point (point)
  "Jump to the entity definition."
  (interactive "d")
  (push-mark)
  (let ((mode (hop-buffer-mode (current-buffer))))
    (hop-update-positions (current-buffer) (point) :hop)
    (cond
     ;; emacs-lisp-mode
     ((equal 'emacs-lisp-mode mode)
      (let ((symb (read (hop-strip-text-properties
                         (thing-at-point 'symbol)))))
        (when symb
          (cond
           ((or (functionp symb) (fboundp symb)) (find-function symb))
           (t (find-variable symb))))))
     ;; clojure-mode
     ((and (equal 'clojure-mode mode) (require 'cider nil 'noerror))
      (cider-jump (cider-read-symbol-name "Symbol: " 'identity)))
     ;; other modes
     (t
      (if (semantic-active-p)
          (condition-case nil
              (semantic-ia-fast-jump point)
            (error (hop-default-tag)))
        (hop-default-tag))))))

(defun hop-by-mouse (start-event)
  "Jump to the entity definition by mouse click."
  (interactive "e")
  (mouse-drag-region start-event)
  (hop-at-point (point)))

(provide 'hopper)
