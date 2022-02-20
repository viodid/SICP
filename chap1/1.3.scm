; +---------------+
; | EXERCISE 1.30 |
; +---------------+
(define (sum term a bext b)
    (define (iter a result)
        (if (> a b)
        result
            (iter (next a) (+ (term a) result))))
    (iter a 0))

; +---------------+
; | EXERCISE 1.31 |
; +---------------+
; Product definition
(define (product term a next b)
       (if (> a b) 1
       (* (term a)
           (product term (next a) next b))))

; Iterative product definition
(define (product term a next b total)
    (if (> a b) total
    (product term (next a) next b (* total  a)))) 

; Factorial procedure
 (define (inc n) (+ n 1))
 (define (nothing n) (* 1 n))
 (define (factorial a b)
      (product nothing a inc b))
 
; +---------------+
; | EXERCISE 1.32 |
; +---------------+
; Recurisive process
(define (accumulate combiner null-value term a next b)
    (if (> a b) null-value
    (combiner (term a)
        (accumulate combiner null-value term (next a) next b))))

; Iterative process
(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        
