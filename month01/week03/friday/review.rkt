;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; scale-all : List-of-numbers Number -> List-of-numbers
(define (scale-all l target)
  (cond
    [(empty? l) empty]
    [else (cons (* (first l)target) (scale-all (rest l)target))]))
;; тоо бүрийг factor-оор үржүүлнэ
(check-expect (scale-all empty 10) empty)
(check-expect (scale-all (list 1 2) 10) (list 10 20))

;; best-grade : NEList-of-numbers -> String
(define (letter-grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

(define (highest scores)
  (cond
    [(empty? (rest scores)) (first scores)]
    [else (max (first scores) (highest (rest scores)))]))

(define(best-grade scores)
  (letter-grade(highest scores)))

;; хамгийн их онооны үсгэн дүн. Пүрэвийн highest, 2-р долоо хоногийн letter-grade-г дууд.
(check-expect (best-grade (list 70 95)) "A")
(check-expect (best-grade (list 59)) "F")

;; badge-row : List-of-numbers -> Image
(define (pass-fail-badge score)
  (cond
    [(>= score 60) (circle 20 "solid" "green")]
    [else (circle 20 "solid" "red")]))

(define (badge-row scores)
  (cond
    [(empty? scores) empty-image]
    [else (beside (pass-fail-badge (first scores))
                  (badge-row (rest scores)))]))

;; оноо бүрийг 2-р долоо хоногийн pass-fail-badge-аар (60+ ногоон, бусад улаан, радиус 20) зүүнээс баруун тийш
(check-expect (badge-row empty) empty-image)
(check-expect (badge-row (list 60 59))
              (beside (circle 20 "solid" "green") (circle 20 "solid" "red")))