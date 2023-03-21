;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Sivan Helfer"
      user-mail-address "sivan.helfer@taranis.com")

(setq org-directory "~/org/")
(setq doom-theme 'doom-vibrant)
;;(setq doom-font (font-spec :family "Fira Code" :size 14))

;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-private-dir "splash.png"))


(setq doom-font (font-spec :size 15 ))

(define-key evil-normal-state-map "K" (lambda nil (interactive) (evil-previous-visual-line 6)))
(define-key evil-normal-state-map "J" (lambda nil (interactive) (evil-next-visual-line 6)))
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map "H" 'evil-first-non-blank)
(define-key evil-normal-state-map "\C-k"  'switch-to-next-buffer)
(define-key evil-normal-state-map "\C-j"  'switch-to-prev-buffer)

(setq evil-snipe-scope 'buffer) ;; makes snipe to search all buffer instead of line

(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t))

(map! :leader :desc "Evil motion next line" "j" #'evilem-motion-next-line)
(map! :leader :desc "Evil motion prev line" "k" #'evilem-motion-previous-line)
(map! :leader :desc "List bookmarks" "l" #'list-bookmarks)
(map! :leader :desc "Kill buffer" "d" #'kill-this-buffer)
(map! :leader :desc "Kill other buffers" "D" #'doom/kill-other-buffers)
(map! :leader
      (:prefix ("b". "buffer")
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))
(map! :leader
      (:prefix ("o")
       :desc "Open my note org file" "o" #'(lambda() (interactive)(find-file "~/Projects/notes.org"))))

(evil-define-key 'normal org-mode-map
  (kbd "g c b") #'org-cycle-list-bullet)

(evil-define-key 'normal dired-mode-map
  ;; (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
  (kbd "R") 'dired-do-rename
  ;; (kbd "x") 'dired-mark
  ;; (kbd "t") 'dired-toggle-marks
  ;; (kbd "u") 'dired-unmark
  ;; (kbd "C") 'dired-do-copy
  ;; (kbd "d") 'dired-do-delete
  ;; (kbd "J") 'dired-goto-file
  ;; (kbd "M") 'dired-do-chmod
  ;; (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  ;; (kbd "+") 'dired-create-directory
  ;; (kbd "-") 'dired-up-directory
  )

(setq confirm-kill-emacs nil) ;; Disable exit confirmation
(setq org-roam-directory "~/Documents/org-roam")

;; (after! dap-mode ;; setup python debugger
;;   (setq dap-python-debugger 'debugpy))


;; (set-frame-parameter (selected-frame) 'alpha '(95 100))
;; (add-to-list 'default-frame-alist '(alpha 97 100))
