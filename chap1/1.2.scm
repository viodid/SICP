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