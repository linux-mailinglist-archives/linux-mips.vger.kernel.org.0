Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A218B10CD06
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 17:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1Qru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 11:47:50 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:27892 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1Qru (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 11:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574959667;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iVDytJazQOiDcNx610UmMzH53A/xpQq868WTOOzaQD8=;
        b=FubLBC5bKxu0L4YEnhS2LjqIdXDt53d9ka+WYVdR+gVBxdpwFq8Lry6UZwvJfbTDLY
        Ja1Lq6iyxk8h8ugB43V2zN7i/bEpYcQOGKyj53bBbtDrAqKr7/gGcVxRLz9MnwsLsQVV
        Qbb/lqsioufVmrcsJTF2+RNES67Zaedwe/JhJKLQjUBDWQf4bFaDu2il6ycMJr6Wqn+b
        DuDtwB4/ijUGIfRdEu4l3pXYeM1ektt+guywc59nQjI6ysjq4evl3Fp3e6NE6WZDwa6K
        PnMTIdZM9VMfpNRnVWIqCHhVRbN4HR7XQV/SpQBhfsyq2Z8CO60MpoLskhuMJlZHCStO
        gKbw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASGldLGm
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 17:47:39 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com>
Date:   Thu, 28 Nov 2019 17:47:38 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF04DB35-9DBA-4297-8FCA-BB422A56DFEC@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com> <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com> <4807842.gtHLO0kk0V@hyperion> <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com> <20191128150721.GA20142@alpha.franken.de> <4F75970F-81DA-4727-8ADC-17CF6D77829B@goldelico.com> <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Vincenzo,

> Am 28.11.2019 um 16:46 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
>=20
> On 28/11/2019 15:41, H. Nikolaus Schaller wrote:
>>=20
>>> Am 28.11.2019 um 16:07 schrieb Thomas Bogendoerfer =
<tsbogend@alpha.franken.de>:
>>>=20
>>> On Thu, Nov 28, 2019 at 02:48:46PM +0100, H. Nikolaus Schaller =
wrote:
>>>>=20
>>>> What still does not fit into the picture is the errno =3D 1 i.e. =
EPERM.
>>>> Maybe I have to study the libc code that tries to read the ELF =
symbols
>>>> you have mentioned. It may fail for unknown reasons.
>>>=20
>>> to understand vdso you might look at arch/mips/vdso and lib/vdso
>>> kernel sources.
>>=20
>> Yes that is what I know, but I do not know how glibc can return an =
EPERM
>> through VDSO.
>>=20
>>>=20
>>> And if I understand it correctly you neither have a working high =
resolution
>>> timer usable bei do_hres() in lib/vdso/gettimeofday.c or a working
>>> gettimeofday_fallback(), which is enabled via =
CONFIG_MIPS_CLOCK_VSYSCALL
>>> and needs either CSRC_R4K or CLKSRC_MIPS_GIC.
>>=20
>> Well, on kernel v4.19 or using v5.4 with Jessie, gettimeofday() =
works.
>>=20
>> So this may only be part of the reason it starts to fail with commit
>> 24640f233b466051ad3a5d2786d2951e43026c9d.
>>=20
>> MIPS_CLOCK_VSYSCALL is neither defined nor undefined in the =
defconfig.
>> And removed if I manually add it to my defconfig.
>> And yes, it depends on either CSRC_R4K || CLKSRC_MIPS_GIC by =
arch/mips/Kconfig.
>>=20
>> Maybe this was just forgotten to properly handle for the =
ci20_defconfig
>> or jz4780?
>>=20
>> What does CSRC_R4K resp. CLKSRC_MIPS_GIC ecactly mean? Does the =
jz4780 have this
>> feature?
>>=20
>=20
> I think I know what is going on, it is the way on which libc does the =
fallback.
> Could you please try the patch below the scissors and let me know if =
it works?

Well, it does not immediately compile because CONFIG_MIPS_CLOCK_VSYSCALL =
is not
set and can not be configured by normal means:

Error:

/Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c: In function =
'__cvdso_gettimeofday':
/Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c:152:4: error: =
implicit declaration of function 'gettimeofday_fallback' =
[-Werror=3Dimplicit-function-declaration]
    return gettimeofday_fallback(tv, tz);
    ^

So I force-#defined CONFIG_MIPS_CLOCK_VSYSCALL in =
arch/mips/include/asm/vdso/gettimeofday.h
which is also included by lib/vdso/gettimeofday.c

Yes, it works now! Great!!!

root@letux:~# ./gettime=20
r =3D 0 errno=3D0
tv.sec =3D 1574959485
tv.usec =3D 671306
rt =3D 1574959485 errno=3D0
t =3D 1574959485
root@letux:~# cat /etc/debian_version=20
9.11
root@letux:~# uname -a
Linux letux 5.4.0-letux-l400+ #1490 PREEMPT Thu Nov 28 17:23:32 CET 2019 =
mips GNU/Linux
root@letux:~# dhclient
root@letux:~#=20

> If it does I will create a proper one.

It needs some mechanism to set CONFIG_MIPS_CLOCK_VSYSCALL.

I'll test if you have something new.

BR and thanks,
Nikolaus


