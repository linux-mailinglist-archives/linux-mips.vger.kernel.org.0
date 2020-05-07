Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1799E1C82A4
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 08:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgEGGkW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 02:40:22 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40016 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgEGGkV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 02:40:21 -0400
Received: by mail-io1-f68.google.com with SMTP id c2so4987536iow.7
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2020 23:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jw5RXXPe+66DtTo7Pfi0Si8RmNRMuVD6ysH72E+03Eg=;
        b=CYRme9IJ4gcuzwyO5naOWHjLw6OmmlmkUYHOtVzXxtUgreBMBF2cF0AXs9mjDV3E0/
         ouWjqIEmGtWObZQXAQZXMQBhT3euU46VF5PPdc39i80ONui9sf1bhGRoqBWiYRGVXoLj
         b7r92Kn3MLCU5Bogoj8kknmGBtjdGjjWolV1N70mnPKqDpTD5zMRaH1eJuqG46mD8UFr
         kVoYPLLGUoJi7gCbP2nXd7sg61vtr62JY3L8shnlfPugiHBP6jNxgFPCusBnaCvKiGWB
         qQpQKUpoF7LaF80B0H4d0/QkrWuSt23/z3BolP8j3FkVWesY6ILU3+434tRrwOrmNpMX
         VHKg==
X-Gm-Message-State: AGi0Pua4o+MO18u4l1xWEk1gebwkZVk7Z8rDnVIGZts2efVjhW9VnVJ5
        Nv0U3K5GwK/51GPRzO37js7Vl1sHXs+pE3SqMwI=
X-Google-Smtp-Source: APiQypIDP5c3ralytqBwLOSMAMmPF5eg28fLpszaz58Y16L+sPRNkT1y+7E0QFlBiDgMfT9uP9Zn1uPASzirXT2GGr4=
X-Received: by 2002:a5e:8613:: with SMTP id z19mr11902378ioj.84.1588833620957;
 Wed, 06 May 2020 23:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <1588830863-30416-1-git-send-email-chenhc@lemote.com> <abdd1464-277e-3921-5714-39a8058d06a8@xen0n.name>
In-Reply-To: <abdd1464-277e-3921-5714-39a8058d06a8@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 7 May 2020 14:47:55 +0800
Message-ID: <CAAhV-H6Qd0xmpSJdukiUB9Csgi8ppJUcr8Ru-ktQx9Xm6P1huw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: asm: Use __ASSEMBLY__ to guard some macros to avoid
 build error
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

On Thu, May 7, 2020 at 2:13 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2020/5/7 13:54, Huacai Chen wrote:
>
> > Use __ASSEMBLY__ to guard definitions of some macros (PANIC and PRINT)
> > to avoid build error:
> >
> > 1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
> > 2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
> >     mac80211/debugfs_sta.c
> >
> > Fixes: d339cd02b888eb8c ("MIPS: Move unaligned load/store helpers to inst.h")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >   arch/mips/include/asm/asm.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> > index 934465d..b01762ab 100644
> > --- a/arch/mips/include/asm/asm.h
> > +++ b/arch/mips/include/asm/asm.h
> > @@ -74,6 +74,8 @@ symbol:             .insn
> >               .globl  symbol;                         \
> >   symbol              =       value
> >
> > +#ifdef __ASSEMBLY__
> > +
> >   #define PANIC(msg)                                  \
> >               .set    push;                           \
> >               .set    reorder;                        \
> > @@ -98,6 +100,8 @@ symbol             =       value
> >   #define PRINT(string)
> >   #endif
> >
> > +#endif
> > +
> >   #define TEXT(msg)                                   \
> >               .pushsection .data;                     \
> >   8:          .asciiz msg;                            \
>
> It looks like the whole file is meant for assembly code, not just the
> couple of conflicting definitions that were caught. At least the parts
> containing assembler directives are nothing to be consumed by C code.
>
> Maybe wrap the whole file and see if it correctly builds?
I have tried to wrap the whole file, but it causes a ton of other build errors.

Regards,
Huacai
