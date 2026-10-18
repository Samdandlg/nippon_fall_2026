;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (passing-score? score)
  (>= score 60))
(define (fits-in-byte? number)
  (and (positive? number)(<= number 255)))


;;Ex01
;; teen? : Number -> Boolean
(define (teen? age)
  (and (>= age 13)(<= age 19)))

;; age 13-аас 19 хүртэл (хоёр талдаа орно) бол #t
(check-expect (teen? 13) #t)
(check-expect (teen? 19) #t)
(check-expect (teen? 12) #f)
(check-expect (teen? 20) #f)

;;Ex02
;; weekend? : Number -> Boolean
(define (weekend? day)
  (or ( = day 6)( = day 7)))

;; долоо хоногийн өдрийн дугаар (1 = Даваа ... 7 = Ням) 6 эсвэл 7 бол #t
(check-expect (weekend? 6) #t)
(check-expect (weekend? 7) #t)
(check-expect (weekend? 5) #f)

;;Ex03
;; scholarship? : Number Number -> Boolean
(define (scholarship? score attendance)
  (and (>= score 90)(>= attendance 80)))

;; score 90 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(check-expect (scholarship? 90 80) #t)
(check-expect (scholarship? 89 100) #f)
(check-expect (scholarship? 100 79) #f)

;;Ex04
;; not-passing? : Number -> Boolean
(define (not-passing? score)
  (not (passing-score? score)))

;; Даваагийн passing-score?-г not-оор урвуулна
(check-expect (not-passing? 59) #t)
(check-expect (not-passing? 60) #f)



;;Dasgal 3A
;;Ex01
;; even-or-odd : Number -> String
(define (even-or-odd number)
  (if (even? number) "even" "odd"))

;; тэгш бол "even", сондгой бол "odd"
(check-expect (even-or-odd 4) "even")
(check-expect (even-or-odd 7) "odd")
(check-expect (even-or-odd 0) "even")

;;Ex02
;; pass-or-fail : Number -> String
(define (pass-or-fail score)
  (if (passing-score? score) "pass" "fail"))

;; score 60 ба түүнээс дээш бол "pass", үгүй бол "fail"
(check-expect (pass-or-fail 60) "pass")
(check-expect (pass-or-fail 59) "fail")

;;Ex03
;; shipping-fee : Number -> Number
(define (shipping-fee fee)
  (if (>= fee 50000) 0 3000))

;; захиалгын дүн 50000 ба түүнээс их бол хүргэлт 0, үгүй бол 3000
(check-expect (shipping-fee 50000) 0)
(check-expect (shipping-fee 49999) 3000)

;;Ex04
;; free-shipping? : Number -> Boolean
(define (free-shipping? fee)
  (= (shipping-fee fee) 0))

;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(check-expect (free-shipping? 50000) #t)
(check-expect (free-shipping? 49999) #f)

;;Ex05
;; larger : Number Number -> Number
(define (larger a b)
  (if ( > a b) a b))

;; хоёр тооны их нь
(check-expect (larger 3 8) 8)
(check-expect (larger 8 3) 8)
(check-expect (larger 5 5) 5)

;;Ex06
;; absolute-value : Number -> Number
(define (absolute-value Number)
  (if (positive? Number) Number (- Number)))

;; сөрөг бол эсрэг тэмдэгтэй болгоно, үгүй бол хэвээр
(check-expect (absolute-value -4) 4)
(check-expect (absolute-value 4) 4)
(check-expect (absolute-value 0) 0)


;;Dasgal 3B
;; scholarship-label : Number Number -> String
(define (scholarship-label score attendance)
  (if (scholarship? score attendance) "scholarship" "regular"))

;; score, attendance → тэтгэлэгт тэнцвэл "scholarship", үгүй бол "regular"
(check-expect (scholarship-label 95 85) "scholarship")
(check-expect (scholarship-label 90 80) "scholarship")
(check-expect (scholarship-label 89 80) "regular")
(check-expect (scholarship-label 90 79) "regular")



;;Dasgal 4A
;;Ex01
;; grade : Number -> String
;; 0–100 оноог үсгэн дүн болгоно
(define (grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

(check-expect (grade 90) "A")   ; хил
(check-expect (grade 89) "B")   ; хилийн доор
(check-expect (grade 79) "C")
(check-expect (grade 69) "D")
(check-expect (grade 100) "A")
(check-expect (grade 30) "F")
(check-expect (grade 82) "B")



;;Ex02
;; temperature-label : Number -> String
(define (temperature-label temp)
  (cond
    [(>= temp 25) "hot"]
    [(>= temp 15) "warm"]
    [(>= temp 0) "cold"]
    [else "freezing"]))
    

;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")


;;Ex03
;; ticket-price : Number -> Number
(define (ticket-price age)
  (cond
    [(>= age 60) 6000]
    [(>= age 13) 10000]
    [else 5000]))
    

;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
(check-expect (ticket-price 12) 5000)
(check-expect (ticket-price 13) 10000)
(check-expect (ticket-price 59) 10000)
(check-expect (ticket-price 60) 6000)

;;Ex04
;; number-sign : Number -> String
(define (number-sign number)
  (cond
    [(positive? number)"positive"]
    [(negative? number)"negative"]
    [else "zero"]))

;; "positive", "zero", "negative"
(check-expect (number-sign 5) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -5) "negative")

;;Ex05
;; file-size-label : Number -> String
(define (file-size-label size)
  (cond
    [(>= size 100)"large"]
    [(>= size 10)"medium"]
    [else "small"]))

;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")

