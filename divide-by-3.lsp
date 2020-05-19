;; Eryn Kelsey-Adkins -- CS 3210 -- Spring 2019
;; ============================================
;; divide-by-3-count counter function: takes a list of 
;; 		numbers and returns a count of how many are 
;; 		divisible by 3 
;; parameters:
;; 		lst - a list, may contain sublists
;; assumptions:
;; 		1. lst contains only numbers
;; helper function:
;; divide-by-3: returns true if element of list is 
;; 		divisible by 3.
;; parameters:
;; 		lst - a list, may contain sublists
;; assumptions:
;; 		1. lst contains only numbers

(defun divide-by-3 (n)
	(cond
	((= 0 (rem n 3)) t)))

	 
(defun divide-by-3-count (lst)
	(cond
		((null lst) 0)
		((listp (car lst))(+ (divide-by-3-count (car lst)) (divide-by-3-count (cdr lst))))
		((not (divide-by-3 (car lst)))(+ 0 (divide-by-3-count (cdr lst))))
		((divide-by-3 (car lst))(+ 1 (divide-by-3-count (cdr lst))))))
			
;; test plan for divide-by-3:
;; category/description				data			expected result
;; -----------------------------------------------------------------
;; lst == empty list				()				0
;; list with n 						(n 5)			1
;; list with n twice				(n n 5)			2
;; list with n in sublist			(n (n) 5)		2
;; list without n					(7 (5) 2 4)		0
;; note: n represents an integer divisible by 3