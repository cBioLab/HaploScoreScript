vg paths -T -g $1.gbwt -x $1.xg -X > $1.gam
bash run.sh $1
vg map -1 $1.gbwt -x $1.xg -g $1.gcsa -G output_$1.gam



