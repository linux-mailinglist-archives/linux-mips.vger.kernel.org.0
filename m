Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B2E1B57ED
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 11:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgDWJSv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 05:18:51 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43558 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWJSv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 05:18:51 -0400
Received: by mail-io1-f67.google.com with SMTP id 19so5626149ioz.10
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2020 02:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6eZiZWmNskUmkholijwyj4qSeQoHJYWmhK4Utg1NCJk=;
        b=Ngtx9MX5W9Lrgr9oMGcTJneZvOF43Xq21UVg/jWKNhquOWMgbQ3gGzMzg//iiNz4/d
         N3XDusht2qJTcnz/MRJWMgJEufsKhIxxmORFVrOleRCRL01erwLJtZSJf2OMfBeT2jMB
         ylpr+Kx3HElAcgZdDtj4qzK2RNe1dYwMbl1Njn1NfNPs7GB9MFyvW5CZm4b3hnE8DpZw
         ZQWzSGjZD+vbLoXs1lUHO0ywt/2pIxIoZHxO5YSsK6xt9y2cxdicL9XajxbktyJ3ijVF
         1+ORgMllan48YzjRc0n8VvnFNiMSYy4o1AigxSNiLDsLaLEK9uJn2381Y1RBrVNBdqL0
         FSCA==
X-Gm-Message-State: AGi0PuZvUheRBtq3l/BvNu79d/yNvv8tBjtn5ZahO2ocdxaZvfKUTYcs
        hV/C9v4prmeKAQdnBCGUVOM56s1dcioU0hXPbJdnVDiMsRk=
X-Google-Smtp-Source: APiQypJMZS0fvE9mXtNyfpyg9plvxOCYB1juNUWBTZ6XKGkTZbdI+RXOo0gMumXBRtReuEytG9djOE0C+swLFa+moZw=
X-Received: by 2002:a05:6638:1192:: with SMTP id f18mr2263777jas.123.1587633530069;
 Thu, 23 Apr 2020 02:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
 <1587548422-10707-2-git-send-email-chenhc@lemote.com> <20200422161044.GA22753@alpha.franken.de>
In-Reply-To: <20200422161044.GA22753@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 23 Apr 2020 17:26:08 +0800
Message-ID: <CAAhV-H4HNYs8UfdYFRjZacCXtTzERL-39w-fsHPK9UT91BP8xg@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] MIPS: Move unaligned load/store helpers to inst.h
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Pei Huang <huangpei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Thu, Apr 23, 2020 at 12:11 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 22, 2020 at 05:40:21PM +0800, Huacai Chen wrote:
> > Move unaligned load/store helpers from unaligned.c to inst.h, then
> > other parts of the kernel can use these helpers.
> >
> > Signed-off-by: Pei Huang <huangpei@loongson.cn>
> > Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  arch/mips/include/asm/inst.h | 773 ++++++++++++++++++++++++++++++++++++++++++
> >  arch/mips/kernel/unaligned.c | 775 -------------------------------------------
>
> this patch still has checkpatch errors/warnings and more serious
> it breaks at least IP30 builds.
>
> Patch 3 also contains checkpatch errors.
>
> Please fix them before submitting again.
I will try my best to fix the all possible checkpatch errors/warnings,
but this patch (Patch 2) just move some code from one file to another
file. Should I fix those errors in this patch?

The other problem, IP28/IP30 build fails because of the redefinition
of "LONG". In asm.h "LONG" is .dword, but in
arch/mips/include/asm/fw/arc/types.h "LONG" is "long". I don't know
what is the best way to resolve this, maybe remove the "LONG"
definition in types.h and use "long" instead?

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

Thanks,
Huacai
