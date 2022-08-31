#lang sicp


(/ (+ (* (- 17 14)
         5)
      6)
   7)


;; %5 tax
(+ 1.29 (* 5/100 1.29))

(lambda (x) (+ x (* 5/100 x)))

;; Exercise 1.2
(define f (lambda (x) (* x x)))

(define square f)

(f 7) ; 49

(square 7)

(define g (lambda (x) (+ x 2)))

(g 7)

(define cylinder-volume
  (lambda (radius height)
    (* (* 3.1415927 (square radius))
       height)))

(cylinder-volume 5 4)

;; Exercise 1.4
;; candy syrups should be cooked 1 degree cooler than listed in the recipe
;; for each 500 feet of elevation above sea level

(define mile-to-feet
  (lambda (mile)
    (* mile 5280)))

(define candy-temp
  (lambda (recipe-degree feet)
    (round (+ (/ feet 500) recipe-degree))))

(candy-temp 244 5280)


(define tax-bad
  (lambda (income)
    (if (< income 10000)
        0
        (* 20/100 income))))

;; tracin
;; (tax 30000)
;; (if (< 30000 10000) 0 (* 20/100 30000))
;; (* 20/100 30000)
;; 6000

(define tax
  (lambda (income)
    (if (< income 10000)
        0
        (* 20/100 (- income 10000)))))

(tax 12500); 500

(define turkey-servings
  (lambda (weight) (if (< weight 12) (* 3/4 weight) (* 1/2 weight))))

;; sum bigger 2
(define puzzle1
  (lambda (a b c)
    (+ a (if (> b c)
             b
             c))))

;; abs
(define puzzle2
  (lambda (x)
    ((if (< x 0) - +) 0 x)))


(define factorial
  (lambda (n)
    (if (= n 1)
        1
        (*  (factorial (- n 1)) n))))

(factorial 1)


