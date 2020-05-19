;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; checker function: A function which checks the 
;;		syntax of a (possibly nested) list of 
;;		expressions with numeric operands and binary 
;;		infix operators (the operators are the actual 
;;		words): plus, minus, times, dividedby.  The 
;;		checker returns nil if any of the following 
;;		conditions are found, true otherwise: wrong 
;;		number of tokens in an expression (i.e., not 
;;		three), operands not numeric, invalid operator.  
;;		Do not consider any other errors.  Your main 
;;		function should call three helper functions 
;;		which each check one condition.  
;; parameters:
;; 		lst - a list, not nested
;; assumptions:
;;
;; helper functions:
;;
;;	check-length: returns true if list length equals
;;			3
;; 	parameters:
;;		lst - a list, not nested
;;	assumptions:
;;		1. lst is not nested
;;		2. lst can be a mix of words and numbers
;;		3. check-length is called on the list given
;;			to checker OR the nested list within the
;;			lst given to checker
;;
;; 	check-number: returns true if element of list is 
;; 		a number.
;; 	parameters:
;; 		n - an element of the lst from checker
;; 	assumptions:
;; 		1. check-number is called on the first and 
;;			last elements of the lst given to checker
;;			OR the first and last elements of the 
;;			nested list within the lst given to 
;;			checker
;;
;;	check-opcode: returns true if element of list is
;;		equal to the given list of opcodes.
;;	parameters:
;;		n - an element of the lst from checker
;;	assumptions:
;;		1. check-opcode is called on the middle 
;;			element of the lst given to checker OR
;;			the middle element of the nested list
;;			within the lst given to checker

(defun checker (lst)
	(cond ((null lst) nil)
	((listp (car lst)) (checker (car lst)))
	((not(check-length lst)) '(wrong number of tokens))
	((not(check-number (car lst))) '(operands not numeric))
	((not(check-opcode (car (cdr lst)))) (append '(invalid operator) (car (cdr lst))))
	((listp (car(cdr(cdr lst)))) (checker (car(cdr(cdr lst)))))
	((not(check-number (car(cdr(cdr lst))))) '(operands not numeric))
	(t '(true valid))))

(defun check-length (lst)
	(cond ((= (length lst) 3))
	(t	nil)))
	
(defun check-number (n)
	(cond ((numberp n) t)
		(t nil)))
	
(defun check-opcode (n)
	(cond ((null n) nil)
	((equal n 'plus) t)
	((equal n 'minus) t)
	((equal n 'times) t)
	((equal n 'dividedby) t)
	(t nil)))	

;; test plan checker:
;; category/description				data					expected result
;; --------------------------------------------------------------------------
;; valid syntax not nested 			(7 plus 11)					(true, valid)
;; valid syntax nested 				(25 minus (17 times 12))	(true, valid)
;; invalid syntax length < 3		(-4 plus)					(wrong number of tokens)
;; invalid operands					(-4 plus dog)				(operands not numeric)
;; invalid operands	nested			(-4 plus (cat minus dog))	(operands not numeric)
;; invalid operator 	 			(7 - 3)				    	(invalid operator “-”)
;; invalid operator nested 			((7 + 3) minus 12)	    	(invalid operator “+”)
		
