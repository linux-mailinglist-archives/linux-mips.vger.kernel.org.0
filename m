Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC311DF566
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 09:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387682AbgEWHJD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 03:09:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44953 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387667AbgEWHJC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 May 2020 03:09:02 -0400
Received: by mail-io1-f66.google.com with SMTP id p20so501863iop.11
        for <linux-mips@vger.kernel.org>; Sat, 23 May 2020 00:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MeJmGIYrcmBlDSuCrP+kAYyIiUNBBeeaUU+5XpTIrfs=;
        b=KHfrOesWRt/AMOpz/8VNtkh3JLAMEe/B7D3BQZ5KOrHQG1lQQ0SCBN4nTCVvEr8UQs
         wMymUaHmduqsnFqpuBAeGCsH4tQoxDI5qvIl7cNQdbxmZCsNjpgF1WpLhaGK7dMSdAxx
         cTb/iIZVdl2RshPOroKYT3llZXuSucZCS/ufLItscBSiIJnJ1EGIG768W2ApuLZe0MIe
         ZNOAWEVNOdpCelTJQHAZMaax4uevKEk1KdyYlgLVmjIv8zNCjMRSA7VIZAaOJMiFd74n
         KTj2gRsCvZnUvGyJ3rbUu8VsBKXIq6o+lT0xxQkamj/U3fQMyNK7zZh7dmE0ossrExQH
         UMRA==
X-Gm-Message-State: AOAM533YelzABJzoWtLD993LVUkedennJE9xFIOyfpEARiyP8GwHIlpd
        jcBtv2S8ZwFeWJXmQ5I57Am4K3jhjTzFdbWiy7E=
X-Google-Smtp-Source: ABdhPJwTySBShwxwpUNaayydUUY1qZINvgXUUHbxkigSpKOFOVukjbfgh4ZtPndBED+tjL2TlKoYpHcg8ndqjqo9b/I=
X-Received: by 2002:a05:6602:13c6:: with SMTP id o6mr5929752iov.84.1590217741144;
 Sat, 23 May 2020 00:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <1590207940-20157-1-git-send-email-chenhc@lemote.com> <7e1a0ef8-6feb-3440-9e30-45cd912194a3@xen0n.name>
In-Reply-To: <7e1a0ef8-6feb-3440-9e30-45cd912194a3@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 23 May 2020 15:08:49 +0800
Message-ID: <CAAhV-H4ES3MbWxMnOoHJU4nrMcHuBdEw-oZvyk3jzGbdbSTCzA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Tidy up CP0.Config6 bits definition
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

Hi, Xuerui,

On Sat, May 23, 2020 at 12:43 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> Hi Huacai,
>
> On 5/23/20 12:25 PM, Huacai Chen wrote:
> > CP0.Config6 is a Vendor-defined register whose bits definitions are
> > different from one to another. Recently, Xuerui's Loongson-3 patch and
> > Serge's P5600 patch make the definitions inconsistency and unclear. To
> > make life easy, this patch tidy the definition up.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >   arch/mips/include/asm/mipsregs.h | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > index fe6293f..e89eeb9 100644
> > --- a/arch/mips/include/asm/mipsregs.h
> > +++ b/arch/mips/include/asm/mipsregs.h
> > @@ -690,6 +690,12 @@
> >   #define MIPS_CONF6_JRCD             (_ULCAST_(1) << 0)
> >   /* MIPSr6 extensions enable */
> >   #define MIPS_CONF6_R6               (_ULCAST_(1) << 2)
> > +/* Loongson-3 internal timer bit */
> > +#define MIPS_CONF6_INTIMER   (_ULCAST_(1) << 6)
> > +/* Loongson-3 external timer bit */
> > +#define MIPS_CONF6_EXTIMER   (_ULCAST_(1) << 7)
>
> These two are not present before, maybe split into two patches?
>
> Also, actually this register is called GSConfig in Loongson's manuals;
> the register bears no resemblance to the actual Config6 on P5600 and the
> likes, it just happens to occupy the same position. So maintaining the
> sorting order actually hurts readability and maintainability IMO.
>
> Maybe reflect this (sad or not, but things happen) truth through naming,
> and group the Loongson bits together?
Thanks for your review, I will send an updated version.

Huacai
>
> > +/* Loongson-3 SFB on/off bit */
> > +#define MIPS_CONF6_SFBEN     (_ULCAST_(1) << 8)
> This bit is called "STFill" in Loongson 3A3000/3B3000 User Manual Volume
> 2. Is Loongson renaming things between releases?
> >   /* IFU Performance Control */
> >   #define MIPS_CONF6_IFUPERFCTL       (_ULCAST_(3) << 10)
> >   #define MIPS_CONF6_SYND             (_ULCAST_(1) << 13)
> > @@ -697,16 +703,16 @@
> >   #define MIPS_CONF6_SPCD             (_ULCAST_(1) << 14)
> >   /* proAptiv FTLB on/off bit */
> >   #define MIPS_CONF6_FTLBEN   (_ULCAST_(1) << 15)
> > +/* Loongson-3's LL on exclusive cacheline */
> > +#define MIPS_CONF6_LLEXC     (_ULCAST_(1) << 16)
> > +/* Loongson-3's SC has a random delay */
> > +#define MIPS_CONF6_SCRAND    (_ULCAST_(1) << 17)
> >   /* Disable load/store bonding */
> >   #define MIPS_CONF6_DLSB             (_ULCAST_(1) << 21)
> >   /* Loongson-3 FTLB on/off bit */
> >   #define MIPS_CONF6_FTLBDIS  (_ULCAST_(1) << 22)
> >   /* FTLB probability bits */
> >   #define MIPS_CONF6_FTLBP_SHIFT      (16)
> > -/* Loongson-3 feature bits */
> > -#define MIPS_CONF6_LOONGSON_SCRAND   (_ULCAST_(1) << 17)
> > -#define MIPS_CONF6_LOONGSON_LLEXC    (_ULCAST_(1) << 16)
> > -#define MIPS_CONF6_LOONGSON_STFILL   (_ULCAST_(1) << 8)
> >
> >   #define MIPS_CONF7_WII              (_ULCAST_(1) << 31)
> >
