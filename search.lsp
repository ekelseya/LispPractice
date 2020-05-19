;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; search-count function: takes an integer and a list 
;; 		and returns the count of how many times the
;; 		integer is found
;; parameters:
;; 		n - an integer
;; 		lst - a list 
;; assumptions:
;; 		1. lst is a list
;; 		2. lst may be a mix of integers and 
;; 			words and may have nested lists
;; 		3. n is an integer

(defun search-count (n lst)
	(cond 
		((null lst) 0)
		((and (numberp (car lst)) (= n (car lst))) (+ 1 (search-count n (cdr lst))))
		((listp (car lst))(+ (search-count n (car lst)) (search-count n (cdr lst))))
		(t (search-count n (cdr lst)))))
		
;; test plan for search-count:
;; category/description				data			expected result
;; -----------------------------------------------------------------
;; lst == empty list				()				0
;; n == non integer					cat				0
;; list with n twice				(n n 5)			2
;; list with n in sublist			(n (n) 5)		2
;; list with n and with words		(n (n cat) n 5)	3
;; list without n					(cat (5) 2 4)	0