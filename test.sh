for d in $(find /home/synth/synspades -maxdepth 50 -type d)
do
ls $d | grep .png
done
