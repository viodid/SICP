; +---------------+
; | EXERCISE 2.31 |
; +---------------+
; Product definition
(define (product term a next b)
       (if (> a b) 1
       (* (term a)
           (product term (next a) next b))))

; Factorial procedure
 (define (inc n) (+ n 1))
 (define (nothing n) (* 1 n))
 (define (factorial a b)
      (product nothing a inc b))
; Pi aproximations procedure
(define (
