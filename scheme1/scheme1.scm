#lang scheme
; Comments start with a semi colon
; You can ignore an entire S-expression using #;
; So the definition below will be ignored.
#;(define ignore
  (lambda (x)
    (* x 0)))

(newline)  ; Writes a new line to output

"Note how the following are evaluated"
"String"   ; string
'Symbol    ; symbol
+          ; primitive

(newline)
"Numbers:"
3          ;integer
#b101      ;binary
;x101      ;hexidecimal
;o101      ;octal
12.34      ;real
1/2        ;fraction

; Math
(* 10 10)
(+ 1 2)
(* 3 4)
(+ 1 2 3 4 5 6 7 8 9 10)
(* 1 2 3 4 5 6 7 8 9 10)
(* (/ (* 7 (- 8 2)) (/ (* 6 3) (* 2 2 3 (/ 1 2)))) 2)

(newline)
"Division"
(/ 30 7)
(/ 30 7.0)
(remainder 20 8)
(quotient 20 8)
(quotient 20 8.0)
(expt 2 5)
'(/ 10 5)

(newline)
"Define x & y"
(define x 10)
(define y 20)
(define (z) 30)
x
y
z
(z)

; y = change(x)
; calculate(y)
; calculate(change(x))

(newline)
"Define a procedure"
(* 3 x)
(lambda (x) (* 3 x))  ; unnamed procedure
((lambda (x) (* 3 x)) 9)
((lambda (x) (* 3 x)) y)
(define trip          ; associates a name to a Scheme form
  (lambda (x)
    (* 3 x)))
trip
(trip 9)
(trip y)
(+ x y (trip 5))

; function as a parameter
(define increment
  (lambda (x)
    (+ x 1)))
(define do
  (lambda (this toThat)
    (this toThat)))
(do increment 8)
(do (lambda (x) (* x 2)) 10)

(newline)
"Recursion"
(define fact
  (lambda (n)
    (if (<= n 1)
        1
        (* n (fact (- n 1))))))
(fact 10)
(fact 30)
(fact 100)
;(fact 1000)
;(fact 10000)

"tail-recursion"
(define fact-tail
  (lambda (n)
    (fact-tail-acc n 1)))
(define fact-tail-acc 
  (lambda (n acc)
    (if (<= n 1)
        acc
        (fact-tail-acc (- n 1) (* n acc)))))
(fact-tail 100)

(newline)
"lists"
(list x y z)
(list 'x 'y 'z)
'(x y z)
(quote (x y z))
(quote z)
(define lst '(a b c))
(define lst2 (list 'a 2 "hello" 'world / #f + fact-tail 18 'a #\H))
(define oplist (list + / -))
lst
lst2
oplist
lst
(car lst)
(cdr lst)
(car (cdr lst))
(cdr (cdr lst))
(car (cdr (cdr lst)))
(cdr (cdr (cdr lst)))
(cadr lst)
;(car '())
(car '((4 5 6)))
(cdr (car '((4 5 6))))
(define lst3 '((1 2) (3 4 (5 6)) (7 8)))
lst3
(cdr '((1 2) (3 4 (5 6)) (7 8)))
(car (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8))))))  ; 4
(cdr (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8))))))  ; ((5 6))
(car (cdr (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8))))))) ; (5 6)
(car (car (cdr (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8)))))))) ; 5
(car '(1))
(cdr '(1))

(newline)
"Checking equality"
(= 32 32)
(eq? 32 32)
(equal? 32 32)
(equal? 32 34)
(newline)
(eq? 'X 'X)
(eq? '(1 2 3) '(1 2 3))
(equal? 'X 'X)
(equal? '(1 2 3) '(1 2 3))
(= 32 (* 4 8))
(= '32 (* 4 8))

(newline)
"Symbols & Strings"
(symbol? "hello")
(string? "hello")
(symbol? 'hello)
(string? 'hello)
(symbol->string 'hello)
(string->symbol "hello")

(newline)
"Characters"
(char? 'a)
(char? "a")
(char? #\a)
(char-upcase #\a)
(char-upcase #\A)
(char->integer #\A)
(char->integer #\a)
(integer->char 65)

(newline)
"Cool example"
oplist
((car oplist) 1 2 3)
((car (cdr oplist)) 24 7)
lst

lst2
(cddddr lst2)
(cadddr lst2)
(caddr (cddddr lst2))
((caddr (cddddr lst2)) 10)