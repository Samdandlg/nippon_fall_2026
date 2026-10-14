Recursive case n uuriiguu duuddag, dawtagdsan asuudliig shiiddeg zuil yum
(define (count-items i)(cond[(empty? i) 0][else (+1 (count-item (rest i)))]))
(check-expect (count-items (cons 1 (cons 2 (cons 3 empty)))) 3)
