# input : input.gam, input.vg -> ouput.gam
python3 gam2csv.py > input.txt
./gamgenerator
python3 csv2json.py
vg view -a -J output.json -G > output.gam
