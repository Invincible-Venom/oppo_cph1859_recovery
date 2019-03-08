 #/**********************************************************************************
 #** Copyright (C), 2016-201X, OPPO Mobile Comm Corp., Ltd
 #** VENDOR_EDIT
 #** FileName : dumplog.sh
 #** Version Number : 1.0
 #** Description : Add for dynamic log in MTK platform
 #** Author : Siting.Mo
 #** Date : 2017-08-03
 #** TAG: EXP.AD.OppoDebug.LogKit
 #** History :(ID, Date, Author, Description)
 #** ------------------------------- Revision History: -----------------------------
 #** <author>                        <data>       <version>   <desc>
 #** --------------------------------------------------------------------------------
 #** Siting.Mo@AD.OppoDebug.LogKit.1058619    2017-08-03   1.0         Create this moudle
 #************************************************************************************/

config="$1"

function dumpAlarmAndPowerLogStart(){
    dumpsys power log power 1
}

function dumpAlarmAndPowerLogEnd(){
    dumpsys power log power 0
}

function dumpBugReportLogEnd(){
}

case "$config" in
    "Log_on")
        dumpAlarmAndPowerLogStart
        ;;

    "Log_off")
        dumpAlarmAndPowerLogEnd
        ;;
esac

