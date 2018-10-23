(define (f n)
  (if (< n 3) n
      (+ (f (- n 1)) (* 2 (f (- n 2)))  (* 3 (f (- n 3))) )
    )
)


(define (f n)
(define (f-iter a b c i n)
    (if (= i n) c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (inc i) n))
)
(f-iter 2 1 0 0 n)
)

