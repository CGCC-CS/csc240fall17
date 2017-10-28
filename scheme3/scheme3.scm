#lang scheme
(define element-count
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((not (pair? lst)) 1)
      (else (+ (element-count (car lst)) (element-count (cdr lst)))))))
  
(element-count '(1 2 3 4))
(element-count '(x y z w))
(element-count '(hello world (1 2 3 4) "csc" "220" (x y z w)))

(define red
  (lambda (operation base-case lst)
    (if (null? lst)
        base-case
        (operation (car lst) (red operation base-case (cdr lst))))))

(define sum-all
  (lambda (lst)
    (red + 0 lst)))
(define mult-all
  (lambda (lst)
    (red * 1 lst)))
(sum-all '(5 6 7 8))
(mult-all '(5 6 7 8))
(red (lambda (x y) (cons (* x x) y)) '() '(5 6 7 8))  ;square-list
(red (lambda (x y) (+ 1 y)) 0 '(5 6 7 8))  ; length
(red + 0 '(5 6 7 8))  ; sumlist

(newline)"Higher order functions - apply"
(define lst '(1 2 3 4 5 6 7 8 9 10 11 12 13))
(define lstn '(0 -1 2 -3 4 -5 6 -7 8 -9 10 -11 12 -13))
(define badlst (list 1 'a + 10 'hello lst '(1 2 3) '(a . b) red  8 6 -3))
(apply + lst)
(apply + lstn)
(apply * lst)
(apply * lstn)

(newline)"Higher order functions - map"
(map (lambda (x) (+ 1 x)) lst)
(map (lambda (x) (+ 1 x)) lstn)
(map (lambda (x) (if (string? x) 0 x)) '(1 "TWO" 3 "FOUR" "FIVE" 6))
(map (lambda (x y) (cons y (* x x))) lstn lstn)

(newline)"Higher order functions - filter)"
(filter (lambda (x) (>= x 0)) lstn)
(filter number? badlst)
(apply + (map (lambda (x) (* x x)) (filter number? badlst)))

(newline)"Functions are first-class objects - so you can return them!"

(define quad
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))
(define f1 (quad 1 1 1))  ; f(x) = x^2 + x + 1
(define f2 (quad 1 2 3))  ; f(x) = x^2 + 2x + 3
(define f3 (quad 2 4 2))  ; f(x) = 2x^2 + 4x + 2
(define f4 (quad 1 (/ 1 2) (/ 1 4)))
(f1 1)
(f1 2)
(quad 2 3 4)
(f4 1)

(newline)"Advanced examples"
; numbers in badlst which are < 8 when incremented
;first attempt
(filter (lambda (x) (< x 8))
        (map (lambda (x) (+ x 1))
             (filter number? badlst)))
(filter (lambda (x) (< (+ x 1) 8))
        (filter number? badlst))
; sum the numbers in badlst which are < 8 when incremented
(apply + 
       (filter (lambda (x) (< (+ x 1) 8))
               (filter number? badlst)))

(newline)"Towers of Hanoi"
(define hanoi    ; uses side-effects
  (lambda (n source center destination)
    (if (= n 1)  ; stopping condition
      (begin  
         (display "move top disk from ")
         (display source)
         (display " to ")
         (display destination)
         (newline)
         )
      (begin
          (hanoi (- n 1) source destination center)
          (hanoi 1 source center destination)
          (hanoi (- n 1) center source destination)
          )
      )))
(hanoi 4 'red 'yellow 'green)

(newline)"let structures (scope)"
(define let-test
  (lambda (x)
    (let 
        ((a (* 2 x))
         (b (+ x 1))
         (c 10))
      (+ x a b c))))
(let-test 5)

; Use let to reduce # of calls to (min1 (cdr lst))
(define min1
  (lambda (lst)
    (if (= (length lst) 1)
        (car lst)
        (let
            ((cdrmin (min1 (cdr lst))))
          (if (< (car lst) cdrmin)
              (car lst)
              cdrmin)))))

; Use let to reduce # of calls to (car lst) & (min1 (cdr lst))
;  Note we can't use a single let for both!
(define min2
  (lambda (lst)
    (let 
        ((c (car lst)))
      (if (= (length lst) 1)
          c
          (let
              ((cdrmin (min2 (cdr lst))))
            (if (< c cdrmin)
                c
                cdrmin))))))
(min1 lst)
(min1 lstn)
(min2 lst)
(min2 lstn)

(define a 1)
(let ((a 4)
      (b 6))
  (+ a b))

((lambda (a b) (+ a b)) 4 6)

; Be careful of your scope!
(let
    ((a 4)
     (b (+ a 2)))  ; a comes from outer scope
   (+ a b))

(let
    ((a 4))
  (let
      ((b (+ a 2))) ; a comes from inner scope
    (+ a b)))

(newline)"External code"
;note - usually this should be at the TOP of the file
(require "scheme3inc.scm")
(fib-tail 10)
;(fib 10)   ; Not provided in scheme3inc.scm

; Really advanced stuff - not needed for project
(define hello
  (case-lambda  ; allow
    (() "Hello World")
    ((name) (string-append "Hello " name))))
(hello)
(hello "John")

(define multiple-of-2-and-5
  (lambda (n)
    (match (list (remainder n 2) (remainder n 5))
      ((list 0 0) #t)
      ((list _ 0) 'almost)  ; if remainder n 5 = 0
      (_ #f))))
(multiple-of-2-and-5 20)
(multiple-of-2-and-5 15)
(multiple-of-2-and-5 17)

(map multiple-of-2-and-5 lst)
(map multiple-of-2-and-5 lstn)

