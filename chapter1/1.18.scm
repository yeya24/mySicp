(define (double x) (+ x x))
(define (halve x) (/ x 2)) 
(define (* a b)
  (iter a b 0)
)
(define (iter a b t)
  (cond ((= b 0) 0)
    ((= b 1) (+ t a))
    ((even? b) (iter (double a) (halve b) t))
    (else (iter a (- b 1) (+ t a)))
  )
)