Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E3E315125
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 15:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhBIOC2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 09:02:28 -0500
Received: from elvis.franken.de ([193.175.24.41]:36682 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231135AbhBIOCN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 09:02:13 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9Ta5-0004Ih-00; Tue, 09 Feb 2021 15:01:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 23E1BC0DC4; Tue,  9 Feb 2021 15:00:18 +0100 (CET)
Date:   Tue, 9 Feb 2021 15:00:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Make check condition for SDBBP consistent with
 EJTAG spec
Message-ID: <20210209140018.GA13043@alpha.franken.de>
References: <1612847125-3141-1-git-send-email-yangtiezhu@loongson.cn>
 <20210209121124.GA11134@alpha.franken.de>
 <03fcfc00-acdd-a949-046c-3002195d6024@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03fcfc00-acdd-a949-046c-3002195d6024@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 09, 2021 at 09:09:52PM +0800, Tiezhu Yang wrote:
> On 02/09/2021 08:11 PM, Thomas Bogendoerfer wrote:
> > On Tue, Feb 09, 2021 at 01:05:25PM +0800, Tiezhu Yang wrote:
> > > According to MIPS EJTAG Specification [1], a Debug Breakpoint
> > > exception occurs when an SDBBP instruction is executed, the
> > > CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
> > > occurred, just check bit DBp for SDBBP is more accurate.
> > > 
> > > [1] http://www.t-es-t.hu/download/mips/md00047f.pdf
> > > 
> > > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > ---
> > > 
> > > v2: add MIPS_DEBUG_DBP definition
> > > 
> > >   arch/mips/include/asm/mipsregs.h | 4 ++++
> > >   arch/mips/kernel/genex.S         | 4 ++--
> > >   2 files changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > > index a0e8ae5..9c8099a 100644
> > > --- a/arch/mips/include/asm/mipsregs.h
> > > +++ b/arch/mips/include/asm/mipsregs.h
> > > @@ -1085,6 +1085,10 @@
> > >   #define CVMVMCONF_RMMUSIZEM1_S	0
> > >   #define CVMVMCONF_RMMUSIZEM1	(_U64CAST_(0xff) << CVMVMCONF_RMMUSIZEM1_S)
> > > +/* Debug register field definitions */
> > > +#define MIPS_DEBUG_DBP_SHIFT	1
> > > +#define MIPS_DEBUG_DBP		(_ULCAST_(1) << MIPS_DEBUG_DBP_SHIFT)
> > > +
> > >   /*
> > >    * Coprocessor 1 (FPU) register names
> > >    */
> > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > index bcce32a..743d759 100644
> > > --- a/arch/mips/kernel/genex.S
> > > +++ b/arch/mips/kernel/genex.S
> > > @@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
> > >   	MTC0	k0, CP0_DESAVE
> > >   	mfc0	k0, CP0_DEBUG
> > > -	sll	k0, k0, 30	# Check for SDBBP.
> > > -	bgez	k0, ejtag_return
> > > +	andi	k0, k0, MIPS_DEBUG_DBP	# Check for SDBBP.
> > > +	beqz	k0, ejtag_return
> > IMHO both implementations are doing the same thing.
> 
> When I read the original code, it looks a little confusing
> at first glance, the initial aim of this patch is to make the code
> more readable and easier to understand.

which your version is, but the description sounds like there is a semantic
change somewhere (at least to me). So with a little bit rewording I'm
fine with applying your patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
