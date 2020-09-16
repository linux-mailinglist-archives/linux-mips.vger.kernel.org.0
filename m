Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC0126C19C
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 12:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgIPKVj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 06:21:39 -0400
Received: from elvis.franken.de ([193.175.24.41]:41367 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbgIPKTv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Sep 2020 06:19:51 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kIUWx-00021L-00; Wed, 16 Sep 2020 12:19:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A651AC0FC0; Wed, 16 Sep 2020 12:18:57 +0200 (CEST)
Date:   Wed, 16 Sep 2020 12:18:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>
Subject: Re: [PATCH V6 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200916101857.GA13514@alpha.franken.de>
References: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
 <1599473169-6599-2-git-send-email-chenhc@lemote.com>
 <20200914111118.GB8974@alpha.franken.de>
 <2a0e87d6-f157-d645-cbb3-bbc3e0f33c7a@flygoat.com>
 <CAAhV-H4YoDKPY-rLcnjgYLEVX2ErReAPGw3bKQ_iP-7jC2G_MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4YoDKPY-rLcnjgYLEVX2ErReAPGw3bKQ_iP-7jC2G_MQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 16, 2020 at 02:22:40AM -0400, Huacai Chen wrote:
> H, Thomas,
> 
> On Tue, Sep 15, 2020 at 1:23 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> >
> >
> > 在 2020/9/14 19:11, Thomas Bogendoerfer 写道:
> > > On Mon, Sep 07, 2020 at 06:06:08PM +0800, Huacai Chen wrote:
> > >> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> > >> index 409cb48..9fc88ec 100644
> > >> --- a/arch/mips/boot/compressed/head.S
> > >> +++ b/arch/mips/boot/compressed/head.S
> > >> @@ -14,11 +14,16 @@
> > >>
> > >>   #include <asm/asm.h>
> > >>   #include <asm/regdef.h>
> > >> +#include <asm/mipsregs.h>
> > >>
> > >>      .set noreorder
> > >>      .cprestore
> > >>      LEAF(start)
> > >>   start:
> > >> +    mfc0    t0, CP0_STATUS
> > >> +    or      t0, ST0_KERNEL_CUMASK
> > >> +    mtc0    t0, CP0_STATUS
> > >> +
> > >>      /* Save boot rom start args */
> > >>      move    s0, a0
> > >>      move    s1, a1
> > > please to compiler flags in arch/mips/boot/compressed/Makefile to
> > > disable generation of instruction not supported, if CU2 is disabled
> > > (and don't forget about 2ef).
> >
> > I don't think it's worthy to have different CFLAGS between zboot and rest of
> > the kernel.
> >
> > On GCC version prior to 9, there is no flag to control the generation of
> > these instructions, unless drop supplied "-march=loongson3a" option,
> > that's messy and unreliable for Makefile.
> >
> > By contrast, enabling CU2 in zboot have no side effect. Some firmware even
> > did it in early ROM initilization stage.
> What do you think about? I agree with Jiaxun, but disable lq/sq in
> zboot is also acceptable for me.

I prefer to keep zboot as minimal as possible, so please disable lq/sq.
Thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
