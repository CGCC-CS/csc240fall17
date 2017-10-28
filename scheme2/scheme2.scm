#lang scheme
(define a 1)
(define b a)
(define c (+ a b))
a
b
c

(- 3)
(define opposite
  (lambda (x)
    (- x)))
(opposite 3)
(opposite -10)
(opposite (opposite 12))

null
(null? 3)
(null? 0)
(null? '())

(newline)
"Tail recursive Fibonacci implementation"
(define fib-tail
  (lambda (x)
    (fib-tail-acc x 0 1)))
(define fib-tail-acc
  (lambda (x f2 f1)
    (if (<= x 1)
        f1
        (fib-tail-acc (- x 1) f1 (+ f1 f2)))))
(fib-tail 1)
(fib-tail 3)
(fib-tail 10)

(newline)
(define isit-lst0 (+ 2 3))
(define isit-lst1 '(+ 2 3))
(define isit-lst2 (list + 2 3))
isit-lst0
isit-lst1
isit-lst2
((car isit-lst2) 8 9 10)
;lst2 -> (list + 2 3)
;      +                   2                       3
((car isit-lst2) (car (cdr isit-lst2)) (car (cdr (cdr isit-lst2))))
;      '+                   '2                       '3
;((car isit-lst1) (car (cdr isit-lst1)) (car (cdr (cdr isit-lst1))))

(define exlst0 (list 2 3))
(define exlst1 (list list 2 3))
(define exlst2 (list list 2 3 (list + 2 3) (+ 2 3)))
(define exlst3 '(list 2 3 (list + 2 3) (+ 2 3)))
exlst0
exlst1
exlst2
exlst3

(newline)"Conditional"
(define what-is-it?
  (lambda (x)
    (cond
      ((not (number? x)) "Not a number")
      ((< x 0) "Negative")
      ((= x 0) "Zero")
      (else "Positive"))))
(what-is-it? 'Number)
(what-is-it? -5)
(what-is-it? 0)
(what-is-it? 5)

; First true statement matches
(define return-something
  (lambda(x)
    (cond
      ((> x 10) 10)
      ((= (remainder x 2) 0) 2)
      ((> x 5) 5)
      (else 0))))
(return-something 26)

(newline)"Math"
(/ 30 7)
(/ 30 7.0)
(quotient 30 7)
(remainder 30 7)
(expt 2 10)
(sqrt 4)
(sqrt -3)

(newline)"Boolean"
(< 4 10)
(> 4 10)
(<= 4 10)
(>= 4 10)
(not #f)
(or #t #f)
(and #t #f)
(xor #t #f)
(or (integer? 6) (symbol? 'six))
(and (integer? 6) (symbol? 6))

(newline) "Strings vs Symbols"
(define str1 "Hello")
(define sym1 'World)
str1 
sym1
(string? str1)
(string? sym1)
(symbol? str1)
(symbol? sym1)
(string->symbol str1)
(symbol->string sym1)

(newline)"Procedures are first-class objects"
(define do-to-10-20
  (lambda (x)
    (x 10 20)))
(do-to-10-20 +)
(do-to-10-20 *)
(do-to-10-20 (lambda (x y) (sqrt (+ (* x x) (* y y)))))
;(do-to-10-20 fib-tail)
(do-to-10-20 (lambda (x y) (fib-tail x)))
(do-to-10-20 list)

(newline)"Lists"
(car '(a))
(cdr '(a))
(define lst '(1 2 3 4))
(car lst)
(cdr lst)
(cons 0 lst)
(car (cons 0 lst))
(cdr (cons 0 lst))
(car (cdr lst))
(cons '(a b c) lst)
(cons lst lst)
(append '(a b c) lst)
;(append 0 lst)
(append lst lst)
"Complex list"
(define lstx '((1 2) 3 (4 (5 6)) (7 8 9)))
(car lstx)
(cdr lstx)
(car (cdr lstx))
(car (cdr (cdr lstx)))
(car (car (cdr (cdr lstx))))
(cdr (car (cdr (cdr lstx))))
(car (cdr (car (cdr (cdr lstx)))))
(cdr (cdr (car (cdr (cdr lstx)))))
(car (car (cdr (car (cdr (cdr lstx))))))
(cdr (car (cdr (car (cdr (cdr lstx))))))
(car (cdr (car (cdr (car (cdr (cdr lstx)))))))
(cdr (cdr (car (cdr (car (cdr (cdr lstx)))))))
(cdr (cdr (cdr lstx)))
(car (cdr (cdr (cdr lstx))))
(cdr (cdr (cdr (cdr lstx))))
(car (car (cdr (cdr (cdr lstx)))))
(cdr (car (cdr (cdr (cdr lstx)))))
(car (cdr (car (cdr (cdr (cdr lstx))))))
(cdr (cdr (car (cdr (cdr (cdr lstx))))))
(car (cdr (cdr (car (cdr (cdr (cdr lstx)))))))
(define go-deep
  (lambda (lst)
    (car (cdr (cdr (car (cdr (cdr (cdr lstx)))))))))
(go-deep lst)

(newline)"List functions"
lst
(define non-empty-list?
  (lambda (lst)
    (if (or (not (list? lst)) (empty? lst))
        #f
        #t)))
(non-empty-list? 'list)
(non-empty-list? '())
(non-empty-list? lst)

(define sumlist
  (lambda (lst)
    (if (or (not (list? lst)) (empty? lst))
         0
         (+ (car lst) (sumlist (cdr lst))))))
(sumlist lst)

(define do-nothing
  (lambda (lst)
    (if (not (non-empty-list? lst))
        lst
        (cons (car lst) (do-nothing (cdr lst))))))
(do-nothing lst)

; double all items in a list
(define double (lambda(x) (* x 2)))
(define doublelist
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (double (car lst)) (doublelist (cdr lst))))))
(doublelist lst)
  
(define sum-doublelist
  (lambda (lst)
    (if (null? lst)
        0
        (+ (double (car lst)) (sum-doublelist (cdr lst))))))
(sum-doublelist lst)

(define better-sum-doublelist
  (lambda (lst)
    (if (not (non-empty-list? lst))
        lst
        (sumlist (doublelist lst)))))
(better-sum-doublelist lst)
 
(define allnums
  (lambda (lst)
    (if (not (non-empty-list? lst))
        lst
        (if (not (number? (car lst)))
            (allnums (cdr lst))
            (cons (car lst) (allnums (cdr lst)))))))
(allnums 'numbers)
(allnums '(1 2 3 4))
(allnums '(a b c 1 2 3 'Hello '(4 5 6)))
(sum-doublelist (allnums '(a b c 1 2 3 'Hello '(4 5 6))))

(newline)"Pair"
(cons 1 2)
(cons 1 '(2))
(pair? 'pair)
(pair? '(1 . 2))
(pair? '(1 2))
(define pair '(a . b))    ; [a . b]
(define pairlist '(a b))  ; [a . [b . ()]]
(car pair)
(cdr pair)
(car pairlist)
(cdr pairlist)
(cons 'a 'b)
(cons 'b '())
(cons 'a (cons 'b '()))
