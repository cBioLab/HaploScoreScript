# input : input.gam, input.vg -> ouput.gam
c++ -std=c++11 gamgenerator.cpp -o gamgenerator -O2
python3 gam2csv.py $1 > $1.txt
./gamgenerator $1
python3 csv2json.py $1
vg view -a -J $1.json -G > $1_testhaplo.gam
