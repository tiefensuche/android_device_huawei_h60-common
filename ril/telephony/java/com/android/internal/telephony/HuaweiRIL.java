/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.os.Parcel;
import android.os.SystemProperties;
import android.content.Context;

import android.telephony.Rlog;
import android.telephony.SignalStrength;

public class HuaweiRIL extends RIL implements CommandsInterface {

    public HuaweiRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
    }

    @Override
    protected Object
    responseSignalStrength(Parcel p) {
        int[] response = new int[16];
        for (int i = 0 ; i < 16 ; i++) {
            response[i] = p.readInt();
        }

        int gsmSignalStrength = response[0]; // Valid values are (0-31, 99) as defined in TS 27.007 8.5
        int gsmBitErrorRate = response[1]; // bit error rate (0-7, 99) as defined in TS 27.007 8.5
        int mWcdmaRscp = response[2]; // added by huawei
        int mWcdmaEcio = response[3]; // added by huawei
        int cdmaDbm = response[4];
        int cdmaEcio = response[5];
        int evdoDbm = response[6]; // -75 to -105, 99
        int evdoEcio = response[7];
        int evdoSnr = response[8]; // Valid values are 0-8.  8 is the highest signal to noise ratio
        int lteSignalStrength = response[9]; // 0 to 12, 63
        int lteRsrp = response[10]; // -85 to -140, -44
        int lteRsrq = response[11]; // -3 to -20
        int lteRssnr = response[12]; // 130 to -30, -200
        int lteCqi = response[13];
        int mGsm = response[14];
        int mRat = response[15]; // added by huawei       

        Rlog.e(RILJ_LOG_TAG, "---------- HEX ----------");
        Rlog.e(RILJ_LOG_TAG, "gsmSignalStrength:" + String.format("%x", gsmSignalStrength));
        Rlog.e(RILJ_LOG_TAG, "gsmBitErrorRate:" + String.format("%x", gsmBitErrorRate));
        Rlog.e(RILJ_LOG_TAG, "mWcdmaRscp:" + String.format("%x", mWcdmaRscp));
        Rlog.e(RILJ_LOG_TAG, "mWcdmaEcio:" + String.format("%x", mWcdmaEcio));
        Rlog.e(RILJ_LOG_TAG, "cdmaDbm:" + String.format("%x", cdmaDbm));
        Rlog.e(RILJ_LOG_TAG, "cdmaEcio:" + String.format("%x", cdmaEcio));
        Rlog.e(RILJ_LOG_TAG, "evdoDbm:" + String.format("%x", evdoDbm));
        Rlog.e(RILJ_LOG_TAG, "evdoEcio:" + String.format("%x", evdoEcio));
        Rlog.e(RILJ_LOG_TAG, "evdoSnr:" + String.format("%x", evdoSnr));
        Rlog.e(RILJ_LOG_TAG, "lteSignalStrength:" + String.format("%x", lteSignalStrength));
        Rlog.e(RILJ_LOG_TAG, "lteRsrp:" + String.format("%x", lteRsrp));
        Rlog.e(RILJ_LOG_TAG, "lteRsrq:" + String.format("%x", lteRsrq));
        Rlog.e(RILJ_LOG_TAG, "lteRssnr:" + String.format("%x", lteRssnr));
        Rlog.e(RILJ_LOG_TAG, "lteCqi:" + String.format("%x", lteCqi));
        Rlog.e(RILJ_LOG_TAG, "mGsm:" + String.format("%x", mGsm));
        Rlog.e(RILJ_LOG_TAG, "mRat:" + String.format("%x", mRat));

        gsmSignalStrength = (gsmSignalStrength & 0xFF) / 8;
        gsmBitErrorRate = (gsmBitErrorRate < 0)?99:gsmBitErrorRate;

        // Fake LTE values in case we don't get some
        if ((gsmSignalStrength > 0 && gsmSignalStrength <= 31) || gsmSignalStrength == 99) {
            
            // Defaults
            lteSignalStrength = 63;
            lteRsrp = -140;
            lteRsrq = -20;
            lteRssnr = -200;
            
            if (gsmSignalStrength == 99) {  // None or Unknown
                lteRsrp = -140;
                lteRsrq = -20;
                lteRssnr = -200;
            } else if (gsmSignalStrength > 26) { // Great
                lteRsrp = -85;
                lteRsrq = -4;
                lteRssnr = 130;
            } else if (gsmSignalStrength > 20) { // Good
                lteRsrp = -95;
                lteRsrq = -8;
                lteRssnr = 45;
            } else if (gsmSignalStrength > 10) { // Moderate
                lteRsrp = -105;
                lteRsrq = -12;
                lteRssnr = 10;
            } else if (gsmSignalStrength >= 1) { // Poor
                lteRsrp = -115;
                lteRsrq = -18;
                lteRssnr = -30;
            }
        }

        if (lteRsrp > -44) lteSignalStrength = 63; // None or Unknown
        else if (lteRsrp >= -85) lteSignalStrength = 12; // Great
        else if (lteRsrp >= -95) lteSignalStrength = 8; // Good
        else if (lteRsrp >= -105) lteSignalStrength = 5; // Moderate
        else if (lteRsrp >= -115) lteSignalStrength = 0; // Poor
        else if (lteRsrp >= -140) lteSignalStrength = 63; // None or Unknown

        Rlog.e(RILJ_LOG_TAG, "---------- MOD ----------");
        Rlog.e(RILJ_LOG_TAG, "gsmSignalStrength:" + gsmSignalStrength);
        Rlog.e(RILJ_LOG_TAG, "gsmBitErrorRate:" + gsmBitErrorRate);
        Rlog.e(RILJ_LOG_TAG, "lteSignalStrength:" + lteSignalStrength);
        Rlog.e(RILJ_LOG_TAG, "lteRsrp:" + lteRsrp);
        Rlog.e(RILJ_LOG_TAG, "lteRsrq:" + lteRsrq);
        Rlog.e(RILJ_LOG_TAG, "lteRssnr:" + lteRssnr);
        Rlog.e(RILJ_LOG_TAG, "lteCqi:" + lteCqi);
        Rlog.e(RILJ_LOG_TAG, "-------------------------");

        SignalStrength signalStrength = new SignalStrength(
            gsmSignalStrength, gsmBitErrorRate, cdmaDbm, cdmaEcio, evdoDbm, 
            evdoEcio, evdoSnr, lteSignalStrength, -lteRsrp, -lteRsrq, 
            lteRssnr, lteCqi, true);

        return signalStrength;
    }
}
