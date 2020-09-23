Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEDC274F74
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 05:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgIWDNW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 23:13:22 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36621 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgIWDNW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 23:13:22 -0400
Received: by mail-io1-f65.google.com with SMTP id d190so22145412iof.3
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 20:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/2YhYEnAm0rfMkZo01TWp92cAKbHfdXt9AbRW+PdHo=;
        b=sxAdeGbZUsLHfp3Buk/qomA/6SqauLysp+r6GKYctbtUNeLK2D2yxifsnx8DpSzSLm
         5ibWL7+QsPYpOQhepvAKuJ9wzB3Iyy/T8HJ9HeDroeqFnPH484a95bEweDDN4Y5XB4eJ
         mcod7Ys3aCpVBOob6bg4JyjDn9lqNvuzIpxl9l6tbuqWVF41v4P5ug898iVa8f4lbnz4
         iFYQ00WmBHj2VN1m0ImOzpAY3JuDUwDQlakbRsCBayUHesNHf4yMzCthlCvcFW4awPfe
         zPFBbgSI2RWzfq6LweMExryMcEaslap3KHpr/EmDFTUk4J6fxD56DrfZMgUPkikWxqHW
         C5kw==
X-Gm-Message-State: AOAM533H4G+clUL5txdJor2L40ffSnrA26BFIzuRhZLv1uuJwZY1EQpf
        DcPsUQiqku9THjqU4Oxy03cSpBBwbvnWc/CG8dxBmZLZXWQ=
X-Google-Smtp-Source: ABdhPJwrWd0D8CRV/nCUIuWRz3C5Otd0jB0zpO7FBDrVYBGRT6SqwMn4CbwNa5516SjVgSO6haIkINH5PXHac3MgXNI=
X-Received: by 2002:a02:a498:: with SMTP id d24mr6720804jam.137.1600830801366;
 Tue, 22 Sep 2020 20:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com> <e91c0c4d-ff35-1eee-22c5-e2e258e618ec@loongson.cn>
In-Reply-To: <e91c0c4d-ff35-1eee-22c5-e2e258e618ec@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 23 Sep 2020 11:13:08 +0800
Message-ID: <CAAhV-H6=Ytj2=A72w=G9kyOt0noiPMtdo=+cYVA65CUUXGcPMg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old memories
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jinyang,

On Wed, Sep 23, 2020 at 11:02 AM Jinyang He <hejinyang@loongson.cn> wrote:
>
> On 09/23/2020 10:30 AM, Huacai Chen wrote:
> > Kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
> > commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
> > BIOS passed memories are removed by early_parse_mem(). I think this is
> > reasonable for a normal kernel but not for a crash kernel, because a
> > crash kernel should be able to see all old memories, even though it is
> > not supposed to use them.
> >
> > Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >   arch/mips/kernel/setup.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > index 4c04a86..e2804a2 100644
> > --- a/arch/mips/kernel/setup.c
> > +++ b/arch/mips/kernel/setup.c
> > @@ -392,8 +392,10 @@ static int __init early_parse_mem(char *p)
> >        */
> >       if (usermem == 0) {
> >               usermem = 1;
> > +#ifndef CONFIG_CRASH_DUMP
> >               memblock_remove(memblock_start_of_DRAM(),
> >                       memblock_end_of_DRAM() - memblock_start_of_DRAM());
> > +#endif
>
> Hi, Huacai,
>
> For this patch, I knew something what had happened. "mem=" parsing
> works wrong for Loongson64. You can referenced the follow patch:
> https://patchwork.kernel.org/patch/11789555/
>
> memblock_add() calls memblock_add_range(,,, MAX_NUMNODES,)
> For Loongson64 enabling NUMA, we need memblock_add_node(). (Or
> using memblock_set_node() after memblock_add())
This seems like another story.

>
> Besides, "mem=" may be useless for kdump. Youling had submitted a patch
> about removing "mem="  serveral days ago.
kexec-tools use "mem=" to pass usable memory for the crash kernel,
Youling removes the base address of "mem=", but "mem=" is still here.

>
> For Loongson64 platform, you can try crashkernel=SIZE@38M after fixed
> "mem=".
> 38M means 40M - 2M, 2M is needed because old firmware compatibility.
"crashkernel=" is for the normal kernel specified by BIOS, and "mem="
is for the crash kernel specified by kexec-tools.

Huacai
>
> Thanks,
> - Jinyang.
>
> >       }
> >       start = 0;
> >       size = memparse(p, &p);
>
