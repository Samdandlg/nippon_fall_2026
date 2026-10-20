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
  (+ (item-total price quantity)
     (tax-amount (item-total price quantity)tax)))
  

(check-expect (price-with-tax 1000 3 10) 3300)
(check-expect (price-with-tax 1000 3 0) 3000)


;;Dasgal 4A
;;Ex01
;; valid-percent? : Number -> Boolean
(define (valid-percent? percent)
  (and (<= 0 percent) (<= percent 100)))

;; 0-ээс 100 хүртэл (хоёр талдаа орно) бол #t
(check-expect (valid-percent? 0) #t)
(check-expect (valid-percent? 100) #t)
(check-expect (valid-percent? -1) #f)
(check-expect (valid-percent? 101) #f)


;;Ex02
;; weekday? : Number -> Boolean
(define (weekday? day)
  (and (>= day 1)(<= day 5)))

;; өдрийн дугаар (1 = Даваа ... 7 = Ням) 1–5 бол #t
(check-expect (weekday? 1) #t)
(check-expect (weekday? 5) #t)
(check-expect (weekday? 6) #f)

;;Ex03
;; eligible-basic? : Number Number -> Boolean
(define (eligible-basic? score attendance)
  (and (>= score 60)(>= attendance 80)))

;; score 60 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(check-expect (eligible-basic? 60 80) #t)
(check-expect (eligible-basic? 59 100) #f)
(check-expect (eligible-basic? 100 79) #f)

;;Ex04
;; needs-help? : Number Number -> Boolean
(define (needs-help? score attendance)
  (not(eligible-basic? score attendance)))

;; eligible-basic? биш бол #t. not ба eligible-basic?-г ашигла.
(check-expect (needs-help? 59 100) #t)
(check-expect (needs-help? 60 80) #f)


;;Dasgal 5A
;;Ex01
;; parking-fee : Number -> Number
(define (parking-fee h)
  (if (<= h 2) 0 2000))
      

;; 2 цаг хүртэл (2 орно) үнэгүй, түүнээс их бол 2000
(check-expect (parking-fee 2) 0)
(check-expect (parking-fee 3) 2000)

;;Ex02
;; smaller : Number Number -> Number
(define (smaller a b)
  (if (> a b) b a))

;; хоёр тооны бага нь
(check-expect (smaller 3 8) 3)
(check-expect (smaller 8 3) 3)
(check-expect (smaller 5 5) 5)

;;Ex03
;; speed-label : Number -> String
(define (speed-label speed)
  (cond
    [(>= speed 100)"too fast"]
    [(>= speed 60)"fast"]
    [(>= speed 30)"normal"]
    [else "slow"]))

;; км/ц: 30-аас бага "slow", 30–59 "normal", 60–99 "fast", 100 ба түүнээс дээш "too fast"
(check-expect (speed-label 29) "slow")
(check-expect (speed-label 30) "normal")
(check-expect (speed-label 59) "normal")
(check-expect (speed-label 60) "fast")
(check-expect (speed-label 99) "fast")
(check-expect (speed-label 100) "too fast")

;;Ex04
;; battery-label : Number -> String
(define (battery-label battery)
  (cond
    [(>= battery 100)"full"]
    [(>= battery 51)"ok"]
    [(>= battery 11)"low"]
    [else "empty"]))

;; 0–100%: 10 хүртэл "empty", 11–50 "low", 51–99 "ok", 100 "full"
(check-expect (battery-label 10) "empty")
(check-expect (battery-label 11) "low")
(check-expect (battery-label 50) "low")
(check-expect (battery-label 51) "ok")
(check-expect (battery-label 99) "ok")
(check-expect (battery-label 100) "full")

;;Ex05
;; report-status : Number Number -> String
(define (report-status score attendance)
  (cond
    [(eligible-basic? score attendance)"pass"]
    [(and (>= score 60)(<= attendance 80))"attendance"]
    [else "retake"]))

;; score, attendance:
;;   eligible-basic? үнэн бол         "pass"
;;   score >= 60 боловч ирц хүрэхгүй   "attendance"
;;   бусад                            "retake"
(check-expect (report-status 60 80) "pass")
(check-expect (report-status 70 50) "attendance")
(check-expect (report-status 40 90) "retake")