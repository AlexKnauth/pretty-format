#lang typed/racket/base

(require/typed/provide
 pretty-format
 [pretty-printf (-> String Any * Void)]
 [pretty-fprintf (-> Output-Port String Any * Void)]
 [pretty-eprintf (-> String Any * Void)]
 [pretty-format (-> String Any * String)])

;; This provides the pretty-format that formats values based on a format string,
;; like `format`.

;; pretty-fprintf is like fprintf
;; pretty-printf is like printf
;; pretty-eprintf is like eprintf
;; pretty-format is like format

;; Each pretty-_ version has the same type as the non-pretty version.

