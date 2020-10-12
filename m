Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFDD28B254
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387611AbgJLKiS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:58427 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387598AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-05; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 15A1CC1140; Mon, 12 Oct 2020 12:31:23 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:31:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] MIPS: replace add_memory_region with memblock
Message-ID: <20201012103123.GE7765@alpha.franken.de>
References: <20201009121449.64081-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009121449.64081-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 09, 2020 at 02:14:46PM +0200, Thomas Bogendoerfer wrote:
> add_memory_region was the old interface for registering memory and
> was already changed to used memblock internaly. Replace it by
> directly calling memblock functions.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v3:
> 	removed early_init_dt_add_memory_arch and
> 	early_init_dt_reserve_memory_arch as there is nothing
> 	special about our version and we can use the generic ones
> 
> Changes in v2:
> 	fixed missing memblock include in fw/sni/sniprom.c
> 	tested on cobalt, IP22, IP28, IP30, IP32, JAZZ, SNI
> 
>  arch/mips/alchemy/common/prom.c               |  3 +-
>  arch/mips/ar7/memory.c                        |  2 +-
>  arch/mips/ath25/ar2315.c                      |  3 +-
>  arch/mips/ath25/ar5312.c                      |  3 +-
>  arch/mips/bcm47xx/prom.c                      |  3 +-
>  arch/mips/bcm47xx/setup.c                     |  2 +-
>  arch/mips/bcm63xx/setup.c                     |  2 +-
>  arch/mips/cavium-octeon/setup.c               | 24 ++++++-------
>  arch/mips/cobalt/setup.c                      |  3 +-
>  arch/mips/dec/prom/memory.c                   |  8 ++---
>  arch/mips/fw/arc/memory.c                     | 28 ++++++++++-----
>  arch/mips/fw/sni/sniprom.c                    |  4 +--
>  arch/mips/include/asm/bootinfo.h              |  7 ----
>  arch/mips/include/asm/netlogic/psb-bootinfo.h |  1 +
>  arch/mips/kernel/prom.c                       | 25 --------------
>  arch/mips/kernel/setup.c                      | 50 ++++-----------------------
>  arch/mips/loongson2ef/common/mem.c            | 12 ++-----
>  arch/mips/loongson32/common/prom.c            |  4 +--
>  arch/mips/netlogic/xlp/setup.c                |  2 +-
>  arch/mips/netlogic/xlr/setup.c                |  5 +--
>  arch/mips/ralink/of.c                         |  3 +-
>  arch/mips/rb532/prom.c                        |  2 +-
>  arch/mips/sgi-ip32/ip32-memory.c              |  3 +-
>  arch/mips/sibyte/common/cfe.c                 | 16 ++++-----
>  arch/mips/txx9/jmr3927/prom.c                 |  4 +--
>  arch/mips/txx9/rbtx4927/prom.c                |  5 +--
>  arch/mips/txx9/rbtx4938/prom.c                |  3 +-
>  arch/mips/txx9/rbtx4939/prom.c                |  4 +--
>  28 files changed, 82 insertions(+), 149 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
