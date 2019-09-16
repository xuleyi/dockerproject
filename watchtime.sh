
#for ((i=0;i<100000;i++));
#do
#t=$(date +%s.%N)
#echo "$t"
#sleep 0.5
#done

function gettime()
{
t=$1
sec=${t%.*}
n_sec=${t##*.}
t1=$(($sec*1000+$n_sec/1000000))
echo $t1
return $t1
}

tp1=$(date +%s.%N)
timestamp1=$(gettime $tp1)
echo timestamp1 is $timestamp1
