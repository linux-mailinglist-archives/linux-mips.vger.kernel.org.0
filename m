Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B260A23F12B
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 18:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgHGQXh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 12:23:37 -0400
Received: from out28-52.mail.aliyun.com ([115.124.28.52]:35813 "EHLO
        out28-52.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgHGQXb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 12:23:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07478463|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.10473-0.000723848-0.894546;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03273;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.IE4gdJm_1596817398;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IE4gdJm_1596817398)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sat, 08 Aug 2020 00:23:19 +0800
Subject: Re: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?B?5ryG6bmP5oyv?= <aric.pzqi@ingenic.com>,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, xuwanhao@wanyeetech.com
References: <20200803170124.231110-1-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>
Date:   Sat, 8 Aug 2020 00:23:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

I'm not too sure if remove "cpu-feature-overrides.h" will cause some 
problems for X2000, because according to my current test on X2000, I 
found that it is somewhat different from the SoCs using XBurst1 CPU 
core, with the kernel source code provided by Ingenic, for example, we 
must configure "#define cpu_has_tlbinv 1" in "cpu-feature-overrides.h" 
to make the X2000 work normally, otherwise the kernel will get stuck. 
And X2000's interrupt controller has also been redesigned. If these 
differences make it impossible to share code, should we set a 
subdirectory of "xburst" and "xburst2" in "arch/mips/ingenic"? (I am 
just worried about this situation, so far I have not been able to 
successfully run the mainline kernel on X2000).

I have added some related engineers from Ingenic to CC

Thanks and best regards!

ÔÚ 2020/8/4 ÉÏÎç1:01, Paul Cercueil Ð´µÀ:
> Hi Thomas & list,
>
> Here is a set of patches for 5.10 (no rush) to move Ingenic support from
> arch/mips/jz4740/ to arch/mips/generic/.
>
> There are some Kconfig changes that I think should be reviewed in detail
> to avoid breakages elsewhere. The idea behind these changes is to allow
> the Ingenic "generic" code to be built in a non-generic kernel, since
> generic kernels bring lots of dependencies which result in a +7% size
> increase.
>
> Support for booting the generic kernel with a built-in and/or appended
> devicetree, as well as support for compressed (vmlinuz) kernels, has
> been added as well.
>
> Cheers,
> -Paul
>
> Paul Cercueil (13):
>    MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
>    MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
>    MIPS: cpu-probe: ingenic: Fix broken BUG_ON
>    MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
>    MIPS: machine: Add get_system_type callback
>    MIPS: generic: Call the machine's .get_system_type callback if
>      provided
>    MIPS: generic: Support booting with built-in or appended DTB
>    MIPS: generic: Add support for zboot
>    MIPS: generic: Increase NR_IRQS to 256
>    MIPS: generic: Add support for Ingenic SoCs
>    MIPS: jz4740: Drop folder
>    MIPS: configs: Regenerate configs of Ingenic boards
>    MAINTAINERS: Update paths to Ingenic platform code
>
>   MAINTAINERS                                   |   4 +-
>   arch/mips/Kbuild.platforms                    |   1 -
>   arch/mips/Kconfig                             |  43 ++++--
>   arch/mips/configs/ci20_defconfig              |   4 +-
>   arch/mips/configs/cu1000-neo_defconfig        |  16 +-
>   arch/mips/configs/gcw0_defconfig              |   2 +-
>   arch/mips/configs/qi_lb60_defconfig           |   5 +-
>   arch/mips/configs/rs90_defconfig              |   4 +-
>   arch/mips/generic/Kconfig                     |   8 +-
>   arch/mips/generic/Makefile                    |   2 +-
>   arch/mips/generic/Platform                    |   1 +
>   arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
>   arch/mips/generic/init.c                      |  28 +++-
>   arch/mips/generic/proc.c                      |  25 ---
>   arch/mips/include/asm/mach-generic/irq.h      |   2 +-
>   .../asm/mach-jz4740/cpu-feature-overrides.h   |  50 ------
>   arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
>   arch/mips/include/asm/machine.h               |   1 +
>   arch/mips/include/asm/pgtable-bits.h          |   5 -
>   arch/mips/{jz4740 => ingenic}/Kconfig         |  16 +-
>   arch/mips/jz4740/Makefile                     |   9 --
>   arch/mips/jz4740/Platform                     |   3 -
>   arch/mips/jz4740/setup.c                      | 145 ------------------
>   arch/mips/kernel/cpu-probe.c                  |   8 +-
>   24 files changed, 198 insertions(+), 305 deletions(-)
>   create mode 100644 arch/mips/generic/board-ingenic.c
>   delete mode 100644 arch/mips/generic/proc.c
>   delete mode 100644 arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
>   delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
>   rename arch/mips/{jz4740 => ingenic}/Kconfig (91%)
>   delete mode 100644 arch/mips/jz4740/Makefile
>   delete mode 100644 arch/mips/jz4740/Platform
>   delete mode 100644 arch/mips/jz4740/setup.c
>
