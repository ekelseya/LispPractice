;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; count-groups function: takes a list of words 
;; 		and/or numbers, not nested, and returns the 
;; 		number of two or more identical adjacent items
;; parameters:
;; 		lst - a list, not nested
;; assumptions:
;; 		1. lst is a list, not nested
;; 		2. lst may be a mix of integers and words 

(defun count-groups (lst)
	(cond 
		((null lst) 0)
		((equal (car lst) (car (cdr lst))) (+ 1 (count-groups (cdr (cdr lst)))))
		(t (count-groups(cdr lst)))))
		
;; test plan for count-groups:
;; category/description				data			expected result
;; ----------------------------------------------------------------
;; lst == empty list				()							0
;; lst with one number				1							0
;; lst with one word				cat							0
;; list with 1 group of 2 numbers	(2 2 5)						1
;; list with 1 group of 3 numbers	(2 2 2 5)					1
;; list with 2 groups of 2 numbers	(2 2 5 5)					2
;; list with 2 groups of 3 numbers	(2 2 2 5 5 5)				2
;; list with numbers and words		(cat 5)						0
;; list with 1 group of 2 words		(cat cat 5)					1
;; list with 1 group of 3 words		(cat cat cat 5)				1
;; list with 2 groups of 2 words	(cat cat dog dog)			2
;; list with 2 groups of 3 words	(cat cat cat dog dog dog)	2
;; list with 2 groups mixed			(cat cat 5 5)				2
;; list with matches, no groups		(cat 5 cat dog 5 dog)		0
