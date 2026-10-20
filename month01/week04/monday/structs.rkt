;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))
(define sam  (make-student "Sam" 100 99))

(student-name aki)
(student-project ren)
(student? mina)
(student? 85)
(student-quiz (make-student "Bat" 70 85))
(+ (student-quiz sora) (student-project sora))
(student-quiz sam)
(make-student "Bat" 70 70)


;;Dasgal 7A

;; student-total : Student -> Number
(define (student-total name)
  (+(student-quiz name)(student-project name)))

;; quiz ба project онооны нийлбэр
(check-expect (student-total aki) 170)
(check-expect (student-total (make-student "Zero" 0 0)) 0)

;;
;; project-better? : Student -> Boolean
(define (project-better? student)
  (<(student-quiz student)(student-project student)))

;; project оноо quiz онооноос их бол #true (тэнцүү бол #false)
(check-expect (project-better? aki) #true)
(check-expect (project-better? sora) #false)
(check-expect (project-better? mina) #false)

;; quiz-passed? : Student -> Boolean
(define (quiz-passed? student)
  (>= (student-quiz student)60))

;; quiz оноо 60 ба түүнээс дээш бол #true
(check-expect (quiz-passed? sora) #true)
(check-expect (quiz-passed? ren) #false)
(check-expect (quiz-passed? (make-student "Uka" 59 100)) #false)


(require 2htdp/image)

;;Dasgal 7B
;; name-tag : Student -> Image
(define (name-tag student)
  (overlay (text (student-name student)18 "black") (rectangle 120 36 "outline" "blue")))

;; сурагчийн нэрийг (18, хар) цэнхэр хүрээтэй (120 × 36) тэмдэг дээр бичнэ
(check-expect (name-tag aki)
              (overlay (text "Aki" 18 "black") (rectangle 120 36 "outline" "blue")))

