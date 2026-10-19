;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Dasgal 3A
;;Ex01
;; minutes-to-seconds : Number -> Number
(define (minutes-to-seconds minute)
  (* minute 60))

(check-expect (minutes-to-seconds 2) 120)

;; hours-to-seconds : Number -> Number
(define (hours-to-seconds hour)
  (*(minutes-to-seconds hour)60))

;; minutes-to-seconds-г дуудна (1 цаг = 60 минут)
(check-expect (hours-to-seconds 1) 3600)
(check-expect (hours-to-seconds 2) 7200)

;;Ex02
;; mib-to-bits : Number -> Number
(define (bytes-to-bits bytes)
  (* bytes 8))

(define (kib-to-bytes kib)
  (* kib 1024))

(define (kib-to-bits kib)
  (bytes-to-bits (kib-to-bytes kib)))

(define (mib-to-bits mib)
  (kib-to-bits ( * mib 1024)))

;; 1 MiB = 1024 KiB. Даваагийн kib-to-bits-г дуудна.
(check-expect (mib-to-bits 1) 8388608)


;;Ex03
;; fahrenheit-to-celsius : Number -> Number
(define (fahrenheit-to-celsius f)
  (/(* (- f 32) 5)9))

;; C = (F - 32) × 5/9
(check-expect (fahrenheit-to-celsius 212) 100)
(check-expect (fahrenheit-to-celsius 32) 0)

;; fahrenheit-to-kelvin : Number -> Number
(define (fahrenheit-to-kelvin f)
  (+ (fahrenheit-to-celsius f) 273.15))

;; K = C + 273.15. fahrenheit-to-celsius-г дуудна.
(check-expect (fahrenheit-to-kelvin 32) 273.15)


;;Ex04
;; tax-amount : Number Number -> Number
(define (tax-amount price tax)
  (/ (* price tax) 100))

;; нийт үнэ ба татварын хувь (10 = 10%) → татварын хэмжээ
(check-expect (tax-amount 3000 10) 300)

;; price-with-tax : Number Number Number -> Number
;; нэгж үнэ, тоо ширхэг, хувь → татвартай нийт үнэ.
;; Даваагийн item-total ба tax-amount-г дуудна.
(define (item-total price quantity)
  (* price quantity))

(define (price-with-tax price quantity tax)
  (+ (item-total price quantity) (tax-amount item-total tax)))
  

(check-expect (price-with-tax 1000 3 10) 3300)
(check-expect (price-with-tax 1000 3 0) 3000)