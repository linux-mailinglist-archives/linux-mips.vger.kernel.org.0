Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F78226BCD4
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 08:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIPGXH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 16 Sep 2020 02:23:07 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40010 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgIPGW4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Sep 2020 02:22:56 -0400
Received: by mail-io1-f68.google.com with SMTP id j2so7013119ioj.7
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2020 23:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y/PZgXJJowD3P9RzJkgyXZom9I7zhGG38QLdBIKiafA=;
        b=hmr+xoE3LIfqgBf9aopMFm2J9f4+M0D8MgkOdUUSRSDbU0xzlxcNkhdXMT2CuqZPBj
         D3Jdj+LrGl7k7XKOih+uTL60kC0NDq9cofuUtSg4uEKSTZf4lw9XzH6nJgz2dKMp5VnD
         mEN7vXXnwk8mLpwTtHQ5QxTBriN7C/7VZjAQKZG9ZJsr5Fb6eLI4ddNCRqTJX4Mn8c1v
         oxvxWYY2Kr54WXeYtLXqpoabj54yZk6EnzA3zIuxbaJPKggeT8rA7Zjy/Hu7M3xFqVPq
         6sKR+5nC1rq2mT45DpWfu+z8NTzLDZ+irWkJB0RYc5/6LTKQ1hO3p78USz2JoL7KTEt8
         rg2g==
X-Gm-Message-State: AOAM531PmKsEQ+Zb/a4ym/TBhtwZ8NC5zmH4A+P4ppmYtqirb75eldr/
        aYXtj6fgmeHP1R4egifoeaofbybVJOSIGXtGTV8=
X-Google-Smtp-Source: ABdhPJyyg2vLT1obN50HrgodZRLCfD/6QcDmwd3+JggEM1TK9W5XJRCTiETPAtvqRP+DMAqtRjeOaSejge5GWNsBrrk=
X-Received: by 2002:a02:a498:: with SMTP id d24mr21384866jam.137.1600237374950;
 Tue, 15 Sep 2020 23:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
 <1599473169-6599-2-git-send-email-chenhc@lemote.com> <20200914111118.GB8974@alpha.franken.de>
 <2a0e87d6-f157-d645-cbb3-bbc3e0f33c7a@flygoat.com>
In-Reply-To: <2a0e87d6-f157-d645-cbb3-bbc3e0f33c7a@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 16 Sep 2020 02:22:40 -0400
Message-ID: <CAAhV-H4YoDKPY-rLcnjgYLEVX2ErReAPGw3bKQ_iP-7jC2G_MQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

H, Thomas,

On Tue, Sep 15, 2020 at 1:23 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 在 2020/9/14 19:11, Thomas Bogendoerfer 写道:
> > On Mon, Sep 07, 2020 at 06:06:08PM +0800, Huacai Chen wrote:
> >> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> >> index 409cb48..9fc88ec 100644
> >> --- a/arch/mips/boot/compressed/head.S
> >> +++ b/arch/mips/boot/compressed/head.S
> >> @@ -14,11 +14,16 @@
> >>
> >>   #include <asm/asm.h>
> >>   #include <asm/regdef.h>
> >> +#include <asm/mipsregs.h>
> >>
> >>      .set noreorder
> >>      .cprestore
> >>      LEAF(start)
> >>   start:
> >> +    mfc0    t0, CP0_STATUS
> >> +    or      t0, ST0_KERNEL_CUMASK
> >> +    mtc0    t0, CP0_STATUS
> >> +
> >>      /* Save boot rom start args */
> >>      move    s0, a0
> >>      move    s1, a1
> > please to compiler flags in arch/mips/boot/compressed/Makefile to
> > disable generation of instruction not supported, if CU2 is disabled
> > (and don't forget about 2ef).
>
> I don't think it's worthy to have different CFLAGS between zboot and rest of
> the kernel.
>
> On GCC version prior to 9, there is no flag to control the generation of
> these instructions, unless drop supplied "-march=loongson3a" option,
> that's messy and unreliable for Makefile.
>
> By contrast, enabling CU2 in zboot have no side effect. Some firmware even
> did it in early ROM initilization stage.
What do you think about? I agree with Jiaxun, but disable lq/sq in
zboot is also acceptable for me.

Huacai
>
> Thanks.
>
> - Jiaxun
>
> >
> > Rest of the patch LGTM.
> >
> > Thomas.
> >
