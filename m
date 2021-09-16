Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A589E40D34C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Sep 2021 08:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbhIPGfB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Sep 2021 02:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbhIPGfB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Sep 2021 02:35:01 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C0AC061574;
        Wed, 15 Sep 2021 23:33:41 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id a25so5147972vso.5;
        Wed, 15 Sep 2021 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yiXswdrOI5sxPOGOIsN558V/Y7e8fyFMfF03zZEiyZg=;
        b=KyHeYjDgaEOSKdyfZvQ/uLpG8SpPdUExdv50yxccxG+xBLR/Ds8lPxPiTUpWsW1KU4
         jA2FMLE/OOqBGHD1QzaW2VL3pSHJYtsrQsCeRyN2nJD9VN3JoBRAbmYy4RP+C9SwcUB6
         APlBgt8HRJUDX+3CgcZnEatnauDjNccLWAyHfX3wMuOSWVyW2MunS935YqnxjdRtd6EY
         5Co6b8+jJwP5OvNVlRmYIgXVgjaHVp2rRxYnWXey0A0G+qALzJgXZqQxsli3K4IQRIcU
         0Wh2ZnHxRe+qlPQKMQkjmhTjBwl19ZkQihGywP1sMGa9WUb2Zwygv6XfMzgMqilCu6Ex
         7SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yiXswdrOI5sxPOGOIsN558V/Y7e8fyFMfF03zZEiyZg=;
        b=iboAt0WcYdUhFm0TZ5Xt70PzhxpHeyuQcm97KtlJYwzBw/F3AR65Le2KSFofCvJMtj
         sU6Hgbp+Bo+BVr6N4jk5M1dvQCtXHdcL6PZ/c2oqq1dfyRgqhuo72/pcBI0RLb9LQC98
         HPEtPPGCIKo2MSkle3k/qTrcLnr3lK3nqn/NIVIGXso3t6LicK9EZCXc8HQFrlcpoVTD
         8buuuBdDp2Q7jjleLHHzaL4JGTO0ZkpT9WdPvNzraLuj8qOUG5kclQUS1/dobyY58mzM
         eyRsfQHGDdJcLeU/FHipaRnaGDKxJ2EwMkqMcmTo9t4ECFotwjoh2aTLZdojdjHxn7pl
         clcQ==
X-Gm-Message-State: AOAM533XhNEGGn5tlrwfjuaC1RHVZq1kUcD/TrRmX7aYcomz4e7k8iGK
        rsQLHMRDsZtH/PuvDgwcv8/zukeam7pwI3jtX7E=
X-Google-Smtp-Source: ABdhPJz24nXcaloxADW1jk636y5GHgZf94Se9VCB4iFiY818Q0c9XZp7G06YwScZzRtEJwv0BzNTSwxsYGNRR09Ew74=
X-Received: by 2002:a67:c410:: with SMTP id c16mr3139504vsk.48.1631774020321;
 Wed, 15 Sep 2021 23:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
In-Reply-To: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 16 Sep 2021 08:33:28 +0200
Message-ID: <CAMhs-H-_6fH00g4tkF7KBgO_HvA1c6QVV8ph2gSXFaoVUAZRUQ@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
To:     Greg Ungerer <gerg@kernel.org>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
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

On Thu, Sep 16, 2021 at 4:57 AM Greg Ungerer <gerg@kernel.org> wrote:
>
> Hi Ilya,
>
> > Most MT7621 SoCs have 2 cores, which is detected and supported properly
> > by CPS.
> >
> > Unfortunately, MT7621 SoC has a less common S variant with only one core.
> > On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
> > starting SMP. CPULAUNCH registers can be used in that case to detect the
> > absence of the second core and override the GCR_CONFIG PCORES field.
> >
> > Rework a long-standing OpenWrt patch to override the value of
> > mips_cps_numcores on single-core MT7621 systems.
> >
> > Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
> > MT7621 device (Netgear R6220).
>
> This is breaking core detection on my MT7621 based platforms.
> I only get 2 cores detected now running 5.13. Reverting this change gives
> me 4 cores back.

I also have a 4 core mt7621 based board and this patch change does not
have problems for me. Let me know if you need me to check something
from my board.

I noticed that on boot the following message appears and might be
related with the way used here to make the core number detection:

[    0.000000] VPE topology {2,2} total 4

Is this the same for your board?

Best regards,
     Sergio Paracuellos

>
>  From a fully working (pre-change) system I get:
>
> # cat /proc/cpuinfo
> system type             : MediaTek MT7621 ver:1 eco:3
> machine                 : Digi EX15
> processor               : 0
> cpu model               : MIPS 1004Kc V2.15
> BogoMIPS                : 586.13
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 0
> VPE                     : 0
> VCED exceptions         : not available
> VCEI exceptions         : not available
>
> processor               : 1
> cpu model               : MIPS 1004Kc V2.15
> BogoMIPS                : 586.13
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 0
> VPE                     : 1
> VCED exceptions         : not available
> VCEI exceptions         : not available
>
> processor               : 2
> cpu model               : MIPS 1004Kc V2.15
> BogoMIPS                : 586.13
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 1
> VPE                     : 0
> VCED exceptions         : not available
> VCEI exceptions         : not available
>
> processor               : 3
> cpu model               : MIPS 1004Kc V2.15
> BogoMIPS                : 586.13
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 1
> VPE                     : 1
> VCED exceptions         : not available
> VCEI exceptions         : not available
>
>
> After this patch is applied:
>
> # cat /proc/cpuinfo
> system type             : MediaTek MT7621 ver:1 eco:3
> machine                 : Digi EX15
> processor               : 0
> cpu model               : MIPS 1004Kc V2.15
> BogoMIPS                : 586.13
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 0
> VPE                     : 0
> VCED exceptions         : not available
> VCEI exceptions         : not available
>
> processor               : 1
> cpu model               : MIPS 1004Kc V2.15
> BogoMIPS                : 586.13
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 0
> VPE                     : 1
> VCED exceptions         : not available
> VCEI exceptions         : not available
>
> Any ideas?
>
> Regards
> Greg
>
>
> > Original 4.14 OpenWrt patch:
> > Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
> > Current 5.10 OpenWrt patch:
> > Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
> >
> > Suggested-by: Felix Fietkau <nbd@nbd.name>
> > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > ---
> >  arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
> > index fd43d876892e..35fb8ee6dd33 100644
> > --- a/arch/mips/include/asm/mips-cps.h
> > +++ b/arch/mips/include/asm/mips-cps.h
> > @@ -10,6 +10,8 @@
> >  #include <linux/io.h>
> >  #include <linux/types.h>
> >
> > +#include <asm/mips-boards/launch.h>
> > +
> >  extern unsigned long __cps_access_bad_size(void)
> >       __compiletime_error("Bad size for CPS accessor");
> >
> > @@ -165,11 +167,30 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
> >   */
> >  static inline unsigned int mips_cps_numcores(unsigned int cluster)
> >  {
> > +     unsigned int ncores;
> > +
> >       if (!mips_cm_present())
> >               return 0;
> >
> >       /* Add one before masking to handle 0xff indicating no cores */
> > -     return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> > +     ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> > +
> > +     if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> > +             struct cpulaunch *launch;
> > +
> > +             /*
> > +              * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> > +              * always reports 2 cores. Check the second core's LAUNCH_FREADY
> > +              * flag to detect if the second core is missing. This method
> > +              * only works before the core has been started.
> > +              */
> > +             launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> > +             launch += 2; /* MT7621 has 2 VPEs per core */
> > +             if (!(launch->flags & LAUNCH_FREADY))
> > +                     ncores = 1;
> > +     }
> > +
> > +     return ncores;
> >  }
> >
> >  /**
> > --
> > 2.31.1
>
