(define (cube-iter guess x)
  (if (goodenough? guess x) 
    guess
    (cube-iter (improve guess x) x))
)
(define (cuberoot x) (cube-iter 1.0 x))

(define (improve guess x) (/ (+ (/ x (* guess guesas)) (* 2 guess)) 3))
(define (cube x) (* x x x))
(define (abs x)  (if (< x 0) (- x) x) )
(define (goodenough? guess x)  (<  (abs (- (cube guess) x) )   0.000001)) 


