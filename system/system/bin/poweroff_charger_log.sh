umask 022

LOGDIR=/dev/rescue/poweroff_charger_log
LOGFILE=$LOGDIR"/poweroff_charger.txt"
XBL_UEFI_LOG="/dev/logfs/UefiLog0.txt"
SRC_DIR=/mnt/rescue/poweroff_charger_log

NUM_MAX=4
#poweroff log threshold is 4MB
threshold=4194304

state=$(getprop persist.sys.offlinelog.poweroff_charger_log)

if [ "$state" == "clean" ]; then
        if [ -d "$SRC_DIR" ]; then
                rm  -rf  /mnt/rescue/poweroff_charger_log
                echo "Delete poweroff_charger_log success "
        else
                echo " poweroff_charger_log not exist "
        fi
else
        num=$NUM_MAX
        
        date >> $LOGFILE

        # append bootloader/dmesg log when poweroff_charger
                nl $XBL_UEFI_LOG >> $LOGFILE
                dmesg >> $LOGFILE

        logcat -b kernel -c
        /system/bin/logcat -b kernel -r 1024 -n $num -v threadtime -f $LOGFILE &
	while true
	do
		size=$(du -b $LOGDIR | awk '{print $1}')
        	#poweroff log exceeds the maximum limit stop
		if [ $size  -ge $threshold ]; then
			setprop persist.sys.offlinelog.poweroff_charger_log false
			break
		fi
        	#Check every 5 seconds
        	sleep 5
	done
fi
