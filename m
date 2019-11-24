Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD5B1081A0
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 04:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfKXDyr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 23 Nov 2019 22:54:47 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40656 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfKXDyq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Nov 2019 22:54:46 -0500
Received: by mail-io1-f67.google.com with SMTP id b26so10518926ion.7
        for <linux-mips@vger.kernel.org>; Sat, 23 Nov 2019 19:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PZ/KE2hJprGqFwsV7+0s99EI+jTXk9VkSRz/9n+Yrow=;
        b=ql+f4eq1/jPotwBuO7qq4jSo3rBU68jmS0FqwWIH85YcVxrYceXwy7AsI9ZAZX7zOB
         mIZIy7LOT0HScCR4OinGkJce8z3NnwXCCrBP94y0yruEMKljBtpfOJa8xt2tQK9Uv3us
         DCMRakDZozm90KOoW3cbjbDj4BQOof9d8G8JCRTCUdQfWtCE31Eb0lAMM5OtfkUm2Nhx
         VmJDqMbGC9MzQKBMoSYBBZECw1XTPNMSo1jj2JgqgMBU+gXHTsuukkx3mmCvPWQRTf+1
         2F5eqtW+GYfb0HFwjh5JjWGe7xwhRHyhrZb721hVvuBLK17o8WWiIOdp13L6J+MWtgms
         YAQA==
X-Gm-Message-State: APjAAAX8XCL05bYK8zKWAzdbcCOfaIvn7ZeEnPg00u16yOHlU6xT4spt
        IKVXCPvoxLDyM71ghg1wgBKWxTz69OLdMdNW2SEZzk7m
X-Google-Smtp-Source: APXvYqw5om0hdlNUAekobhlo7SO95tX8sAyy6KO/yg8RJluTP+zdD0VzvTbuSj9rZCswVfvGTY9dn6Dl1rk8qNAJ8F8=
X-Received: by 2002:a02:ce5b:: with SMTP id y27mr22559747jar.38.1574567685414;
 Sat, 23 Nov 2019 19:54:45 -0800 (PST)
MIME-Version: 1.0
References: <1574335820-15188-1-git-send-email-chenhc@lemote.com>
 <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain> <EAC4F77C-88BE-47FA-83A5-5855A869425A@flygoat.com>
 <3C1D695B-09AA-4C2D-A94F-84DFC05C6F0C@flygoat.com>
In-Reply-To: <3C1D695B-09AA-4C2D-A94F-84DFC05C6F0C@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sun, 24 Nov 2019 12:00:51 +0800
Message-ID: <CAAhV-H4R1LqwLyehnTo89XPCeZo=ka=p29_rHVg=vJ_YiqqNCQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Make sure ebase address is in KSEG0
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

On Sat, Nov 23, 2019 at 2:11 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 于 2019年11月23日 GMT+08:00 下午1:08:38, Jiaxun Yang <jiaxun.yang@flygoat.com> 写到:
> >
> >
> >于 2019年11月23日 GMT+08:00 上午2:47:31, Paul Burton <paulburton@kernel.org>
> >写到:
> >>Hi Huacai,
> >>
> >>On Thu, Nov 21, 2019 at 07:30:20PM +0800, Huacai Chen wrote:
> >>> Dynamically allocated ebase address above 0x20000000 can be
> >triggered
> >>> by some special physical memory layout, or just by a "big kernel +
> >>big
> >>> initrd + big swiotlb" configuration.
> >>>
> >>> For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64
> >it
> >>> is usable but this case is warned. However, this warning is useless
> >>> because it is unfixable in a specific system configuration. So we
> >>just
> >>> use CKSEG0 as a fallback.
> >>
> >>I'd prefer that we don't assume there's memory at physical address
> >zero
> >>- that property doesn't hold for all systems.
> >>
> >>How about the change I suggested previously over here:
> >>
> >>https://lore.kernel.org/linux-mips/20191108191149.bbq3h4xp4famsh2n@lantea.localdomain/
> >>
> >>Would that work for you?
Now this patch has nothing to do with WG bit, and also has nothing to
do with Loongson, it just a problem with ebase address -- on any
MIPSr2 platforms where ebase is dynamically allocated.

In the comments it is said that ebase address above 0x20000000 (which
should be in XKphys) has problems to handle cache error. However, if
we really treat it as a problem, we should avoid it (not just a
warning); and if we don't think it is a problem, then we can remove
the warning (because the warning is unfixable in a specific system
configuration).

Huacai
> >
> >Hi Paul
> >
> >Our problem is, sometimes the ebase from firmware is totally a random
> >address,
> >even not inside the memory region. I'd prefer ignore address if it's
> >not valid since the warning here can't deal with it.
>
> I'm sorry. I was wrong. Please ignore the noise.
>
> Thanks
>
> >
> >Thanks.
> >>
> >>Thanks,
> >>    Paul
> >>
>
> --
> Jiaxun Yang
