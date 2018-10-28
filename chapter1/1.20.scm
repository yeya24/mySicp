; normal-order
(define (fib n)
  (if (<= n 1) n
    (+ (fib (- n 1)) (fib (- n 2)))
  )
)

(define (count-remainder n)
  (define (loop n sum)
    (if (= n 0) (- sum 1)
      (loop (- n 1) (+ sum (fib n) (fib (- n 1))))
    )
  )
  (loop n 0)
)