(setq mode 'web-mode)
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
  bool
  )


(defun getPositionToInsert (start mainStr)
  (setq mainSubStr (substring mainStr (+ 1 start)))
  (setq open t)
  (dotimes (index (- (length mainSubStr) 1))
    (if (= 62 (aref mainSubStr index))
	(
	 if open
	 (
	  progn
	  (setq open nil)
	  (setq pti index)
	  (print index)
	  ))))
  pti   
  )


(defun getLine ()
  (interactive)
  (if(and  (checkScope (+ 1 (current-column))) (derived-mode-p mode))
      (
       progn
       (setq curPos (point))
       (insert "</>")
       (goto-char (+ curPos 1))
       )
    (insert "<")))


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
       (setq pos 0)
       (setq found nil)
       (setq lis '())
       (dotimes (index (- (length lineStr) 1))
	 (if (and (= 60 (aref lineStr index)) (> columnNumber index))
	     
	     (if(< (- columnNumber index) diff)
		 (
		  progn
		  (setq pos index)
		  (setq diff (- columnNumber index))
		  (setq found t)
		  ))
	   )
	 )
       (if found
	   (
	    progn
	    (setq node (split-string (substring lineStr (+ pos 1) columnNumber)))
	    (insert "<")
	    ;; (setq currenPos (point))
	    (setq currenPos (+ (getPositionToInsert columnNumber lineStr) cursorPos ))
	    (goto-char currenPos)
	    (insert (car node))
	    (goto-char cursorPos)
	    )
	 )
       )
    (insert ">")))
