Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF315661F8
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2019 00:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbfGKWtV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Jul 2019 18:49:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730191AbfGKWtV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Jul 2019 18:49:21 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08517214AF;
        Thu, 11 Jul 2019 22:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562885360;
        bh=F0692oM20SJBi7lipGMWh8asP30aK1zY5Sdre9epQkE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=L5Z9krLKI9nSy8tV3IzQalqBtpWXJWdMFlfaOUH+MjmcE0DMgIpRaPSkSpkAbMLkd
         uYrReV24XpvMXXctVHHhCVZoyvjIhmkxGWE0i9pTGAjZZOKxa/jhEhzpyccUp6UubU
         qBgK/iWqdautlONEQXJ6DpjMNy3+xr026DqMOj9E=
Date:   Fri, 12 Jul 2019 07:49:07 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH] mm/kprobes: Add generic kprobe_fault_handler() fallback
 definition
Message-Id: <20190712074907.1ab08841e77b6cc867396148@kernel.org>
In-Reply-To: <3aee1f30-241c-d1c2-2ff5-ff521db47755@arm.com>
References: <1562304629-29376-1-git-send-email-anshuman.khandual@arm.com>
        <20190705193028.f9e08fe9cf1ee86bc5c0bb82@kernel.org>
        <3aee1f30-241c-d1c2-2ff5-ff521db47755@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Anshuman,

On Mon, 8 Jul 2019 09:03:13 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> >> Architectures like parisc enable CONFIG_KROBES without having a definition
> >> for kprobe_fault_handler() which results in a build failure.
> > 
> > Hmm, as far as I can see, kprobe_fault_handler() is closed inside each arch
> > specific code. The reason why include/linux/kprobes.h defines
> > dummy inline function is only for !CONFIG_KPROBES case.
> 
> IIRC Andrew mentioned [1] that we should remove this stub from the generic kprobes
> header because this is very much architecture specific. As we see in this proposed
> patch, except x86 there is no other current user which actually calls this from
> some where when CONFIG_KPROBES is not enabled.
> 
> [1] https://www.spinics.net/lists/linux-mm/msg182649.html

Ah, OK. I saw another branch. Also, this is a bugfix patch against
commit 4dd635bce90e ("mm, kprobes: generalize and rename notify_page_fault() as
 kprobe_page_fault()"), please add Fixes: tag on it.

In this case, we should just add a prototype of kprobe_fault_handler() in
include/linux/kprobes.h, and maybe add a stub of kprobe_fault_handler()
as a weak function, something like below.

int __weak kprobe_fault_handler(struct pt_regs *regs, int trapnr)
{
	/*
	 * Each architecture which uses kprobe_page_fault() must define
	 * a fault handler to handle page fault in kprobe correctly.
	 */
	WARN_ON_ONCE(1);
	return 0;
}

> >> Arch needs to
> >> provide kprobe_fault_handler() as it is platform specific and cannot have
> >> a generic working alternative. But in the event when platform lacks such a
> >> definition there needs to be a fallback.
> > 
> > Wait, indeed that each arch need to implement it, but that is for calling
> > kprobe->fault_handler() as user expected.
> > Hmm, why not fixing those architecture implementations?
> 
> After the recent change which introduced a generic kprobe_page_fault() every
> architecture enabling CONFIG_KPROBES must have a kprobe_fault_handler() which
> was not the case earlier.

As far as I can see, gcc complains it because there is no prototype of
kprobe_fault_handler(). Actually no need to define empty kprobe_fault_handler()
on each arch. If we have a prototype, but no actual function, gcc stops the
error unless the arch depending code uses it. So actually, we don't need above
__weak function.

> Architectures like parisc which does enable KPROBES but
> never used (kprobe_page_fault or kprobe->fault_handler) kprobe_fault_handler() now
> needs one as well.

(Hmm, it sounds like the kprobes porting is incomplete on parisc...)

> I am not sure and will probably require inputs from arch parsic
> folks whether it at all needs one. We dont have a stub or fallback definition for
> kprobe_fault_handler() when CONFIG_KPROBES is enabled just to prevent a build
> failure in such cases.

Yeah, that is a bug, and fixed by adding a prototype, not introducing new macro.

> 
> In such a situation it might be better defining a stub symbol fallback than to try
> to implement one definition which the architecture previously never needed or used.
> AFAICS there is no generic MM callers for kprobe_fault_handler() as well which would
> have made it mandatory for parisc to define a real one.
> 
> > 
> >> This adds a stub kprobe_fault_handler() definition which not only prevents
> >> a build failure but also makes sure that kprobe_page_fault() if called will
> >> always return negative in absence of a sane platform specific alternative.
> > 
> > I don't like introducing this complicated macro only for avoiding (not fixing)
> > build error. To fix that, kprobes on parisc should implement kprobe_fault_handler
> > correctly (and call kprobe->fault_handler).
> 
> As I mentioned before parsic might not need a real one. But you are right this
> complicated (if perceived as such) change can be just avoided at least for the
> build failure problem by just defining a stub definition kprobe_fault_handler()
> for arch parsic when CONFIG_KPROBES is enabled. But this patch does some more
> and solves the kprobe_fault_handler() symbol dependency in a more generic way and
> forces kprobe_page_fault() to fail in absence a real arch kprobe_fault_handler().
> Is not it worth solving in this way ?
> 
> > 
> > BTW, even if you need such generic stub, please use a weak function instead
> > of macros for every arch headers.
> 
> There is a bit problem with that. The existing definitions are with different
> signatures and an weak function will need them to be exact same for override
> requiring more code changes. Hence choose to go with a macro in each header.
> 
> arch/arc/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, unsigned long cause);
> arch/arm/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
> arch/arm64/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
> arch/ia64/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> arch/powerpc/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> arch/s390/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> arch/sh/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> arch/sparc/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> arch/x86/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);

OK, in that case, original commit is wrong way. it should be reverted and
should introduce something like below


/* Returns true if arch should call kprobes_fault_handler() */
static nokprobe_inline bool is_kprobe_page_fault(struct pt_regs *regs)
{
	if (!kprobes_built_in())
		return false;
	if (user_mode(regs))
		return false;
	/*
	 * To be potentially processing a kprobe fault and to be allowed
	 * to call kprobe_running(), we have to be non-preemptible.
	 */
	if (preemptible())
		return false;
	if (!kprobe_running())
		return false;
	return true;
}

Since it silently casts the type of trapnr, which is strongly depends
on architecture.

> >> While here wrap kprobe_page_fault() in CONFIG_KPROBES. This enables stud
> >> definitions for generic kporbe_fault_handler() and kprobes_built_in() can
> >> just be dropped. Only on x86 it needs to be added back locally as it gets
> >> used in a !CONFIG_KPROBES function do_general_protection().
> > 
> > If you want to remove kprobes_built_in(), you should replace it with
> > IS_ENABLED(CONFIG_KPROBES), instead of this...
> 
> Apart from kprobes_built_in() the intent was to remove !CONFIG_KPROBES
> stub for kprobe_fault_handler() as well which required making generic
> kprobe_page_fault() to be empty in such case.

No, I meant that "IS_ENABLED(CONFIG_KPROBES)" is generic and is equal to
what kprobes_built_in() does.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
