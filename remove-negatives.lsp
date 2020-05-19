;; Eryn Kelsey-Adkins -- CS 3210 -- Spring 2019
;; ============================================
;; remove-negatives: a function that receives a 
;; 		list of integers, not nested, and returns 
;; 		a list with all negative values removed.
;; parameters:
;; 		lst - a list, unordered, no sublists
;; assumptions:
;; 		1. lst contains only numbers
;; 		2. lst contains no sublists

(defun remove-negatives (lst)
    (cond
        ((null lst) lst)
        ((< (car lst) 0) (cons (-(car lst)) (remove-negatives (cdr lst))))
        ((>= (car lst) 0) (cons (car lst) (remove-negatives (cdr lst))))))
		
;; test plan for remove-negatives:
;; category/description				data			expected result
;; -----------------------------------------------------------------
;; lst == empty list				()				nil
;; list with 1 element not negative	(n)				(n)
;; list with 1 negative				(-1)			(1)
;; ordered list with no negatives	(1 2 3)			(1 2 3)
;; unordered list with no negatives	(5 4 6 7)		(5 4 6 7)
;; ordered list with 1 negative		(-1 1 2 3 5)	(1 1 2 3 5)
;; unordered list with 1 negative	(5 -2 8 3 2)	(5 2 8 3 2)
