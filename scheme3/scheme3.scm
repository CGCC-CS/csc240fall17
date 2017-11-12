#lang scheme

(define crazylist '(hello world (1 2 3 4) "csc" "240" (x y z w)))

(define len
  (lambda (lst)
    (if (or (not (list? lst)) (null? lst))
        0
        (+ 1 (len (cdr lst))))))

(len crazylist)

; Count all elements in a list and sublists
(define element-count
  (lambda (lst)
    (cond
     ((null? lst) 0)
     ((not (pair? lst)) 1)
     (else (+ (element-count (car lst)) (element-count (cdr lst)))))))
(element-count crazylist)
(element-count '(1 . 2))
(element-count 'hello)

(define lst0 '(5 6 7 8))

(newline)
"Reduce"
(define red
  (lambda (operation base-case lst)
    (if (null? lst)
        base-case
        (operation (car lst) (red operation base-case (cdr lst))))))

(define sum-all
  (lambda (lst)
    (red + 0 lst0)))

(define mult-all
  (lambda (lst)
    (red * 1 lst0)))

(sum-all lst0)
(mult-all lst0)

; square-list
(red (lambda (x y) (cons (* x x) y))  '() lst0)
;length
(red (lambda (x y) (+ 1 y)) 0 lst0)
;get-odds
(red (lambda (x y) (if (= 0 (remainder x 2)) y (cons x y))) '() lst0)
;reverse
(red (lambda (x y) (append y (list x))) '() lst0)

(define lst '(1 2 3 4 5 6 7 8 9 10 11 12 13))
(define lstn '(0 -1 2 -3 4 -5 6 -7 8 -9 10 -11 12 -13))
(define badlst (list 1 'a + 10 'hello lst '(1 2 3) '(a . b) red 8 6 -3))
(newline)
"Higher order functions - apply"
(apply + lst)
(apply + lstn)
(apply * lst)
(apply * lstn)

(newline)
"Higher order functions - map"
(map (lambda (x) (* x x)) lst)
(map (lambda (x) (* x x)) lstn)
(map (lambda (x) (if (>= x 0) x (* -1 x))) lstn)
(map (lambda (x) (if (>= x 0) #t #f)) lstn)
(map string? '(1 "TWO" 'three 4 "FIVE" 'six))

(newline)
"Higher order functions - filter"
(filter (lambda (x) (>= x 0)) lstn)
(filter string? '(1 "TWO" 'three 4 "FIVE" 'six))
(filter (lambda (x) (not (string? x))) '(1 "TWO" 'three 4 "FIVE" 'six))
(filter number? badlst)
(apply + (map (lambda (x) (* x x)) (filter number? badlst)))

; numbers in badlst which <8 when incremented
badlst
(filter (lambda (x) (< x 8))
        (map (lambda (x) (+ x 1))
             (filter number? badlst)))
; improvement
(filter (lambda (x) (< (+ x 1) 8))
        (filter number? badlst))

"define a polynomial"
(define quad
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))
(define f1 (quad 1 1 1))  ; f(x) = x^2 + x + 1
(define f2 (quad 1 2 3))  ; f(x) = x^2 + 2x + 3
(define f3 (quad 2 4 2))  ; f(x) = 2x^2 + 4x + 2
(define f4 (quad 1 (/ 1 2) (/ 1 4))) ; f(x) = x^2 + 1/2 x + 1/4
(f1 2)
(f2 2)
(f3 2)
(f4 2)

(newline)
"Towers of Hanoi"
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
(hanoi 3 'red 'yellow 'green)

(newline)
"Let structures (scope)"
(define a 100)
a
(let
    ((a 4)
     (b 3))
  (+ a b))

; Be careful of your scope!
(let
    ((a 4)
     (b (+ a 1)))  ; a here comes from the outer scope
  (+ a b))

(let
    ((a 4))
  (let
      ((b (+ a 1)))  ; a here comes from the inner scope
    (+ a b)))

(let
    ((x 9))
  (let
      ((x 3)
       (y (* 5 x)))
    (+ x y)))

(define let-test
  (lambda (x)
    (let
        ((a (* 2 x))
         (b (+ x 1))
         (c 10))
      (+ x a b c))))
(let-test 10)

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

(newline)
"lambda->let, let->lambda"
(let 
    ((a 4)
     (b 5))
  (+ a b))
((lambda (a b) (+ a b)) 4 5)


((lambda (x y) (+ (* x x) (* y y))) 3 4)
(let 
    ((x 3)
     (y 4))
  (+ (* x x) (* y y)))

(newline)
"External code"
; note - usually this should be at the top of the file!
(require "scheme3inc.scm")
(fib-tail 10)
;(fib 10)

(newline)
; Advanced topics - not required for project or final
(define hello
  (case-lambda
    (() "Hello World")
    ((name) (string-append "Hello " name))))
(hello)
(hello "John")

(define multiple-of-2-and-5
  (lambda (n)
    (match (list (remainder n 2) (remainder n 5))
      ((list 0 0) #t)         ; both remainders are 0
      ((list _ 0) 'almost)    ; divisible by 5, not 2
      (_ #f))))
(multiple-of-2-and-5 20)
(multiple-of-2-and-5 15)
(multiple-of-2-and-5 17)
(map multiple-of-2-and-5 lst)