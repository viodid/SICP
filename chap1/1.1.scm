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