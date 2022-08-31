#lang racket

(require racket/trace)
;; exc 2.1 Write procedure power (power base exponent)

(define power
  (lambda (base exponent)
    (cond ((= 0 exponent) 1)
          (else (* base (power base (- exponent 1)))))))

(power 8 2)



(define square
  (lambda (n)
    (if (= n 0)
        0
        (+ (square (- n 1))
           (- (+ n n) 1)))))

;; (n - 1)^2 + 2n - 1 = n^2
(trace square)
;(square 3)
;(+ (square 2) (- (+ 3 3) 1)
;(+ (+ (square 1) (- (+ 2 2) 1)) (- (+ 3 3) 1))
;(+ (+ (+ square 0) (- (+ 1 1) 1) (- (+ 2 2) 1)) (- (+ 3 3) 1))
;(+ (+ (+ 0 (- (+ 1 1) 1) (- (+ 2 2) 1)) (- (+ 3 3) 1)))

; 1 + 3 + 5

;; The assumption that the procedure works correctly for smaller arguments
;; is called the induction hypotesis. The reasoning that leads from the induction
;; hypotesis to the conclusion of correct operation is called the induction step

;; Exc 2.2 write a similarly detailed proof of the fac procedure

(define factorial
  (lambda (n)
    (cond ((= n 0) 1)
          ((= n 1) 1)
          (else
           (* n (factorial (- n 1)))))))

(factorial 0)

;; consider evaluating (factorial n) with n > 0
;; this will terminate if the evaluation of (fac (- n 1)) does
;; will have same value as (* n (factorial (- n 1)))
;; because (- n 1) evaluates to n-1 and 0 <= n-1 < n  we can therefore
;; assume by our induction hypotesis that (fac (- n 1)) does terminate,
;; with the value (n-1)! , because (* (n-1)! n) = n!  correcT??


;; problem is if n < 2 (square (- n 2)) => takes negative number that
;; non of the base case includes, possible fix is
(define square-wrong
  (lambda (n)
    (if (= n 0)
        0
        (+ (square (- n 2))
           (- (* 4 n) 4)))))

(square-wrong 2)
;; say (square n ) with n > 0 this will terminate if evaluation of
;; (square (- n 2)) does and will hawe the same value as (+ (square (- n 2)
;;                                                          (- (* 4 n) 4))

;; because n - 2 => 0 <= n - 2 < n

(define square-2
  (lambda (n)
    (if (= n 0)
        0
        (if (even? n)
            (*  (square-2 (/ n 2))
                4)
            (+ (square-2 (- n 1))
               (- (+ n n) 1))))))

;; (square-2 1)

(define quot
  (lambda (n d)
    (if (< n d) 0 (+ 1 (quot (- n d) d)))))

(define quot2
  (lambda (n d)
    (if (< d 0)
        (- (quot2 n (- d)))
        (if (< n 0)
            (- (quot2 (- n) d))
            (if (< n d)
                0
                (+ 1 (quot2 (- n d) d)))))))


(define sum-of-first
  (lambda (n)
    (if (= n 1)
        1
        (+ (sum-of-first (- n 1))
           n))))


