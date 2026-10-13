;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; recursive function

(define (fun-for-lon l)
  (cond
    [(empty? l) ...]
    [else (... (first l)
               ... (fun-for-lon(rest 1)) ...)]))

;;sum : List-of-Numbers -> Number
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]))

;; buh toonii niilber
(check-expect (sum empty) 0)
(check-expect (sum (cons 1 (cons 2 (cons 3 empty)))) 6)

;; multiply: List-of-numbers -> Number
(define (multiply l)
  (cond
    [(empty? l) 1]
    [else (* (first l)
             (multiply (rest l)))]))

(check-expect (multiply empty) 1)
(check-expect (multiply (cons 1 (cons 2 (cons 3 empty)))) 6)
(check-expect (multiply (cons 1 (cons 2 (cons 3 (cons 4 empty))))) 24)

;; Ex01
;; count-words : List-if-strings -> Number
(define (count-words words)
  (cond
    [(empty? words) 0]
    [else (+ 1
             (count-words (rest words)))]))

(check-expect (count-words empty) 0)
(check-expect (count-words (cons "hello" empty)) 1)
(check-expect (count-words (cons "hello" (cons "world" empty))) 2)
(check-expect (count-words (cons "I" (cons "love" (cons "Racket" empty)))) 3)

;;Ex02
;;contains-word? : String List-of-strings --> Boolean
(define (contains-word? word words)
  (cond
    [(empty? words) #f]
    [(string=? word (first words)) #t]
    [else (contains-word? word (rest words))]))

(check-expect (contains-word? "cat" empty) #false)
(check-expect (contains-word? "cat" (cons "cat" empty)) #true)
(check-expect (contains-word? "dog" (cons "cat" (cons "dog" empty))) #true)
(check-expect (contains-word? "bird" (cons "cat" (cons "dog" empty))) #false)

;;Ex03
;; count-long-words : List-of-strings --> Number
(define (count-long-words words)
  (cond
    [(empty? words) 0]
    [ (>= (string-length (first words))5)
      (+ 1 (count-long-words (rest words)))
      ]
    [else
     (count-long-words (rest words))])) 

;; 5 bolon tuunes olon temdegte ugsiin toog olno

(check-expect (count-long-words empty) 0)
(check-expect (count-long-words (cons "cat" empty)) 0)
(check-expect (count-long-words (cons "apple" empty)) 1)
(check-expect (count-long-words  (cons "apple" (cons "hi" (cons "banana" empty)))) 2)
(check-expect (count-long-words  (cons "hello" (cons "world" (cons "Racket" empty)))) 3)

;;Ex04
;; count-completed : List-of-Boolean -> Number
(define(count-completed booleans)
  (cond
    [(empty? booleans) 0]
    [(first booleans)
      (+ 1 (count-completed (rest booleans)))]          
    [else
     (count-completed (rest booleans))]))

(check-expect (count-completed empty) 0)
(check-expect (count-completed (cons #true empty)) 1)
(check-expect (count-completed (cons #false empty)) 0)
(check-expect (count-completed (cons #true (cons #false empty))) 1)
(check-expect (count-completed  (cons #true (cons #true (cons #false (cons #true empty))))) 3)
(check-expect (count-completed  (cons #false (cons #false (cons #false empty)))) 0)

;;Ex05
;;join-words : List-of-strings -> String
(define (join-words words)
  (cond
    [(empty? words) ""]
    [ (empty? (rest words) ) (first words)]
    [else
     (string-append (first words)
     " "
     (join-words (rest words)))]))

(check-expect (string-append "Hello" "World") "HelloWorld")
;; buh ugiig zaigaar tusgaarlan holboh
(check-expect (join-words empty) "")
(check-expect (join-words (cons "Hello" empty)) "Hello")
(check-expect (join-words (cons "Hello" (cons "world" empty))) "Hello world")
(check-expect (join-words (cons "I" (cons "love" (cons "Racket" empty)))) "I love Racket")


;;Dasgal 4A

;;Ex01.count-items

;; count-items : List-of-numbers -> Number
(define (count-items items)
  (cond
    [(empty? items) 0]
    [else (+ 1
             (count-items (rest items)))]))

;; элементийн тоо
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)

;;Ex02.product

;; product : List-of-numbers -> Number
(define (product l)
  (cond
    [(empty? l) 1]
    [else (* (first l)
             (product (rest l)))]))

(check-expect (product empty) 1)
(check-expect (product (cons 2 (cons 3 (cons 4 empty)))) 24)

;;Ex03.contains-zero
;; contains-zero? : List-of-numbers -> Boolean
(define (contains-zero? l )
  (cond
    [(empty? l) #f]
    [else
     (or (=(first l) 0) (contains-zero? (rest l)))]))

;; list дотор 0 байвал #t. or ашигла.
(check-expect (contains-zero? empty) #f)
(check-expect (contains-zero? (cons 1 (cons 0 empty))) #t)
(check-expect (contains-zero? (cons 1 (cons 2 empty))) #f)

;;Dasgal5A

;;Ex01.count-even

;; count-even : List-of-numbers -> Number
(define (count-even l)
  (cond
    [(empty? l) 0]
    [else
     (if (even? (first l))
         (+ 1 (count-even (rest l)))
         (count-even (rest l)))]))

;; тэгш тоонуудын тоо
(check-expect (count-even empty) 0)
(check-expect (count-even (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 3)
(check-expect (count-even (cons 1 (cons 3 empty))) 0)

;;Ex02.count-negative

;; count-negative : List-of-numbers -> Number
(define (count-negative l)
  (cond
    [(empty? l) 0]
    [else
     (if (negative? (first l))
         (+ 1 (count-negative (rest l)))
         (count-negative (rest l)))]))

;; сөрөг тоонуудын тоо (0 сөрөг биш)
(check-expect (count-negative (cons -1 (cons 0 (cons -3 empty)))) 2)

