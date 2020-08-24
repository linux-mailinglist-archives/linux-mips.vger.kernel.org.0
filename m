Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1430E2501BB
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgHXQJe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:09:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:60795 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXQJd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:09:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kAF2I-0000tt-01; Mon, 24 Aug 2020 18:09:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DD9D6C0DE1; Mon, 24 Aug 2020 18:09:17 +0200 (CEST)
Date:   Mon, 24 Aug 2020 18:09:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Remove PNX833x alias NXP_STB22x
Message-ID: <20200824160917.GB7827@alpha.franken.de>
References: <20200822080429.65704-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822080429.65704-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 22, 2020 at 10:04:27AM +0200, Thomas Bogendoerfer wrote:
> Remove another unused MIPS platform.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/Kbuild.platforms                       |   1 -
>  arch/mips/Kconfig                                |  30 ---
>  arch/mips/configs/pnx8335_stb225_defconfig       |  77 ------
>  arch/mips/include/asm/mach-pnx833x/gpio.h        | 159 ------------
>  arch/mips/include/asm/mach-pnx833x/irq-mapping.h | 112 ---------
>  arch/mips/include/asm/mach-pnx833x/irq.h         |  40 ---
>  arch/mips/include/asm/mach-pnx833x/pnx833x.h     | 189 --------------
>  arch/mips/include/asm/mipsregs.h                 |  12 -
>  arch/mips/pnx833x/Makefile                       |   4 -
>  arch/mips/pnx833x/Platform                       |   4 -
>  arch/mips/pnx833x/common/Makefile                |   2 -
>  arch/mips/pnx833x/common/interrupts.c            | 303 -----------------------
>  arch/mips/pnx833x/common/platform.c              | 224 -----------------
>  arch/mips/pnx833x/common/prom.c                  |  51 ----
>  arch/mips/pnx833x/common/reset.c                 |  31 ---
>  arch/mips/pnx833x/common/setup.c                 |  48 ----
>  arch/mips/pnx833x/stb22x/Makefile                |   2 -
>  arch/mips/pnx833x/stb22x/board.c                 | 120 ---------
>  18 files changed, 1409 deletions(-)
>  delete mode 100644 arch/mips/configs/pnx8335_stb225_defconfig
>  delete mode 100644 arch/mips/include/asm/mach-pnx833x/gpio.h
>  delete mode 100644 arch/mips/include/asm/mach-pnx833x/irq-mapping.h
>  delete mode 100644 arch/mips/include/asm/mach-pnx833x/irq.h
>  delete mode 100644 arch/mips/include/asm/mach-pnx833x/pnx833x.h
>  delete mode 100644 arch/mips/pnx833x/Makefile
>  delete mode 100644 arch/mips/pnx833x/Platform
>  delete mode 100644 arch/mips/pnx833x/common/Makefile
>  delete mode 100644 arch/mips/pnx833x/common/interrupts.c
>  delete mode 100644 arch/mips/pnx833x/common/platform.c
>  delete mode 100644 arch/mips/pnx833x/common/prom.c
>  delete mode 100644 arch/mips/pnx833x/common/reset.c
>  delete mode 100644 arch/mips/pnx833x/common/setup.c
>  delete mode 100644 arch/mips/pnx833x/stb22x/Makefile
>  delete mode 100644 arch/mips/pnx833x/stb22x/board.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
