;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; twin function: receives a list, not nested, and 
;; 		doubles all elements
;; parameters:
;; 		lst - a list, not nested
;; assumptions:
;; 		1. lst is a list
;; 		2. lst is not nested
;; 		3. lst can be a mix of numbers and words
;;		4. lst may have duplicates

(defun twin (lst)
	(cond ((null lst) nil)
		(t (cons (car lst) (cons (car lst) (twin (cdr lst)))))))
		
;; test plan twin:
;; category/description				data			expected result
;; ----------------------------------------------------------------
;; lst == empty list				()							()
;; lst with one element				(n)							(n n)
;; lst with multiple elements		(cat n)						(cat cat n n)
;; lst with twin elements			(n n cat)					(n n n n cat)

