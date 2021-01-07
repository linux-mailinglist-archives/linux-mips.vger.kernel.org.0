Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FA72ED5FE
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 18:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbhAGRsC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 12:48:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:34891 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728889AbhAGRsC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 12:48:02 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxZNW-00015D-00; Thu, 07 Jan 2021 18:47:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 49471C081B; Thu,  7 Jan 2021 18:26:20 +0100 (CET)
Date:   Thu, 7 Jan 2021 18:26:20 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Jinyang He <hejinyang@loongson.cn>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
Message-ID: <20210107172620.GA13201@alpha.franken.de>
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
 <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 31, 2020 at 09:23:33AM +0800, Huacai Chen wrote:
> > Thanks, :-)
> > Jinyang
> Any comments?

sure...

> > > --- a/arch/mips/kernel/relocate_kernel.S
> > > +++ b/arch/mips/kernel/relocate_kernel.S
> > > @@ -6,6 +6,7 @@
> > >
> > >   #include <asm/asm.h>
> > >   #include <asm/asmmacro.h>
> > > +#include <asm/cpu.h>
> > >   #include <asm/regdef.h>
> > >   #include <asm/mipsregs.h>
> > >   #include <asm/stackframe.h>
> > > @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
> > >   #else
> > >       sync
> > >   #endif
> > > +
> > > +#ifdef CONFIG_CPU_LOONGSON64

Is there a reason why you can't use the already existing infrastructure
the way cavium-octeon is doing it ? If you can't please explain why
so we can find a way to extend it. But having some sort of poking
loongson registers in generic MIPS code is a non starter.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
