;;; Compiled snippets and support files for `c++-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c++-mode
                     '(("beginend" "${1:v}.begin(), $1.end" "v.begin(), v.end()" nil nil nil nil nil nil)
                       ("class" "class ${1:Name} {\npublic:\n    ${1:$(yas/substr text \"[^: ]*\")}($2);\n    virtual ~${1:$(yas/substr text \"[^: ]*\")}();\n};\n" "class ... { ... }" nil nil nil nil nil nil)
                       ("fopen" "FILE *${fp} = fopen (${1:\"file\"}, \"${2:r}\");\n" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
                       ("ns" "namespace " "namespace ..." nil nil nil nil nil nil)
                       ("open" "open (${1:pathname}, ${2:O_RDWR}, ${3:755});\n" "open" nil nil nil nil nil nil)
                       ("printf" "printf ( \"${1:%s}\\\\n\"${1:$(if (string-match \"%\" text) \",\" \"\\);\")\n}$2${1:$(if (string-match \"%\" text) \"\\);\" \"\")}" "printf " nil nil nil nil nil nil)
                       ("template" "template <typename ${T}>" "template <typename ...>" nil nil nil nil nil nil)
                       ("using" "using namespace ${std};\n$0" "using namespace ... " nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Mar  3 05:11:58 2013
