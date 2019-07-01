Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3112E5C3A0
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 21:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfGAT13 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 15:27:29 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:55952 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726695AbfGAT13 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Jul 2019 15:27:29 -0400
Received: from [192.168.1.13] (c-73-132-78-152.hsd1.md.comcast.net [73.132.78.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 357E7346D98;
        Mon,  1 Jul 2019 19:27:27 +0000 (UTC)
From:   Joshua Kinard <kumba@gentoo.org>
Subject: Re: SGI-IP30
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop>
 <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CA+QBN9CtbYmTnUNyvohifcHQ03+kURZBPJ=CQRrCw0euDe-u9A@mail.gmail.com>
Openpgp: preference=signencrypt
Message-ID: <921d1771-a99e-4378-fd32-b4879a05d4d8@gentoo.org>
Date:   Mon, 1 Jul 2019 15:27:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9CtbYmTnUNyvohifcHQ03+kURZBPJ=CQRrCw0euDe-u9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/26/2019 01:49, Carlo Pisani wrote:>> SMP works fine, on my machine at
least.  I got it working back in 4.4 a few
>> years ago, and it's largely just worked fine since then on the one machine I
>> have.
>
> here I am with
> - kernel v4.18.20 + Gentoo patches
> - mips64-unknown-linux-gnu {binutils v2.29.1, gcc-v7.4.0) emerged by
> Gentoo crossdev
>
> crossdev --b 2.30-2 --g 8.2.0  --l 2.22-r1 --k 4.3 -s2 -A n32 -t
> mips64-unknown-linux-gnu --without-headers -v
>
> my Octane is
>>> hinv
>                    System: IP30
>                 Processor: 600 Mhz R14000, 2M secondary cache
>                 Processor: 600 Mhz R14000, 2M secondary cache, (cpu 1)
>               Memory size: 1536 Mbytes
>                   Network: ef0 ethernet (100/10 base-T)
>                 SCSI Disk: scsi(0)disk(1)
>                 SCSI Disk: scsi(0)disk(2)
>                 SCSI Disk: scsi(0)disk(3)
>                     Audio: RAD Audio Processor
>
> (yes, there is no GFX, it's a headless configuration)
>
> my test reports:
>
> kernel type
> - No Forced Preemption: stable
> - Voluntary Kernel Preemption: it works, but it has some issues with
> smp_stop() and panic()
> - Preemptible Kernel: completely unstable, the kernel panics in 20 seconds
>
> I have a ram-rootfs, based on uclibc/mips3-be. It's attached to the
> kernel, so "bash" is the first process.
>
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE="../rootfs/mips3be-uclibc-2008"
> CONFIG_INITRAMFS_ROOT_UID=0
> CONFIG_INITRAMFS_ROOT_GID=0
> CONFIG_RD_GZIP=y
>
> I have three SCSI hard drives, and they do work, but I prefer net-booing
>
> Once booted, it works properly. The 20-hours burning-in test is passed!
> (two gcc sessions + nbench in a while(1) { do(); } loop )
>
> When I exit from "bash", the kernel correctly calls the panic()
> function, which calls ip30_machine_restart()
> (arch/mips/sgi-ip30/ip30-power.c) but this function is not able to
> restart the Octane, so it simply hangs and I have to manually force a
> hardware reset. Sometimes the machine seems gone insane, and I have to
> press the "reset" button several times before I can see the red light.

Yeah, I get this sometimes on a normal reboot from userland.  You usually
have to press reset twice, one second apart.  If it works, the system
LED/bulb will blink once, then it'll "click" and the red LED will come on
for a few seconds indicating PROM reset.  It may be a bug in the PROM
somewhere, or a bug in how the Octane's Linux restart code works.  The
restart code literally just flips a specific register in HEART to trigger a
reset.  It is possible there needs to be some special housekeeping done
beforehand so that HEART doesn't wind up in an unknown hardware state, which
I suspect is the underlying problem.


> the solution is adding "isolcpus=1" to command line. This way the
> kernel does reboot/restart correctly.

I'll have to look into that kernel flag.  I haven't heard of it before.


> I have also fixed the power-down function (ds1685_rtc_poweroff_ip30,
> drivers/rtc/rtc-ds1685.c) since the kernel does not power down, it
> simply hangs forever.

I believe Thomas found and fixed the bug in it recently and sent it upstream
(or was that something else?).  I remember the shutdown function working in
the past, but assumed something upstream broke it, or something upstream
exposed an existing bug that causes this breakage now.


> /*
>  * sgi-ip30
>  * ========
>  *
>  * ds1685_rtc_poweroff_ip30 - uses the RTC chip to power the system off.
>  * @pdev: pointer to platform_device structure.
>  */
> void __noreturn
> ds1685_rtc_poweroff_ip30(struct platform_device *pdev)
> {
[snip]

> }
> EXPORT_SYMBOL(ds1685_rtc_poweroff_ip30);
>
> This source comes from kernel 2.6.17, and it works properly. Instead
> of patching the existing ds1685_rtc_poweroff(), I have just created a
> dedicated function ds1685_rtc_poweroff_ip30() ...

Are you sure that's from 2.6.17?  I believe I cribbed the basic logic for
RTC shutdown from O2 (IP32), which uses the same RTC chip, and I did most of
my work on the RTC driver during the 3.x kernel series, getting rtc-ds1685.c
added with the release of Linux 4.0 in 2015.

Could you do a diff against the 4.18 kernel source so I can more easily see
the changed logic?


> Everything I have tried with the PCI ... doesn't work. The ShoeHorn
> panics the kernel, the ShoeBox seems to have quirks

Can you make sure that you don't have a Rev A or Rev B BRIDGE chip on that
shoehorn?  There are known issues/errata with those revs.  The Octane
Shoebox usually carries a Rev C BRIDGE, and the system board a Rev D BRIDGE
(except for very old boards I think).  I don't know the .  I can't promise
that every Rev A/B errata is worked around (or can be worked around).  I
know I added one or two extra cases that I found buried in the 2.5.70 IA64
Altix port code that was obviously cribbed from IRIX by SGI themselves.  But
I think those were for Rev C...

Also, I'll add that PCI support on these SGI machines usually works by the
sheer force of luck alone.  The one PCI card I have in my shoebox is a Tigon
II 1gbps ethernet card (copper), commonly marketed as an SGI Acenic.  It's
one of the few cards that's generally worked w/o issue (and a good
substitute for the annoying IOC3 ethernet), likely because it's an SGI part.
 I haven't tested much beyond that, since my Octane is primarily a build box
these days.

I personally have never had luck with USB flash drives, except OHCI USB1.x
on a Via USB controller years ago.  Sparc systems also had issues way back
then w/ USB mass storage because a lot of PCI drivers assumed everything in
Linux was little-endian.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic

