;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; grade-bar : Number -> Image
(define (grade-bar img

;; өргөн нь оноо, өндөр 20, өнгө нь grade-color
(check-expect (grade-bar 95) (rectangle 95 20 "solid" "green"))
(check-expect (grade-bar 59) (rectangle 59 20 "solid" "red"))