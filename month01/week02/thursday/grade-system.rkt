;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grade-system) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;Ex01

(define (sum3 a b c)
  (+ a b c))

;; sum3 : Number Number Number -> Number
(check-expect (sum3 80 90 70) 240)

;; average3 : Number Number Number -> Number
(define (average3 a b c)
  (/ (sum3 a b c) 3))

;; гурван тооны дундаж. sum3-г дуудна.
(check-expect (average3 80 90 70) 80)
(check-expect (average3 60 60 60) 60)

;; assignment-percent : Number Number -> Number
(define (assignment-percent a b)
  (* a b))

;; хийсэн ба нийт даалгавар → гүйцэтгэлийн хувь (total > 0)
(check-expect (assignment-percent 8 10) 80)
(check-expect (assignment-percent 7 10) 70)
(check-expect (assignment-percent 0 10) 0)





;;Ex02

;; passing-average? : Number Number Number -> Boolean
(define (passing-average? a b c)
  (>= (average3 a b c) 60))

;; average3 60 ба түүнээс дээш бол #t
(check-expect (passing-average? 60 60 60) #t)
(check-expect (passing-average? 59 59 59) #f)
(check-expect (passing-average? 100 80 0) #t)   ; дундаж яг 60


;; good-attendance? : Number -> Boolean
(define (good-attendance? attendance)
  (>= attendance 80))

;; ирц 80 ба түүнээс дээш бол #t
(check-expect (good-attendance? 80) #t)
(check-expect (good-attendance? 79) #f)

;; assignments-complete? : Number Number -> Boolean
(define (assignments-complete? a b)
  (>= (assignment-percent a b) 70))

;; assignment-percent 70 ба түүнээс дээш бол #t. assignment-percent-г дуудна.
(check-expect (assignments-complete? 7 10) #t)
(check-expect (assignments-complete? 6 10) #f)
(check-expect (assignments-complete? 0 10) #f)




;;Ex03
;; eligible? : Number Number Number Number Number Number -> Boolean
(define (eligible? s1 s2 s3 attendance a b)
  (and (passing-average? s1 s2 s3)(good-attendance? attendance)(assignments-complete? a b))) 
  

;; s1 s2 s3 attendance completed total → гурван шалгуур бүгд үнэн бол #t
(check-expect (eligible? 80 90 70 85 8 10) #t)
(check-expect (eligible? 80 90 70 79 8 10) #f)   ; ирц
(check-expect (eligible? 59 59 59 100 10 10) #f) ; оноо
(check-expect (eligible? 80 90 70 85 6 10) #f)   ; даалгавар




;;Ex04
;; final-status : Number Number Number Number Number Number -> String
(define (final-status s1 s2 s3 attendance a b)
  (if (eligible? s1 s2 s3 attendance a b) "Eligible" "Not eligible"))

;; тэнцсэн бол "Eligible", үгүй бол "Not eligible"
(check-expect (final-status 80 90 70 85 8 10) "Eligible")
(check-expect (final-status 80 90 70 79 8 10) "Not eligible")



;;Ex05
;; letter-grade : Number -> String
(define (letter-grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

;; дундаж оноо → "A" "B" "C" "D" "F" (Мягмарын grade-тэй ижил дүрэм)
(check-expect (letter-grade 90) "A")
(check-expect (letter-grade 89) "B")
(check-expect (letter-grade 80) "B")
(check-expect (letter-grade 79) "C")
(check-expect (letter-grade 60) "D")
(check-expect (letter-grade 59) "F")

;; student-grade : Number Number Number -> String
(define (student-grade a b c)
  (cond
    [(>= (average3 a b c ) 90) "A"]
    [(>= (average3 a b c ) 80) "B"]
    [(>= (average3 a b c ) 70) "C"]
    [(>= (average3 a b c ) 60) "D"]
    [else "F"]))
;; гурван оноо → үсгэн дүн. average3 ба letter-grade-г дуудна.
(check-expect (student-grade 80 90 70) "B")
(check-expect (student-grade 100 90 80) "A")





;;Ex06
;; grade-color : Number -> String
(define (grade-color score)
  (cond
    [(>= score 90) "green"]
    [(>= score 80) "blue"]
    [(>= score 70) "gold"]
    [(>= score 60) "orange"]
    [else "red"]))

;; дундаж оноо → өнгө: 90+ "green", 80–89 "blue", 70–79 "gold", 60–69 "orange", бусад "red"
(check-expect (grade-color 90) "green")
(check-expect (grade-color 89) "blue")
(check-expect (grade-color 60) "orange")
(check-expect (grade-color 59) "red")

;; grade-badge : Number -> Image
(define (grade-badge score)
  (overlay (text (letter-grade score) 24 "white")
           (circle 30 "solid" (grade-color score))))

;; дундаж оноо → өнгөт тойрог дээр цагаан үсгэн дүн.
;; grade-color, letter-grade-г дуудна.
(check-expect (grade-badge 95) (overlay (text "A" 24 "white") (circle 30 "solid" "green")))
(check-expect (grade-badge 59) (overlay (text "F" 24 "white") (circle 30 "solid" "red")))

;; student-card : Number Number Number Number Number Number -> Image
(define (student-card s1 s2 s3 attendance a b)
  (beside (grade-badge (average3 s1 s2 s3))
          (text (final-status s1 s2 s3 attendance a b) 20 "black")))

;; s1 s2 s3 attendance completed total → тэмдэг, хажууд нь final-status-ийн текст.
;; average3, grade-badge, final-status-г дуудна.
(check-expect (student-card 80 90 70 85 8 10)
              (beside (grade-badge 80) (text "Eligible" 20 "black")))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;nemelt

;; honor-roll? : Number Number Number Number -> Boolean
(define (honor-roll? s1 s2 s3 attendance)
  (and (>= (average3 s1 s2 s3) 90)(>= attendance 95))) 

;; s1 s2 s3 attendance: дундаж 90 ба түүнээс дээш, ирц 95 ба түүнээс дээш бол #t
(check-expect (honor-roll? 90 90 90 95) #t)
(check-expect (honor-roll? 90 90 90 94) #f)
(check-expect (honor-roll? 89 89 89 100) #f)


;; ineligibility-reason : Number Number Number Number Number Number -> String
(define (ineligibility-reason s1 s2 s3 attendance a b)
  (cond
    [(not(passing-average? s1 s2 s3))"Low score"]
    [(not(good-attendance? attendance))"Low attendance"]
    [(not(assignments-complete? a b))"Missing assignments"]
    [else "Eligible"]))

;; Хэд хэдэн шалгуур унавал эхнийхийг нь буцаана: оноо → ирц → даалгавар.
;; Бүгд үнэн бол "Eligible".
(check-expect (ineligibility-reason 59 59 59 50 0 10) "Low score")
(check-expect (ineligibility-reason 80 90 70 79 0 10) "Low attendance")
(check-expect (ineligibility-reason 80 90 70 85 6 10) "Missing assignments")
(check-expect (ineligibility-reason 80 90 70 85 8 10) "Eligible")

;; average5 : Number Number Number Number Number -> Number
(define (average5 a b c d e)
  (/(+ a b c d e)5))

;; таван онооны дундаж
(check-expect (average5 60 70 80 90 100) 80)