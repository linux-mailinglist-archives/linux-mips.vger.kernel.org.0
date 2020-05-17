Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CB81D678C
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 13:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgEQLBW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 07:01:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:56514 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727839AbgEQLBW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 07:01:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jaH2m-000449-02; Sun, 17 May 2020 13:01:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E3EBCC04EC; Sun, 17 May 2020 13:01:10 +0200 (CEST)
Date:   Sun, 17 May 2020 13:01:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     "Maciej W. Rozycki" <macro@wdc.com>, linux-mips@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
Message-ID: <20200517110110.GC5508@alpha.franken.de>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
 <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com>
 <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org>
 <alpine.LFD.2.21.2005142233430.6492@redsun52.ssa.fujisawa.hgst.com>
 <18995238-ed16-411c-79ef-071897ee8a1b@gentoo.org>
 <alpine.LFD.2.21.2005151216570.6492@redsun52.ssa.fujisawa.hgst.com>
 <6db89a43-372b-ed92-af5d-9a95543554c2@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6db89a43-372b-ed92-af5d-9a95543554c2@gentoo.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 16, 2020 at 02:16:52AM -0400, Joshua Kinard wrote:
> Focusing on just one hunk for asm/mach-ip27/war.h, how does this look if I
> keep the conditional inside the block?
> 
> diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
> index ef3efce0094a..f041e7357620 100644
> --- a/arch/mips/include/asm/mach-ip27/war.h
> +++ b/arch/mips/include/asm/mach-ip27/war.h
> @@ -17,7 +17,11 @@
>  #define MIPS_CACHE_SYNC_WAR		0
>  #define TX49XX_ICACHE_INDEX_INV_WAR	0
>  #define ICACHE_REFILLS_WORKAROUND_WAR	0
> +#ifdef CONFIG_CPU_R10000
>  #define R10000_LLSC_WAR			1
> +#else
> +#define R10000_LLSC_WAR			0
> +#endif

#define R10000_LLSC_WAR			IS_ENABLED(CPU_R10000_WORKAROUNDS)

looks nice and clean ;-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
