; 前面需要定义的prime部分
(define (divides? a b)
  (= (remainder a b) 0)
)

(define (square x) (* x x))
(define (smallest-divisor n)
  (find-divisor n 2)
)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? n test-divisor) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))
  )
)

(define (prime? n)
  (= (smallest-divisor n) n)
)

;这是一个打印出花费的时间的函数
(define (timed-prime-test n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (prime? n)
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