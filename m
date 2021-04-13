Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1646B35DD96
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 13:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345286AbhDMLS5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 07:18:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:47658 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237455AbhDMLS4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 07:18:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lWH3v-00084x-00; Tue, 13 Apr 2021 13:18:31 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0C5A3C02C4; Tue, 13 Apr 2021 13:14:39 +0200 (CEST)
Date:   Tue, 13 Apr 2021 13:14:38 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
Message-ID: <20210413111438.GA9472@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
 <20210412142730.GA23146@alpha.franken.de>
 <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 09:15:48AM +0800, Jinyang He wrote:
> On 04/12/2021 10:27 PM, Thomas Bogendoerfer wrote:
> > > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > > index 91bc7fb..eafc99b 100644
> > > --- a/arch/mips/include/asm/uaccess.h
> > > +++ b/arch/mips/include/asm/uaccess.h
> > > @@ -630,8 +630,8 @@ static inline long strnlen_user(const char __user *s, long n)
> > >   {
> > >          long res;
> > > -       if (!access_ok(s, n))
> > > -               return -0;
> > > +       if (!access_ok(s, 1))
> > > +               return 0;
> > >          might_fault();
> > >          __asm__ __volatile__(
> > that's the fix I'd like to apply. Could someone send it as a formal
> > patch ? Thanks.
> > 
> > Thomas.
> > 
> Hi, Thomas,
> 
> I always think it is better to use access_ok(s, 0) on MIPS. I have been
> curious about the difference between access_ok(s, 0) and access_ok(s, 1)
> until I saw __access_ok() on RISCV at arch/riscv/include/asm/uaccess.h
> 
> The __access_ok() is noted with `Ensure that the range [addr, addr+size)
> is within the process's address space`. Does the range checked by
> __access_ok() on MIPS is [addr, addr+size]. So if we want to use
> access_ok(s, 1), should we modify __access_ok()? Or my misunderstanding?

you are right, I'm going to apply

https://patchwork.kernel.org/project/linux-mips/patch/20190209194718.1294-1-paul.burton@mips.com/

to fix that.

> More importantly, the implementation of strnlen_user in lib/strnlen_user.c
> is noted `we hit the address space limit, and we still had more characters
> the caller would have wanted. That's 0.` Does it make sense? It is not
> achieved on MIPS when hit __ua_limit, if only access_ok(s, 1) is used.

see the comment in arch/mips/lib/strnlen_user.S

 * Note: for performance reasons we deliberately accept that a user may
 *       make strlen_user and strnlen_user access the first few KSEG0
 *       bytes.  There's nothing secret there.  On 64-bit accessing beyond
 *       the maximum is a tad hairier ...

for 32bit kernels strnlen_user could possibly access KSEG0 and will find
a 0 sooner or later. I don't see much problems there. For 64bit kernels
strnlen_user will stop inside user space as there will be nothing
mapped after __UA_LIMIT.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
