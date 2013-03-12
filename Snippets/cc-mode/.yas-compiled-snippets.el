;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("do" "do {\n    $0\n} while (${1:condition});\n" "do{ ... }while (...)" nil nil nil nil nil nil)
                       ("enum" "enum {\n    $0\n} ${1:name};\n" "enum{...} name;" nil nil nil nil nil nil)
                       ("for" "for (${1:i = 0}; ${2:i < N}; ${3:i++}) {\n    $0\n}\n" "for" nil nil nil nil nil nil)
                       ("if" "if (${1:condition})\n{\n    $0\n}\n" "if (...) { ... }" nil nil nil nil nil nil)
                       ("inc" "#include \"$1\"\n" "#include \"...\"" nil nil nil nil nil nil)
                       ("inc" "#include <$1>\n" "#include <...>" nil nil nil nil nil nil)
                       ("main" "int main (int argc, char *argv[])\n{\n    $0\n    return 0;\n}\n" "int main(argc, argv) { ... }" nil nil nil nil nil nil)
                       ("once" "#ifndef ${1:_`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H_}\n#define $1\n\n$0\n\n#endif /* $1 */\n" "#ifndef XXX; #define XXX; #endif" nil nil nil nil nil nil)
                       ("struct.1" "struct ${1:name} {\n    $0\n};\n" "struct ... { ... }" nil nil nil nil nil nil)
                       ("while" "while (${1:condition})\n{\n    $0\n}" "while(...){...}" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Mar 12 08:32:10 2013
