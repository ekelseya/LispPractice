;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; enforce-upper-limit function: A function that 
;; 		receives a number (an upper limit) and a list 
;; 		of words and / or numbers, possibly nested.  
;; 		The function produces a new list in which all 
;; 		values originally over the limit are replaced 
;; 		by the limit.  Assumption: the limit will be 
;; 		a number.
;; parameters:
;;		n - a number
;; 		lst - a list, may be nested
;; assumptions:
;; 		1. lst is a list
;; 		2. lst can be a mix of numbers and words
;;		3. lst may have duplicates
;; 		4. n will be a number

(defun enforce-upper-limit (n lst)
	(cond 
		((null lst) nil)
		((listp (car lst))(cons (enforce-upper-limit n (car lst)) (enforce-upper-limit n (cdr lst))))
		((and (numberp (car lst)) (<= n (car lst))) (cons n (enforce-upper-limit n (cdr lst))))
		(t (cons (car lst)(enforce-upper-limit n (cdr lst))))))
		
		
;; test plan for enforce-upper-limit:
;; category/description				data			expected result
;; ----------------------------------------------------------------
;; lst == empty list				()							()
;; lst with one number > n			(99)						(n)
;; lst with one number <= n			(3)							(3)
;; lst with one word				(cat)						(cat)
;; mixed lst with no numbers > n 	(cat 9 dog)					(cat 9 dog)
;; mixed lst with numbers > n 		(cat 99 dog)				(cat n dog)
;; mixed lst with nested numbers > n(cat (99) dog)				(cat (n) dog)
