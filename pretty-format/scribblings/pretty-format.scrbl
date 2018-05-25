#lang scribble/manual

@(require scribble/eval
          (for-label racket/base
                     pretty-format))

@title{Pretty-printing with format strings}

@defmodule[pretty-format]{

This module provides the pretty-printing versions of functions that
format values based on a format string, like @racket[format] or
@racket[printf].

@itemlist[
  @item{@racket[pretty-fprintf] is like @racket[fprintf]}
  @item{@racket[pretty-printf] is like @racket[printf]}
  @item{@racket[pretty-eprintf] is like @racket[eprintf]}
  @item{@racket[pretty-format] is like @racket[format]}
]
}

@defproc[(pretty-fprintf [out output-port?] [fmt string?] [v any/c] ...) void?]{
Prints the format string @racket[fmt] to @racket[out],
replacing each format-placeholder (such as @litchar{~v},
@litchar{~s}, or @litchar{~a}) with a pretty-printing of the
corresponding @racket[v].

@examples[
  (require pretty-format)
  (pretty-fprintf (current-output-port)
                  "~a: ~v"
                  "and the values are indented"
                  '(define (f n)
                     (for/list ([i (in-range n)] #:when (odd? i))
                       (* 2 i))))
]}

@defproc[(pretty-printf [fmt string?] [v any/c] ...) void?]{
Prints the format string @racket[fmt] to the @racket[(current-output-port)],
replacing each format-placeholder (such as @litchar{~v} or
@litchar{~a}) with a pretty-printing of the corresponding
@racket[v].

@examples[
  (require racket/pretty
           pretty-format)
  (pretty-print-current-style-table
   (pretty-print-extend-style-table (pretty-print-current-style-table)
                                    '(∀ Refine for/and for/and*)
                                    '(lambda lambda lambda lambda)))
  (pretty-printf "val ~a : ~s"
                 'rem-dups
                 '(∀ (X)
                     (-> ([xs : (Listof X)])
                         ([f : (-> X X Bool)])
                         (Refine
                          [ys : (Listof X)]
                          (subset? ys xs)
                          (for/and ([x (in-list xs)])
                            (member x ys f))
                          (for*/and ([i (in-range (length ys))]
                                     [j (in-range i)])
                            (not (f (nth ys i) (nth ys j))))))))
]}

@defproc[(pretty-eprintf [fmt string?] [v any/c] ...) void?]{
Prints the format string @racket[fmt] to the @racket[(current-error-port)],
replacing each format-placeholder (such as @litchar{~v} or
@litchar{~a}) with a pretty-printing of the corresponding
@racket[v].
}

@defproc[(pretty-format [fmt string?] [v any/c] ...) string?]{
Returns the string produced from replacing each
format-placeholder in @racket[fmt] with the pretty-printed
version of the corresponding @racket[v].

@examples[
  (require racket/pretty
           pretty-format)
  (pretty-print-columns 60)
  (define str
    (pretty-format "val ~a : ~v = ~s"
                   'f
                   procedure?
                   '(λ (n)
                      (if (zero? n)
                          1
                          (* n (f (sub1 n)))))))
  (string-length str)
  (displayln str)
]}

