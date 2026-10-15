;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname score-analyzer) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; 2 жишээ list. Эхнийх нь бүгд тэнцсэн, хоёр дахь нь тэнцээгүй оноотой.
(define scores (list 70 82 95 63 88))
(define mixed-scores (list 40 60 72 58 100))

;; 1r alham, niilber, too, dundaj
;; 1
;; total : List-of-numbers -> Number
(define (total l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l) (total (rest l)))]))

(check-expect (total empty) 0)
(check-expect (total scores) 398)

;; 2
;; count-scores : List-of-numbers -> Number
(define (count-scores l)
  (cond
    [(empty? l) 0]
    [else
     (+ 1 (count-scores (rest l)))]))

(check-expect (count-scores empty) 0)
(check-expect (count-scores scores) 5)

;;3
;; average : NEList-of-numbers -> Number
(define (average l)
  (/ (total l)(count-scores l)))

;; total, count-scores-г дуудна. Хоосон list дээр дуудахгүй (NEList).
(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)

;;4
(define (highest Number)
  (cond
    [(empty? (rest Number)) (first Number)]
    [else (max (first Number) (highest (rest Number)))]))

;; highest : NEList-of-numbers -> Number
(check-expect (highest (list 63)) 63)
(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)

;;2r alham, Tentssen tentseegui
;; 1
;; count-passing : List-of-numbers -> Number
(define (count-passing Number )
  (cond
    [(empty? Number) 0]
    [ (>= (first Number) 60)
      (+ 1 (count-passing (rest Number)))
      ]
    [else
     (count-passing (rest Number) )])) 
;; 60 ба түүнээс дээш онооны тоо
(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)
(check-expect (count-passing (list 60 59)) 1)    ; хил

;;2
;; count-failing : List-of-numbers -> Number
(define (count-failing Number )
  (cond
    [(empty? Number) 0]
    [ (< (first Number) 60)
      (+ 1 (count-failing (rest Number)))
      ]
    [else
     (count-failing (rest Number) )])) 
;; 60-аас бага онооны тоо
(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)

;;3
;; passing-scores : List-of-numbers -> List-of-numbers
(define (passing-scores Number)
  (cond
    [(empty? Number) empty]
    [(>= (first Number) 60)
     (cons (first Number)(passing-scores (rest Number)))]
    [else
     (passing-scores (rest Number))]))

;; зөвхөн тэнцсэн оноонууд
(check-expect (passing-scores mixed-scores) (list 60 72 100))
(check-expect (passing-scores (list 10 20)) empty)

;;3r alham
;;1
;; score-bars : List-of-numbers -> Image
(define (score-bars Number)
  (cond
    [(empty? Number) empty-image]
    [else
     (above (rectangle (first Number) 20 "solid" "blue")
            (score-bars (rest Number)))]))

;; оноо бүрийг 2-р долоо хоногийн score-bar-аар (rectangle оноо 20 "solid" "blue")
;; дээрээс доош тавина. Хоосон list → empty-image.
(check-expect (score-bars empty) empty-image)
(check-expect (score-bars (list 80 60))
              (above (rectangle 80 20 "solid" "blue") (rectangle 60 20 "solid" "blue")))