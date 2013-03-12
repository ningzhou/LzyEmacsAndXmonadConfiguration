;;; Compiled snippets and support files for `c++-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c++-mode
                     '(("beginend" "${1:v}.begin(), $1.end\n" "v.begin(), v.end()" nil nil nil nil nil nil)
                       ("class" "class ${1:Name} {\npublic:\n    ${1:$(yas/substr text \"[^: ]*\")}($2);\n    virtual ~${1:$(yas/substr text \"[^: ]*\")}();\n};\n" "class ... { ... }" nil nil nil nil nil nil)
                       ("fopen" "FILE *${fp} = fopen (${1:\"file\"}, \"${2:r}\");\n" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
                       ("hack" "# -*- mode: snippet -*-\n#name: hack by\n#key: hack\n#--\n// HACKED: ${1:by unia}\n$0\n" "hack" nil nil nil nil nil nil)
                       ("ns" "namespace \n" "namespace ..." nil nil nil nil nil nil)
                       ("open" "open (${1:pathname}, ${2:O_RDWR}, ${3:755});\n" "open" nil nil nil nil nil nil)
                       ("printf" "printf ( \"${1:%s}\\\\n\"${1:$(if (string-match \"%\" text) \",\" \"\\);\")\n}$2${1:$(if (string-match \"%\" text) \"\\);\" \"\")}" "printf " nil nil nil nil nil nil)
                       ("template" "template <typename ${T}>\n" "template <typename ...>" nil nil nil nil nil nil)
                       ("using" "using namespace ${std};\n$0\n" "using namespace ... " nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Mar 12 08:32:10 2013
