Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43ACE40D1CE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Sep 2021 04:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbhIPC6C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Sep 2021 22:58:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233940AbhIPC6C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Sep 2021 22:58:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1927E6056B;
        Thu, 16 Sep 2021 02:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631761002;
        bh=sLebcC2qju/b5kEgaRMkyjuxt4lrYNpkvC3ixpK8/xU=;
        h=To:Cc:Subject:From:Date:From;
        b=A5kINMcuGZqFofPda5Lw6TA4m4XuJ9cRmJ0cPDPRZ1+kHcaw6J0ih4Q5vLOLSDgtZ
         TtboxF+F/ToSgJhtyI0wasp1IAksA35p6tX7rwTMbh3ZCjNvBli8X3Cq8IShOuQJl2
         WO8iW8WjlhwL2Wt41+C4XQLgTgxeNuXXWSSilsklutH+o94NuIUze6LueMJLSOs/zH
         IH3SheXgv91mCLnYGoGoyUmvtwInuwrgtsQmsHToUgY3ZrKKAA6LDU76tike8c9tWc
         JDlqMuYELGiwkxWVbfUAInX8z6oqAUm5DM36ob1Loa/Gi84C748G61cVUyd3j9j5Rn
         vG2ddMK6nI6ZA==
To:     ilya.lipnitskiy@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        liwei391@huawei.com, macro@orcam.me.uk, nbd@nbd.name,
        tsbogend@alpha.franken.de, yangtiezhu@loongson.cn
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
From:   Greg Ungerer <gerg@kernel.org>
Message-ID: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
Date:   Thu, 16 Sep 2021 12:56:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ilya,

> Most MT7621 SoCs have 2 cores, which is detected and supported properly
> by CPS.
> 
> Unfortunately, MT7621 SoC has a less common S variant with only one core.
> On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
> starting SMP. CPULAUNCH registers can be used in that case to detect the
> absence of the second core and override the GCR_CONFIG PCORES field.
> 
> Rework a long-standing OpenWrt patch to override the value of
> mips_cps_numcores on single-core MT7621 systems.
> 
> Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
> MT7621 device (Netgear R6220).

This is breaking core detection on my MT7621 based platforms.
I only get 2 cores detected now running 5.13. Reverting this change gives
me 4 cores back.

 From a fully working (pre-change) system I get:

# cat /proc/cpuinfo
system type		: MediaTek MT7621 ver:1 eco:3
machine			: Digi EX15
processor		: 0
cpu model		: MIPS 1004Kc V2.15
BogoMIPS		: 586.13
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VPE			: 0
VCED exceptions		: not available
VCEI exceptions		: not available

processor		: 1
cpu model		: MIPS 1004Kc V2.15
BogoMIPS		: 586.13
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VPE			: 1
VCED exceptions		: not available
VCEI exceptions		: not available

processor		: 2
cpu model		: MIPS 1004Kc V2.15
BogoMIPS		: 586.13
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 1
VPE			: 0
VCED exceptions		: not available
VCEI exceptions		: not available

processor		: 3
cpu model		: MIPS 1004Kc V2.15
BogoMIPS		: 586.13
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 1
VPE			: 1
VCED exceptions		: not available
VCEI exceptions		: not available


After this patch is applied:

# cat /proc/cpuinfo
system type		: MediaTek MT7621 ver:1 eco:3
machine			: Digi EX15
processor		: 0
cpu model		: MIPS 1004Kc V2.15
BogoMIPS		: 586.13
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VPE			: 0
VCED exceptions		: not available
VCEI exceptions		: not available

processor		: 1
cpu model		: MIPS 1004Kc V2.15
BogoMIPS		: 586.13
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa			: mips1 mips2 mips32r1 mips32r2
ASEs implemented	: mips16 dsp mt
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VPE			: 1
VCED exceptions		: not available
VCEI exceptions		: not available

Any ideas?

Regards
Greg


> Original 4.14 OpenWrt patch:
> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
> Current 5.10 OpenWrt patch:
> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
> 
> Suggested-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
> index fd43d876892e..35fb8ee6dd33 100644
> --- a/arch/mips/include/asm/mips-cps.h
> +++ b/arch/mips/include/asm/mips-cps.h
> @@ -10,6 +10,8 @@
>  #include <linux/io.h>
>  #include <linux/types.h>
>  
> +#include <asm/mips-boards/launch.h>
> +
>  extern unsigned long __cps_access_bad_size(void)
>  	__compiletime_error("Bad size for CPS accessor");
>  
> @@ -165,11 +167,30 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
>   */
>  static inline unsigned int mips_cps_numcores(unsigned int cluster)
>  {
> +	unsigned int ncores;
> +
>  	if (!mips_cm_present())
>  		return 0;
>  
>  	/* Add one before masking to handle 0xff indicating no cores */
> -	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> +	ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> +
> +	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> +		struct cpulaunch *launch;
> +
> +		/*
> +		 * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> +		 * always reports 2 cores. Check the second core's LAUNCH_FREADY
> +		 * flag to detect if the second core is missing. This method
> +		 * only works before the core has been started.
> +		 */
> +		launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> +		launch += 2; /* MT7621 has 2 VPEs per core */
> +		if (!(launch->flags & LAUNCH_FREADY))
> +			ncores = 1;
> +	}
> +
> +	return ncores;
>  }
>  
>  /**
> -- 
> 2.31.1

