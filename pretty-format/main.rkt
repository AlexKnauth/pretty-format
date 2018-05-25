#lang racket

(provide pretty-fprintf
         pretty-printf
         pretty-eprintf
         pretty-format)

;; This provides the pretty-format that formats values based on a format string,
;; like `format`.

;; pretty-fprintf is like fprintf
;; pretty-printf is like printf
;; pretty-eprintf is like eprintf
;; pretty-format is like format

(require (rename-in racket/pretty [pretty-format pretty-string]))
(module+ test
  (require rackunit))

(struct formatted (fmt vs)
  #:methods gen:custom-write
  [(define (write-proc this out mode)
     (apply fprintf out (formatted-fmt this) (formatted-vs this)))])

(define (pretty-print/no-newline v out)
  (define old-line-hook (pretty-print-print-line))
  (parameterize ([pretty-print-print-line
                  (λ (line out prev-len dest-col)
                    (if line
                        (old-line-hook line out prev-len dest-col)
                        0))])
    (pretty-print v out)))

(define (pretty-fprintf out fmt . vs)
  (pretty-print/no-newline (formatted fmt vs) out))

(define (pretty-printf fmt . vs)
  (pretty-print/no-newline (formatted fmt vs) (current-output-port)))

(define (pretty-eprintf fmt . vs)
  (pretty-print/no-newline (formatted fmt vs) (current-error-port)))

(define (pretty-format fmt . vs)
  (pretty-string (formatted fmt vs)))

(module+ test
  (test-case "pretty-format"
    (check-equal? (parameterize ([pretty-print-columns 70])
                    (pretty-format
                     "~v: ~a"
                     "and the stuff is indented"
                     '(define (f n)
                        (for/list ([i (in-range n)] #:when (odd? i))
                          (* 2 i)))))
                  #<<"""
"and the stuff is indented": (define (f n)
                               (for/list
                                ((i (in-range n)) #:when (odd? i))
                                (* 2 i)))
"""
                  ))

  (test-case "pretty-fprintf"
    (define out (open-output-string))
    (parameterize ([pretty-print-columns 56])
      (pretty-fprintf out
                      "~a = ~v"
                      'x
                      '(define (f n)
                         (for/list ([i (in-range n)] #:when (odd? i))
                           (* 2 i)))))
    (check-equal? (get-output-string out)
                  #<<"""
x = '(define (f n)
       (for/list
        ((i (in-range n)) #:when (odd? i))
        (* 2 i)))
"""
                  )))
