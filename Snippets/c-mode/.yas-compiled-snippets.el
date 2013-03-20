;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
                     '(("fopen" "FILE *${fp} = fopen (${1:\"file\"}, \"${2:r}\");\n" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
                       ("hack" "/* HACKED: ${1:by unia} */\n$0\n" "hack by .." nil nil nil nil nil nil)
                       ("open" "open (${1:pathname}, ${2:O_RDWR}, ${3:755});\n" "open" nil nil nil nil nil nil)
                       ("printf" "printf (\"${1:%s}\\\\n\"${1:$(if (string-match \"%\" text) \",\" \"\\);\")\n}$2${1:$(if (string-match \"%\" text) \"\\);\" \"\")}" "printf " nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Mar 20 13:12:43 2013
