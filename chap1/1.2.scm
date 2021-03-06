; +---------------+
; |  EXERCISE 1.9 |
; +---------------+
; Recursive process
(+ 4 5) 
 (inc (+ (dec 4) 5)) 
 (inc (+ 3 5)) 
 (inc (inc (+ (dec 3) 5))) 
 (inc (inc (+ 2 5))) 
 (inc (inc (inc (+ (dec 2) 5)))) 
 (inc (inc (inc (+ 1 5)))) 
 (inc (inc (inc (inc (+ (dec 1) 5))))) 
 (inc (inc (inc (inc (+ 0 5))))) 
 (inc (inc (inc (inc 5)))) 
 (inc (inc (inc 6))) 
 (inc (inc 7)) 
 (inc 8)
(9)
; -------
; Iterative process
(+ 4 5)
(+ (3) (6))
(+ (2) (7))
(+ (1) (8))
(+ (0) (9))
(9)

; +---------------+
; |  EXERCISE 1.10|
; +---------------+
; Inifinite recursion
(A 1 10)
(A 2 4)
(A 3 3)

; f(n) -> 2n
(define (f n) (A 0 n))
; g(n) -> 0 for n=0, 2^(n) for n>0
(define (g n) (A 1 n))
; h(n) -> 0 for n=0, 2 for n=1, 2^(2^(2^(2...(n times)))) for n>1
(define (h n) (A 2 n))
; k(n) -> 5n^2
(define (k n) (* 5 n n))

; +---------------+
; |  EXERCISE 1.11|
; +---------------+
; Recursive process
(define (callRecurFunction n)
    (f n)
)
(define (f n)
    (if (< n 3) n
    (+ (f (- n 1)) 
    (* 2 (f (- n 2))) 
    (* 3 (f (- n 3))) ) )
)
; Iterative process
(define (callIterFunction n)
    (f 2 1 0 n)
)
(define (f a b c count)
    (cond ((< count 0) count) 
               ((= count 0) a) 
               ((= count 1) b) 
               ((= count 2) c) 
               (else (f b c (+ c (* 2 b) (* 3 a)) (- count 1))))
)

; +---------------+
; |  EXERCISE 1.12|
; +---------------+
(define (pascal row col)
    (if (or (= col 1) (= col row)) 1
    (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))
)

; +---------------+
; |  EXERCISE 1.14|
; +---------------+
;                11 => 10 5 1    
;                    3|1
;             +-------+--------------------------------------+
;             |                                              |
;       11 => 5 1                                       1=> 10 5 1
;            1|2                                            1|0
;     +-------+-------+                                 +----+---------+
;     |               |                                 |              |
;  11=> 1          6 => 5 1                           1=> 5 1      -9 => 10 5 1
;                    1|1                               1|0
;            +--------+----+                      +-----+---+
;            |             |                      |         |
;         6 => 1        1 => 5 1               1 => 1     -4=> 5 1
;                         1|0
;                     +----+----+
;                     |         |
;                 1 => 1     -4=> 5 1
;
; T(n,5) = ??(n^5)
; https://codology.net/post/sicp-solution-exercise-1-14/

; +---------------+
; |  EXERCISE 1.15|
; +---------------+
; a. 5
; b. ??log(a)

; +---------------+
; |  EXERCISE 1.20|
; +---------------+
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (gcd 206 40)
    (if (= 40 0)
        a
    (gcd 40 (remainder 206 40))))
        -> (gcd 40 6)))
            (if (= 6 0)
                a
            (gcd 6 (remainder 40 6))))
            -> (gcd 6 4)))
                (if (= 4 0))
                    a
                (gcd 4 (remainder 6 4))))
                -> (gcd 4 2)))
                    (if (= 2 0))
                        a
                    (gcd 2 (remainder 4 2))))
                    -> (gcd 2 0)))
                        (if (= 0 0))
                            2
; Using applicative-order evaluation, remainder is called 4 times.

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))
(if (= 6 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder 40 6) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder a  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
(if (= 0 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder a  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

; Using normal-order evaluation, remainder is called 18 times.


; +---------------+
; |  EXERCISE 1.21|
; +---------------+
(define (smallest-divisor n)
  (find-divisor n 2))
  
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

; (smallest-divisor 199) -> 199
; (smallest-divisor 1999) -> 1999
; (smallest-divisor 19999) -> 7

; +---------------+
; |  EXERCISE 1.22|
; +---------------+
(define (runtime) (current-inexact-milliseconds))

(define (time-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
    (report-prime (- (runtime) start-time) n)
    (start-prime-test (+ n 1) (runtime))))

(define (report-prime elapsed-time n)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
    n)

(define (search-for-primes n)
    (time-prime-test (+ 1 (time-prime-test (+ 1 (time-prime-test n))))))

; > (search-for-primes 1,000)
; 1009 *** 0.030029296875
; 1013 *** 0.030029296875
; 1019 *** 0.029052734375

; > (search-for-primes 10,000)
; 10007 *** 0.10791015625
; 10009 *** 0.108154296875
; 10037 *** 0.09716796875

; > (search-for-primes 100,000)
; 100003 *** 0.23583984375
; 100019 *** 0.23486328125
; 100043 *** 0.23486328125

; > (search-for-primes 1,000,000)
; 1000003 *** 0.406005859375
; 1000033 *** 0.376953125
; 1000037 *** 0.3779296875

; +---------------+
; |  EXERCISE 1.23|
; +---------------+
(define (smallest-divisor n)
  (find-divisor n 2))
  
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(define (next n)
    (if (= (remainder n 2) 0) (+ n 1)
    (+ n 2)))

; (search-for-primes 1,000)
; 1009 *** 0.0068359375
; 1013 *** 0.0078125
; 1019 *** 0.008056640625

; (search-for-primes 10,000)
; 10007 *** 0.023193359375
; 10009 *** 0.023193359375
; 10037 *** 0.02392578125

; (search-for-primes 100,000)
; 100003 *** 0.071044921875
; 100019 *** 0.071044921875
; 100043 *** 0.095947265625

; (search-for-primes 1,000,000)
; 1000003 *** 0.22705078125
; 1000033 *** 0.23291015625
; 1000037 *** 0.22900390625

; +---------------+
; |  EXERCISE 1.24|
; +---------------+
(define (runtime) (current-inexact-milliseconds))

(define (square n) (* n n))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (report-prime elapsed-time n)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
    n)

(define (prime-test n start-time)
    (if (fast-prime? n 100) (report-prime (- (runtime) start-time) n)
        (display " nothing ")))

(define (start-prime-test n)
    (prime-test n (runtime)))