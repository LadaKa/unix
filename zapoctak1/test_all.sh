#!/bin/sh
#$name $mail $localrepo;
test_updated()
{
        for dir in ./ukol*/; do
                dirname=$(basename "$dir")
                echo $dirname
                if [ "$3/$dirname" -nt "./kontroly/$1/$dirname" ]; then
                        for ukol in $dir; do
                                ./runtest.sh $name $dirname $ukol;
                        done;
                        touch "./kontroly/$name/$dirname";
                        errorfile="./tmp/msg_""$1"
                        if [ -e "$errorfile" ]; then
                               # mail -s "Chyby v domacich ulohach" "$2" < "$errorfile";
                               echo "Chyby v domacich ulohach";
                               cat "$errorfile";
                               echo "konec";
                               rm "$errorfile";
                        fi;
                fi;
        done;
}


while IFS=" " read -r name mail repo
do
        localrepo="../studenti/gity/$name";
        if [ ! -d "$localrepo" ]; then
                git clone $repo $localrepo;
        else
                cd "$localrepo"; 
                git pull $repo;
                cd "../../../ukoly";
        fi;
        test_updated $name $mail $localrepo;
done < repositare.txt
