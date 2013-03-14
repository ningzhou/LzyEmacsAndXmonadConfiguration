Config { font = "xft:Monospace:size=8:antialias=true"
--       , bgColor = "#002b36"
       , bgColor = "#000000"
       , fgColor = "#657b83"
       , position = TopW L 93
       , lowerOnStart = True
       , commands = [ Run Network "wlan0" ["-L","0","-H","1024","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run StdinReader
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
		    , Run Battery ["-L","25","-H","75","--high","green","--normal","yellow", "--low", "red"] 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{<fc=deeppink>%cpu%</fc>  <fc=yellow>%memory%</fc>  <fc=skyblue>%wlan0%</fc>  <fc=orange>%battery%</fc> <fc=green>Time: %date%</fc>  "
       }
