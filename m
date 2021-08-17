Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9EE3EE3FB
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 03:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhHQByC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 21:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbhHQBx7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 21:53:59 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7775BC061764;
        Mon, 16 Aug 2021 18:53:27 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id z1so1478880ioh.7;
        Mon, 16 Aug 2021 18:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DsKrl2iRjJaSZKdNUz2JO6h2rvMiTsyLdCWNCDFYxik=;
        b=CyBpXQZ/J+LH4E3Np0XqjelogX3iH9+3QLk0MvA69ESWv2TtmQhAAl9xE6Bmq9eVZC
         xs2ysOc770crIdDNeIIOs0/Q9qrDo3UkFWBVKoHzsbyNRWqaucqkA7L/s2Ils8Nbb8Wv
         kxm6R7geEFE0sUCMLg3qqun/Ys9zZHWOc5+XX4LHX4uUv0G7El8QeS/Fw+YaOazRcXy+
         Kjni8a/W11zayfglf6yKsfyh/rGkQGj6YkX3bbfXjmLpdWCIv/ltjaBJ302bzmyd90DK
         Nwfhv4j5WH/agRo7NHleP3/rT31xnKdFyjHegx88IGVUNay+b024Aikr0DmBOZp679Bk
         TIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsKrl2iRjJaSZKdNUz2JO6h2rvMiTsyLdCWNCDFYxik=;
        b=NCzEOMP8ncalzaVl02dMmg4GlSMx0+AxgIRkG2iPUonT3nnRVtPvNWOKPvDEkaC42E
         1EE5wcI5KfOd2eHrG6qZDvm74ON9tZEHBxI4F9/NFU42KbCK0A9A+pBocUHSm4QjpznG
         jFLOi2A3/ep2jqlWsJBhEINVTrhjSFiGyb1AU6y6/sEgOkIRuA8Gbc8YofMwwbqiQsKY
         /4gIEvNva6ZZus2o5hhAzIFLRtH7a+k9iFyvH87l9n4xJ7CZAlnuy/2EFePwJdzpm9ou
         nH49bWtcILxpVzzXD2PXTCP1sA6/Vl0LuoRiX0ZS0trhOuS1AYEDk/A/HwqriKZ2iRny
         Wf7g==
X-Gm-Message-State: AOAM5334vAnTMre8Ei25C6SmkhSoxOxlOu5BMHI9MOw8METrHa/RPjb3
        yZs5Wlo8lhUr06sv9nyuKMAE77W4tAb4nHt15m9hjWwONwvPdQ==
X-Google-Smtp-Source: ABdhPJxK7nkmj+RgS+akmsvqQOE/tdGIzPEpqjvvOtNK13SLZt39sBjdG97ffqRm6E23mGlqJ2uxMPIK6FYl28xfU5E=
X-Received: by 2002:a6b:e010:: with SMTP id z16mr1012160iog.94.1629165206905;
 Mon, 16 Aug 2021 18:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld> <874kbpp5zd.ffs@tglx>
In-Reply-To: <874kbpp5zd.ffs@tglx>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Tue, 17 Aug 2021 09:53:14 +0800
Message-ID: <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Davidlohr and Thomas,

On Tue, Aug 17, 2021 at 3:03 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Aug 16 2021 at 11:27, Davidlohr Bueso wrote:
> > On Mon, 16 Aug 2021, Huacai Chen wrote:
> >
> >>fault_in_user_writeable() should verify R/W access but only verify W. In
> >>most archs W implies R, but not true in MIPS and LoongArch, so fix it.
> >
> > Yuck for a find_vma() in futex.c. If this is a problem in MIPS, shouldn't
> > the fix be there? Furthermore it's stated that fault_in_user_writeable():
> >
> > "Fault in user address and verify RW access"
>
> That seems to be wishful thinking given the fact that some architectures
> do not imply R for FLAG_FAULT_WRITE.
>
> > And you guys seem to have proposed it already:
> >
> > https://lore.kernel.org/linux-mips/20200630005845.1239974-1-liulichao@loongson.cn/
This works, but I don't think this is a MIPS problem, so does Thomas
Bogendoerfer. Because write-only page is valid in MIPS (so Thomas
rejected this patch).

>
> That's surely one way to fix that. If that does not work for whatever
> reason, then we really don't want this find_vma() hack there, but rather
> something like:
I don't know why find_vma() is unacceptable here, there is also
find_vma() in fixup_user_fault().

>
>     if (IS_ENABLED(CONFIG_ARCH_USER_FAULT_VOODOO) && get_user(&tmp, uaddr))
>         return -EFAULT;
get_user() may be better than find_vma(), but can we drop
CONFIG_ARCH_USER_FAULT_VOODOO here? On those "W implies R" archs,
get_user() always success, this can simplify the logic.

Huacai

>
> Thanks,
>
>         tglx
