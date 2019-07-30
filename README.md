# pretty-format

Pretty-printing with format strings

[_Documentation_](https://docs.racket-lang.org/pretty-format/index.html)

```racket
(require pretty-format)
```
This module provides the pretty-printing versions of functions that
format values based on a format string, like [`format`][format] or
[`printf`][printf].

 * [`pretty-fprintf`][pretty-fprintf] is like [`fprintf`][fprintf]

 * [`pretty-printf`][pretty-printf] is like [`printf`][printf]

 * [`pretty-eprintf`][pretty-eprintf] is like [`eprintf`][eprintf]

 * [`pretty-format`][pretty-format] is like [`format`][format]
 
  [pretty-fprintf]: https://docs.racket-lang.org/pretty-format/index.html#%28def._%28%28lib._pretty-format%2Fmain..rkt%29._pretty-fprintf%29%29
  [pretty-printf]: https://docs.racket-lang.org/pretty-format/index.html#%28def._%28%28lib._pretty-format%2Fmain..rkt%29._pretty-printf%29%29
  [pretty-eprintf]: https://docs.racket-lang.org/pretty-format/index.html#%28def._%28%28lib._pretty-format%2Fmain..rkt%29._pretty-eprintf%29%29
  [pretty-format]: https://docs.racket-lang.org/pretty-format/index.html#%28def._%28%28lib._pretty-format%2Fmain..rkt%29._pretty-format%29%29
  [fprintf]: https://docs.racket-lang.org/reference/Writing.html#%28def._%28%28quote._~23~25kernel%29._fprintf%29%29
  [printf]: https://docs.racket-lang.org/reference/Writing.html#%28def._%28%28quote._~23~25kernel%29._printf%29%29
  [eprintf]: https://docs.racket-lang.org/reference/Writing.html#%28def._%28%28quote._~23~25kernel%29._eprintf%29%29
  [format]: https://docs.racket-lang.org/reference/Writing.html#%28def._%28%28quote._~23~25kernel%29._format%29%29
