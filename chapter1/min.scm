(define (expt b n)
  (if (= n 0) 1
    (* b (expt b (- n 1))))
)

(define (expt b n)
    (expt-iter b n 1)
)
(define (expt-iter base counter product)
    (if (= counter 0) product
      (expt-iter base (- counter 1) (* base product)))
)


(define (square x) (* x x))
(define (fast-expt b n)
  (cond ((= n 0) 1)
      ((even? n) (square (fast-expt b (/ n 2))))
      (else (* b (fast-expt b (- n 1)))))
)