# input : input.gam, input.vg -> ouput.gam
c++ -std=c++11 gamgenerator.cpp -o gamgenerator -O2
time python3 gam2csv.py $1 > $1.txt
echo "Finish GAM2CSV"
time ./gamgenerator $1
echo "Finish Generating"
time python3 csv2json.py $1
echo "Finish CSV2JSON"
time vg view -a -J $1.json -G > $1_testhaplo.gam
echo "Finish JSON2GAM"
