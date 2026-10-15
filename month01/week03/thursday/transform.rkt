;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname transform) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(cons 4 (cons 5 empty))
(cons "a"(cons "b" (cons "c" empty)))
(list 7 8)
empty

;;Ex01
;; add-ten-all : List-of-numbers -> List-of-numbers
(define (add-ten-all l)
  (cond
    [(empty? l) empty]
    [else (cons (+ (first l)10) (add-ten-all (rest l)))]))

(check-expect (add-ten-all empty) empty)
(check-expect (add-ten-all (list 1 2 3)) (list 11 12 13))

;;Ex02
;; only-positive : List-of-numbers -> List-of-numbers
(define (only-positive l)
  (cond
    [(empty? l) empty]
    [(positive? (first l))
     (cons (first l) (only-positive (rest l)))]
    [else
     (only-positive (rest l))]))

;; зөвхөн эерэг тоонуудыг үлдээнэ (0 эерэг биш)
(check-expect (only-positive empty) empty)
(check-expect (only-positive (list -2 0 5 9)) (list 5 9))

;;Ex03
;; cap-at-100 : List-of-numbers -> List-of-numbers
(define (cap-at-100 l)
  (cond
    [(empty? l) empty]
    [else
     (cons (min (first l)100) (cap-at-100 (rest l)))]))

;; 100-аас их оноог 100 болгоно. min ашиглаж болно.
(check-expect (cap-at-100 (list 50 100 150)) (list 50 100 100))


