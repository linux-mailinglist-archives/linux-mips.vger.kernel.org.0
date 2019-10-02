Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33360C8E32
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 18:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfJBQXS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 12:23:18 -0400
Received: from fd.dlink.ru ([178.170.168.18]:57884 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfJBQXS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 12:23:18 -0400
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id 8CECF1B21904; Wed,  2 Oct 2019 19:23:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 8CECF1B21904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1570033390; bh=p8GRq3aJkr91PUKLcrsJZc1auPxXJLR6OBbqQjZEKRM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=q7m2Ki8EPwXnsT8DKGyi4skMcw/L+TgmTrGaUthQKEGLy1gh7r4T5Qe9KvpcXQj1p
         0tjFn26YRQH0AyNfLR2qzfzQKMPVBjVSz5+iTYmmSz841ebq1DEzQXCZZTKJ9kz2Zv
         6pEe6wjRFc4h2GlDU9gvx0cjVRSbHvZEXGO04YdM=
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-96.3 required=7.5 tests=BAYES_99,BAYES_999,
        USER_IN_WHITELIST autolearn=disabled version=3.4.1
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 3E9E11B218BF;
        Wed,  2 Oct 2019 19:23:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 3E9E11B218BF
Received: by mail.rzn.dlink.ru (Postfix, from userid 5000)
        id E76101B2085D; Wed,  2 Oct 2019 19:23:05 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA id 604A41B2022D;
        Wed,  2 Oct 2019 19:23:02 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 02 Oct 2019 19:23:02 +0300
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Dmitry Korotin <dkorotin@wavecomp.com>,
        Paul Burton <pburton@wavecomp.com>, linux-mips@vger.kernel.org,
        linux-mips-owner@vger.kernel.org
Subject: Re: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
In-Reply-To: <9875943eab33d7a1ee52183c8593333b@dlink.ru>
References: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
 <1563c90e9d9ed42bd1dedd552fa0316a@dlink.ru>
 <20191001231400.cjge7xocdesmx7pf@pburton-laptop>
 <9875943eab33d7a1ee52183c8593333b@dlink.ru>
Message-ID: <a2a35f1cf58d6db19eb4af9b4ae21e35@dlink.ru>
X-Sender: alobakin@dlink.ru
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Alexander Lobakin wrote 02.10.2019 11:39:
> Hi!
> 
> Paul Burton wrote 02.10.2019 02:14:
>> Hi Alexander,
>> 
>> On Tue, Oct 01, 2019 at 03:49:56PM +0300, Alexander Lobakin wrote:
>>> Maybe it's time to remove the "rather naive" block under CONFIG_32BIT 
>>> at all
>>> and use C implementations in all cases? I'm interested in what does 
>>> Paul
>>> think abous this.
>> 
>> That's not a bad idea - it's something I've already been considering
>> doing anyway as I slowly prep for nanoMIPS support. The reason I 
>> haven't
>> pulled the trigger yet is that I haven't had time to verify the
>> performance impact - I expect it to be minimal, perhaps even 
>> beneficial,
>> but it'd be good to get numbers from a few machines to check that.
> 
> Yep, I thought about performance changes too. strcpy() and strncpy() 
> are
> considered deprecated for now (Documentation/process/deprecated.rst), 
> so
> we might take only strcmp() and strncmp() into the scope.
> I have some R3k and interAptiv boards and could investigate into this 
> and
> share the results. For now I can say that switching to C functions 
> reduces
> the total size of the text section and entire vmlinux.

Well, I've performed some sort of testing.
In general, I'm surprised that kernel with CONFIG_FORTIFY_SOURCE=y has
results at least comparable to current configuration. I was sure it'd
be the slowest one. At the same time, it still have lesser size.

Both platforms (R3k and 32R2) have been tested on Linux 5.3.0 with
Binutils 2.32, GCC 9.2.0, CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y and
CONFIG_OPTIMIZE_INLINING=y (the latter has become 'def_bool y' in
5.4-rc1).

I. R3k boards (UP, 600 MHz, 64/32 Kb cache, linesize 32 bytes)

I. 1. Kernel size

The following differences have been collected using bloat-o-meter.

ASM inline -> C functions:

Text
add/remove: 4/7 grow/shrink: 42/169 up/down: 1824/-8432 (-6608)
Total: Before=4790786, After=4784178, chg -0.14%

Data
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Total: Before=359387, After=359387, chg +0.00%

Rodata
add/remove: 8/0 grow/shrink: 0/0 up/down: 62/0 (62)
Total: Before=199638, After=199700, chg +0.03%

C functions -> Fortify source:

Text
add/remove: 26/7 grow/shrink: 370/538 up/down: 20372/-17648 (2724)
Total: Before=4784178, After=4786902, chg +0.06%

Data
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Total: Before=359387, After=359387, chg +0.00%

Rodata
add/remove: 6/2 grow/shrink: 1/1 up/down: 508/-68 (440)
Total: Before=199700, After=200140, chg +0.22%

ASM inline -> Fortify source:

Text
add/remove: 29/13 grow/shrink: 394/676 up/down: 21352/-25236 (-3884)
Total: Before=4790786, After=4786902, chg -0.08%

Data
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Total: Before=359387, After=359387, chg +0.00%

Rodata
add/remove: 14/2 grow/shrink: 1/1 up/down: 570/-68 (502)
Total: Before=199638, After=200140, chg +0.25%

Kernel built with pure string.c functions has the smallest size,
whilst the one with ASM inlines is the biggest.

I.2. Performance on cached segment (CKSEG0, using kzalloc())

I used ktime_get() and ktime_sub() to get execution times and some
functions from drivers/dma/dmatest.c to calculate ops and Kb/s
(shifted to operate nanoseconds and bytes for maximal precision).

ASM inline functions:

----------------------------
strcpy(8): 700 nsec (0 usec), 1428571.42 iops, 11160 Kb/s
strcpy(32): 500 nsec (0 usec), 2000000.00 iops, 62500 Kb/s
strcpy(128): 1160 nsec (1 usec), 862068.96 iops, 107758 Kb/s
strcpy(512): 3740 nsec (3 usec), 267379.67 iops, 133689 Kb/s
strcpy(2048): 14000 nsec (14 usec), 71428.57 iops, 142857 Kb/s
strcpy(8192): 54900 nsec (54 usec), 18214.93 iops, 145719 Kb/s
strcpy(32768): 439850 nsec (439 usec), 2273.50 iops, 72752 Kb/s
strcpy(131072): 1414390 nsec (1414 usec), 707.01 iops, 90498 Kb/s
strcpy(524288): 5640900 nsec (5640 usec), 177.27 iops, 90765 Kb/s
strcpy(2097152): 22452490 nsec (22452 usec), 44.53 iops, 91214 Kb/s
----------------------------
strncpy(8): 810 nsec (0 usec), 1234567.89 iops, 9645 Kb/s
strncpy(32): 530 nsec (0 usec), 1886792.44 iops, 58962 Kb/s
strncpy(128): 1330 nsec (1 usec), 751879.69 iops, 93984 Kb/s
strncpy(512): 4540 nsec (4 usec), 220264.31 iops, 110132 Kb/s
strncpy(2048): 17340 nsec (17 usec), 57670.12 iops, 115340 Kb/s
strncpy(8192): 68540 nsec (68 usec), 14590.01 iops, 116720 Kb/s
strncpy(32768): 467760 nsec (467 usec), 2137.84 iops, 68411 Kb/s
strncpy(131072): 1605830 nsec (1605 usec), 622.73 iops, 79709 Kb/s
strncpy(524288): 6403900 nsec (6403 usec), 156.15 iops, 79951 Kb/s
strncpy(2097152): 25665740 nsec (25665 usec), 38.96 iops, 79795 Kb/s
----------------------------
strcmp(8): 650 nsec (0 usec), 1538461.53 iops, 12019 Kb/s
strcmp(32): 610 nsec (0 usec), 1639344.26 iops, 51229 Kb/s
strcmp(128): 1410 nsec (1 usec), 709219.85 iops, 88652 Kb/s
strcmp(512): 4600 nsec (4 usec), 217391.30 iops, 108695 Kb/s
strcmp(2048): 17390 nsec (17 usec), 57504.31 iops, 115008 Kb/s
strcmp(8192): 68600 nsec (68 usec), 14577.25 iops, 116618 Kb/s
strcmp(32768): 539340 nsec (539 usec), 1854.11 iops, 59331 Kb/s
strcmp(131072): 1970180 nsec (1970 usec), 507.56 iops, 64968 Kb/s
strcmp(524288): 7632900 nsec (7632 usec), 131.01 iops, 67078 Kb/s
strcmp(2097152): 30342950 nsec (30342 usec), 32.95 iops, 67495 Kb/s
----------------------------
strncmp(8): 750 nsec (0 usec), 1333333.33 iops, 10416 Kb/s
strncmp(32): 780 nsec (0 usec), 1282051.28 iops, 40064 Kb/s
strncmp(128): 1790 nsec (1 usec), 558659.21 iops, 69832 Kb/s
strncmp(512): 5580 nsec (5 usec), 179211.46 iops, 89605 Kb/s
strncmp(2048): 20940 nsec (20 usec), 47755.48 iops, 95510 Kb/s
strncmp(8192): 82360 nsec (82 usec), 12141.81 iops, 97134 Kb/s
strncmp(32768): 595380 nsec (595 usec), 1679.59 iops, 53747 Kb/s
strncmp(131072): 2156050 nsec (2156 usec), 463.80 iops, 59367 Kb/s
strncmp(524288): 8477760 nsec (8477 usec), 117.95 iops, 60393 Kb/s
strncmp(2097152): 33734690 nsec (33734 usec), 29.64 iops, 60709 Kb/s
----------------------------

C functions:

----------------------------
strcpy(8): 790 nsec (0 usec), 1265822.78 iops, 9889 Kb/s
strcpy(32): 520 nsec (0 usec), 1923076.92 iops, 60096 Kb/s
strcpy(128): 1120 nsec (1 usec), 892857.14 iops, 111607 Kb/s
strcpy(512): 3670 nsec (3 usec), 272479.56 iops, 136239 Kb/s
strcpy(2048): 13900 nsec (13 usec), 71942.44 iops, 143884 Kb/s
strcpy(8192): 54860 nsec (54 usec), 18228.21 iops, 145825 Kb/s
strcpy(32768): 440220 nsec (440 usec), 2271.58 iops, 72690 Kb/s
strcpy(131072): 1414620 nsec (1414 usec), 706.90 iops, 90483 Kb/s
strcpy(524288): 5608940 nsec (5608 usec), 178.28 iops, 91282 Kb/s
strcpy(2097152): 22452660 nsec (22452 usec), 44.53 iops, 91214 Kb/s
----------------------------
strncpy(8): 690 nsec (0 usec), 1449275.35 iops, 11322 Kb/s
strncpy(32): 500 nsec (0 usec), 2000000.00 iops, 62500 Kb/s
strncpy(128): 1300 nsec (1 usec), 769230.76 iops, 96153 Kb/s
strncpy(512): 4540 nsec (4 usec), 220264.31 iops, 110132 Kb/s
strncpy(2048): 17330 nsec (17 usec), 57703.40 iops, 115406 Kb/s
strncpy(8192): 68530 nsec (68 usec), 14592.14 iops, 116737 Kb/s
strncpy(32768): 484950 nsec (484 usec), 2062.06 iops, 65986 Kb/s
strncpy(131072): 1606070 nsec (1606 usec), 622.63 iops, 79697 Kb/s
strncpy(524288): 6403790 nsec (6403 usec), 156.15 iops, 79952 Kb/s
strncpy(2097152): 25667340 nsec (25667 usec), 38.95 iops, 79790 Kb/s
----------------------------
strcmp(8): 500 nsec (0 usec), 2000000.00 iops, 15625 Kb/s
strcmp(32): 690 nsec (0 usec), 1449275.35 iops, 45289 Kb/s
strcmp(128): 1690 nsec (1 usec), 591715.97 iops, 73964 Kb/s
strcmp(512): 5480 nsec (5 usec), 182481.75 iops, 91240 Kb/s
strcmp(2048): 20840 nsec (20 usec), 47984.64 iops, 95969 Kb/s
strcmp(8192): 82270 nsec (82 usec), 12155.09 iops, 97240 Kb/s
strcmp(32768): 593160 nsec (593 usec), 1685.88 iops, 53948 Kb/s
strcmp(131072): 2155430 nsec (2155 usec), 463.94 iops, 59384 Kb/s
strcmp(524288): 8478010 nsec (8478 usec), 117.94 iops, 60391 Kb/s
strcmp(2097152): 33705730 nsec (33705 usec), 29.66 iops, 60761 Kb/s
----------------------------
strncmp(8): 890 nsec (0 usec), 1123595.50 iops, 8778 Kb/s
strncmp(32): 750 nsec (0 usec), 1333333.33 iops, 41666 Kb/s
strncmp(128): 1840 nsec (1 usec), 543478.25 iops, 67934 Kb/s
strncmp(512): 6270 nsec (6 usec), 159489.63 iops, 79744 Kb/s
strncmp(2048): 24200 nsec (24 usec), 41322.31 iops, 82644 Kb/s
strncmp(8192): 95880 nsec (95 usec), 10429.70 iops, 83437 Kb/s
strncmp(32768): 645310 nsec (645 usec), 1549.64 iops, 49588 Kb/s
strncmp(131072): 2368130 nsec (2368 usec), 422.27 iops, 54051 Kb/s
strncmp(524288): 9338630 nsec (9338 usec), 107.08 iops, 54826 Kb/s
strncmp(2097152): 37154590 nsec (37154 usec), 26.91 iops, 55121 Kb/s
----------------------------

Fortify source:

----------------------------
strcpy(8): 470 nsec (0 usec), 2127659.57 iops, 16622 Kb/s
strcpy(32): 490 nsec (0 usec), 2040816.32 iops, 63775 Kb/s
strcpy(128): 1110 nsec (1 usec), 900900.89 iops, 112612 Kb/s
strcpy(512): 3710 nsec (3 usec), 269541.77 iops, 134770 Kb/s
strcpy(2048): 13920 nsec (13 usec), 71839.07 iops, 143678 Kb/s
strcpy(8192): 54860 nsec (54 usec), 18228.21 iops, 145825 Kb/s
strcpy(32768): 439500 nsec (439 usec), 2275.31 iops, 72810 Kb/s
strcpy(131072): 1445910 nsec (1445 usec), 691.60 iops, 88525 Kb/s
strcpy(524288): 5640850 nsec (5640 usec), 177.27 iops, 90766 Kb/s
strcpy(2097152): 22450030 nsec (22450 usec), 44.54 iops, 91224 Kb/s
----------------------------
strncpy(8): 800 nsec (0 usec), 1250000.00 iops, 9765 Kb/s
strncpy(32): 510 nsec (0 usec), 1960784.31 iops, 61274 Kb/s
strncpy(128): 1320 nsec (1 usec), 757575.75 iops, 94696 Kb/s
strncpy(512): 4530 nsec (4 usec), 220750.55 iops, 110375 Kb/s
strncpy(2048): 17330 nsec (17 usec), 57703.40 iops, 115406 Kb/s
strncpy(8192): 68520 nsec (68 usec), 14594.27 iops, 116754 Kb/s
strncpy(32768): 485340 nsec (485 usec), 2060.41 iops, 65933 Kb/s
strncpy(131072): 1605790 nsec (1605 usec), 622.74 iops, 79711 Kb/s
strncpy(524288): 6404220 nsec (6404 usec), 156.14 iops, 79947 Kb/s
strncpy(2097152): 25665150 nsec (25665 usec), 38.96 iops, 79796 Kb/s
----------------------------
strcmp(8): 470 nsec (0 usec), 2127659.57 iops, 16622 Kb/s
strcmp(32): 590 nsec (0 usec), 1694915.25 iops, 52966 Kb/s
strcmp(128): 1550 nsec (1 usec), 645161.28 iops, 80645 Kb/s
strcmp(512): 5370 nsec (5 usec), 186219.73 iops, 93109 Kb/s
strcmp(2048): 20740 nsec (20 usec), 48216.00 iops, 96432 Kb/s
strcmp(8192): 82180 nsec (82 usec), 12168.41 iops, 97347 Kb/s
strcmp(32768): 594630 nsec (594 usec), 1681.71 iops, 53814 Kb/s
strcmp(131072): 2185570 nsec (2185 usec), 457.54 iops, 58565 Kb/s
strcmp(524288): 8477320 nsec (8477 usec), 117.96 iops, 60396 Kb/s
strcmp(2097152): 33704090 nsec (33704 usec), 29.66 iops, 60764 Kb/s
----------------------------
strncmp(8): 1010 nsec (1 usec), 990099.00 iops, 7735 Kb/s
strncmp(32): 850 nsec (0 usec), 1176470.58 iops, 36764 Kb/s
strncmp(128): 1970 nsec (1 usec), 507614.21 iops, 63451 Kb/s
strncmp(512): 6480 nsec (6 usec), 154320.98 iops, 77160 Kb/s
strncmp(2048): 24380 nsec (24 usec), 41017.22 iops, 82034 Kb/s
strncmp(8192): 96050 nsec (96 usec), 10411.24 iops, 83289 Kb/s
strncmp(32768): 645870 nsec (645 usec), 1548.29 iops, 49545 Kb/s
strncmp(131072): 2368150 nsec (2368 usec), 422.26 iops, 54050 Kb/s
strncmp(524288): 9337580 nsec (9337 usec), 107.09 iops, 54832 Kb/s
strncmp(2097152): 37152160 nsec (37152 usec), 26.91 iops, 55124 Kb/s
----------------------------

There's noticeable decrease at strcpy() on small amounts of data and
at strcmp(). Hovewer, fortified strcpy() produce same-to-faster
results.
ASMs are also faster at strncmp() on 2-8 Kb chunks. Other positions
are on par or give some boosts when switching to C.

I.3. Performance on uncached segment (CKSEG1, using
dma_alloc_coherent())

ASM inline functions:

----------------------------
strcpy(8): 1690 nsec (1 usec), 591715.97 iops, 4622 Kb/s
strcpy(32): 4630 nsec (4 usec), 215982.71 iops, 6749 Kb/s
strcpy(128): 17740 nsec (17 usec), 56369.78 iops, 7046 Kb/s
strcpy(512): 68790 nsec (68 usec), 14536.99 iops, 7268 Kb/s
strcpy(2048): 274670 nsec (274 usec), 3640.73 iops, 7281 Kb/s
strcpy(8192): 1097660 nsec (1097 usec), 911.02 iops, 7288 Kb/s
strcpy(32768): 4400440 nsec (4400 usec), 227.25 iops, 7272 Kb/s
strcpy(131072): 17578830 nsec (17578 usec), 56.88 iops, 7281 Kb/s
strcpy(524288): 70309650 nsec (70309 usec), 14.22 iops, 7282 Kb/s
strcpy(2097152): 281234830 nsec (281234 usec), 3.55 iops, 7282 Kb/s
----------------------------
strncpy(8): 1550 nsec (1 usec), 645161.28 iops, 5040 Kb/s
strncpy(32): 4420 nsec (4 usec), 226244.34 iops, 7070 Kb/s
strncpy(128): 17260 nsec (17 usec), 57937.42 iops, 7242 Kb/s
strncpy(512): 68850 nsec (68 usec), 14524.32 iops, 7262 Kb/s
strncpy(2048): 274530 nsec (274 usec), 3642.58 iops, 7285 Kb/s
strncpy(8192): 1097450 nsec (1097 usec), 911.20 iops, 7289 Kb/s
strncpy(32768): 4391010 nsec (4391 usec), 227.73 iops, 7287 Kb/s
strncpy(131072): 17578710 nsec (17578 usec), 56.88 iops, 7281 Kb/s
strncpy(524288): 70307870 nsec (70307 usec), 14.22 iops, 7282 Kb/s
strncpy(2097152): 281223350 nsec (281223 usec), 3.55 iops, 7282 Kb/s
----------------------------
strcmp(8): 2520 nsec (2 usec), 396825.39 iops, 3100 Kb/s
strcmp(32): 8230 nsec (8 usec), 121506.67 iops, 3797 Kb/s
strcmp(128): 32010 nsec (32 usec), 31240.23 iops, 3905 Kb/s
strcmp(512): 127140 nsec (127 usec), 7865.34 iops, 3932 Kb/s
strcmp(2048): 507570 nsec (507 usec), 1970.16 iops, 3940 Kb/s
strcmp(8192): 2029840 nsec (2029 usec), 492.64 iops, 3941 Kb/s
strcmp(32768): 8127320 nsec (8127 usec), 123.03 iops, 3937 Kb/s
strcmp(131072): 32498990 nsec (32498 usec), 30.76 iops, 3938 Kb/s
strcmp(524288): 130004790 nsec (130004 usec), 7.69 iops, 3938 Kb/s
strcmp(2097152): 523810690 nsec (523810 usec), 1.90 iops, 3909 Kb/s
----------------------------
strncmp(8): 2800 nsec (2 usec), 357142.85 iops, 2790 Kb/s
strncmp(32): 8400 nsec (8 usec), 119047.61 iops, 3720 Kb/s
strncmp(128): 32370 nsec (32 usec), 30892.80 iops, 3861 Kb/s
strncmp(512): 128000 nsec (128 usec), 7812.50 iops, 3906 Kb/s
strncmp(2048): 510590 nsec (510 usec), 1958.51 iops, 3917 Kb/s
strncmp(8192): 2041010 nsec (2041 usec), 489.95 iops, 3919 Kb/s
strncmp(32768): 8171540 nsec (8171 usec), 122.37 iops, 3916 Kb/s
strncmp(131072): 32675170 nsec (32675 usec), 30.60 iops, 3917 Kb/s
strncmp(524288): 130707990 nsec (130707 usec), 7.64 iops, 3917 Kb/s
strncmp(2097152): 522833410 nsec (522833 usec), 1.91 iops, 3917 Kb/s
----------------------------

C functions:

----------------------------
strcpy(8): 1860 nsec (1 usec), 537634.40 iops, 4200 Kb/s
strcpy(32): 4620 nsec (4 usec), 216450.21 iops, 6764 Kb/s
strcpy(128): 17740 nsec (17 usec), 56369.78 iops, 7046 Kb/s
strcpy(512): 70460 nsec (70 usec), 14192.44 iops, 7096 Kb/s
strcpy(2048): 281350 nsec (281 usec), 3554.28 iops, 7108 Kb/s
strcpy(8192): 1123640 nsec (1123 usec), 889.96 iops, 7119 Kb/s
strcpy(32768): 4503220 nsec (4503 usec), 222.06 iops, 7106 Kb/s
strcpy(131072): 17994180 nsec (17994 usec), 55.57 iops, 7113 Kb/s
strcpy(524288): 71971750 nsec (71971 usec), 13.89 iops, 7113 Kb/s
strcpy(2097152): 287887550 nsec (287887 usec), 3.47 iops, 7113 Kb/s
----------------------------
strncpy(8): 1480 nsec (1 usec), 675675.67 iops, 5278 Kb/s
strncpy(32): 4430 nsec (4 usec), 225733.63 iops, 7054 Kb/s
strncpy(128): 17670 nsec (17 usec), 56593.09 iops, 7074 Kb/s
strncpy(512): 70400 nsec (70 usec), 14204.54 iops, 7102 Kb/s
strncpy(2048): 280950 nsec (280 usec), 3559.35 iops, 7118 Kb/s
strncpy(8192): 1123660 nsec (1123 usec), 889.94 iops, 7119 Kb/s
strncpy(32768): 4493970 nsec (4493 usec), 222.51 iops, 7120 Kb/s
strncpy(131072): 17994650 nsec (17994 usec), 55.57 iops, 7113 Kb/s
strncpy(524288): 71967540 nsec (71967 usec), 13.89 iops, 7114 Kb/s
strncpy(2097152): 287879690 nsec (287879 usec), 3.47 iops, 7114 Kb/s
----------------------------
strcmp(8): 2200 nsec (2 usec), 454545.45 iops, 3551 Kb/s
strcmp(32): 8210 nsec (8 usec), 121802.67 iops, 3806 Kb/s
strcmp(128): 32130 nsec (32 usec), 31123.55 iops, 3890 Kb/s
strcmp(512): 127730 nsec (127 usec), 7829.01 iops, 3914 Kb/s
strcmp(2048): 510220 nsec (510 usec), 1959.93 iops, 3919 Kb/s
strcmp(8192): 2050050 nsec (2050 usec), 487.79 iops, 3902 Kb/s
strcmp(32768): 8171380 nsec (8171 usec), 122.37 iops, 3916 Kb/s
strcmp(131072): 32675350 nsec (32675 usec), 30.60 iops, 3917 Kb/s
strcmp(524288): 130710890 nsec (130710 usec), 7.64 iops, 3917 Kb/s
strcmp(2097152): 526633450 nsec (526633 usec), 1.89 iops, 3888 Kb/s
----------------------------
strncmp(8): 2630 nsec (2 usec), 380228.13 iops, 2970 Kb/s
strncmp(32): 8340 nsec (8 usec), 119904.07 iops, 3747 Kb/s
strncmp(128): 32210 nsec (32 usec), 31046.25 iops, 3880 Kb/s
strncmp(512): 127890 nsec (127 usec), 7819.21 iops, 3909 Kb/s
strncmp(2048): 510420 nsec (510 usec), 1959.16 iops, 3918 Kb/s
strncmp(8192): 2040750 nsec (2040 usec), 490.01 iops, 3920 Kb/s
strncmp(32768): 8171570 nsec (8171 usec), 122.37 iops, 3916 Kb/s
strncmp(131072): 32675950 nsec (32675 usec), 30.60 iops, 3917 Kb/s
strncmp(524288): 130720570 nsec (130720 usec), 7.64 iops, 3916 Kb/s
strncmp(2097152): 522854010 nsec (522854 usec), 1.91 iops, 3916 Kb/s
----------------------------

Fortify source:

----------------------------
strcpy(8): 1490 nsec (1 usec), 671140.93 iops, 5243 Kb/s
strcpy(32): 4670 nsec (4 usec), 214132.76 iops, 6691 Kb/s
strcpy(128): 17870 nsec (17 usec), 55959.70 iops, 6994 Kb/s
strcpy(512): 70560 nsec (70 usec), 14172.33 iops, 7086 Kb/s
strcpy(2048): 281230 nsec (281 usec), 3555.80 iops, 7111 Kb/s
strcpy(8192): 1123430 nsec (1123 usec), 890.12 iops, 7121 Kb/s
strcpy(32768): 4503010 nsec (4503 usec), 222.07 iops, 7106 Kb/s
strcpy(131072): 17984300 nsec (17984 usec), 55.60 iops, 7117 Kb/s
strcpy(524288): 71968010 nsec (71968 usec), 13.89 iops, 7114 Kb/s
strcpy(2097152): 287871190 nsec (287871 usec), 3.47 iops, 7114 Kb/s
----------------------------
strncpy(8): 1820 nsec (1 usec), 549450.54 iops, 4292 Kb/s
strncpy(32): 4500 nsec (4 usec), 222222.21 iops, 6944 Kb/s
strncpy(128): 17490 nsec (17 usec), 57175.52 iops, 7146 Kb/s
strncpy(512): 70520 nsec (70 usec), 14180.37 iops, 7090 Kb/s
strncpy(2048): 280890 nsec (280 usec), 3560.10 iops, 7120 Kb/s
strncpy(8192): 1123430 nsec (1123 usec), 890.12 iops, 7121 Kb/s
strncpy(32768): 4493990 nsec (4493 usec), 222.51 iops, 7120 Kb/s
strncpy(131072): 17992790 nsec (17992 usec), 55.57 iops, 7113 Kb/s
strncpy(524288): 71962910 nsec (71962 usec), 13.89 iops, 7114 Kb/s
strncpy(2097152): 287863110 nsec (287863 usec), 3.47 iops, 7114 Kb/s
----------------------------
strcmp(8): 2280 nsec (2 usec), 438596.48 iops, 3426 Kb/s
strcmp(32): 8170 nsec (8 usec), 122399.01 iops, 3824 Kb/s
strcmp(128): 32110 nsec (32 usec), 31142.94 iops, 3892 Kb/s
strcmp(512): 127720 nsec (127 usec), 7829.62 iops, 3914 Kb/s
strcmp(2048): 510360 nsec (510 usec), 1959.39 iops, 3918 Kb/s
strcmp(8192): 2049640 nsec (2049 usec), 487.88 iops, 3903 Kb/s
strcmp(32768): 8170920 nsec (8170 usec), 122.38 iops, 3916 Kb/s
strcmp(131072): 32673620 nsec (32673 usec), 30.60 iops, 3917 Kb/s
strcmp(524288): 130702960 nsec (130702 usec), 7.64 iops, 3917 Kb/s
strcmp(2097152): 526610120 nsec (526610 usec), 1.89 iops, 3889 Kb/s
----------------------------
strncmp(8): 2510 nsec (2 usec), 398406.37 iops, 3112 Kb/s
strncmp(32): 8360 nsec (8 usec), 119617.22 iops, 3738 Kb/s
strncmp(128): 32380 nsec (32 usec), 30883.25 iops, 3860 Kb/s
strncmp(512): 128020 nsec (128 usec), 7811.27 iops, 3905 Kb/s
strncmp(2048): 510550 nsec (510 usec), 1958.67 iops, 3917 Kb/s
strncmp(8192): 2040980 nsec (2040 usec), 489.95 iops, 3919 Kb/s
strncmp(32768): 8162310 nsec (8162 usec), 122.51 iops, 3920 Kb/s
strncmp(131072): 32674690 nsec (32674 usec), 30.60 iops, 3917 Kb/s
strncmp(524288): 130704590 nsec (130704 usec), 7.64 iops, 3917 Kb/s
strncmp(2097152): 522826990 nsec (522826 usec), 1.91 iops, 3917 Kb/s
----------------------------

II. interAptiv boards (SMP-CPS with 4 CPUs, 1200 MHz, 64/32 Kb cache,
linesize 32 bytes)

II. 1. Kernel size

ASM inline -> C functions:

Text
add/remove: 4/6 grow/shrink: 41/180 up/down: 1820/-9060 (-7240)
Total: Before=4863690, After=4856450, chg -0.15%

Data
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Total: Before=427226, After=427226, chg +0.00%

Rodata
add/remove: 8/0 grow/shrink: 0/0 up/down: 62/0 (62)
Total: Before=248470, After=248532, chg +0.02%

C functions -> Fortify source:

Text
add/remove: 33/10 grow/shrink: 390/491 up/down: 24244/-22216 (2028)
Total: Before=4856510, After=4858538, chg +0.04%

Data
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Total: Before=427226, After=427226, chg +0.00%

Rodata
add/remove: 6/2 grow/shrink: 1/1 up/down: 578/-68 (510)
Total: Before=248532, After=249042, chg +0.21%

ASM inline -> Fortify source

Text
add/remove: 37/16 grow/shrink: 410/636 up/down: 25276/-30436 (-5160)
Total: Before=4863698, After=4858538, chg -0.11%

Data
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Total: Before=427226, After=427226, chg +0.00%

Rodata
add/remove: 14/2 grow/shrink: 1/1 up/down: 640/-68 (572)
Total: Before=248470, After=249042, chg +0.23%

Same story here, with bigger space savings.

II.2. Performance on cached segment (CKSEG0, using kzalloc())

ASM inline functions:

----------------------------
strcpy(8): 595 nsec (0 usec), 1680672.26 iops, 13130 Kb/s
strcpy(32): 351 nsec (0 usec), 2849002.84 iops, 89031 Kb/s
strcpy(128): 751 nsec (0 usec), 1331557.92 iops, 166444 Kb/s
strcpy(512): 2351 nsec (2 usec), 425350.91 iops, 212675 Kb/s
strcpy(2048): 9223 nsec (9 usec), 108424.58 iops, 216849 Kb/s
strcpy(8192): 35533 nsec (35 usec), 28142.85 iops, 225142 Kb/s
strcpy(32768): 269403 nsec (269 usec), 3711.91 iops, 118781 Kb/s
strcpy(131072): 1117256 nsec (1117 usec), 895.04 iops, 114566 Kb/s
strcpy(524288): 4497279 nsec (4497 usec), 222.35 iops, 113846 Kb/s
strcpy(2097152): 17893861 nsec (17893 usec), 55.88 iops, 114452 Kb/s
----------------------------
strncpy(8): 583 nsec (0 usec), 1715265.86 iops, 13400 Kb/s
strncpy(32): 567 nsec (0 usec), 1763668.42 iops, 55114 Kb/s
strncpy(128): 1207 nsec (1 usec), 828500.41 iops, 103562 Kb/s
strncpy(512): 3736 nsec (3 usec), 267665.94 iops, 133832 Kb/s
strncpy(2048): 13977 nsec (13 usec), 71546.10 iops, 143092 Kb/s
strncpy(8192): 54937 nsec (54 usec), 18202.66 iops, 145621 Kb/s
strncpy(32768): 320867 nsec (320 usec), 3116.55 iops, 99729 Kb/s
strncpy(131072): 1379006 nsec (1379 usec), 725.15 iops, 92820 Kb/s
strncpy(524288): 5643065 nsec (5643 usec), 177.20 iops, 90730 Kb/s
strncpy(2097152): 22308231 nsec (22308 usec), 44.82 iops, 91804 Kb/s
----------------------------
strcmp(8): 443 nsec (0 usec), 2257336.33 iops, 17635 Kb/s
strcmp(32): 474 nsec (0 usec), 2109704.64 iops, 65928 Kb/s
strcmp(128): 954 nsec (0 usec), 1048218.02 iops, 131027 Kb/s
strcmp(512): 2859 nsec (2 usec), 349772.64 iops, 174886 Kb/s
strcmp(2048): 10540 nsec (10 usec), 94876.66 iops, 189753 Kb/s
strcmp(8192): 41262 nsec (41 usec), 24235.37 iops, 193882 Kb/s
strcmp(32768): 434466 nsec (434 usec), 2301.67 iops, 73653 Kb/s
strcmp(131072): 1418412 nsec (1418 usec), 705.01 iops, 90241 Kb/s
strcmp(524288): 5429797 nsec (5429 usec), 184.16 iops, 94294 Kb/s
strcmp(2097152): 21424585 nsec (21424 usec), 46.67 iops, 95591 Kb/s
----------------------------
strncmp(8): 542 nsec (0 usec), 1845018.44 iops, 14414 Kb/s
strncmp(32): 673 nsec (0 usec), 1485884.09 iops, 46433 Kb/s
strncmp(128): 1804 nsec (1 usec), 554323.72 iops, 69290 Kb/s
strncmp(512): 3766 nsec (3 usec), 265533.72 iops, 132766 Kb/s
strncmp(2048): 14006 nsec (14 usec), 71397.96 iops, 142795 Kb/s
strncmp(8192): 54966 nsec (54 usec), 18193.06 iops, 145544 Kb/s
strncmp(32768): 450255 nsec (450 usec), 2220.96 iops, 71070 Kb/s
strncmp(131072): 1656933 nsec (1656 usec), 603.52 iops, 77251 Kb/s
strncmp(524288): 6437916 nsec (6437 usec), 155.32 iops, 79528 Kb/s
strncmp(2097152): 25591114 nsec (25591 usec), 39.07 iops, 80027 Kb/s
----------------------------

C functions:

----------------------------
strcpy(8): 528 nsec (0 usec), 1893939.39 iops, 14796 Kb/s
strcpy(32): 645 nsec (0 usec), 1550387.59 iops, 48449 Kb/s
strcpy(128): 962 nsec (0 usec), 1039501.03 iops, 129937 Kb/s
strcpy(512): 2867 nsec (2 usec), 348796.64 iops, 174398 Kb/s
strcpy(2048): 10680 nsec (10 usec), 93632.95 iops, 187265 Kb/s
strcpy(8192): 41267 nsec (41 usec), 24232.43 iops, 193859 Kb/s
strcpy(32768): 280070 nsec (280 usec), 3570.53 iops, 114257 Kb/s
strcpy(131072): 1178973 nsec (1178 usec), 848.19 iops, 108569 Kb/s
strcpy(524288): 4766757 nsec (4766 usec), 209.78 iops, 107410 Kb/s
strcpy(2097152): 18930688 nsec (18930 usec), 52.82 iops, 108184 Kb/s
----------------------------
strncpy(8): 442 nsec (0 usec), 2262443.43 iops, 17675 Kb/s
strncpy(32): 417 nsec (0 usec), 2398081.53 iops, 74940 Kb/s
strncpy(128): 974 nsec (0 usec), 1026694.04 iops, 128336 Kb/s
strncpy(512): 3204 nsec (3 usec), 312109.85 iops, 156054 Kb/s
strncpy(2048): 12236 nsec (12 usec), 81726.05 iops, 163452 Kb/s
strncpy(8192): 47804 nsec (47 usec), 20918.75 iops, 167350 Kb/s
strncpy(32768): 314508 nsec (314 usec), 3179.56 iops, 101746 Kb/s
strncpy(131072): 1393467 nsec (1393 usec), 717.63 iops, 91857 Kb/s
strncpy(524288): 5311476 nsec (5311 usec), 188.26 iops, 96395 Kb/s
strncpy(2097152): 21330073 nsec (21330 usec), 46.87 iops, 96014 Kb/s
----------------------------
strcmp(8): 378 nsec (0 usec), 2645502.64 iops, 20667 Kb/s
strcmp(32): 390 nsec (0 usec), 2564102.56 iops, 80128 Kb/s
strcmp(128): 871 nsec (0 usec), 1148105.62 iops, 143513 Kb/s
strcmp(512): 2789 nsec (2 usec), 358551.44 iops, 179275 Kb/s
strcmp(2048): 10469 nsec (10 usec), 95520.10 iops, 191040 Kb/s
strcmp(8192): 41296 nsec (41 usec), 24215.41 iops, 193723 Kb/s
strcmp(32768): 405947 nsec (405 usec), 2463.37 iops, 78828 Kb/s
strcmp(131072): 1404735 nsec (1404 usec), 711.87 iops, 91120 Kb/s
strcmp(524288): 5427340 nsec (5427 usec), 184.25 iops, 94337 Kb/s
strcmp(2097152): 21418212 nsec (21418 usec), 46.68 iops, 95619 Kb/s
----------------------------
strncmp(8): 899 nsec (0 usec), 1112347.05 iops, 8690 Kb/s
strncmp(32): 464 nsec (0 usec), 2155172.41 iops, 67349 Kb/s
strncmp(128): 1184 nsec (1 usec), 844594.59 iops, 105574 Kb/s
strncmp(512): 4064 nsec (4 usec), 246062.98 iops, 123031 Kb/s
strncmp(2048): 15584 nsec (15 usec), 64168.37 iops, 128336 Kb/s
strncmp(8192): 61664 nsec (61 usec), 16216.91 iops, 129735 Kb/s
strncmp(32768): 410711 nsec (410 usec), 2434.80 iops, 77913 Kb/s
strncmp(131072): 1738375 nsec (1738 usec), 575.24 iops, 73631 Kb/s
strncmp(524288): 6807887 nsec (6807 usec), 146.88 iops, 75206 Kb/s
strncmp(2097152): 27137821 nsec (27137 usec), 36.84 iops, 75466 Kb/s
----------------------------

Fortify source:

----------------------------
strcpy(8): 643 nsec (0 usec), 1555209.95 iops, 12150 Kb/s
strcpy(32): 359 nsec (0 usec), 2785515.32 iops, 87047 Kb/s
strcpy(128): 759 nsec (0 usec), 1317523.05 iops, 164690 Kb/s
strcpy(512): 2394 nsec (2 usec), 417710.94 iops, 208855 Kb/s
strcpy(2048): 8887 nsec (8 usec), 112523.91 iops, 225047 Kb/s
strcpy(8192): 35508 nsec (35 usec), 28162.66 iops, 225301 Kb/s
strcpy(32768): 294308 nsec (294 usec), 3397.80 iops, 108729 Kb/s
strcpy(131072): 1195600 nsec (1195 usec), 836.39 iops, 107059 Kb/s
strcpy(524288): 4457173 nsec (4457 usec), 224.35 iops, 114871 Kb/s
strcpy(2097152): 17823024 nsec (17823 usec), 56.10 iops, 114907 Kb/s
----------------------------
strncpy(8): 642 nsec (0 usec), 1557632.39 iops, 12169 Kb/s
strncpy(32): 401 nsec (0 usec), 2493765.58 iops, 77930 Kb/s
strncpy(128): 959 nsec (0 usec), 1042752.86 iops, 130344 Kb/s
strncpy(512): 3188 nsec (3 usec), 313676.28 iops, 156838 Kb/s
strncpy(2048): 12108 nsec (12 usec), 82590.01 iops, 165180 Kb/s
strncpy(8192): 47880 nsec (47 usec), 20885.54 iops, 167084 Kb/s
strncpy(32768): 299734 nsec (299 usec), 3336.28 iops, 106761 Kb/s
strncpy(131072): 1316430 nsec (1316 usec), 759.62 iops, 97232 Kb/s
strncpy(524288): 5391320 nsec (5391 usec), 185.48 iops, 94967 Kb/s
strncpy(2097152): 21335943 nsec (21335 usec), 46.86 iops, 95988 Kb/s
----------------------------
strcmp(8): 561 nsec (0 usec), 1782531.19 iops, 13926 Kb/s
strcmp(32): 394 nsec (0 usec), 2538071.06 iops, 79314 Kb/s
strcmp(128): 874 nsec (0 usec), 1144164.75 iops, 143020 Kb/s
strcmp(512): 2794 nsec (2 usec), 357909.80 iops, 178954 Kb/s
strcmp(2048): 10582 nsec (10 usec), 94500.09 iops, 189000 Kb/s
strcmp(8192): 41195 nsec (41 usec), 24274.78 iops, 194198 Kb/s
strcmp(32768): 331844 nsec (331 usec), 3013.46 iops, 96430 Kb/s
strcmp(131072): 1335663 nsec (1335 usec), 748.69 iops, 95832 Kb/s
strcmp(524288): 5354050 nsec (5354 usec), 186.77 iops, 95628 Kb/s
strcmp(2097152): 21476108 nsec (21476 usec), 46.56 iops, 95361 Kb/s
----------------------------
strncmp(8): 573 nsec (0 usec), 1745200.69 iops, 13634 Kb/s
strncmp(32): 476 nsec (0 usec), 2100840.33 iops, 65651 Kb/s
strncmp(128): 1197 nsec (1 usec), 835421.88 iops, 104427 Kb/s
strncmp(512): 4076 nsec (4 usec), 245338.56 iops, 122669 Kb/s
strncmp(2048): 15596 nsec (15 usec), 64119.00 iops, 128238 Kb/s
strncmp(8192): 61677 nsec (61 usec), 16213.49 iops, 129707 Kb/s
strncmp(32768): 411615 nsec (411 usec), 2429.45 iops, 77742 Kb/s
strncmp(131072): 1677657 nsec (1677 usec), 596.06 iops, 76296 Kb/s
strncmp(524288): 6803235 nsec (6803 usec), 146.98 iops, 75258 Kb/s
strncmp(2097152): 27052891 nsec (27052 usec), 36.96 iops, 75703 Kb/s
----------------------------

A solid slowdown at strcpy() when switching to string.c. And again
fortified variant is not affected.
Comparing functions are mostly faster on C.

II.3. Performance on uncached segment (CKSEG1, using
dma_alloc_coherent())

ASM inline functions:

----------------------------
strcpy(8): 1870 nsec (1 usec), 534759.35 iops, 4177 Kb/s
strcpy(32): 5687 nsec (5 usec), 175839.63 iops, 5494 Kb/s
strcpy(128): 22695 nsec (22 usec), 44062.56 iops, 5507 Kb/s
strcpy(512): 108924 nsec (108 usec), 9180.71 iops, 4590 Kb/s
strcpy(2048): 358105 nsec (358 usec), 2792.47 iops, 5584 Kb/s
strcpy(8192): 1432137 nsec (1432 usec), 698.25 iops, 5586 Kb/s
strcpy(32768): 5810379 nsec (5810 usec), 172.10 iops, 5507 Kb/s
strcpy(131072): 23170996 nsec (23170 usec), 43.15 iops, 5524 Kb/s
strcpy(524288): 92888520 nsec (92888 usec), 10.76 iops, 5511 Kb/s
strcpy(2097152): 371465896 nsec (371465 usec), 2.69 iops, 5513 Kb/s
----------------------------
strncpy(8): 1505 nsec (1 usec), 664451.82 iops, 5191 Kb/s
strncpy(32): 5996 nsec (5 usec), 166777.85 iops, 5211 Kb/s
strncpy(128): 22607 nsec (22 usec), 44234.08 iops, 5529 Kb/s
strncpy(512): 89688 nsec (89 usec), 11149.76 iops, 5574 Kb/s
strncpy(2048): 358135 nsec (358 usec), 2792.24 iops, 5584 Kb/s
strncpy(8192): 1495518 nsec (1495 usec), 668.66 iops, 5349 Kb/s
strncpy(32768): 5843265 nsec (5843 usec), 171.13 iops, 5476 Kb/s
strncpy(131072): 23250885 nsec (23250 usec), 43.00 iops, 5505 Kb/s
strncpy(524288): 92950378 nsec (92950 usec), 10.75 iops, 5508 Kb/s
strncpy(2097152): 371894801 nsec (371894 usec), 2.68 iops, 5506 Kb/s
----------------------------
strcmp(8): 1817 nsec (1 usec), 550357.73 iops, 4299 Kb/s
strcmp(32): 5797 nsec (5 usec), 172503.01 iops, 5390 Kb/s
strcmp(128): 22568 nsec (22 usec), 44310.52 iops, 5538 Kb/s
strcmp(512): 89908 nsec (89 usec), 11122.48 iops, 5561 Kb/s
strcmp(2048): 358188 nsec (358 usec), 2791.82 iops, 5583 Kb/s
strcmp(8192): 1503943 nsec (1503 usec), 664.91 iops, 5319 Kb/s
strcmp(32768): 5850655 nsec (5850 usec), 170.91 iops, 5469 Kb/s
strcmp(131072): 23287057 nsec (23287 usec), 42.94 iops, 5496 Kb/s
strcmp(524288): 93092045 nsec (93092 usec), 10.73 iops, 5499 Kb/s
strcmp(2097152): 372382048 nsec (372382 usec), 2.68 iops, 5499 Kb/s
----------------------------
strncmp(8): 1878 nsec (1 usec), 532481.35 iops, 4160 Kb/s
strncmp(32): 5904 nsec (5 usec), 169376.69 iops, 5293 Kb/s
strncmp(128): 22713 nsec (22 usec), 44027.64 iops, 5503 Kb/s
strncmp(512): 89880 nsec (89 usec), 11125.94 iops, 5562 Kb/s
strncmp(2048): 358413 nsec (358 usec), 2790.07 iops, 5580 Kb/s
strncmp(8192): 1504985 nsec (1504 usec), 664.45 iops, 5315 Kb/s
strncmp(32768): 5852808 nsec (5852 usec), 170.85 iops, 5467 Kb/s
strncmp(131072): 23296769 nsec (23296 usec), 42.92 iops, 5494 Kb/s
strncmp(524288): 93131195 nsec (93131 usec), 10.73 iops, 5497 Kb/s
strncmp(2097152): 372495582 nsec (372495 usec), 2.68 iops, 5498 Kb/s
----------------------------

C functions:

----------------------------
strcpy(8): 1805 nsec (1 usec), 554016.61 iops, 4328 Kb/s
strcpy(32): 5821 nsec (5 usec), 171791.78 iops, 5368 Kb/s
strcpy(128): 22555 nsec (22 usec), 44336.06 iops, 5542 Kb/s
strcpy(512): 109622 nsec (109 usec), 9122.25 iops, 4561 Kb/s
strcpy(2048): 358291 nsec (358 usec), 2791.02 iops, 5582 Kb/s
strcpy(8192): 1432059 nsec (1432 usec), 698.29 iops, 5586 Kb/s
strcpy(32768): 5828220 nsec (5828 usec), 171.57 iops, 5490 Kb/s
strcpy(131072): 23165778 nsec (23165 usec), 43.16 iops, 5525 Kb/s
strcpy(524288): 92814956 nsec (92814 usec), 10.77 iops, 5516 Kb/s
strcpy(2097152): 371301356 nsec (371301 usec), 2.69 iops, 5515 Kb/s
----------------------------
strncpy(8): 1697 nsec (1 usec), 589275.19 iops, 4603 Kb/s
strncpy(32): 5817 nsec (5 usec), 171909.91 iops, 5372 Kb/s
strncpy(128): 22587 nsec (22 usec), 44273.25 iops, 5534 Kb/s
strncpy(512): 89994 nsec (89 usec), 11111.85 iops, 5555 Kb/s
strncpy(2048): 358226 nsec (358 usec), 2791.53 iops, 5583 Kb/s
strncpy(8192): 1488054 nsec (1488 usec), 672.01 iops, 5376 Kb/s
strncpy(32768): 5842954 nsec (5842 usec), 171.14 iops, 5476 Kb/s
strncpy(131072): 23254716 nsec (23254 usec), 43.00 iops, 5504 Kb/s
strncpy(524288): 92968479 nsec (92968 usec), 10.75 iops, 5507 Kb/s
strncpy(2097152): 371878650 nsec (371878 usec), 2.68 iops, 5507 Kb/s
----------------------------
strcmp(8): 1688 nsec (1 usec), 592417.05 iops, 4628 Kb/s
strcmp(32): 5804 nsec (5 usec), 172294.96 iops, 5384 Kb/s
strcmp(128): 22517 nsec (22 usec), 44410.88 iops, 5551 Kb/s
strcmp(512): 89352 nsec (89 usec), 11191.68 iops, 5595 Kb/s
strcmp(2048): 358100 nsec (358 usec), 2792.51 iops, 5585 Kb/s
strcmp(8192): 1492326 nsec (1492 usec), 670.09 iops, 5360 Kb/s
strcmp(32768): 5850862 nsec (5850 usec), 170.91 iops, 5469 Kb/s
strcmp(131072): 23279940 nsec (23279 usec), 42.95 iops, 5498 Kb/s
strcmp(524288): 93109791 nsec (93109 usec), 10.73 iops, 5498 Kb/s
strcmp(2097152): 372277151 nsec (372277 usec), 2.68 iops, 5501 Kb/s
----------------------------
strncmp(8): 2088 nsec (2 usec), 478927.19 iops, 3741 Kb/s
strncmp(32): 6039 nsec (6 usec), 165590.32 iops, 5174 Kb/s
strncmp(128): 30812 nsec (30 usec), 32454.88 iops, 4056 Kb/s
strncmp(512): 89889 nsec (89 usec), 11124.82 iops, 5562 Kb/s
strncmp(2048): 391044 nsec (391 usec), 2557.25 iops, 5114 Kb/s
strncmp(8192): 1447395 nsec (1447 usec), 690.89 iops, 5527 Kb/s
strncmp(32768): 5858877 nsec (5858 usec), 170.67 iops, 5461 Kb/s
strncmp(131072): 23292701 nsec (23292 usec), 42.92 iops, 5495 Kb/s
strncmp(524288): 93169303 nsec (93169 usec), 10.73 iops, 5495 Kb/s
strncmp(2097152): 372475445 nsec (372475 usec), 2.68 iops, 5498 Kb/s
----------------------------

Fortify source:

----------------------------
strcpy(8): 1992 nsec (1 usec), 502008.03 iops, 3921 Kb/s
strcpy(32): 5867 nsec (5 usec), 170444.85 iops, 5326 Kb/s
strcpy(128): 22516 nsec (22 usec), 44412.85 iops, 5551 Kb/s
strcpy(512): 112520 nsec (112 usec), 8887.30 iops, 4443 Kb/s
strcpy(2048): 358263 nsec (358 usec), 2791.24 iops, 5582 Kb/s
strcpy(8192): 1432205 nsec (1432 usec), 698.22 iops, 5585 Kb/s
strcpy(32768): 5818716 nsec (5818 usec), 171.85 iops, 5499 Kb/s
strcpy(131072): 23186616 nsec (23186 usec), 43.12 iops, 5520 Kb/s
strcpy(524288): 92944126 nsec (92944 usec), 10.75 iops, 5508 Kb/s
strcpy(2097152): 371652750 nsec (371652 usec), 2.68 iops, 5510 Kb/s
----------------------------
strncpy(8): 1732 nsec (1 usec), 577367.20 iops, 4510 Kb/s
strncpy(32): 5742 nsec (5 usec), 174155.34 iops, 5442 Kb/s
strncpy(128): 22404 nsec (22 usec), 44634.88 iops, 5579 Kb/s
strncpy(512): 89606 nsec (89 usec), 11159.96 iops, 5579 Kb/s
strncpy(2048): 358219 nsec (358 usec), 2791.58 iops, 5583 Kb/s
strncpy(8192): 1476064 nsec (1476 usec), 677.47 iops, 5419 Kb/s
strncpy(32768): 5843889 nsec (5843 usec), 171.11 iops, 5475 Kb/s
strncpy(131072): 23238689 nsec (23238 usec), 43.03 iops, 5508 Kb/s
strncpy(524288): 93065521 nsec (93065 usec), 10.74 iops, 5501 Kb/s
strncpy(2097152): 372084985 nsec (372084 usec), 2.68 iops, 5504 Kb/s
----------------------------
strcmp(8): 1718 nsec (1 usec), 582072.17 iops, 4547 Kb/s
strcmp(32): 5867 nsec (5 usec), 170444.85 iops, 5326 Kb/s
strcmp(128): 22581 nsec (22 usec), 44285.01 iops, 5535 Kb/s
strcmp(512): 89765 nsec (89 usec), 11140.19 iops, 5570 Kb/s
strcmp(2048): 358054 nsec (358 usec), 2792.87 iops, 5585 Kb/s
strcmp(8192): 1465581 nsec (1465 usec), 682.32 iops, 5458 Kb/s
strcmp(32768): 5855974 nsec (5855 usec), 170.76 iops, 5464 Kb/s
strcmp(131072): 23229745 nsec (23229 usec), 43.04 iops, 5510 Kb/s
strcmp(524288): 93113133 nsec (93113 usec), 10.73 iops, 5498 Kb/s
strcmp(2097152): 372567129 nsec (372567 usec), 2.68 iops, 5496 Kb/s
----------------------------
strncmp(8): 1998 nsec (1 usec), 500500.50 iops, 3910 Kb/s
strncmp(32): 5967 nsec (5 usec), 167588.40 iops, 5237 Kb/s
strncmp(128): 22885 nsec (22 usec), 43696.74 iops, 5462 Kb/s
strncmp(512): 90107 nsec (90 usec), 11097.91 iops, 5548 Kb/s
strncmp(2048): 358220 nsec (358 usec), 2791.57 iops, 5583 Kb/s
strncmp(8192): 1497236 nsec (1497 usec), 667.89 iops, 5343 Kb/s
strncmp(32768): 5860543 nsec (5860 usec), 170.62 iops, 5460 Kb/s
strncmp(131072): 23240420 nsec (23240 usec), 43.02 iops, 5507 Kb/s
strncmp(524288): 93157833 nsec (93157 usec), 10.73 iops, 5496 Kb/s
strncmp(2097152): 372756234 nsec (372756 usec), 2.67 iops, 5494 Kb/s
----------------------------

III. As a conclusion

Considering that
1) strcpy() is generally deprecated and not recommended (and the
proposed alternative -- strscpy() -- is a C function that uses
word-at-a-time);
2) comparing functions implemented in C are faster on MIPS32;
3) MIPS64 used only C variants since day 0;
4) eliminating ASM inlines reduces total kernel size;
5) all sorts of hardening and fortifying become de facto standard
nowadays (I was hoping Dmitry's patch would hit 5.4 main pull),
I see the removal rather reasonable and worth trying.

The choice is yours, anyways.

> 
>> Thanks,
>>     Paul
> 
> Regards,
> ᚷ ᛖ ᚢ ᚦ ᚠ ᚱ

Regards,
ᚷ ᛖ ᚢ ᚦ ᚠ ᚱ
