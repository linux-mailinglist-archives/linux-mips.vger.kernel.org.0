Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F128241AC7
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 14:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgHKMHd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 08:07:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:43751 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728790AbgHKMH1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 08:07:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k5T3h-0002Ps-00; Tue, 11 Aug 2020 14:07:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A82B6C0CC7; Tue, 11 Aug 2020 14:06:45 +0200 (CEST)
Date:   Tue, 11 Aug 2020 14:06:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200811120645.GA6199@alpha.franken.de>
References: <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
 <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
 <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com>
 <20200810141219.GA2844@alpha.franken.de>
 <106e65f5-d456-deaa-b47b-45b2a461b048@flygoat.com>
 <CAAhV-H7xJXX7V18ZUKw6RdEOtKUF49itrXY0PBNFAcSBbr4idQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7xJXX7V18ZUKw6RdEOtKUF49itrXY0PBNFAcSBbr4idQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 11, 2020 at 02:45:05PM +0800, Huacai Chen wrote:
> Hi, Thomas and Jiaxun,
> 
> On Tue, Aug 11, 2020 at 10:18 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> >
> >
> > 在 2020/8/10 22:12, Thomas Bogendoerfer 写道:
> > > On Sun, Aug 09, 2020 at 10:53:13PM +0800, Jiaxun Yang wrote:
> > >> Thus we still need to enable CU2 with exception for user space, and we can
> > >> always enable CU2 in
> > >> kernel since kernel won't be compiled with hard-float. :-)
> > > I see, how about the patch below
> > That looks fine for me.
> > Is it good with you, Huacai?
> 
> There are two problems:
> 1, zboot (arch/mips/boot/compressed/head.S) should be considered,
> because the initial value of Status may or may not contain CU2.

this comes with it's own memcpy/memset and stuff, I don't see a reason why
COP2 needs to be enabled there,

> 2, r4k_switch.S should set CU2 for the new process, otherwise it
> cannot use gslq/gssq while it in kernel (Because the new process
> doesn't contain CU2 in THERAD_STATUS.

which is correct for all user space process, otherwise the whole
cop2 exception thing wouldn't work. And if cop2 exception handling
has been run it's set in THREAD_STATUS.

> Though a process sets CU2 when it enters kernel, but it
> only sets CU2 in hardware, not in THREAD_STATUS).

A kernel thread will get THREAD_STATUS from current running kernel code,
at least that's how I read this code:

       if (unlikely(p->flags & PF_KTHREAD)) {
                /* kernel thread */
                unsigned long status = p->thread.cp0_status;
                memset(childregs, 0, sizeof(struct pt_regs));
                ti->addr_limit = KERNEL_DS;
                p->thread.reg16 = usp; /* fn */
                p->thread.reg17 = kthread_arg;
                p->thread.reg29 = childksp;
                p->thread.reg31 = (unsigned long) ret_from_kernel_thread;
#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
                status = (status & ~(ST0_KUP | ST0_IEP | ST0_IEC)) |
                         ((status & (ST0_KUC | ST0_IEC)) << 2);
#else
                status |= ST0_EXL;
#endif
                childregs->cp0_status = status;
                return 0;
        }

If there is still something missing, I want to find the root cause
and not paper over it in r4k_switch.S and IMHO break COP2 handling for
loongsoon completely.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
