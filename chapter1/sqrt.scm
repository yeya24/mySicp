(define (sqrt x)
  (define (average x y) (/ (+ y x) 2))
  (define (improve guess x) (average guess (/ x guess)))
  (define (abs x) (if (< x 0) (- x) x))
  (define (square x) (* x x))
  (define (goodenough? guess x) (< (abs (- (square guess) x)) 0.001))
  (define (sqrt-iter guess x) (if (goodenough? guess x) guess (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
  )


(define (new-if predicate then-clause else-clause) 
  (cond (predicate then-clause)
  (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (goodenough? guess x)
  guess
  (sqrt-iter (improve guess x) 
              x)))