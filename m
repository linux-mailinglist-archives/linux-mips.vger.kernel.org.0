Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9500A262F8D
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 16:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgIIOLV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 10:11:21 -0400
Received: from elvis.franken.de ([193.175.24.41]:32954 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730295AbgIINKQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Sep 2020 09:10:16 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kFzrd-0001tu-00; Wed, 09 Sep 2020 15:10:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4848CC0F5F; Wed,  9 Sep 2020 14:10:57 +0200 (CEST)
Date:   Wed, 9 Sep 2020 14:10:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 00/12] Convert WAR defines to config options
Message-ID: <20200909121057.GA2814@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 24, 2020 at 06:32:42PM +0200, Thomas Bogendoerfer wrote:
> This patches convert workaround (WAR) defines into config options and
> gets rid of mach-*/war.h files.
> 
> Thomas Bogendoerfer (12):
>   MIPS: Convert R4600_V1_INDEX_ICACHEOP into a config option
>   MIPS: Convert R4600_V1_HIT_CACHEOP into a config option
>   MIPS: Convert R4600_V2_HIT_CACHEOP into a config option
>   MIPS: Remove MIPS4K_ICACHE_REFILL_WAR and MIPS_CACHE_SYNC_WAR
>   MIPS: Convert TX49XX_ICACHE_INDEX_INV into a config option
>   MIPS: Convert ICACHE_REFILLS_WORKAROUND_WAR into a config option
>   MIPS: Convert R10000_LLSC_WAR info a config option
>   MIPS: Convert MIPS34K_MISSED_ITLB_WAR into a config option
>   MIPS: Replace SIBYTE_1956_WAR by CONFIG_SB1_PASS_2_WORKAROUNDS
>   MIPS: Get rid of BCM1250_M3_WAR
>   MIPS: Get rid of CAVIUM_OCTEON_DCACHE_PREFETCH_WAR
>   MIPS: Remove mach-*/war.h
> 
>  arch/mips/Kconfig                              |  80 +++++++++++++
>  arch/mips/cavium-octeon/setup.c                |   2 +-
>  arch/mips/include/asm/futex.h                  |   4 +-
>  arch/mips/include/asm/llsc.h                   |   2 +-
>  arch/mips/include/asm/local.h                  |   4 +-
>  arch/mips/include/asm/mach-cavium-octeon/war.h |  27 -----
>  arch/mips/include/asm/mach-generic/war.h       |  23 ----
>  arch/mips/include/asm/mach-ip22/war.h          |  27 -----
>  arch/mips/include/asm/mach-ip27/war.h          |  23 ----
>  arch/mips/include/asm/mach-ip28/war.h          |  23 ----
>  arch/mips/include/asm/mach-ip30/war.h          |  24 ----
>  arch/mips/include/asm/mach-ip32/war.h          |  23 ----
>  arch/mips/include/asm/mach-malta/war.h         |  23 ----
>  arch/mips/include/asm/mach-rc32434/war.h       |  23 ----
>  arch/mips/include/asm/mach-rm/war.h            |  27 -----
>  arch/mips/include/asm/mach-sibyte/war.h        |  38 -------
>  arch/mips/include/asm/mach-tx49xx/war.h        |  23 ----
>  arch/mips/include/asm/mipsregs.h               |   4 +-
>  arch/mips/include/asm/war.h                    | 150 -------------------------
>  arch/mips/kernel/signal.c                      |   8 +-
>  arch/mips/kernel/syscall.c                     |   2 +-
>  arch/mips/mm/c-r4k.c                           |  17 +--
>  arch/mips/mm/page.c                            |  16 ++-
>  arch/mips/mm/tlbex.c                           |   8 +-
>  arch/mips/mm/uasm.c                            |   2 +-
>  drivers/tty/serial/sb1250-duart.c              |   9 +-
>  26 files changed, 127 insertions(+), 485 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-cavium-octeon/war.h
>  delete mode 100644 arch/mips/include/asm/mach-generic/war.h
>  delete mode 100644 arch/mips/include/asm/mach-ip22/war.h
>  delete mode 100644 arch/mips/include/asm/mach-ip27/war.h
>  delete mode 100644 arch/mips/include/asm/mach-ip28/war.h
>  delete mode 100644 arch/mips/include/asm/mach-ip30/war.h
>  delete mode 100644 arch/mips/include/asm/mach-ip32/war.h
>  delete mode 100644 arch/mips/include/asm/mach-malta/war.h
>  delete mode 100644 arch/mips/include/asm/mach-rc32434/war.h
>  delete mode 100644 arch/mips/include/asm/mach-rm/war.h
>  delete mode 100644 arch/mips/include/asm/mach-sibyte/war.h
>  delete mode 100644 arch/mips/include/asm/mach-tx49xx/war.h

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
