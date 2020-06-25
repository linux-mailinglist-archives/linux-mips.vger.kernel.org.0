Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E1320A05D
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 15:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405070AbgFYN4J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jun 2020 09:56:09 -0400
Received: from relaygw2-19.mclink.it ([195.78.211.233]:34003 "EHLO
        relaygw2-19.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404890AbgFYN4J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Jun 2020 09:56:09 -0400
Received: from cgp-esgout01-rm.mail.irds.it ([172.24.30.44] verified)
  by relaygw2-19.mclink.it (CommuniGate Pro SMTP 6.0.4)
  with ESMTPS id 173050297 for linux-mips@vger.kernel.org; Thu, 25 Jun 2020 15:56:06 +0200
X-Envelope-From: <mc5686@mclink.it>
Received: from [192.168.7.109] (host-79-18-219-56.retail.telecomitalia.it [79.18.219.56])
        (Authenticated sender: mc5686)
        by cgp-esgout01-rm.mail.irds.it (Postfix) with ESMTPA id C2ABD41B15;
        Thu, 25 Jun 2020 15:55:42 +0200 (CEST)
From:   Mauro Condarelli <mc5686@mclink.it>
Subject: MT7628 WiFi
To:     linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org
Message-ID: <4f5960cf-fed0-1bad-0910-b42d3d153368@mclink.it>
Date:   Thu, 25 Jun 2020 15:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Irideos-Libra-ESVA-Information: Please contact Irideos for more information
X-Irideos-Libra-ESVA-ID: C2ABD41B15.A81EA
X-Irideos-Libra-ESVA: No virus found
X-Irideos-Libra-ESVA-SpamScore: s
X-Irideos-Libra-ESVA-From: mc5686@mclink.it
X-Irideos-Libra-ESVA-Watermark: 1593698144.43735@mJZSlAmr25SiDrzZVad+Fw
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,
I have ported the whole new kernel (and a rebuilt rootfs) to a
VoCore2 board (https://vocore.io/v2.html).
This board originally came with a custom OpenWRT SW
based on an ancient U-boot v4.3.0.0, linux v3.18 and proprietary
"mt_wifi.ko" driver.

I ported to the current U-boot git master, fairly recent Linux v5.7
and stock mt7603e.ko WiFi driver.
RootFS is built using Buildroot.

U-boot changes have already been contributed back.

Everything seems to work ALMOST as expected.

Problem is WiFi seems to work at "lower power" than in "original".
If/when access-point is not really near the board I get something like:
> # iwctl --passphrase SECRET station wlan0 connect FASTWEB-SSID1
> [ 1285.041643] wlan0: authenticate with a4:91:b1:85:e4:e6
> [ 1285.048395] wlan0: send auth to a4:91:b1:85:e4:e6 (try 1/3)
> [ 1285.093234] wlan0: send auth to a4:91:b1:85:e4:e6 (try 2/3)
> [ 1285.234527] wlan0: send auth to a4:91:b1:85:e4:e6 (try 3/3)
> [ 1285.313445] wlan0: authenticated
> [ 1285.327190] wlan0: associate with a4:91:b1:85:e4:e6 (try 1/3)
> [ 1285.349292] wlan0: RX AssocResp from a4:91:b1:85:e4:e6 (capab=0x1411 status=0 aid=2)
> [ 1285.357849] wlan0: associated
> [ 1289.411439] wlan0: deauthenticated from a4:91:b1:85:e4:e6 (Reason: 2=PREV_AUTH_NOT_VALID)
> Received Deauthentication event, reason: 2, from_ap: true
> Operation failed
> #  
Also simple scan seems much more limited:
> # iwctl station wlan0 scan
> # iwctl station wlan0 get-networks
>                               Available networks                              
> --------------------------------------------------------------------------------
>    Network name                    Security  Signal
> --------------------------------------------------------------------------------
>    FASTWEB-SSID1                   psk       ****
>    valeria                         open      ****
("valeria" is a cellphone tethering hotspot sitting 10cm from VoCore2 board).

Situation is completely different with "old" software running on the
*same physical hardware*:
>  77390 INFO      commands.py#330 : --- survey requested
>  88661 INFO      commands.py#334 : --- decode complete (3)
>  88680 INFO      commands.py#339 : ---     -->FASTWEB-SSID1<--[ 1] -  5%
>  88682 INFO      commands.py#339 : ---     -->InfostradaWiFi-106836<--[ 6] -  5%
>  88685 INFO      commands.py#339 : ---     -->Network Wi-Fi di Alessio<--[11] -  5%
> 102433 INFO      commands.py#330 : --- survey requested
> 113679 INFO      commands.py#334 : --- decode complete (3)
> 113682 INFO      commands.py#339 : ---     -->FASTWEB-SSID2<--[ 1] - 31%
> 113685 INFO      commands.py#339 : ---     --><--[ 4] -  2%
> 113698 INFO      commands.py#339 : ---     -->Home&Life SuperWiFi-AFD4<--[10] -  7%
Strangely enough old software sees many more APs, but not always
the same ones (this is one of the reasons why I wanted to upgrade).

Even when connection is actually established ping times are very
high and with a lot of jitter (IMHO this means we have a lot of
retries between board and AP, but that's only a guess).
OLD:
> # ping ftp.funet.fi <http://ftp.funet.fi>
> PING ftp.funet.fi <http://ftp.funet.fi> (193.166.3.2) 56(84) bytes of data.
> 64 bytes from ftp-test.nic.funet.fi <http://ftp-test.nic.funet.fi> (193.166.3.2): icmp_seq=1 ttl=46 time=55.8 ms
> 64 bytes from ftp-test.nic.funet.fi <http://ftp-test.nic.funet.fi> (193.166.3.2): icmp_seq=2 ttl=46 time=56.2 ms
> 64 bytes from ftp-test.nic.funet.fi <http://ftp-test.nic.funet.fi> (193.166.3.2): icmp_seq=3 ttl=46 time=57.9 ms
NEW:
> # ping ftp.funet.fi <http://ftp.funet.fi>
> PING ftp.funet.fi <http://ftp.funet.fi> (193.166.3.2): 56 data bytes
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=0 ttl=48 time=1215.635 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=1 ttl=48 time=527.494 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=2 ttl=48 time=2898.139 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=3 ttl=48 time=1897.868 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=4 ttl=48 time=1133.200 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=5 ttl=48 time=2212.843 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=6 ttl=48 time=2603.802 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=7 ttl=48 time=2122.423 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=8 ttl=48 time=1122.181 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=9 ttl=48 time=626.889 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=10 ttl=48 time=1530.872 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=11 ttl=48 time=531.276 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=12 ttl=48 time=368.461 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=13 ttl=48 time=5507.518 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=14 ttl=48 time=4507.281 ms
> 64 bytes from 193.166.3.2 <http://193.166.3.2>: seq=15 ttl=48 time=5568.011 ms
Note that pinging the very near cellular AP (valeria) seems to work correctly:
> # ping 192.168.43.1
> PING 192.168.43.1 (192.168.43.1): 56 data bytes
> 64 bytes from 192.168.43.1 <http://192.168.43.1>: seq=0 ttl=64 time=3.567 ms
> 64 bytes from 192.168.43.1 <http://192.168.43.1>: seq=1 ttl=64 time=2.797 ms
> 64 bytes from 192.168.43.1 <http://192.168.43.1>: seq=2 ttl=64 time=2.525 ms

I am obviously missing something, most likely either in DT or
driver (I'm using linux standard mt7603e.ko) setup.
Can someone suggest me what to check?

I'm fully willing to send more information or do any test
deemed useful; I didn't send more info just to keep this short.

Thanks in Advance
Mauro Condarelli
