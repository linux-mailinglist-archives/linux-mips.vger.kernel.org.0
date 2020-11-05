Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27B82A7746
	for <lists+linux-mips@lfdr.de>; Thu,  5 Nov 2020 06:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgKEF6F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Nov 2020 00:58:05 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:41782 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgKEF6F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Nov 2020 00:58:05 -0500
Received: by mail-io1-f66.google.com with SMTP id u62so613031iod.8;
        Wed, 04 Nov 2020 21:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AyVi8nv9bxB+fUfbHsfwKKKH6LwJfTRc39uOuRnky6M=;
        b=Cn11NBERHf9WhUG2tce/ni+mT/QoMaRz+irsjgG3xuRgKyY9nfK+OoUrHJSSu2A4n/
         6cZpxCf7XXDFdd89oWz9VtgP0MSm9Xgp73QR+wxrbmMxqhxk0XyxxoWkuTL4DaqzsPON
         8V6B6DNimMievN8MuFVZh2MiXYx+4HkkpqkfBsQr5YaVKuTQf0zd8JvIraxOEbRKJwZN
         4vLFG5rrFDFWFY+rh5IRabwK5D8rXN2v4fRnI9gHdGnGpn4C7uvj04s+lB9i9M9z0CdK
         ZLVoQztxrxytnfwu1j59jP6/py4Rcsmujn90nAW+Px3er7KdAX4XvN1OCNJsuyc48w30
         p+vg==
X-Gm-Message-State: AOAM533Da1Ha2ve9xhRYy3JDPU5GdFRf9PuM+sswPE4b6H3ZKp59Ed7C
        khnxPJQTUtzwY8XMmfr2+spaEdUop1aoZ/kuGkcTZCAi0k9yCw==
X-Google-Smtp-Source: ABdhPJwCB769qoHOHxb6BM6AE1L+xusKZRcG7j/y2IW9mgnE+HlYidZLVPlnejPPeW5rSHkXWSaDCI5QPGoqiMWEVok=
X-Received: by 2002:a05:6638:15a:: with SMTP id y26mr848982jao.57.1604555884629;
 Wed, 04 Nov 2020 21:58:04 -0800 (PST)
MIME-Version: 1.0
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
 <1604387525-23400-2-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4WfaCLuCzvCJx-UriqgPAz2b0H6LGwMhyhRaxvuSAMwQ@mail.gmail.com> <e999986a-8236-752a-8b17-353bb87fc521@loongson.cn>
In-Reply-To: <e999986a-8236-752a-8b17-353bb87fc521@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 5 Nov 2020 13:57:53 +0800
Message-ID: <CAAhV-H62Ft_mPBY4UaM0vbd70VVgYGnQW5E0n-y8SPHKftU8UQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Tiezhu,

On Wed, Nov 4, 2020 at 11:51 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> On 11/04/2020 10:00 AM, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Tue, Nov 3, 2020 at 3:13 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >> The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
> >> write operations are meaningless, remove them.
> >>
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>
> >> v2: No changes
> >> v3: No changes
> >>
> >>   arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 --------
> >>   arch/mips/loongson64/numa.c                               | 3 ---
> >>   2 files changed, 11 deletions(-)
> >>
> >> diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> >> index 87a5bfb..e4d77f4 100644
> >> --- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> >> +++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> >> @@ -19,10 +19,6 @@
> >>          .macro  kernel_entry_setup
> >>          .set    push
> >>          .set    mips64
> >> -       /* Set LPA on LOONGSON3 config3 */
> >> -       mfc0    t0, CP0_CONFIG3
> >> -       or      t0, (0x1 << 7)
> >> -       mtc0    t0, CP0_CONFIG3
> > Sorry for the late response, I have the same worry as Jiaxun. As you
> > know, Loongson's user manuals are not always correct, but the original
> > code comes from Loongson are usually better. So, my opinion is "Don't
> > change it if it doesn't break anything".
>
> Hi Huacai,
>
> Thanks for your reply, I have confirmed by Loongson user manuals and
> hardware designers, CP0_CONFIG3 register is read only.
>
> Without this patch, the related kernel code is meaningless, with
> this patch, it can reflect the reality.
>
> Thanks,
> Tiezhu
Then you should at least test your code on Loongson-3A R1 two way machine.

Huacai
>
> >
> > Huacai
> >
> >>          /* Set ELPA on LOONGSON3 pagegrain */
> >>          mfc0    t0, CP0_PAGEGRAIN
> >>          or      t0, (0x1 << 29)
> >> @@ -54,10 +50,6 @@
> >>          .macro  smp_slave_setup
> >>          .set    push
> >>          .set    mips64
> >> -       /* Set LPA on LOONGSON3 config3 */
> >> -       mfc0    t0, CP0_CONFIG3
> >> -       or      t0, (0x1 << 7)
> >> -       mtc0    t0, CP0_CONFIG3
> >>          /* Set ELPA on LOONGSON3 pagegrain */
> >>          mfc0    t0, CP0_PAGEGRAIN
> >>          or      t0, (0x1 << 29)
> >> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> >> index cf9459f..c7e3cced 100644
> >> --- a/arch/mips/loongson64/numa.c
> >> +++ b/arch/mips/loongson64/numa.c
> >> @@ -40,9 +40,6 @@ static void enable_lpa(void)
> >>          unsigned long value;
> >>
> >>          value = __read_32bit_c0_register($16, 3);
> >> -       value |= 0x00000080;
> >> -       __write_32bit_c0_register($16, 3, value);
> >> -       value = __read_32bit_c0_register($16, 3);
> >>          pr_info("CP0_Config3: CP0 16.3 (0x%lx)\n", value);
> >>
> >>          value = __read_32bit_c0_register($5, 1);
> >> --
> >> 2.1.0
> >>
>
