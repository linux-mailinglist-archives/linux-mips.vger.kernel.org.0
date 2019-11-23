Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DCC107D71
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 08:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbfKWH3o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 02:29:44 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:35155 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfKWH3o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Nov 2019 02:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574494179;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=C3tq2C1FlgowlsVRn7oonUSXNm/jC4rx4yf32YwSpvI=;
        b=EfL3LYRmMJw1RjNg2YKI853nLmp5hzI8EEaKDARdm0wmqYCGbrAIGlPvWQcE6fISYB
        q9pDA65wyneoKfzqFtwca1uCS3IoGZGudhA9f5Qx/gdJgWysQqdhQc1sfyxDBtjA5/fM
        zkLy2WuakQGxRhk1dpRix86+uCB6iAocjUdWojxrdbM4kOWE+D6nmuKMLmA1dc4mAIu4
        z/QYn2re0KJA9iNL9kZNAwc+7eASEzKbGygjtMQUxuXsCVC8OpOcC5711XzUIDmOmlSK
        wQtypcFXOwr+XUc6yYq3p/lCi1OLNo7ppoxuV1bKfH3uRSj47mElWkCQnIHl+ZNDRlWn
        Ryvw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zrwDCoG68="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAN7TUtsN
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 23 Nov 2019 08:29:30 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re:MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com>
Date:   Sat, 23 Nov 2019 08:29:30 +0100
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <69EFB859-ED05-4C47-AC69-76CBBEC7C2DE@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Nobody with an idea?

> Am 17.11.2019 um 14:14 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Vincenzo,
>=20
>> Am 07.11.2019 um 17:21 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> Hi,
>> I am trying to run v5.4-rc6 on the CI20 board (jz4780) and it
>> is almost ok. Except one strange thing.
>>=20
>> If I install a v4.19.81 kernel I can initialize the
>> ethernet interface and dhclient works.
>>=20
>> If I install a v5.4-rc6 kernel on exactly the same
>> rootfs dhclient fails with
>>=20
>> root@letux:~# dhclient
>> ../../../../lib/isc/unix/time.c:200: Operation not permitted
>> root@letux:~#
>>=20
>> I have done some strace and the first significant difference
>> is that with v5.4-rc6 there is no gettimeofday syscall.
>>=20
>> Another symptom pointing in the same direction is that
>> after manually assigning an IP address I can run ping
>> but get strange time values.
>>=20
>> So it may be that
>>=20
>> 24640f233b46 mips: Add support for generic vDSO
>>=20
>> did break gettimeofday when used with latest Debian Stretch
>> libraries. I tried to git revert but there are conflicts.
>>=20
>> Just a side-note: both kernels work with Debian Jessie,
>> which likely has an older gettimeofday wrapper that
>> is not influenced by some subtle change.
>=20
> I finally found time to do a bisect and it confirms:
>=20
> 24640f233b466051ad3a5d2786d2951e43026c9d is the first bad commit
> commit 24640f233b466051ad3a5d2786d2951e43026c9d
> Author: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Date:   Fri Jun 21 10:52:46 2019 +0100
>=20
>    mips: Add support for generic vDSO
>=20
>    The mips vDSO library requires some adaptations to take advantage =
of the
>    newly introduced generic vDSO library.
>=20
>    Introduce the following changes:
>     - Modification of vdso.c to be compliant with the common vdso =
datapage
>     - Use of lib/vdso for gettimeofday
>=20
>    Cc: Ralf Baechle <ralf@linux-mips.org>
>    Cc: Paul Burton <paul.burton@mips.com>
>    Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>    [paul.burton@mips.com: Prepend $(src) to config-n32-o32-env.c =
path.]
>    Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> arch/mips/Kconfig                         |   2 +
> arch/mips/include/asm/vdso.h              |  78 +--------------
> arch/mips/include/asm/vdso/gettimeofday.h | 151 =
++++++++++++++++++++++++++++++
> arch/mips/include/asm/vdso/vdso.h         |  85 +++++++++++++++++
> arch/mips/include/asm/vdso/vsyscall.h     |  43 +++++++++
> arch/mips/kernel/vdso.c                   |  37 ++------
> arch/mips/vdso/Makefile                   |  33 ++++++-
> arch/mips/vdso/config-n32-o32-env.c       |  17 ++++
> arch/mips/vdso/elf.S                      |   2 +-
> arch/mips/vdso/sigreturn.S                |   2 +-
> arch/mips/vdso/vdso.h                     |  85 -----------------
> arch/mips/vdso/vgettimeofday.c            |  40 ++++++++
> 12 files changed, 378 insertions(+), 197 deletions(-)
> create mode 100644 arch/mips/include/asm/vdso/gettimeofday.h
> create mode 100644 arch/mips/include/asm/vdso/vdso.h
> create mode 100644 arch/mips/include/asm/vdso/vsyscall.h
> create mode 100644 arch/mips/vdso/config-n32-o32-env.c
> delete mode 100644 arch/mips/vdso/vdso.h
> create mode 100644 arch/mips/vdso/vgettimeofday.c
>=20
> So this patch intoruced in v5.4-rc1 breaks compatibility with Debian =
9.9
> user space assumptions.
>=20
> One thing seems strange to me:
>=20
> -/**
> - * union mips_vdso_data - Data provided by the kernel for the VDSO.
> - * @xtime_sec:         Current real time (seconds part).
> - * @xtime_nsec:                Current real time (nanoseconds part, =
shifted).
> - * @wall_to_mono_sec:  Wall-to-monotonic offset (seconds part).
> - * @wall_to_mono_nsec: Wall-to-monotonic offset (nanoseconds part).
> - * @seq_count:         Counter to synchronise updates (odd =3D =
updating).
> - * @cs_shift:          Clocksource shift value.
> - * @clock_mode:                Clocksource to use for time functions.
> - * @cs_mult:           Clocksource multiplier value.
> - * @cs_cycle_last:     Clock cycle value at last update.
> - * @cs_mask:           Clocksource mask value.
> - * @tz_minuteswest:    Minutes west of Greenwich (from timezone).
> - * @tz_dsttime:                Type of DST correction (from =
timezone).
> - *
> - * This structure contains data needed by functions within the VDSO. =
It is
> - * populated by the kernel and mapped read-only into user memory. The =
time
> - * fields are mirrors of internal data from the timekeeping =
infrastructure.
> - *
> - * Note: Care should be taken when modifying as the layout must =
remain the same
> - * for both 64- and 32-bit (for 32-bit userland on 64-bit kernel).
> - */
> union mips_vdso_data {
> -       struct {
> -               u64 xtime_sec;
> -               u64 xtime_nsec;
> -               u64 wall_to_mono_sec;
> -               u64 wall_to_mono_nsec;
> -               u32 seq_count;
> -               u32 cs_shift;
> -               u8 clock_mode;
> -               u32 cs_mult;
> -               u64 cs_cycle_last;
> -               u64 cs_mask;
> -               s32 tz_minuteswest;
> -               s32 tz_dsttime;
> -       };
> -
> +       struct vdso_data data[CS_BASES];
>        u8 page[PAGE_SIZE];
> };
>=20
> If I look at the definition of vdso_data it *is* significantly =
differen
> from mips_vdso_data.
>=20
> What I would assume is that the struct mips_vdso_data is embossed in =
user
> space code and therefore using vdso_data instead is breaking API.
>=20
> Please advise what I should try or check to narrow down further.
>=20
> BR and thanks,
> Nikolaus Schaller
>=20
> _______________________________________________
> http://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

