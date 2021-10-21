Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148B44366EE
	for <lists+linux-mips@lfdr.de>; Thu, 21 Oct 2021 17:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhJUP7f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Oct 2021 11:59:35 -0400
Received: from foss.arm.com ([217.140.110.172]:44622 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231745AbhJUP73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Oct 2021 11:59:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24098D6E;
        Thu, 21 Oct 2021 08:57:13 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC3BD3F694;
        Thu, 21 Oct 2021 08:57:11 -0700 (PDT)
Date:   Thu, 21 Oct 2021 16:57:03 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [GIT PULL] arm64 fixes for 5.15-rc5
Message-ID: <20211021155654.GA55459@lakrids.cambridge.arm.com>
References: <YWCPyK+xotTgUMy/@arm.com>
 <CAHk-=whWZ4OxfKQwKVrRc-E9=w-ygKdVFn_HcAMW-DW8SgranQ@mail.gmail.com>
 <20211011104729.GB1421@C02TD0UTHF1T.local>
 <CAHk-=wjTAJwMJZ-6PPxvdtDmkL0=pfRF77nJ5qWw2vbiTzT4nQ@mail.gmail.com>
 <87czoacrfr.ffs@tglx>
 <20211012140243.GA41546@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012140243.GA41546@C02TD0UTHF1T.local>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 12, 2021 at 03:02:43PM +0100, Mark Rutland wrote:
> On Tue, Oct 12, 2021 at 03:18:16PM +0200, Thomas Gleixner wrote:
> > On Mon, Oct 11 2021 at 12:54, Linus Torvalds wrote:
> > > On Mon, Oct 11, 2021 at 3:47 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > > And so the reason I really hate that patch is that it introduces a new
> > > "different architectures randomly and inexplicably do different
> > > things, and the generic behavior is very different on arm64 than it is
> > > elsewhere".
> > >
> > > That's just the worst kind of hack to me.
> > >
> > > And in this case, it's really *horribly* hard to see what the call
> > > chain is. It all ends up being actively obfuscated and obscured
> > > through that 'handle_arch_irq' function pointer, that is sometimes set
> > > through set_handle_irq(), and sometimes set directly.
> > >
> > > I really think that if the rule is "we can't do accounting in
> > > handle_domain_irq(), because it's too late for arm64", then the fix
> > > really should be to just not do that.
> > >
> > > Move the irq_enter()/irq_exit() to the callers - quite possibly far up
> > > the call chain to the root of it all, and just say "architecture code
> > > needs to do this in the low-level code before calling
> > > handle_arch_irq".

I've spent the last few days attacking this, and I have a series which
reworks things to pull irq_{enter,exit}() out of the irqchip code and
into arch/entry code where it belongs, removig CONFIG_HANDLE_DOMAIN_IRQ
entirely in the process. I'll post that out soon once I've cleaned up
the commit messages and given it a decent cover letter.

> > > Anyway, it _looks_ to me like the pattern is very simple:
> > >
> > > Step 1:
> > >  - remove irq_enter/irq_exit from handle_domain_irq(), move it to all callers.
> > >
> > > This clearly doesn't change anything at all, but also doesn't fix the
> > > problem you have. But it's easy to verify that the code is the same
> > > before-and-after.
> > >
> > > Step 2 is the pattern matching step:
> > >
> > >  - if the caller of handle_domain_irq() ends up being a function that
> > > is registered with set_handle_irq(), then we
> > >    (a) remove the irq_enter/irq_exit from it
> > >    (b) add it to the architectures that use handle_arch_irq.
> > >    (c) make sure that if there are other callers of it (not through
> > > handle_arch_irq) we move that irq_enter/irq_exit into them too
> > >
> > > I _suspect_ - but didn't check - that Step 2(c) doesn't actually

I had a go with the approach suggested above, but that didn't really
work out and I ended up splitting the problem a different way. Comments
belwo for the sake of posterity.

Attacking this as a per-caller issue is *really* chury, and
interdependencies force you to fix all drivers and all architectures in
one go, which makes it really hard to see the wood for the trees.

The underlying issue was with CONFIG_HANDLE_DOMAIN_IRQ, so just looking
as set_handle_irq (which indicates CONFIG_GENERIC_IRQ_MULTI_HANDLER)
also wasn't sufficient, and I had to go digging through each of the
affected architectures' entry code.

Instead, I've added a temporary shim, migrated each architecture in
turn, then removed the shim and CONFIG_HANDLE_DOMAIN_IRQ entirely, which
also ends up simplifying the drivers a bit.

Thanks,
Mark.
