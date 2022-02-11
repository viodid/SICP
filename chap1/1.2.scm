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
; T(n,5) = Θ(n^5)
; https://codology.net/post/sicp-solution-exercise-1-14/

; +---------------+
; |  EXERCISE 1.15|
; +---------------+
; a. 5
; b. Θlog(a)

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