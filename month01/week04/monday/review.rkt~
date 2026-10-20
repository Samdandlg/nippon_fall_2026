;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Ex01
;; sum-passing : List-of-numbers -> Number
(define (sum-passing Number )
  (cond
    [(empty? Number) 0]
    [ (>= (first Number) 60)
      (+ (first Number) (sum-passing (rest Number)))
      ]
    [else
     (sum-passing (rest Number) )]))
;; 60 ба түүнээс дээш оноонуудын нийлбэр
(check-expect (sum-passing empty) 0)
(check-expect (sum-passing (list 59 60 100)) 160)
(check-expect (sum-passing (list 10 20)) 0)

;;Ex02
;; all-passing? : List-of-numbers -> Boolean
(define (all-passing? a)
  (cond
    [(empty? a) #t]
    [else
     (and (>= (first a)60) (all-passing? (rest a)))]))
     
;; бүх оноо 60 ба түүнээс дээш бол #true. Хоосон list-д #true.
(check-expect (all-passing? empty) #true)
(check-expect (all-passing? (list 60 75)) #true)
(check-expect (all-passing? (list 60 59)) #false)

;;Ex03
;; score-dots : List-of-numbers -> Image
(define (score-dots score)

;; оноо бүрийг радиус 10 тойрог болгож зэрэгцүүлнэ: 60+ ногоон, бусад улаан
(check-expect (score-dots empty) empty-image)
(check-expect (score-dots (list 70 40))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))
(check-expect (score-dots (list 60)) (circle 10 "solid" "green"))