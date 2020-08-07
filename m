Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE3123F16E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 18:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgHGQqM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 12:46:12 -0400
Received: from crapouillou.net ([89.234.176.41]:59882 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgHGQqL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Aug 2020 12:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596818768; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sg0VSA/NC4/y3Ug0VqDZBrWCK4m5IS0k3Mj+tZWcKto=;
        b=tyn0I2fT04dk1nVGpT0DuKhv48vVdgSq7SIMR4aWWV+xMJrEPeJfmTDFS9d/lPzLnJexoP
        6Kx2hYLvmlwucfbgAqZpbE8bWUFfPiDQjGNnY67BFHvreE71UVPU+eBb//OYz64408F+x8
        AK9xYb34wLyQgN199SfAa2bGFlv4dL0=
Date:   Fri, 07 Aug 2020 18:45:57 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?b?5ryG6bmP5oyv?= <aric.pzqi@ingenic.com>,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, xuwanhao@wanyeetech.com
Message-Id: <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>
In-Reply-To: <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>
References: <20200803170124.231110-1-paul@crapouillou.net>
        <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam. 8 ao=C3=BBt 2020 =C3=A0 0:23, Zhou Yanjie <zhouyanjie@wanyeetech.co=
m> a=20
=C3=A9crit :
> Hi Paul,
>=20
> I'm not too sure if remove "cpu-feature-overrides.h" will cause some=20
> problems for X2000, because according to my current test on X2000, I=20
> found that it is somewhat different from the SoCs using XBurst1 CPU=20
> core, with the kernel source code provided by Ingenic, for example,=20
> we must configure "#define cpu_has_tlbinv 1" in=20
> "cpu-feature-overrides.h" to make the X2000 work normally, otherwise=20
> the kernel will get stuck. And X2000's interrupt controller has also=20
> been redesigned. If these differences make it impossible to share=20
> code, should we set a subdirectory of "xburst" and "xburst2" in=20
> "arch/mips/ingenic"? (I am just worried about this situation, so far=20
> I have not been able to successfully run the mainline kernel on=20
> X2000).

The <cpu-feature-overrides.h> is kind of a hack, to hardcode settings=20
in case the CPU is not properly detected. The cpu-probe.c should be=20
able to auto-detect these settings, including the inverted TLB that the=20
X2000 has, reading from the CPU config registers ("TLB INV" info should=20
be in config4). Right now cpu_probe_ingenic() doesn't read config4 (not=20
present on older SoCs) but that's trivial to add.

As for your other question, I don't see any reason why we wouldn't be=20
able to support the X2000 aside the others in a generic kernel, so=20
don't worry :)

Cheers,
-Paul

>=20
> I have added some related engineers from Ingenic to CC
>=20
> Thanks and best regards!
>=20
> =E5=9C=A8 2020/8/4 =E4=B8=8A=E5=8D=881:01, Paul Cercueil =E5=86=99=E9=81=
=93:
>> Hi Thomas & list,
>>=20
>> Here is a set of patches for 5.10 (no rush) to move Ingenic support=20
>> from
>> arch/mips/jz4740/ to arch/mips/generic/.
>>=20
>> There are some Kconfig changes that I think should be reviewed in=20
>> detail
>> to avoid breakages elsewhere. The idea behind these changes is to=20
>> allow
>> the Ingenic "generic" code to be built in a non-generic kernel, since
>> generic kernels bring lots of dependencies which result in a +7% size
>> increase.
>>=20
>> Support for booting the generic kernel with a built-in and/or=20
>> appended
>> devicetree, as well as support for compressed (vmlinuz) kernels, has
>> been added as well.
>>=20
>> Cheers,
>> -Paul
>>=20
>> Paul Cercueil (13):
>>    MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
>>    MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
>>    MIPS: cpu-probe: ingenic: Fix broken BUG_ON
>>    MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
>>    MIPS: machine: Add get_system_type callback
>>    MIPS: generic: Call the machine's .get_system_type callback if
>>      provided
>>    MIPS: generic: Support booting with built-in or appended DTB
>>    MIPS: generic: Add support for zboot
>>    MIPS: generic: Increase NR_IRQS to 256
>>    MIPS: generic: Add support for Ingenic SoCs
>>    MIPS: jz4740: Drop folder
>>    MIPS: configs: Regenerate configs of Ingenic boards
>>    MAINTAINERS: Update paths to Ingenic platform code
>>=20
>>   MAINTAINERS                                   |   4 +-
>>   arch/mips/Kbuild.platforms                    |   1 -
>>   arch/mips/Kconfig                             |  43 ++++--
>>   arch/mips/configs/ci20_defconfig              |   4 +-
>>   arch/mips/configs/cu1000-neo_defconfig        |  16 +-
>>   arch/mips/configs/gcw0_defconfig              |   2 +-
>>   arch/mips/configs/qi_lb60_defconfig           |   5 +-
>>   arch/mips/configs/rs90_defconfig              |   4 +-
>>   arch/mips/generic/Kconfig                     |   8 +-
>>   arch/mips/generic/Makefile                    |   2 +-
>>   arch/mips/generic/Platform                    |   1 +
>>   arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
>>   arch/mips/generic/init.c                      |  28 +++-
>>   arch/mips/generic/proc.c                      |  25 ---
>>   arch/mips/include/asm/mach-generic/irq.h      |   2 +-
>>   .../asm/mach-jz4740/cpu-feature-overrides.h   |  50 ------
>>   arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
>>   arch/mips/include/asm/machine.h               |   1 +
>>   arch/mips/include/asm/pgtable-bits.h          |   5 -
>>   arch/mips/{jz4740 =3D> ingenic}/Kconfig         |  16 +-
>>   arch/mips/jz4740/Makefile                     |   9 --
>>   arch/mips/jz4740/Platform                     |   3 -
>>   arch/mips/jz4740/setup.c                      | 145=20
>> ------------------
>>   arch/mips/kernel/cpu-probe.c                  |   8 +-
>>   24 files changed, 198 insertions(+), 305 deletions(-)
>>   create mode 100644 arch/mips/generic/board-ingenic.c
>>   delete mode 100644 arch/mips/generic/proc.c
>>   delete mode 100644=20
>> arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
>>   delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
>>   rename arch/mips/{jz4740 =3D> ingenic}/Kconfig (91%)
>>   delete mode 100644 arch/mips/jz4740/Makefile
>>   delete mode 100644 arch/mips/jz4740/Platform
>>   delete mode 100644 arch/mips/jz4740/setup.c
>>=20


