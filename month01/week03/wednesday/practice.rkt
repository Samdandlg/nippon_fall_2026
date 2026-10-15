;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;List-of-Numbers dasgal 3A
;;Ex01
;; contains? : Number List-of-numbers -> Boolean
(define (contains? target l )
  (cond
    [(empty? l) #f]
    [else
     (or (=(first l) target) (contains? target (rest l)))]))

;; target list дотор байвал #t
(check-expect (contains? 5 empty) #f)
(check-expect (contains? 5 (cons 3 (cons 5 (cons 7 empty)))) #t)
(check-expect (contains? 4 (cons 3 (cons 5 empty))) #f)

;;Ex02
;; count-greater-than : List-of-numbers Number -> Number
(define (count-greater-than Number target)
  (cond
    [(empty? Number) 0]
    [ (> (first Number) target)
      (+ 1 (count-greater-than (rest Number)target))
      ]
    [else
     (count-greater-than (rest Number) target)])) 

;; limit-ээс ИХ (тэнцүү биш) тоонуудын тоо
(check-expect (count-greater-than empty 5) 0)
(check-expect (count-greater-than (cons 2 (cons 8 (cons 10 empty))) 5) 2)
(check-expect (count-greater-than (cons 5 (cons 6 empty)) 5) 1)   ; 5 тоологдохгүй

;;NEList-of-numbers Dasgal 3B
;;Ex01
;; find-max : NEList-of-numbers -> Number
(define (find-max Number)
  (cond
    [(empty? (rest Number)) (first Number)]
    [else (max (first Number) (find-max (rest Number)))]))


;; хамгийн их утга. max ашиглаж болно: (max 3 8) → 8
(check-expect (find-max (cons 70 empty)) 70)
(check-expect (find-max (cons 70 (cons 95 (cons 63 empty)))) 95)
(check-expect (find-max (cons -5 (cons -2 empty))) -2)

;;Ex02
;; average : NEList-of-numbers -> Number
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]))
(define (count-items l)
  (cond
    [(empty? l) 0]
    [else (+ 1
             (count-items (rest l)))]))

(define (average l)
  (/ (sum l) (count-items l)))

;; дундаж = sum / count-items. Хоосон биш тул 0-д хуваахгүй.
(check-expect (average (cons 80 empty)) 80)
(check-expect (average (cons 70 (cons 82 (cons 95 (cons 63 (cons 88 empty)))))) 79.6)
