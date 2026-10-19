;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; 1. Нөхцөлийн дараалал буруу
(define (grade-1 score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))
(check-expect (grade-1 95) "A")

;; 2. else байхгүй, нэг тохиолдол дутуу
(define (number-sign-2 n)
  (cond
    [(> n 0) "positive"]
    [(< n 0) "negative"]
    [else "zero"]))
(check-expect (number-sign-2 0) "zero")

;; 3. Хаалт буруу байрлалтай
(define (pass-or-fail-3 score)
  (if (>= score 60) "pass" "fail"))
(check-expect (pass-or-fail-3 75) "pass")

;; 4. Boolean хэрэгтэй газарт string буцаасан
(define (adult-4? age)
  (>= age 18))
(check-expect (adult-4? 20) #t)

;; 5. Хил 59/60 буруу
(define (pass-or-fail-5 score)
  (if (>= score 60) "pass" "fail"))
(check-expect (pass-or-fail-5 60) "pass")

;; 6. Хил 89/90 буруу
(define (grade-6 score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [else "C"]))
(check-expect (grade-6 90) "A")