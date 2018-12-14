# input : input.gam, input.vg -> ouput.gam
c++ -std=c++11 gamgenerator.cpp -o gamgenerator -O2
python3 gam2csv.py $1 > input.txt
./gamgenerator
python3 csv2json.py
vg view -a -J output.json -G > $1_testhaplo.gam
