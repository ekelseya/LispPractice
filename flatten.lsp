(defun flatten (L)
   (cond
      ((not (listp L)) L)
      ((null L) L)
      ((not (listp (car L))) (cons (car L) (flatten (cdr L))))
      (t (append (flatten (car L)) (flatten (cdr L))))))