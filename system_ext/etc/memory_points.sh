#!/bin/sh

#get imei1_value
oem_imei1_getprop=$(getprop | grep ro.ril.oem.imei1)
miui_imei1_getprop=$(getprop | grep ro.ril.miui.imei1)
imei1_value=""
#if imei1_value is 0 , then its length is 23.
if [[ ${#oem_imei1_getprop} > 24 ]];
then
	nvalue=${oem_imei1_getprop##*[}
	imei1_value=${nvalue%]*}
elif [[ ${#miui_imei1_getprop} > 24 ]];
then
        nvalue=${miui_imei1_getprop##*[}
	imei1_value=${nvalue%]*}
fi

#imei.txt already exists and will not be written when the content is repeated
imei1_file_path="/data/vendor/mi_ic/imei.txt"
if [[ -e $imei1_file_path && $(cat $imei1_file_path) = $imei1_value ]];
then 
	return
else
	echo $imei1_value > $imei1_file_path
fi
