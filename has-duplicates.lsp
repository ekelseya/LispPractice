;; Eryn Kelsey-Adkins -- CS 3210 -- Spring 2019
;; ============================================
;; has-duplicates function: takes a list of 
;; 		numbers and returns true if the list has
;; 		duplicates, or nil if not 
;; parameters:
;; 		lst - a list, unordered, no sublists
;; assumptions:
;; 		1. lst contains only numbers
;; 		2. lst contains no sublists
;; helper functions:
;; is-sorted: returns true if the list is 
;; 		in acsending order
;; parameters:
;;		lst - a list
;; assumptions:
;; 		1. lst may or may not be in order
;; 		2. lst contains only numbers
;; 		3. lst contains no sublists

(defun has-duplicates (lst)
	(cond
		((null lst) nil)
		((null (cdr lst)) nil)
		(( > (car lst) (car (cdr lst)))(has-duplicates (bubble-sort lst)))
		(( < (car lst) (car (cdr lst)))(has-duplicates (cdr lst)))
		(( = (car lst) (car (cdr lst))) t)))  
		
(defun is-sorted (lst)
  (cond 
	((null lst) t)
	((null (cdr lst)) t)
    ((<= (car lst) (car (cdr lst))) (is-sorted (cdr lst)))
    (t nil)))

(defun bubble (lst)
  (cond
    ((null lst) lst) 
    ((null (cdr lst)) lst)
    (( <= (car lst) (car (cdr lst))) (cons (car lst) (bubble (cdr lst))))
	(( > (car lst) (car (cdr lst))) (bubble (append (cdr lst)(list (car lst)))))
    ( t (cons (car (cdr lst)) (bubble (cons (car lst) (cdr (cdr lst))))))))

(defun bubble-sort (lst)
  (cond 
	((null lst) lst)
	((null (cdr lst)) lst)
    ((is-sorted  lst) lst)
    (t (bubble-sort (bubble lst)))))
		
;; test plan for has-duplicates:
;; category/description				data			expected result
;; -----------------------------------------------------------------
;; lst == empty list				()				nil
;; list with 1 element				(n)				nil
;; ordered list with no duplicates	(1 2 3)			nil
;; unordered list with no duplicates(5 4 6 7)		nil
;; ordered list with 1 duplicate	(1 2 2 3 5)		t 
;; unordered list with 1 duplicate	(5 2 8 3 2)		t 
