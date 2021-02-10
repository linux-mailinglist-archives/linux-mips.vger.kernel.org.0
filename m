Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC13316653
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 13:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbhBJMOU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 07:14:20 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:47364 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhBJMMQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 07:12:16 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 6D0429200B4; Wed, 10 Feb 2021 13:11:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 657BD9200B3;
        Wed, 10 Feb 2021 13:11:28 +0100 (CET)
Date:   Wed, 10 Feb 2021 13:11:28 +0100 (CET)
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
In-Reply-To: <20210210113830.xeechzpctz5repv5@maple.lan>
Message-ID: <alpine.DEB.2.21.2102101252580.35623@angie.orcam.me.uk>
References: <20210122110307.934543-1-arnd@kernel.org> <20210122110307.934543-2-arnd@kernel.org> <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk> <20210210113830.xeechzpctz5repv5@maple.lan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 Feb 2021, Daniel Thompson wrote:

> >  Wrapping the relevant parts of this file into #ifdef MIPS_FP_SUPPORT 
> > would be as easy though and would qualify as a proper fix given that we 
> > have no XML description support for the MIPS target (so we need to supply 
> > the inexistent registers in the protocol; or maybe we can return NULL in 
> > `dbg_get_reg' to get them padded out in the RSP packet, I haven't checked 
> > if generic KGDB code supports this feature).
> 
> Returning NULL should be fine.
> 
> The generic code will cope OK. The values in the f.p. registers may
> act a little odd if gdb uses a 'G' packet to set them to non-zero values
> (since kgdb will cache the values gdb sent it) but the developer
> operating the debugger will probably figure out what is going on without
> too much pain.

 Ack, thanks!

 NB if GDB sees a register padded out (FAOD it means all-x's rather than a 
hex string placed throughout the respective slot) in a `g' packet, then it 
will mark the register internally as "unavailable" and present it to the 
receiver of the information as such rather than giving any specific value.  
I don't remember offhand what the syntax for the `G' packet is in that 
case; possibly GDB just sends all-zeros, and in any case you can't make 
GDB write any specific value to such a register via any user interface.

 The way the unavailability is shown depends on the interface used, i.e. 
it will be different between the `info all-registers'/`info register $reg' 
commands, and the `p $reg' command (or any expression involving `$reg'), 
and the MI interface.  But in any case it will be unambiguous.

 In no case however there will be user confusion for such registers.

  Maciej
