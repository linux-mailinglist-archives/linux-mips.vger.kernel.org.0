Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE92F41DB2B
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 15:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350919AbhI3NhI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 09:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350880AbhI3NhG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 09:37:06 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F11C06176D;
        Thu, 30 Sep 2021 06:35:23 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id 37so4191583uaq.11;
        Thu, 30 Sep 2021 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/QUivUu+g2Q0vG6nAAZHcnENvPt3rj5C9WJJN5yQbTE=;
        b=Mof2phEfvzH4oH3IMKiZ+GQBxVpbV/jk4m9GXWboYWWJ6pCLIJilIgSxWRtocPIVJo
         smHk/8qGEQQyaSaWYG3If8MV4G9Z1aBRv2SN5dHKTmxOGRguWCuN+a8p3fjYDywoBrc5
         0Axw6f91RbyXSfGKEydEpUP4IYSMIkfgqQ0F/kBJhKbOVsPDhUZCvE9jBHHxhKD3vkLX
         OTkB42ciDWtvER+HWgJqQ+eBz+F3jxtM18qPG3blsP+p20bK+2+NCwFiWaO2DlDMuTTx
         dt+9Lc2n1LTV/SOqDJoacbNi894Ca4kVbmBnyOn2CQKlzVG+bNdX6Q3vul+5sabEX/6M
         E9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/QUivUu+g2Q0vG6nAAZHcnENvPt3rj5C9WJJN5yQbTE=;
        b=CZ+G5RC3ELOBYYYQlX3sULNH+Tvy82wnfg2JMPKkdl50ivaOuB38F+t1zKJOlrVx4/
         XBfe+XPF9VNAeA6xwtYDmdlnqBMH4xISsDzrBTuFs+3lq4mwxWpPQ2Cx7UC+JbDTLx2v
         gza0JCNqY0ZJbiADptfG9pKYdqMVi8HFPs4L2GD8up1djAop6w3lVzkltgDWOdX+E7/L
         J4ziOq2rSoOUFCaG4d5SOD2y04GpKbo1iAclBo/nSmhyp/wyzl0HcXTp8xUXxo1HtYXj
         jjttoECFBTNRoXqqNITR0ww4YTRjN0OrTwyanE4QcogEY5ARcbpGcMsF+BlcHuh+Iv4x
         M50w==
X-Gm-Message-State: AOAM531hICkpprVYjGyfgENTyjvFL25PSAc0p8skJbF+ZbO9fY/YCykA
        mNaT8BK1/bkCUpbl5Go3iN4qGBtWwfdThrQL7iA=
X-Google-Smtp-Source: ABdhPJzqqtu+AqCDgvwExxKqKhYKktgfkhuEF454BK9DG6NGPcKSIgMqWhL6kUvVWjrJlxCtp3GcVnEc7kiY4SqvO2g=
X-Received: by 2002:ab0:7588:: with SMTP id q8mr2153623uap.46.1633008922655;
 Thu, 30 Sep 2021 06:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
 <07fc9510-148a-4ae9-e240-7d5402e0e2d7@gmail.com> <3cc110b0-42cc-d6e0-0404-c5dfc6cd9248@kernel.org>
In-Reply-To: <3cc110b0-42cc-d6e0-0404-c5dfc6cd9248@kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 30 Sep 2021 15:35:11 +0200
Message-ID: <CAMhs-H9_wMHsgGbTBxa7_hx+02+VqeK4e_jVPUhWd7LfLRAaVA@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
To:     Greg Ungerer <gerg@kernel.org>
Cc:     Strontium <strntydog@gmail.com>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>, liwei391@huawei.com,
        macro@orcam.me.uk, nbd@nbd.name,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

On Thu, Sep 30, 2021 at 3:13 PM Greg Ungerer <gerg@kernel.org> wrote:
>
> Hi Steven,
>
> On 16/9/21 6:54 pm, Strontium wrote:
> > Hi Greg,
> >
> > I had trouble with this as well.  This line from the patch:
> >
> >> if (!(launch->flags & LAUNCH_FREADY))
> >
> > is checking ram which I believe is supposed to be set by the bootloader.
> > On my platform it looked like the preloaded uboot wasn't setting that as
> > expected.
> > If you have control over your bootloader you can force this ram address
> > to be what the kernel wants, or you can do what i did, because i didn't
> > have that targets uboot src, and wedge before the kernel starts to force
> > the ram to the required state, like so:
>
> Well, my solution was to revert that patch locally :-)
>
> But many people will not have control of or the desire to change
> their u-boot loader. I would have figured this ends up being a
> real regression for many (most?) users of this SoC.

Agree.

>
>
> > #define CORE0_INITIAL_CPU_STATE (0xf00)
> > #define CORE_FL_OFFSET (0x1C)
> > #define FLAG_LAUNCH_FREADY (1)
> >
> > #define WRITEREG(r, v) *(volatile uint32_t *)(r) = v
> > #define KSEG1ADDR(_x) (((_x)&0x1fffffff) | 0xa0000000)
> >
> > void set_core(uint32_t core)
> > {
> >      uint32_t start = CORE0_INITIAL_CPU_STATE + (0x40 * core);
> >      WRITEREG(KSEG1ADDR(start + CORE_FL_OFFSET), FLAG_LAUNCH_FREADY);
> > }
> >
> > void fix_cores(void) {
> >      // Fixes the flags for each core, just before running the kernel.
> >      // Means we don't have to patch the kernel check for valid CPU's.
> >      for (int i = 0; i < 4; i++) {
> >          set_core(i);
> >      }
> > }
> >
> > It seems that memory section is supposed to set all the cores registers
> > before the kernel runs, but i never found it did anything except that 1
> > flag.
> >
> > Obviously a better way would be to properly detect the number of cores
> > and not rely on the boot loader to set a flag in ram, I don't know if
> > that's even possible.
>
> I can't help but think this commit is not a proper fix for this problem.

I also do think this commit should be reverted. Ilya, do you have a
strong opinion to maintain it instead?

>
> Regards
> Greg

Best regards,
    Sergio Paracuellos
>
>
> > Steven Johnson
> >
> > On 16/9/21 09:56, Greg Ungerer wrote:
> >> Hi Ilya,
> >>
> >>> Most MT7621 SoCs have 2 cores, which is detected and supported properly
> >>> by CPS.
> >>>
> >>> Unfortunately, MT7621 SoC has a less common S variant with only one
> >>> core.
> >>> On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
> >>> starting SMP. CPULAUNCH registers can be used in that case to detect the
> >>> absence of the second core and override the GCR_CONFIG PCORES field.
> >>>
> >>> Rework a long-standing OpenWrt patch to override the value of
> >>> mips_cps_numcores on single-core MT7621 systems.
> >>>
> >>> Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
> >>> MT7621 device (Netgear R6220).
> >>
> >> This is breaking core detection on my MT7621 based platforms.
> >> I only get 2 cores detected now running 5.13. Reverting this change gives
> >> me 4 cores back.
> >>
> >>  From a fully working (pre-change) system I get:
> >>
> >> # cat /proc/cpuinfo
> >> system type        : MediaTek MT7621 ver:1 eco:3
> >> machine            : Digi EX15
> >> processor        : 0
> >> cpu model        : MIPS 1004Kc V2.15
> >> BogoMIPS        : 586.13
> >> wait instruction    : yes
> >> microsecond timers    : yes
> >> tlb_entries        : 32
> >> extra interrupt vector    : yes
> >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> >> 0x0ffc, 0x0ffb, 0x0ffb]
> >> isa            : mips1 mips2 mips32r1 mips32r2
> >> ASEs implemented    : mips16 dsp mt
> >> shadow register sets    : 1
> >> kscratch registers    : 0
> >> package            : 0
> >> core            : 0
> >> VPE            : 0
> >> VCED exceptions        : not available
> >> VCEI exceptions        : not available
> >>
> >> processor        : 1
> >> cpu model        : MIPS 1004Kc V2.15
> >> BogoMIPS        : 586.13
> >> wait instruction    : yes
> >> microsecond timers    : yes
> >> tlb_entries        : 32
> >> extra interrupt vector    : yes
> >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> >> 0x0ffc, 0x0ffb, 0x0ffb]
> >> isa            : mips1 mips2 mips32r1 mips32r2
> >> ASEs implemented    : mips16 dsp mt
> >> shadow register sets    : 1
> >> kscratch registers    : 0
> >> package            : 0
> >> core            : 0
> >> VPE            : 1
> >> VCED exceptions        : not available
> >> VCEI exceptions        : not available
> >>
> >> processor        : 2
> >> cpu model        : MIPS 1004Kc V2.15
> >> BogoMIPS        : 586.13
> >> wait instruction    : yes
> >> microsecond timers    : yes
> >> tlb_entries        : 32
> >> extra interrupt vector    : yes
> >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> >> 0x0ffc, 0x0ffb, 0x0ffb]
> >> isa            : mips1 mips2 mips32r1 mips32r2
> >> ASEs implemented    : mips16 dsp mt
> >> shadow register sets    : 1
> >> kscratch registers    : 0
> >> package            : 0
> >> core            : 1
> >> VPE            : 0
> >> VCED exceptions        : not available
> >> VCEI exceptions        : not available
> >>
> >> processor        : 3
> >> cpu model        : MIPS 1004Kc V2.15
> >> BogoMIPS        : 586.13
> >> wait instruction    : yes
> >> microsecond timers    : yes
> >> tlb_entries        : 32
> >> extra interrupt vector    : yes
> >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> >> 0x0ffc, 0x0ffb, 0x0ffb]
> >> isa            : mips1 mips2 mips32r1 mips32r2
> >> ASEs implemented    : mips16 dsp mt
> >> shadow register sets    : 1
> >> kscratch registers    : 0
> >> package            : 0
> >> core            : 1
> >> VPE            : 1
> >> VCED exceptions        : not available
> >> VCEI exceptions        : not available
> >>
> >>
> >> After this patch is applied:
> >>
> >> # cat /proc/cpuinfo
> >> system type        : MediaTek MT7621 ver:1 eco:3
> >> machine            : Digi EX15
> >> processor        : 0
> >> cpu model        : MIPS 1004Kc V2.15
> >> BogoMIPS        : 586.13
> >> wait instruction    : yes
> >> microsecond timers    : yes
> >> tlb_entries        : 32
> >> extra interrupt vector    : yes
> >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> >> 0x0ffc, 0x0ffb, 0x0ffb]
> >> isa            : mips1 mips2 mips32r1 mips32r2
> >> ASEs implemented    : mips16 dsp mt
> >> shadow register sets    : 1
> >> kscratch registers    : 0
> >> package            : 0
> >> core            : 0
> >> VPE            : 0
> >> VCED exceptions        : not available
> >> VCEI exceptions        : not available
> >>
> >> processor        : 1
> >> cpu model        : MIPS 1004Kc V2.15
> >> BogoMIPS        : 586.13
> >> wait instruction    : yes
> >> microsecond timers    : yes
> >> tlb_entries        : 32
> >> extra interrupt vector    : yes
> >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> >> 0x0ffc, 0x0ffb, 0x0ffb]
> >> isa            : mips1 mips2 mips32r1 mips32r2
> >> ASEs implemented    : mips16 dsp mt
> >> shadow register sets    : 1
> >> kscratch registers    : 0
> >> package            : 0
> >> core            : 0
> >> VPE            : 1
> >> VCED exceptions        : not available
> >> VCEI exceptions        : not available
> >>
> >> Any ideas?
> >>
> >> Regards
> >> Greg
> >>
> >>
> >>> Original 4.14 OpenWrt patch:
> >>> Link:
> >>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
> >>> Current 5.10 OpenWrt patch:
> >>> Link:
> >>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
> >>>
> >>> Suggested-by: Felix Fietkau <nbd@nbd.name>
> >>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> >>> ---
> >>>   arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
> >>>   1 file changed, 22 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/mips/include/asm/mips-cps.h
> >>> b/arch/mips/include/asm/mips-cps.h
> >>> index fd43d876892e..35fb8ee6dd33 100644
> >>> --- a/arch/mips/include/asm/mips-cps.h
> >>> +++ b/arch/mips/include/asm/mips-cps.h
> >>> @@ -10,6 +10,8 @@
> >>>   #include <linux/io.h>
> >>>   #include <linux/types.h>
> >>>
> >>> +#include <asm/mips-boards/launch.h>
> >>> +
> >>>   extern unsigned long __cps_access_bad_size(void)
> >>>       __compiletime_error("Bad size for CPS accessor");
> >>>
> >>> @@ -165,11 +167,30 @@ static inline uint64_t
> >>> mips_cps_cluster_config(unsigned int cluster)
> >>>    */
> >>>   static inline unsigned int mips_cps_numcores(unsigned int cluster)
> >>>   {
> >>> +    unsigned int ncores;
> >>> +
> >>>       if (!mips_cm_present())
> >>>           return 0;
> >>>
> >>>       /* Add one before masking to handle 0xff indicating no cores */
> >>> -    return (mips_cps_cluster_config(cluster) + 1) &
> >>> CM_GCR_CONFIG_PCORES;
> >>> +    ncores = (mips_cps_cluster_config(cluster) + 1) &
> >>> CM_GCR_CONFIG_PCORES;
> >>> +
> >>> +    if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> >>> +        struct cpulaunch *launch;
> >>> +
> >>> +        /*
> >>> +         * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> >>> +         * always reports 2 cores. Check the second core's
> >>> LAUNCH_FREADY
> >>> +         * flag to detect if the second core is missing. This method
> >>> +         * only works before the core has been started.
> >>> +         */
> >>> +        launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> >>> +        launch += 2; /* MT7621 has 2 VPEs per core */
> >>> +        if (!(launch->flags & LAUNCH_FREADY))
> >>> +            ncores = 1;
> >>> +    }
> >>> +
> >>> +    return ncores;
> >>>   }
> >>>
> >>>   /**
> >>> --
> >>> 2.31.1
> >>
> >
