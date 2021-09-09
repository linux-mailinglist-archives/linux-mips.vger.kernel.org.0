Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B95240602B
	for <lists+linux-mips@lfdr.de>; Fri, 10 Sep 2021 01:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhIIXkX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Sep 2021 19:40:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232591AbhIIXiK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Sep 2021 19:38:10 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AF536108D;
        Thu,  9 Sep 2021 23:36:57 +0000 (UTC)
Date:   Thu, 9 Sep 2021 19:36:55 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Weizhao Ouyang <o451686892@gmail.com>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH v4] ftrace: Cleanup ftrace_dyn_arch_init()
Message-ID: <20210909193655.7bc715af@gandalf.local.home>
In-Reply-To: <20210909090216.1955240-1-o451686892@gmail.com>
References: <20210909090216.1955240-1-o451686892@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  9 Sep 2021 17:02:16 +0800
Weizhao Ouyang <o451686892@gmail.com> wrote:

> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.

FYI,

I'm not ignoring this patch. I just wont be able to look at it until the
merge window is over.

-- Steve


> 
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
> Acked-by: Helge Deller <deller@gmx.de> (parisc)
> 
> ---
> Changes in v4:
> -- revert the generic declaration
> 
> Changes in v3:
> -- fix unrecognized opcode on PowerPC
> 
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag
> 
> ---
>  arch/arm/kernel/ftrace.c        | 5 -----
>  arch/arm64/kernel/ftrace.c      | 5 -----
>  arch/csky/kernel/ftrace.c       | 5 -----
>  arch/ia64/kernel/ftrace.c       | 6 ------
>  arch/microblaze/kernel/ftrace.c | 5 -----
>  arch/nds32/kernel/ftrace.c      | 5 -----
>  arch/parisc/kernel/ftrace.c     | 5 -----
>  arch/riscv/kernel/ftrace.c      | 5 -----
>  arch/s390/kernel/ftrace.c       | 5 -----
>  arch/sh/kernel/ftrace.c         | 5 -----
>  arch/sparc/kernel/ftrace.c      | 5 -----
>  arch/x86/kernel/ftrace.c        | 5 -----
>  kernel/trace/ftrace.c           | 5 +++++
>  13 files changed, 5 insertions(+), 61 deletions(-)
> 
>
