Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1501E9C59
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 06:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725290AbgFAEHP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 00:07:15 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37138 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFAEHP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 00:07:15 -0400
Received: by mail-il1-f194.google.com with SMTP id r2so8123037ila.4
        for <linux-mips@vger.kernel.org>; Sun, 31 May 2020 21:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aigbM5/8SIhpxHZMzmsPOEeWQ0x808v0GkdHqYZ3hfY=;
        b=mH66KXXFQPgD2MLCL4k1d8QHc8g4uV4xsxmKERAs1xhHpYHvMiWRaeDLs3M5ZoTV69
         Mpx6fECx09dFaLocFpDTtLXeCX0lCMwgeGW877LWCepGMO76FWZ6pdHBqGoqL1E++0e8
         3dlP7q/sN+pnj2shQ28AULoIRaDI6+2eH+nd0h3yTX5AvIH8CmtltoNQjYwCi4Sb5AF+
         /S3IXVFCa0hUC6J/aHaEbicG2QZhS7yNsuKx1jepQ5OOJ9Pk7XJgpgyH4ZjzLZQE1LEN
         cz7N0KuBb8OkPdridmbzSdCqoMFJ8vSMOMeQCAxRkh3jiAx3pwlPM/dARydZbSYlgRUq
         Ex/g==
X-Gm-Message-State: AOAM533EKG7vtgmDZKJPKVtvUFdHoXlL4Uuyz0Pfmx4c+oLASe6sgCXI
        qs4n+TScz9la/482ubhGKH6YpPo33u9oD07hSTA=
X-Google-Smtp-Source: ABdhPJxL8gMjC2YVI/Zmv3IHGHJmlgjioJrP+6GqOtxwLdEI7HI1UPmNHWAIV56jqjNcHtE+LGmRZ8jIpBrnzCO5m3Y=
X-Received: by 2002:a05:6e02:503:: with SMTP id d3mr19545520ils.208.1590984433730;
 Sun, 31 May 2020 21:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <1590981437-9701-1-git-send-email-chenhc@lemote.com> <54081df9-f723-a832-c9dc-294ead81009d@xen0n.name>
In-Reply-To: <54081df9-f723-a832-c9dc-294ead81009d@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 1 Jun 2020 12:07:02 +0800
Message-ID: <CAAhV-H6Qfkv0rOZFtETapSsE-LZgTJCtqk5uutDkLUX4uub-mQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Unify naming style of vendor CP0.Config6 bits
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 1, 2020 at 11:43 AM WANG Xuerui <kernel@xen0n.name> wrote:
>
> Hi Huacai,
>
> On 2020/6/1 11:17, Huacai Chen wrote:
> > Other vendor-defined registers use the vendor name as a prefix, not an
> > infix, so unify the naming style of CP0.Config6 bits.
> >
> > Suggested-by: Maciej W. Rozycki" <macro@linux-mips.org>
> Stray quotation mark?
Oh, I'm sorry.

> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >   arch/mips/include/asm/mipsregs.h   | 28 ++++++++++++++--------------
> >   arch/mips/kernel/cpu-probe.c       | 12 ++++++------
> >   arch/mips/loongson64/cpucfg-emul.c |  6 +++---
> >   arch/mips/mm/c-r4k.c               |  4 ++--
> >   4 files changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > index 796dbb8..ef4912e 100644
> > --- a/arch/mips/include/asm/mipsregs.h
> > +++ b/arch/mips/include/asm/mipsregs.h
> > @@ -689,35 +689,35 @@
> >   /* Config6 feature bits for proAptiv/P5600 */
> >
> >   /* Jump register cache prediction disable */
> > -#define MIPS_CONF6_MTI_JRCD          (_ULCAST_(1) << 0)
> > +#define MTI_CONF6_JRCD               (_ULCAST_(1) << 0)
> >   /* MIPSr6 extensions enable */
> > -#define MIPS_CONF6_MTI_R6            (_ULCAST_(1) << 2)
> > +#define MTI_CONF6_R6         (_ULCAST_(1) << 2)
> >   /* IFU Performance Control */
> > -#define MIPS_CONF6_MTI_IFUPERFCTL    (_ULCAST_(3) << 10)
> > -#define MIPS_CONF6_MTI_SYND          (_ULCAST_(1) << 13)
> > +#define MTI_CONF6_IFUPERFCTL (_ULCAST_(3) << 10)
> > +#define MTI_CONF6_SYND               (_ULCAST_(1) << 13)
> >   /* Sleep state performance counter disable */
> > -#define MIPS_CONF6_MTI_SPCD          (_ULCAST_(1) << 14)
> > +#define MTI_CONF6_SPCD               (_ULCAST_(1) << 14)
> >   /* proAptiv FTLB on/off bit */
> > -#define MIPS_CONF6_MTI_FTLBEN                (_ULCAST_(1) << 15)
> > +#define MTI_CONF6_FTLBEN     (_ULCAST_(1) << 15)
> >   /* Disable load/store bonding */
> > -#define MIPS_CONF6_MTI_DLSB          (_ULCAST_(1) << 21)
> > +#define MTI_CONF6_DLSB               (_ULCAST_(1) << 21)
> >   /* FTLB probability bits */
> > -#define MIPS_CONF6_MTI_FTLBP_SHIFT   (16)
> > +#define MTI_CONF6_FTLBP_SHIFT        (16)
> >
> >   /* Config6 feature bits for Loongson-3 */
> >
> >   /* Loongson-3 internal timer bit */
> > -#define MIPS_CONF6_LOONGSON_INTIMER  (_ULCAST_(1) << 6)
> > +#define LOONGSON_CONF6_INTIMER       (_ULCAST_(1) << 6)
> >   /* Loongson-3 external timer bit */
> > -#define MIPS_CONF6_LOONGSON_EXTIMER  (_ULCAST_(1) << 7)
> > +#define LOONGSON_CONF6_EXTIMER       (_ULCAST_(1) << 7)
> >   /* Loongson-3 SFB on/off bit, STFill in manual */
> > -#define MIPS_CONF6_LOONGSON_SFBEN    (_ULCAST_(1) << 8)
> > +#define LOONGSON_CONF6_SFBEN (_ULCAST_(1) << 8)
> >   /* Loongson-3's LL on exclusive cacheline */
> > -#define MIPS_CONF6_LOONGSON_LLEXC    (_ULCAST_(1) << 16)
> > +#define LOONGSON_CONF6_LLEXC (_ULCAST_(1) << 16)
> >   /* Loongson-3's SC has a random delay */
> > -#define MIPS_CONF6_LOONGSON_SCRAND   (_ULCAST_(1) << 17)
> > +#define LOONGSON_CONF6_SCRAND        (_ULCAST_(1) << 17)
> >   /* Loongson-3 FTLB on/off bit, VTLBOnly in manual */
> > -#define MIPS_CONF6_LOONGSON_FTLBDIS  (_ULCAST_(1) << 22)
> > +#define LOONGSON_CONF6_FTLBDIS       (_ULCAST_(1) << 22)
> >
> >   #define MIPS_CONF7_WII              (_ULCAST_(1) << 31)
> >
> > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> > index 6b93162..e5b218d 100644
> > --- a/arch/mips/kernel/cpu-probe.c
> > +++ b/arch/mips/kernel/cpu-probe.c
> > @@ -635,14 +635,14 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
> >               config = read_c0_config6();
> >
> >               if (flags & FTLB_EN)
> > -                     config |= MIPS_CONF6_MTI_FTLBEN;
> > +                     config |= MTI_CONF6_FTLBEN;
> >               else
> > -                     config &= ~MIPS_CONF6_MTI_FTLBEN;
> > +                     config &= ~MTI_CONF6_FTLBEN;
> >
> >               if (flags & FTLB_SET_PROB) {
> > -                     config &= ~(3 << MIPS_CONF6_MTI_FTLBP_SHIFT);
> > +                     config &= ~(3 << MTI_CONF6_FTLBP_SHIFT);
> >                       config |= calculate_ftlb_probability(c)
> > -                               << MIPS_CONF6_MTI_FTLBP_SHIFT;
> > +                               << MTI_CONF6_FTLBP_SHIFT;
> >               }
> >
> >               write_c0_config6(config);
> > @@ -662,10 +662,10 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
> >               config = read_c0_config6();
> >               if (flags & FTLB_EN)
> >                       /* Enable FTLB */
> > -                     write_c0_config6(config & ~MIPS_CONF6_LOONGSON_FTLBDIS);
> > +                     write_c0_config6(config & ~LOONGSON_CONF6_FTLBDIS);
> >               else
> >                       /* Disable FTLB */
> > -                     write_c0_config6(config | MIPS_CONF6_LOONGSON_FTLBDIS);
> > +                     write_c0_config6(config | LOONGSON_CONF6_FTLBDIS);
> >               break;
> >       default:
> >               return 1;
> > diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
> > index cd619b4..630927e 100644
> > --- a/arch/mips/loongson64/cpucfg-emul.c
> > +++ b/arch/mips/loongson64/cpucfg-emul.c
> > @@ -57,11 +57,11 @@ static void decode_loongson_config6(struct cpuinfo_mips *c)
> >   {
> >       u32 config6 = read_c0_config6();
> >
> > -     if (config6 & MIPS_CONF6_LOONGSON_SFBEN)
> > +     if (config6 & LOONGSON_CONF6_SFBEN)
> >               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SFBP;
> > -     if (config6 & MIPS_CONF6_LOONGSON_LLEXC)
> > +     if (config6 & LOONGSON_CONF6_LLEXC)
> >               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LLEXC;
> > -     if (config6 & MIPS_CONF6_LOONGSON_SCRAND)
> > +     if (config6 & LOONGSON_CONF6_SCRAND)
> >               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SCRAND;
> >   }
> >
> > diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> > index 6fb83ac..8f51617 100644
> > --- a/arch/mips/mm/c-r4k.c
> > +++ b/arch/mips/mm/c-r4k.c
> > @@ -1073,12 +1073,12 @@ static inline int alias_74k_erratum(struct cpuinfo_mips *c)
> >               if (rev <= PRID_REV_ENCODE_332(2, 4, 0))
> >                       present = 1;
> >               if (rev == PRID_REV_ENCODE_332(2, 4, 0))
> > -                     write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
> > +                     write_c0_config6(read_c0_config6() | MTI_CONF6_SYND);
> >               break;
> >       case PRID_IMP_1074K:
> >               if (rev <= PRID_REV_ENCODE_332(1, 1, 0)) {
> >                       present = 1;
> > -                     write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
> > +                     write_c0_config6(read_c0_config6() | MTI_CONF6_SYND);
> >               }
> >               break;
> >       default:
