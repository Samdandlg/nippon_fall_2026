;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


(define-struct book (title author pages))

(define b1 (make-book "Harry Potter" "Rowling" 320))
(define b2 (make-book "Бяцхан ханхүү" "Exupéry" 96))
(define b3 (make-book "Нууц товчоо" "Тодорхойгүй" 300))

;; Template
(book-title b2)
;; b3 heden huudastai ve
(book-pages b3)
;; b1-iin zohiogch n hen be?
(book-author b1)

;;
;; long-book? : Book -> Boolean
(define (long-book? book)
  (> (book-pages book) 300))

(check-expect (long-book? b1) #true)
(check-expect (long-book? b2) #false)
(check-expect (long-book? b3) #false)   ; яг 300
(check-expect (long-book? (make-book "A" "B" 301)) #true)

;;Dasgal 1C : reading-days
;;Udurt 20 huudas unshwal nom heden udurt duusahiig tootsool.

(define (reading-days book)
  (/ (book-pages book) 20))

;; Reading-days : Book -> Number
(check-expect (reading-days b1 ) 16)
(check-expect (reading-days b2 ) 4.8)
(check-expect (reading-days b3 ) 15)

;;Ex02
(define-struct pet (name kind age))

(define bobo (make-pet "Бобо" "нохой" 3))
(define mimi (make-pet "Мими" "муур" 1))
(define tom  (make-pet "Том"  "муур" 12))

(define (cat? pet)
  (string=? (pet-kind pet) "муур"))

(check-expect (cat? mimi) #true)
(check-expect (cat? tom) #true)
(check-expect (cat? bobo) #false)

;;Dasgal 2C: senior?

(define (senior? pet)
  (>= (pet-age pet) 10))

(check-expect (senior? tom) #true)
(check-expect (senior? bobo) #false)
(check-expect (senior? (make-pet "Хар" "нохой" 10)) #true)
(check-expect (senior? (make-pet "Цагаан" "муур" 9)) #false)

(define (pet-intro pet)
  (string-append (pet-name pet) " bol "
                 (number->string(pet-age pet)) " nastai "
                 (pet-kind pet)))

(check-expect (pet-intro bobo) "Бобо bol 3 nastai нохой")
(check-expect (pet-intro mimi) "Мими bol 1 nastai муур")
(check-expect (pet-intro tom) "Том bol 12 nastai муур")





;;Ex03
(define-struct product (name price qty))

(define pen      (make-product "Үзэг"   500   40))
(define notebook (make-product "Дэвтэр" 1500  0))
(define bag      (make-product "Цүнх"   45000 3))

;;
(define (stock-value p)
  (* (product-price p)(product-qty p)))

(check-expect (stock-value pen) 20000)
(check-expect (stock-value bag) 135000)
(check-expect (stock-value notebook) 0)

;;
(define (in-stock? p)
  (> (product-qty p) 0))

(check-expect (in-stock? pen) #true)
(check-expect (in-stock? bag) #true)
(check-expect (in-stock? notebook) #false)

;;
(define (price-with-tax p)
  (* (product-price p) 1.1))

(check-expect (price-with-tax pen) 550)
(check-expect (price-with-tax notebook) 1650)
(check-expect (price-with-tax bag) 49500)





;;Ex04
(require 2htdp/image)

(define-struct ball (radius color))

(define red-ball (make-ball 20 "red"))
(define big-blue (make-ball 50 "blue"))
(define tiny (make-ball 5 "green"))

;;

(define (draw-all img)
  (circle (ball-radius img) "solid" (ball-color img)))

(check-expect (draw-all red-ball) (circle 20 "solid" "red"))
(check-expect (draw-all big-blue) (circle 50 "solid" "blue"))

;;

(define (bigger? a b)
  (> (ball-radius a)(ball-radius b)))

(check-expect (bigger? big-blue red-ball) #true)
(check-expect (bigger? red-ball tiny) #true)
(check-expect (bigger? tiny red-ball) #false)
(check-expect (bigger? red-ball red-ball) #false)

;;

(define (ball-in-box ball)
  (overlay (draw-all ball) (square (+(* (ball-radius ball) 2)10) "outline" "black")))

(check-expect (ball-in-box red-ball)
              (overlay (circle 20 "solid" "red") (square 50 "outline" "black")))
(check-expect (ball-in-box tiny)
              (overlay (circle 5 "solid" "green") (square 20 "outline" "black")))
(check-expect (ball-in-box big-blue)
              (overlay (circle 50 "solid" "blue") (square 110 "outline" "black")))


;;
(define-struct game (home away home-goals away-goals))

(define g1 (make-game "Mongol" "Solongos" 4 3))
(define g2 (make-game "Mongol" "Hyatad" 2 2))
(define g3 (make-game "Mongol" "Ypon" 1 0))


(check-expect (game? g1) #true)
(check-expect (game-home g1) "Mongol")
(check-expect (game-away g1) "Solongos")
(check-expect (game-away-goals g1) 3)


;;
(define (total-goals g)
  (+ (game-away-goals g)(game-home-goals g)))

(check-expect (total-goals g1) 7)
(check-expect (total-goals g2) 4)
(check-expect (total-goals g3) 1)
(check-expect (total-goals (make-game "A" "B" 0 0)) 0)


;;
(define (winner g)
  (cond
    [(> (game-home-goals g)(game-away-goals g))(game-home g)]
    [(< (game-home-goals g)(game-away-goals g))(game-away g)]
    [else "Tentsee"]))

(check-expect (winner g1) "Mongol")
(check-expect (winner g2) "Tentsee")
(check-expect (winner g3) "Mongol")
(check-expect (winner (make-game "A" "B" 0 0)) "Tentsee")

;;

(define (score-line g)
  (string-append (game-home g) " " (number->string (game-home-goals g)) " : " (number->string (game-away-goals g)) " " (game-away g)))

(check-expect (score-line g1) "Mongol 4 : 3 Solongos")
(check-expect (score-line g2) "Mongol 2 : 2 Hyatad")
(check-expect (score-line g3) "Mongol 1 : 0 Ypon")





;;Ex06

(define-struct student (name quiz project))


(define aki (make-student "Aki" 80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren (make-student "Ren" 45 55))

(define (final-score score)
  (+(*(student-quiz score)0.4)
    (*(student-project score)0.6)))

(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "Zero" 0 0)) 0)


;;Ex07

(define (passed? student)
  (>= (final-score student)60))

(check-expect (passed? aki) #true)
(check-expect (passed? sora) #true)
(check-expect (passed? mina) #true)
(check-expect (passed? ren) #false)
(check-expect (passed? (make-student "Uka" 100 34)) #true)

;;

(check-expect (passed? (make-student "Uka" 100 34)) #true)
(check-expect (passed? (make-student "Bat" 100 33)) #false)
