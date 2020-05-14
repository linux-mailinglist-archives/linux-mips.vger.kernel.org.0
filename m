Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2129B1D26C3
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 07:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgENFor (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 01:44:47 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46972 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgENFor (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 01:44:47 -0400
Received: by mail-io1-f68.google.com with SMTP id j8so581645iog.13
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 22:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7oDc3kobxbLN8zQjue8D4ls6OVvEC00+vj04oio67vo=;
        b=qyxEGwwl5itlw9LTfker6uysZv472O64uxajOCMORYDg9L+WKEg89KT4IhLyAY4i5W
         IPoUL9btH6bxZzPOxAYIgL5uj97cTN64isKn/YROtUml3ftB/W4NR1Wkd2Z4z85/rghT
         PLbZIKahDDKhCHEXiykgeUbABxuTrMwnBMVZ9SRNntX8z1htp0oGj/tZ6idBx5huYe3z
         EUEeVQnai4/wC0fD5LFkPmwGQsu1EDawHR8B3q/mpIGWWpq4Y2WnyhFBOl1NamG5e0vo
         DWqMpWtWLnRxVN+orMoRuZiTDJFtzThUlzwRgYJHYUCAqzTbG1lZkiZcTK3+eUbV5i3Y
         W1pA==
X-Gm-Message-State: AOAM533FAn2rETfL9EwLVgjnrC9U8FinTGP8ZrKUIpb4ChT4lmnV1h3d
        wFQbHY+m7aPuB05uGme8uDN7gxnRkNW6LenKlPQ=
X-Google-Smtp-Source: ABdhPJxroh5u40yQ5KepP31yU6zZog4e7NkAyytC6rlf4B9qjFb0lyX1srCDgrm+zoX1IvYldw0zfrc13Af9bIPqSVk=
X-Received: by 2002:a5e:880b:: with SMTP id l11mr2704858ioj.42.1589435085215;
 Wed, 13 May 2020 22:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <1588153121-28507-1-git-send-email-chenhc@lemote.com>
 <20200429183305.GB21234@alpha.franken.de> <CAAhV-H6KWnzwB-p6aOL+L_ZXiYsMyzN1MbXeeeTYpimg7jG73w@mail.gmail.com>
 <alpine.LFD.2.21.2005010117200.851719@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2005010117200.851719@eddie.linux-mips.org>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 14 May 2020 13:44:34 +0800
Message-ID: <CAAhV-H6-CBEh2jaTudon=X1tR6iGtjC20QBt74fUkAdh1ZbgcQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
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

Hi, Maiej,

On Thu, May 14, 2020 at 6:42 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Thu, 30 Apr 2020, Huacai Chen wrote:
>
> > > > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > > > index ce40fbf..0f71540 100644
> > > > --- a/arch/mips/include/asm/mipsregs.h
> > > > +++ b/arch/mips/include/asm/mipsregs.h
> > > > @@ -386,6 +386,7 @@
> > > >  #define ST0_CU1                      0x20000000
> > > >  #define ST0_CU2                      0x40000000
> > > >  #define ST0_CU3                      0x80000000
> > > > +#define ST0_MM                       0x40000000      /* Loongson-3 naming */
> > >
> > > please use ST0_CU2, so everybody understands it's COO2
> > I see that there is already an alias  ST0_XX for ST0_CU3, and I think
> > use a ST0_MM for ST0_CU2 is more meaningful in some places (at least
> > in traps.c where ST0_XX is also used). If there are places only used
> > to describe the CU Mask (such as in stackframe.h), I will use ST0_CU2.
>
>  Well ST0_XX is not an alias, because the bit has a different meaning that
> has nothing to do with CP3.  It just happens to share the bit position in
> CP0.Status with ST0_CU3.  Yes, ST0_XX is misplaced and misnamed as it
> applies to R10k processors only, but it is our legacy from the old days of
> chaos and some three processor types supported.  This is similar to say
> ST0_ERL vs ST0_IEP, which also share the bit position in CP0.Status, but
> have different meanings each.
>
>  All this could have been cleaned up (e.g. s/ST0_XX/R10K_ST0_XX/) if
> someone had the incentive; I occasionally had and poked at these macros,
> but apparently missed this one and a couple of other ones.  Maybe on some
> rainy autumn evening...
>
>  However ST0_MM does enable CP2, even if a specific implementation, making
> it no different from ST0_CU2 really.
I have send a new version, could you please review that?Thank you.

>
>   Maciej
>
>
Huacai
