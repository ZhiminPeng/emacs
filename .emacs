(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))
;; emacs themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)



;; emacs for python 
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(elpy-enable)
;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)


;; emacs for C/C++
; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
 ; initialize package.el
(package-initialize)
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
(defalias 'yas/table-hash 'yas--table-hash)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/local/lib/gcc/x86_64-apple-darwin13.4.0/4.9.1/include")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;(add-hook 'c-mode-common-hook '(lambda () (c-set-style "Ellemtel")))

(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;(defun my:flymake-google-init () 
;;  (require 'flymake-google-cpplint)
;;  (custom-set-variables
;;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;;  (flymake-google-cpplint-load)
;;)

;;(add-hook 'c-mode-hook 'my:flymake-google-init)
;;(add-hook 'c++-mode-hook 'my:flymake-google-init)
; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(eval-after-load 'flymake '(require 'flymake-cursor))


