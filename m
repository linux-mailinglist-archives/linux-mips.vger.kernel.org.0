Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AC43168EA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 15:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhBJOQi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 09:16:38 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:47382 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbhBJOP6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 09:15:58 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id B1BBB9200B4; Wed, 10 Feb 2021 15:15:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id ACC779200B3;
        Wed, 10 Feb 2021 15:15:10 +0100 (CET)
Date:   Wed, 10 Feb 2021 15:15:10 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Daniel Thompson <daniel.thompson@linaro.org>
cc:     Arnd Bergmann <arnd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: make kgdb depend on FPU support
In-Reply-To: <20210210122929.rgqfkoop4rsso3yo@maple.lan>
Message-ID: <alpine.DEB.2.21.2102101444140.35623@angie.orcam.me.uk>
References: <20210122110307.934543-1-arnd@kernel.org> <20210122110307.934543-2-arnd@kernel.org> <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk> <20210210113830.xeechzpctz5repv5@maple.lan> <alpine.DEB.2.21.2102101252580.35623@angie.orcam.me.uk>
 <20210210122929.rgqfkoop4rsso3yo@maple.lan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 Feb 2021, Daniel Thompson wrote:

> >  NB if GDB sees a register padded out (FAOD it means all-x's rather than a 
> > hex string placed throughout the respective slot) in a `g' packet, then it 
> > will mark the register internally as "unavailable" and present it to the 
> > receiver of the information as such rather than giving any specific value.  
> > I don't remember offhand what the syntax for the `G' packet is in that 
> > case; possibly GDB just sends all-zeros, and in any case you can't make 
> > GDB write any specific value to such a register via any user
> > interface.
> 
> kgdb doesn't track register validity and adding would be a fairly big
> change. Everything internally (including some of the interactions with
> arch code) is based on updating a binary shadow of register state which
> is only bin2hex'ed just before transmitting a packet.

 I've had a peek and it doesn't appear to me it would be a big deal.

 We have `gdb_regs' defined as an array of longs.  We'd just need a second 
array for a register validity bitmap, which could for simplicity just have 
a single bit per each byte of `gdb_regs'.  It would then be updated in 
`pt_regs_to_gdb_regs' according to the result of `dbg_get_reg' across the 
number of bits given by `dbg_reg_def[i].size'.  And then `kgdb_mem2hex' 
would interpret the bitmap given as an extra argument accordingly.

 It looks to me like a couple of lines of extra code really.

> It will simply default them to zero and update them on a 'G' packet.

 Ack.

> >  The way the unavailability is shown depends on the interface used, i.e. 
> > it will be different between the `info all-registers'/`info register $reg' 
> > commands, and the `p $reg' command (or any expression involving `$reg'), 
> > and the MI interface.  But in any case it will be unambiguous.
> 
> I guess this probably does create a technical protocol violation since
> kgdb will reject per-register read/write for register that its report
> says are zero rather then invalid.

 Not a violation, as GDB won't ever issue a `p'/`P' packet for a register 
that is in the range covered by `g'/`G'.  This is by design.  I'd have to 
track down the justification, but this is the right thing really.

 Also there is no issue with returning a rubbish value written with `G', 
as the same already happens with any RSP debug stub (or for that matter 
native GDB target) that deals with read-only registers.  If you attempt to 
write one, then all the caches will keep the new value, and you will often 
have to make the target resume execution before the value reported is 
reset to the hardwired one.

 Debug stubs often cache registers for performance reasons, and may not 
even write them out unless execution is to be resumed, which often has 
serious consequences if a write to a hardware registers has side effects.  
For example I had that with an Intel Atom CPU switching between the real 
and the protected mode with a CR0 register write issued via a debug probe 
wired through the JTAG inteface.

 Caching is surely what Linux `gdbserver' does, as is what all JTAG debug 
interfaces do that I have come across, as JTAG access is usually painfully 
slow.  Therefore in many cases GDB's `flushregs' command won't help as the 
stub will happily resend what it has previously cached with any updates 
applied locally only.

 FWIW,

  Maciej
