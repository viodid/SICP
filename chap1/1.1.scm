; +---------------+
; |  EXERCISE 1.3 |
; +---------------+
(define (twoSquares a b c)
    (cond ((> a b) 
                (
                    + (* a a) 
                    (cond ((> b c) (* b b)) 
                        (else (* c c))
                    )
                )
            )
            (
                else (+ (* b b)
                (
                    cond ((> a c)(* a a)) 
                        (else (* c c))
                )
                )
            )
    )
)


; +---------------+
; |  EXERCISE 1.4 |
; +---------------+
; (define (a-plus-abs-b 1 -2)
;     (if ( > -2 0) + -)
;         (- 1 -2))
;           3


; +---------------+
; |  EXERCISE 1.5|
; +---------------+
; An applicative-order evaluation interpreter will always enter the infinite recursion, whereas a normal-order 
; evaluation interpreter will not evaluate the y parameter (the infite recursion) untill the end, so that will meet the first 
; conditional and return the function before enter into the recursion.


(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
            x)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess))))

(define (average x y)
    (/ (+ x y) 2))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; +---------------+
; |  EXERCISE 1.6|
; +---------------+
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (new-sqrt-iter (improve guess x) ;here is the problem
            x)))

; It creates an infinite recursion, because of the applicative-order evaluation interpreter. That means, the 'new-if' 
; function will try to reach the bottom of the recursion calls.
; The default if statement is a special form which means that even when an interpreter follows applicative substitution,
; it only evaluates one of its parameters, not both.



; +---------------+
; |  EXERCISE 1.7|
; +---------------+
; Since the margin of error is hard-coded, meaning that it would perform the same 'good-enough?' approach to resolve 
; differents square roots no matter how big or small the number could be, it won't solve properly either for small or 
; large numbers.


