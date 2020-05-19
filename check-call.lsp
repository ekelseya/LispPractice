;; Eryn Kelsey-Adkins  --  CS 3210  --  Spring 2019
;; =================================================
;; check-call function: receives a list of a Lisp-like
;; 		function call; checks that a) the first item in 
;; 		the list is a valid function name, and b) it has 
;;		the right number of arguments.  The function 
;;		returns true or nil.  It does not check argument 
;;		types.
;; parameters:
;;		val - a list of valid functions and the 
;;			number of parameters they require,
;; 		fun - the Lisp-like function to be checked
;; assumptions:
;; 		1. val exists and is not empty
;; 		2. both lists may be nested
;;
;; helper functions:
;;
;;	check-length: returns true if fun-lst contains
;;		the correct number of arguments
;; 	parameters:
;;		n - number of arguments
;;		fun - a Lisp-like function

(defun check-length (n fun)
	(cond
		((equal n (list-length (cdr fun))) t)
		(t nil)))


(defun check-call (val fun)
	(cond 
		((null fun) nil)
		((not (equal (car (car val))(car fun)))(check-call (cdr val) fun))
		((equal (car (car val))(car fun))(check-length (car (cdr (car val)))fun))))
		
		
;; test plan for check-call:
;; category/description				data						expected result
;; -----------------------------------------------------------------------------
;; Valid function list: 
;;	((stuff 4)(blob 1)(thing 0)(flapdoodle 3)(thingie 1)(junk 3)(func 2)(fn 0)(calc 4)(fun 2))
;;
;; valid good function call			(stuff  33  lst  (a b c)  101)		t
;; valid good function call			(thing)								t
;; invalid bad function call		(thing happy)						nil
;; invalid bad function call	 	(func 2 (2) 2)						nil
