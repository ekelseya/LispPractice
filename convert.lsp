;; Eryn Kelsey-Adkins -- CS 3210 -- Spring 2019
;; ============================================
;; convert: function for temperature conversion;  
;; 		receives a list containing two pieces of 
;; 		data, a number and a letter, calls a 
;; 		relevant helper function, and returns 
;;		the converted value (not in a list).  
;; parameters:
;; 		lst - a list, containing two pieces of 
;; 		data, a number and a letter, where the 
;; 		number is a value for a temperature, and
;;		the letter is either C or F (meaning 
;; 		centigrade or Fahrenheit)
;; assumptions:
;; 		1. lst contains only a number and a letter
;; 		2. the numeric value is an integer holding
;; 			a valid temperature
;; 		3. the letter is either C or F
;; helper functions:
;; F-to-C: converts Fahrenheit to centigrade and 
;; 		returns the value
;; parameters:
;; 		a number
;; assumptions:
;; 		1. the number is an integer
;; 		2. the numeric value is a valid temperature
;; C-to-F: converts centigrade to Fahrenheit and 
;; 		returns the value
;; parameters:
;; 		a number
;; assumptions:
;; 		1. the number is an integer
;; 		2. the numeric value is a valid temperature

(defun convert (lst)
	(cond
		((null lst) 
		(print "error, input must be a list of temperature followed by C or F"))
		((= 1 (length lst))
		(print "error, input must be a list of temperature followed by C or F"))
		((equal 'F (car lst))
		(print "error, input must be a list of temperature followed by C or F"))
		((equal 'C (car lst))
		(print "error, input must be a list of temperature followed by C or F"))
		((equal 'F (car (cdr lst)))(F-to-C (car lst)))
		((equal 'C (car (cdr lst)))(C-to-F (car lst)))))
		
(defun F-to-C (f)
	(*(- f 32.0)(/ 5 9)))
		
(defun C-to-F (c)
	(+ (* c (/ 9 5)) 32.0))
		
;; test plan for convert:
;; category/description				data			expected result
;; -----------------------------------------------------------------
;; lst == empty list				()				"error, input must be temperature and C or F"
;; list with 1 element				(n)				"error, input must be temperature and C or F"
;; list with Fahrenheit temp 		(45 F)			7.22
;; list with centigrade temp		(30 C)			86
;; list with equal values (-40 C)	(-40 C) 		-40
;; list with equal values (-40 F)	(-40 F) 		-40
;; list with values out of order	(F 21)			"error, input must be temperature and C or F"