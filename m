Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0475842A54E
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 15:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236798AbhJLNUV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 09:20:21 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:55852 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236778AbhJLNUT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 09:20:19 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1634044696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ymITe80mWx73Jpl6DT0uZfy3o7gRcw0Jy8tyHcqTiE8=;
        b=LgaA3Nn8D5eyiroiMjLQj1ZhZdlUPtCnf/rR857Hlvt8mv5RUmY61YF4hHBKRBYHLcuu/G
        6ZMikcEqXcE1GnrbxQhKCF1VQSUMyNDrgz4BzLU5ZU/gCKIgNXI/RVbBa5c/Bsyfm3dVlF
        KkixShZSQpIlWz6wfjm4YAuLCObFpbqbEyQ772cMxlT4bcbl/KCGQGRyHOp5rP+zitwk1S
        N/Gagk6koDP600UMSZQhg4GWg5e0y4XRtS1TkWniBwAu2qlgrpk2hrvb8zbESXzX5SZVDk
        vqnlzBJX/tqy1ZZbMMmue19hCFdLlAJbFqV9I8YFOl/o88Dx91/kw82WsZUwzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1634044696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ymITe80mWx73Jpl6DT0uZfy3o7gRcw0Jy8tyHcqTiE8=;
        b=A1bEbvzkMZxpPWGXGbpmn5c5uilUbirjSJukgbchZ/6SfuWjbW6OVRmpiv2Pj4rCXaxU6r
        +aou9YS2AQw3fBCw==
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [GIT PULL] arm64 fixes for 5.15-rc5
In-Reply-To: <CAHk-=wjTAJwMJZ-6PPxvdtDmkL0=pfRF77nJ5qWw2vbiTzT4nQ@mail.gmail.com>
References: <YWCPyK+xotTgUMy/@arm.com>
 <CAHk-=whWZ4OxfKQwKVrRc-E9=w-ygKdVFn_HcAMW-DW8SgranQ@mail.gmail.com>
 <20211011104729.GB1421@C02TD0UTHF1T.local>
 <CAHk-=wjTAJwMJZ-6PPxvdtDmkL0=pfRF77nJ5qWw2vbiTzT4nQ@mail.gmail.com>
Date:   Tue, 12 Oct 2021 15:18:16 +0200
Message-ID: <87czoacrfr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Linus,

On Mon, Oct 11 2021 at 12:54, Linus Torvalds wrote:
> On Mon, Oct 11, 2021 at 3:47 AM Mark Rutland <mark.rutland@arm.com> wrote:
> And so the reason I really hate that patch is that it introduces a new
> "different architectures randomly and inexplicably do different
> things, and the generic behavior is very different on arm64 than it is
> elsewhere".
>
> That's just the worst kind of hack to me.
>
> And in this case, it's really *horribly* hard to see what the call
> chain is. It all ends up being actively obfuscated and obscured
> through that 'handle_arch_irq' function pointer, that is sometimes set
> through set_handle_irq(), and sometimes set directly.
>
> I really think that if the rule is "we can't do accounting in
> handle_domain_irq(), because it's too late for arm64", then the fix
> really should be to just not do that.
>
> Move the irq_enter()/irq_exit() to the callers - quite possibly far up
> the call chain to the root of it all, and just say "architecture code
> needs to do this in the low-level code before calling
> handle_arch_irq".

That's where it belongs. It's mandatory to have it there for NOHZ_FULL
to work correctly vs. instrumentation etc. I've pointed that out back
then after we fed the X86 entry code into the mincer and added noinstr
sections to keep tracers, BPF and kprobes away from it.

Looking at the architectures which "support" that by selecting
HAVE_CONTEXT_TRACKING:

arch/arm/Kconfig:	select HAVE_CONTEXT_TRACKING
arch/arm64/Kconfig:	select HAVE_CONTEXT_TRACKING
arch/csky/Kconfig:	select HAVE_CONTEXT_TRACKING
arch/mips/Kconfig:	select HAVE_CONTEXT_TRACKING
arch/powerpc/Kconfig:	select HAVE_CONTEXT_TRACKING		if PPC64
arch/riscv/Kconfig:	select HAVE_CONTEXT_TRACKING
arch/sparc/Kconfig:	select HAVE_CONTEXT_TRACKING
arch/x86/Kconfig:	select HAVE_CONTEXT_TRACKING		if X86_64

S390 and X86 are (mostly) complete and use the generic entry code. S390
does not even select HAVE_CONTEXT_TRACKING!

PPC64 has done quite some work to fix that, but it looks not yet complete. 

Mark is working on ARM64.

There is some effort underway to convert MIPS over to generic entry.

The rest needs all the fundamental architecture side changes.

> Anyway, it _looks_ to me like the pattern is very simple:
>
> Step 1:
>  - remove irq_enter/irq_exit from handle_domain_irq(), move it to all callers.
>
> This clearly doesn't change anything at all, but also doesn't fix the
> problem you have. But it's easy to verify that the code is the same
> before-and-after.
>
> Step 2 is the pattern matching step:
>
>  - if the caller of handle_domain_irq() ends up being a function that
> is registered with set_handle_irq(), then we
>    (a) remove the irq_enter/irq_exit from it
>    (b) add it to the architectures that use handle_arch_irq.
>    (c) make sure that if there are other callers of it (not through
> handle_arch_irq) we move that irq_enter/irq_exit into them too
>
> I _suspect_ - but didn't check - that Step 2(c) doesn't actually
> exist. But who knows.

It only exists with chained handlers, but they do not need that at all
because:

        irq_enter()
        arch_handle_irq()
          handle_domain_irq()
            chained_handler()
              handle_domain_irq()

which is still the same interrupt context and not a nested interrupt.

> It really looks like there is a very tight connection between "uses
> handle_domain_irq()" and "uses handle_arch_irq/set_handle_irq()". No?

Looks like. That might conflict with the MIPS rework though. I don't
know how far that came already. Cc'ed the MIPS people.

Thanks,

        tglx
