(setq mode 'web-mode)
(defun getNode()
  (setq nodPos nil)
   (setq prevPos (point))
   (setq nodPos (re-search-backward "[<]"))
   (goto-char nodPos)
   (setq columnNod (current-column))
   (setq buffNod (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
   (goto-char prevPos)
   (setq nodList (car (split-string(substring buffNod (+ 1 columnNod)))))
   (setq nodList (car (split-string nodList ">")))
   (if nodPos
       nodList nil))

(defun checkScope (curPos)
  (setq bufStr (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
  (setq bufLis "")
  (setq bool nil)
  (setq bufStr (string-trim (substring bufStr 0 (- curPos 1))))
  (if (> (length bufStr) 0)
      (
       progn
       (setq bufLis (car (last (butlast (split-string (car (last (split-string bufStr))) "")))))
       
	(if(string-match "^[a-zA-Z0-9)]*$" bufLis)
	    (setq bool nil)
	  (setq bool t)
	  )
       )
    (setq bool t)
      )
  bool)


(defun getLine ()
  (interactive)
  (if(and  (checkScope (+ 1 (current-column))) (derived-mode-p mode))
      (
       progn
       (setq curPos (point))
       (insert "</>")
       (goto-char (+ curPos 1))
       )
    (insert "<")
    )
)


(defun getLine2 ()
(interactive)
  (if(derived-mode-p mode)
      (
       progn
	(insert ">")
       (setq columnNumber (- (current-column) 1))
       (setq cursorPos (point))
       (setq lineStr  (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
       (setq diff 9999)
       (setq  node nil)
       (setq pos 0)
       (setq found nil)
       (setq lis '())
       (setq node (getNode))
       (setq posT nil)
       (setq posT (re-search-forward "[/]"))
       (if (and node posT)
	   (
	    progn
	     (goto-char (- posT 1))
	     (insert "<")
	     (goto-char (+ 1 posT))
	     (insert node)
	     (goto-char cursorPos)
	    )
	   )
      )
    )
  (insert ">"))
