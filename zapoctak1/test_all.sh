#!/bin/sh
#$name $mail $localrepo;
test_updated()
{
        echo "up";
        for dir in ./ukol*/; do
                dirname=$(basename "$dir")
                echo $dir;
                if [ "./kontroly/$1/$dirname" -nt "$3/$dirname" ]; then
                        echo "newer";
                        for ukol in $dir*".in"; do
                                jmeno_ukolu=`echo $ukol|sed "s/in$/out/"|sed "s/^.\\///"`;
                                echo "ukol:$jmeno_ukolu"
                                ./runtest.sh $name $dirname $jmeno_ukolu;
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
        echo  "start"
        echo "$name x $mail x $repo"
        localrepo="../studenti/gity/$name";
        if [ ! -d "$localrepo" ]; then
                echo  "if"
                echo "$repo $localrepo";
                git clone $repo $localrepo;
        else
                echo  "else"
                cd "$localrepo";
                git pull $repo;
                cd "../../../ukoly";
                pwd;
        fi;
        test_updated $name $mail $localrepo;
done < repozitare.txt
