#! /bin/sh
ip=192.168.1.15

mainroku ()
{ case "$input" in

apps)
# will list all installed apps in this format: 12 Netflix
wget -q -O - "http://${ip}:8060/query/apps" | sed -e 's/<app id=\"//g' -e 's#<[^>]*>##g' -e 's/\".*>/ /g';;

go*)
# from the above list, use go plus the number to select channel.
# e.g. "go 12" to go to netflix
wget -q -O - --post-data "" "http://${ip}:8060/launch/${goto#* }"; shift;;

space|sp)
wget -q -O - --post-data "" "http://${ip}:8060/keypress/lit_ "
;;

home|rev|fwd|play|select|left|right|down|up|back|instantreplay|info|backspace|search|enter)
wget -q -O - --post-data "" "http://${ip}:8060/keydown/${input}"
wget -q -O - --post-data "" "http://${ip}:8060/keyup/${input}";;

a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|1|2|3|4|5|6|7|8|9|0)
wget -q -O - --post-data "" "http://${ip}:8060/keypress/lit_${input}";;

## customized
del)
wget -q -O - --post-data "" "http://${ip}:8060/keypress/backspace";;
wake)
wget -q -O - --post-data "" "http://${ip}:8060/keypress/backspace";;
re)
wget -q -O - --post-data "" "http://${ip}:8060/keydown/instantreplay"
wget -q -O - --post-data "" "http://${ip}:8060/keyup/instantreplay";;
sel)
wget -q -O - --post-data "" "http://${ip}:8060/keydown/select"

esac }

if [ "$1" = "live" ]
then
echo "Type your command and hit enter. Type exit to end"
while [ "$input" != "exit" ]
do read input; goto=${input#* }; mainroku
done

elif [ "$1" = "str" ]
then
arg=$(($# - 1))
while [ "$arg" -ne "0" ]
do shift; arg=$(($arg - 1))
goto="$1 $2"
input="$1"
mainroku
sleep .5
done

else input="$1"; goto="$1 $2"; mainroku

fi
