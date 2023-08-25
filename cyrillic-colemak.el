;; cyrillic-colemak input method, based on cyrillic-dvorak
;; license is unlicense, see the end of file
;; https://github.com/defanor/cyrillic-colemak
;; https://gist.github.com/akamch/2669535

(require 'quail)

(quail-define-package
 "cyrillic-colemak" "Cyrillic" "CC" nil
 "ЙЦУКЕН keyboard layout widely used in Russia (ISO 8859-5 encoding)
  in assuming that your default keyboard layout is Colemak"
 nil t t t t nil nil nil nil nil t)

(quail-define-rules
 ("1" ?1)
 ("2" ?2)
 ("3" ?3)
 ("4" ?4)
 ("5" ?5)
 ("6" ?6)
 ("7" ?7)
 ("8" ?8)
 ("9" ?9)
 ("0" ?0)
 ("[" ?х)
 ("]" ?ъ)
 ("`" ?ё)
 ("'" ?э)
 ("," ?б)
 ("." ?ю)
 ("p" ?к)
 ("y" ?щ)
 ("f" ?у)
 ("g" ?е)
 ("c" ?с)
 ("r" ?ы)
 ("l" ?г)
 ("/" ?.)
 ("=" ?=)
 ("a" ?ф)
 ("o" ?ж)
 ("e" ?л)
 ("u" ?ш)
 ("i" ?д)
 ("d" ?п)
 ("h" ?р)
 ("t" ?а)
 ("n" ?о)
 ("s" ?в)
 ("-" ?-)
 ("\\" ?\\)
 (";" ?з)
 ("q" ?й)
 ("j" ?н)
 ("k" ?т)
 ("x" ?ч)
 ("b" ?и)
 ("m" ?ь)
 ("w" ?ц)
 ("v" ?м)
 ("z" ?я)
 
 ("!" ?!)
 ("@" ?\")
 ("#" ?№)
 ("$" ?\;)
 ("%" ?%)
 ("^" ?:)
 ("&" ??)
 ("*" ?*)
 ("(" ?\()
 (")" ?\))
 ("{" ?Х)
 ("}" ?Ъ)
 ("~" ?Ё)
 ("\"" ?Э)
 ("<" ?Б)
 (">" ?Ю)
 ("P" ?К)
 ("Y" ?Щ)
 ("F" ?У)
 ("G" ?Е)
 ("C" ?С)
 ("R" ?Ы)
 ("L" ?Г)
 ("?" ?,)
 ("+" ?+)
 ("A" ?Ф)
 ("O" ?Ж)
 ("E" ?Л)
 ("U" ?Ш)
 ("I" ?Д)
 ("D" ?П)
 ("H" ?Р)
 ("T" ?А)
 ("N" ?О)
 ("S" ?В)
 ("_" ?_)
 ("|" ?/)
 (":" ?З)
 ("Q" ?Й)
 ("J" ?Н)
 ("K" ?Т)
 ("X" ?Ч)
 ("B" ?И)
 ("M" ?Ь)
 ("W" ?Ц)
 ("V" ?М)
 ("Z" ?Я))

;; This is free and unencumbered software released into the public domain.

;; Anyone is free to copy, modify, publish, use, compile, sell, or
;; distribute this software, either in source code form or as a compiled
;; binary, for any purpose, commercial or non-commercial, and by any
;; means.

;; In jurisdictions that recognize copyright laws, the author or authors
;; of this software dedicate any and all copyright interest in the
;; software to the public domain. We make this dedication for the benefit
;; of the public at large and to the detriment of our heirs and
;; successors. We intend this dedication to be an overt act of
;; relinquishment in perpetuity of all present and future rights to this
;; software under copyright law.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
;; OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
;; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;; OTHER DEALINGS IN THE SOFTWARE.

;; For more information, please refer to <http://unlicense.org>
