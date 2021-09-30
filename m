Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2421A41DF51
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 18:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352212AbhI3QnV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 12:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352189AbhI3QnT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 12:43:19 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1BAC06176A;
        Thu, 30 Sep 2021 09:41:36 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id i62so8405282ioa.6;
        Thu, 30 Sep 2021 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=plVtPKbW0TH3QmCSauyQdRXU87wK9uh8O7d34H6c7rU=;
        b=aFdVkwKHhomrOF/MUjyPnlmVMR/0BF5nIaL7FgGEQAdWX4TKHAkKEfbwQJ527324SI
         O/xjbrwaAwhGjYJhSyp+JGT6mh0jMwdrVJVqWz0FIpq+udHpJiCgiWo7pa+l+1nN8J4o
         9gICHsgohYbH1P4O4ft88BlCA1YR1mqPwX/aPBhqDDw2ym4Q6lGMCHW6Zc78KgCHSrAv
         TeHhvGCy6i0fcSqCN2b3OIh3+Ml29nrgMcyObOowr90ecSd9SUwskYxsTnMwnrgtg6gJ
         H2eMC2rlHWXmbBSCMHzr6fi8u3s3j4ByT1UYUjecOaQxnAMPUr2uGZmXT97frr9GvFhU
         IEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=plVtPKbW0TH3QmCSauyQdRXU87wK9uh8O7d34H6c7rU=;
        b=U55Di1utcL2EnG1p4e6xtsNNgcJItx8bPez4GKfC8B22aFMxBYdipEXtTP0ZSMNxE4
         lWs1eu4Uhj7sMsqDwSFB0ezaIQc7BU8267ma+nhNQyWE4QiMt4FlaPivsVY4uww/dDCZ
         4AUDLcWQFKnYyxFi6Lr5UDDhRvFzdqWEJrNJpapd8BfSJab0dhkBCdt8CclNK0/+xpFq
         +WQDKaujcbOpta5bmS48xpph4uXcEJiNLNC7Z+XJWpEQckoUDiNgVznH+p2e8orm7jtD
         XDGk7UFa/F81vEWV46N1400NP4wpr1i8D+l1gIzi1lm/UGi3NvwzCrqfuZwiAnu1xIrc
         itrg==
X-Gm-Message-State: AOAM533oVKh6GboXQbZLKnmhgBRKtv5wc8PX9/pR/vNRNctA9ln7qbVi
        oYcontM48OR43QOC0SgxPYNtnaWIPHO7lArnAP4=
X-Google-Smtp-Source: ABdhPJwwK+XcZHo5l0mELZuKFgq2f3Tev6bk2QJbACKzPW9YdnSEBCdOq2VUnuriM0a9fThsBsPUMouVueesQpjdNPc=
X-Received: by 2002:a05:6638:14b:: with SMTP id y11mr5665573jao.34.1633020095861;
 Thu, 30 Sep 2021 09:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
 <07fc9510-148a-4ae9-e240-7d5402e0e2d7@gmail.com> <3cc110b0-42cc-d6e0-0404-c5dfc6cd9248@kernel.org>
 <CAMhs-H9_wMHsgGbTBxa7_hx+02+VqeK4e_jVPUhWd7LfLRAaVA@mail.gmail.com>
In-Reply-To: <CAMhs-H9_wMHsgGbTBxa7_hx+02+VqeK4e_jVPUhWd7LfLRAaVA@mail.gmail.com>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Thu, 30 Sep 2021 09:41:25 -0700
Message-ID: <CALCv0x1pChoPKC2nm_GSS3VypAQ6OgdzD00HrtniPksg9ebSmw@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Greg Ungerer <gerg@kernel.org>, Strontium <strntydog@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Wei Li <liwei391@huawei.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Felix Fietkau <nbd@nbd.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergio, Greg, Steven,

On Thu, Sep 30, 2021 at 6:35 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Greg,
>
> On Thu, Sep 30, 2021 at 3:13 PM Greg Ungerer <gerg@kernel.org> wrote:
> >
> > Hi Steven,
> >
> > On 16/9/21 6:54 pm, Strontium wrote:
> > > Hi Greg,
> > >
> > > I had trouble with this as well.  This line from the patch:
> > >
> > >> if (!(launch->flags & LAUNCH_FREADY))
> > >
> > > is checking ram which I believe is supposed to be set by the bootloader.
> > > On my platform it looked like the preloaded uboot wasn't setting that as
> > > expected.
> > > If you have control over your bootloader you can force this ram address
> > > to be what the kernel wants, or you can do what i did, because i didn't
> > > have that targets uboot src, and wedge before the kernel starts to force
> > > the ram to the required state, like so:
> >
> > Well, my solution was to revert that patch locally :-)
> >
> > But many people will not have control of or the desire to change
> > their u-boot loader. I would have figured this ends up being a
> > real regression for many (most?) users of this SoC.
>
> Agree.
>
> >
> >
> > > #define CORE0_INITIAL_CPU_STATE (0xf00)
> > > #define CORE_FL_OFFSET (0x1C)
> > > #define FLAG_LAUNCH_FREADY (1)
> > >
> > > #define WRITEREG(r, v) *(volatile uint32_t *)(r) = v
> > > #define KSEG1ADDR(_x) (((_x)&0x1fffffff) | 0xa0000000)
> > >
> > > void set_core(uint32_t core)
> > > {
> > >      uint32_t start = CORE0_INITIAL_CPU_STATE + (0x40 * core);
> > >      WRITEREG(KSEG1ADDR(start + CORE_FL_OFFSET), FLAG_LAUNCH_FREADY);
> > > }
> > >
> > > void fix_cores(void) {
> > >      // Fixes the flags for each core, just before running the kernel.
> > >      // Means we don't have to patch the kernel check for valid CPU's.
> > >      for (int i = 0; i < 4; i++) {
> > >          set_core(i);
> > >      }
> > > }
> > >
> > > It seems that memory section is supposed to set all the cores registers
> > > before the kernel runs, but i never found it did anything except that 1
> > > flag.
> > >
> > > Obviously a better way would be to properly detect the number of cores
> > > and not rely on the boot loader to set a flag in ram, I don't know if
> > > that's even possible.
> >
> > I can't help but think this commit is not a proper fix for this problem.
>
> I also do think this commit should be reverted. Ilya, do you have a
> strong opinion to maintain it instead?
Not a strong opinion - I think we need a better fix that would work on
the platform I tested with as well as Greg's. I'm okay with reverting
it while trying to come up with said fix. Downstream projects, such as
OpenWrt can keep this patch or apply it only when building for MT7621S
targets until the detection logic is made more robust.

Greg - if and when a proper fix is made, a test against your platform
would help so we don't regress again in the future.

Ilya
>
> >
> > Regards
> > Greg
>
> Best regards,
>     Sergio Paracuellos
> >
> >
> > > Steven Johnson
> > >
> > > On 16/9/21 09:56, Greg Ungerer wrote:
> > >> Hi Ilya,
> > >>
> > >>> Most MT7621 SoCs have 2 cores, which is detected and supported properly
> > >>> by CPS.
> > >>>
> > >>> Unfortunately, MT7621 SoC has a less common S variant with only one
> > >>> core.
> > >>> On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
> > >>> starting SMP. CPULAUNCH registers can be used in that case to detect the
> > >>> absence of the second core and override the GCR_CONFIG PCORES field.
> > >>>
> > >>> Rework a long-standing OpenWrt patch to override the value of
> > >>> mips_cps_numcores on single-core MT7621 systems.
> > >>>
> > >>> Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
> > >>> MT7621 device (Netgear R6220).
> > >>
> > >> This is breaking core detection on my MT7621 based platforms.
> > >> I only get 2 cores detected now running 5.13. Reverting this change gives
> > >> me 4 cores back.
> > >>
> > >>  From a fully working (pre-change) system I get:
> > >>
> > >> # cat /proc/cpuinfo
> > >> system type        : MediaTek MT7621 ver:1 eco:3
> > >> machine            : Digi EX15
> > >> processor        : 0
> > >> cpu model        : MIPS 1004Kc V2.15
> > >> BogoMIPS        : 586.13
> > >> wait instruction    : yes
> > >> microsecond timers    : yes
> > >> tlb_entries        : 32
> > >> extra interrupt vector    : yes
> > >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> > >> 0x0ffc, 0x0ffb, 0x0ffb]
> > >> isa            : mips1 mips2 mips32r1 mips32r2
> > >> ASEs implemented    : mips16 dsp mt
> > >> shadow register sets    : 1
> > >> kscratch registers    : 0
> > >> package            : 0
> > >> core            : 0
> > >> VPE            : 0
> > >> VCED exceptions        : not available
> > >> VCEI exceptions        : not available
> > >>
> > >> processor        : 1
> > >> cpu model        : MIPS 1004Kc V2.15
> > >> BogoMIPS        : 586.13
> > >> wait instruction    : yes
> > >> microsecond timers    : yes
> > >> tlb_entries        : 32
> > >> extra interrupt vector    : yes
> > >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> > >> 0x0ffc, 0x0ffb, 0x0ffb]
> > >> isa            : mips1 mips2 mips32r1 mips32r2
> > >> ASEs implemented    : mips16 dsp mt
> > >> shadow register sets    : 1
> > >> kscratch registers    : 0
> > >> package            : 0
> > >> core            : 0
> > >> VPE            : 1
> > >> VCED exceptions        : not available
> > >> VCEI exceptions        : not available
> > >>
> > >> processor        : 2
> > >> cpu model        : MIPS 1004Kc V2.15
> > >> BogoMIPS        : 586.13
> > >> wait instruction    : yes
> > >> microsecond timers    : yes
> > >> tlb_entries        : 32
> > >> extra interrupt vector    : yes
> > >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> > >> 0x0ffc, 0x0ffb, 0x0ffb]
> > >> isa            : mips1 mips2 mips32r1 mips32r2
> > >> ASEs implemented    : mips16 dsp mt
> > >> shadow register sets    : 1
> > >> kscratch registers    : 0
> > >> package            : 0
> > >> core            : 1
> > >> VPE            : 0
> > >> VCED exceptions        : not available
> > >> VCEI exceptions        : not available
> > >>
> > >> processor        : 3
> > >> cpu model        : MIPS 1004Kc V2.15
> > >> BogoMIPS        : 586.13
> > >> wait instruction    : yes
> > >> microsecond timers    : yes
> > >> tlb_entries        : 32
> > >> extra interrupt vector    : yes
> > >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> > >> 0x0ffc, 0x0ffb, 0x0ffb]
> > >> isa            : mips1 mips2 mips32r1 mips32r2
> > >> ASEs implemented    : mips16 dsp mt
> > >> shadow register sets    : 1
> > >> kscratch registers    : 0
> > >> package            : 0
> > >> core            : 1
> > >> VPE            : 1
> > >> VCED exceptions        : not available
> > >> VCEI exceptions        : not available
> > >>
> > >>
> > >> After this patch is applied:
> > >>
> > >> # cat /proc/cpuinfo
> > >> system type        : MediaTek MT7621 ver:1 eco:3
> > >> machine            : Digi EX15
> > >> processor        : 0
> > >> cpu model        : MIPS 1004Kc V2.15
> > >> BogoMIPS        : 586.13
> > >> wait instruction    : yes
> > >> microsecond timers    : yes
> > >> tlb_entries        : 32
> > >> extra interrupt vector    : yes
> > >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> > >> 0x0ffc, 0x0ffb, 0x0ffb]
> > >> isa            : mips1 mips2 mips32r1 mips32r2
> > >> ASEs implemented    : mips16 dsp mt
> > >> shadow register sets    : 1
> > >> kscratch registers    : 0
> > >> package            : 0
> > >> core            : 0
> > >> VPE            : 0
> > >> VCED exceptions        : not available
> > >> VCEI exceptions        : not available
> > >>
> > >> processor        : 1
> > >> cpu model        : MIPS 1004Kc V2.15
> > >> BogoMIPS        : 586.13
> > >> wait instruction    : yes
> > >> microsecond timers    : yes
> > >> tlb_entries        : 32
> > >> extra interrupt vector    : yes
> > >> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> > >> 0x0ffc, 0x0ffb, 0x0ffb]
> > >> isa            : mips1 mips2 mips32r1 mips32r2
> > >> ASEs implemented    : mips16 dsp mt
> > >> shadow register sets    : 1
> > >> kscratch registers    : 0
> > >> package            : 0
> > >> core            : 0
> > >> VPE            : 1
> > >> VCED exceptions        : not available
> > >> VCEI exceptions        : not available
> > >>
> > >> Any ideas?
> > >>
> > >> Regards
> > >> Greg
> > >>
> > >>
> > >>> Original 4.14 OpenWrt patch:
> > >>> Link:
> > >>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
> > >>> Current 5.10 OpenWrt patch:
> > >>> Link:
> > >>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
> > >>>
> > >>> Suggested-by: Felix Fietkau <nbd@nbd.name>
> > >>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > >>> ---
> > >>>   arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
> > >>>   1 file changed, 22 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/arch/mips/include/asm/mips-cps.h
> > >>> b/arch/mips/include/asm/mips-cps.h
> > >>> index fd43d876892e..35fb8ee6dd33 100644
> > >>> --- a/arch/mips/include/asm/mips-cps.h
> > >>> +++ b/arch/mips/include/asm/mips-cps.h
> > >>> @@ -10,6 +10,8 @@
> > >>>   #include <linux/io.h>
> > >>>   #include <linux/types.h>
> > >>>
> > >>> +#include <asm/mips-boards/launch.h>
> > >>> +
> > >>>   extern unsigned long __cps_access_bad_size(void)
> > >>>       __compiletime_error("Bad size for CPS accessor");
> > >>>
> > >>> @@ -165,11 +167,30 @@ static inline uint64_t
> > >>> mips_cps_cluster_config(unsigned int cluster)
> > >>>    */
> > >>>   static inline unsigned int mips_cps_numcores(unsigned int cluster)
> > >>>   {
> > >>> +    unsigned int ncores;
> > >>> +
> > >>>       if (!mips_cm_present())
> > >>>           return 0;
> > >>>
> > >>>       /* Add one before masking to handle 0xff indicating no cores */
> > >>> -    return (mips_cps_cluster_config(cluster) + 1) &
> > >>> CM_GCR_CONFIG_PCORES;
> > >>> +    ncores = (mips_cps_cluster_config(cluster) + 1) &
> > >>> CM_GCR_CONFIG_PCORES;
> > >>> +
> > >>> +    if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> > >>> +        struct cpulaunch *launch;
> > >>> +
> > >>> +        /*
> > >>> +         * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> > >>> +         * always reports 2 cores. Check the second core's
> > >>> LAUNCH_FREADY
> > >>> +         * flag to detect if the second core is missing. This method
> > >>> +         * only works before the core has been started.
> > >>> +         */
> > >>> +        launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> > >>> +        launch += 2; /* MT7621 has 2 VPEs per core */
> > >>> +        if (!(launch->flags & LAUNCH_FREADY))
> > >>> +            ncores = 1;
> > >>> +    }
> > >>> +
> > >>> +    return ncores;
> > >>>   }
> > >>>
> > >>>   /**
> > >>> --
> > >>> 2.31.1
> > >>
> > >
