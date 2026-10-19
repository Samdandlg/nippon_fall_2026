;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Ex01
(define (exam-time? time)
  (and (>= time 9)(<= time 12)))

;; exam-time? : Number -> Boolean
(check-expect (exam-time? 9) #t)
(check-expect (exam-time? 12) #t)
(check-expect (exam-time? 8) #f)
(check-expect (exam-time? 13) #f)

;;Ex02
;; bonus-points : Number -> Number
(define (bonus-points point)
  (if (>= point 90) 5 0))

;; оноо 90 ба түүнээс дээш бол 5 нэмэлт оноо, үгүй бол 0
(check-expect (bonus-points 90) 5)
(check-expect (bonus-points 89) 0)

;;Ex03
;; water-state : Number -> String
(define (water-state state)
  (cond
    [(>= state 100)"steam"]
    [(>= state 0)"water"]
    [else "ice"]))

;; 0-ээс бага "ice", 0–99 "water", 100 ба түүнээс дээш "steam"
(check-expect (water-state -1) "ice")
(check-expect (water-state 0) "water")
(check-expect (water-state 99) "water")
(check-expect (water-state 100) "steam")

