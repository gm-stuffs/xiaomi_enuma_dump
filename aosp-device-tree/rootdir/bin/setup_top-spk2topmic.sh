# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1
set -x

sleep 1

echo "enabling top mic"
audio-factory-test -f enable_top-mic
# start recording
tinycap /data/data/top-spk2top_mic.wav -r 48000 -b 16 -T 6 && echo "capture done" &



sleep 2
echo "enabling top spk"
audio-factory-test -f enable_top-spk
tinyplay /vendor/etc/top_spk_seal.wav

sleep 1


echo "disabling top mic"
audio-factory-test -f disable_top-mic

echo "disabling top spk"
audio-factory-test -f disable_top-spk
