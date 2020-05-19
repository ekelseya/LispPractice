;; Eryn Kelsey-Adkins -- CS 3210 -- Spring 2019
;; ============================================
;; factorial calculator function: takes an 
;; 		integer and returns the factorial
;; parameters:
;; 		n - a positive integer
;; assumptions:
;; 		1. n is positive
;; 		2. n is an integer

(defun factorial (n)
		(cond 
		((= n 0) 1)
		((> n 0) (* n (factorial (- n 1))))))		
		
;; test plan for factorial:
;; category/description				data			expected result
;; -----------------------------------------------------------------
;; empty list						()				"not a number"
;; non integer						cat				"not a number"
;; 0								0				1
;; positive integer	< 5400			n				n!
;; positive integer > 5400			n 				Overflow error
;; note: above numbers are approximate and machine dependent