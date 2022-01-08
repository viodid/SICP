; +---------------+
; |  EXERCISE 1.3 |
; +---------------+
(define (twoSquares a b c)
    (cond ((> a b) 
                (+ (* a a) 
                (cond (> b c)(* b b) (else * c c))
                )
            )
            (else (+ (* b b) (cond (> a c)(* a a) (else * c c)))
            )
    )
)

