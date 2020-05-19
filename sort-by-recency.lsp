;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; sort-by-recency function: takes a word and a list 
;; 		of words, not nested.  If the word is not in
;;		the list, it is added at the beginning of the 
;; 		list.  If the word is in the list, its 
;; 		position is changed to be first in the list.  
;; 		In both cases, the word most recently added 
;; 		is now at the front of the list.  
;; parameters:
;;		n - a word
;; 		lst - a list, not nested
;; assumptions:
;; 		1. lst is a list, not nested
;; 		2. lst is a list of words
;;		3. lst has no duplicates
;; 		4. lst may or may not contain n  
;;
;; helper functions:
;;
;;	find-word: returns true if list contains the 
;; 		given word
;; 	parameters:
;;		n - a word
;;		lst - a list, not nested
;;	assumptions:
;;		1. lst is not nested
;; 		2. lst has no duplicates
;;
;; 	remove-word: removes elements from list that 
;;		equal the given word
;; 	parameters:
;; 		n - a word
;;		lst - a list, not nested
;; 	assumptions:
;; 		1. lst is not nested
;;		2. lst has no duplicates


(defun sort-by-recency (n lst)
	(cond 
		((null lst) (list n))
		((find-word n lst) (cons n (remove-word n lst)))
		(t (cons n lst))))

(defun find-word (n lst)
	(cond
		((null lst) nil)
		((equal n (car lst)) t)
		(t (find-word n (cdr lst)))))
		
(defun remove-word (n lst)
	(cond 
		((null lst) nil) 
		((equal n (car lst)) (remove-word n (cdr lst)))
		(t (cons (car lst) (remove-word n (cdr lst))))))
		
;; test plan for sort-by-recency:
;; category/description				data			expected result
;; ----------------------------------------------------------------
;; lst == empty list				n ()						(n)
;; lst without n 					n (cat dog fish)			(n cat)
;; lst with n first					n (n cat)					(n cat)
;; list with n within lst 			n (dog n cat)				(n dog cat)
