echo "start creating gam (paths)"
vg paths -T -g $1.gbwt -x $1.xg -X > $1.gam
echo "finish creating gam"
echo "start sampling path"
bash run.sh $1
echo "finish sampling path"
echo "start calurating P(h)"
vg map -1 $1.gbwt -x $1.xg -g $1.gcsa -G $1_testhaplo.gam



