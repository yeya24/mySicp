; 费马检查
(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (expmod base (- exp 1) m) m))
  )
)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a)
  )
  (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)
    )
)

(define (square x) (* x x))

;这是一个打印出花费的时间的函数
(define (timed-prime-test n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (fast-prime? n 3)
    (begin 
      (report-time n (- (runtime) start-time))
        #t)
        #f)
)

(define (report-time n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
)

;1.22要求的函数
(define (search-for-primes start end num)
  (if (even? start)
    (search-for-primes (+ 1 start) end  num)
    (search-iter start end 0 num)
  )
)

(define (search-iter start end cur num)
  (if (and (< start end) (< cur num))
    (if (timed-prime-test start)
      (search-iter (+ start 2) end (+ 1 cur) num)
      (search-iter (+ start 2) end cur num))
    cur
  )
)