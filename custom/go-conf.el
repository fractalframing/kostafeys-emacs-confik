;;; go-mode configuration

;;--------------------
;; Dependencies:

;;    go-mode
;; go get golang.org/x/tools/cmd/...
;; go get golang.org/x/tools/cmd/godoc
;; go get code.google.com/p/rog-go/exp/cmd/godef

;;    go-autocomplete
;;    go-eldoc
;; go get -u github.com/nsf/gocode

;;    go-flymake
;;    go-flycheck
;; go get -u github.com/dougm/goflymake

;;--------------------

;; Environment example:

;; export GOROOT=/opt/golang/go
;; export GOPATH=/opt/go
;; PATH=$PATH:$GOROOT/bin:$GOPATH/bin/

(require 'go-mode)
(require 'go-autocomplete)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-to-list 'load-path (concat (getenv "GOPATH")
                                "/src/github.com/dougm/goflymake"))
(require 'go-flymake nil 'noerror)
(require 'go-flycheck nil 'noerror)

(defvar go-compile-command
  "go generate && go build -ldflags \"-s\" -v && go test -v && go vet")

(defun my-go-mode-hook ()
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           go-compile-command)))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun go-compile ()
  (interactive)
  (compile go-compile-command))

(defun go-run ()
  (interactive)
  (compile
   (format "go run \"%s\""(buffer-file-name))))

(provide 'go-conf)
