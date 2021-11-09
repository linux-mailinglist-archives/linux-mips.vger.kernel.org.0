Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFF444B068
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239221AbhKIPeR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 10:34:17 -0500
Received: from elvis.franken.de ([193.175.24.41]:39259 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239167AbhKIPeP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 10:34:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkT5p-00033f-00; Tue, 09 Nov 2021 16:31:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0A943C2C35; Tue,  9 Nov 2021 16:29:06 +0100 (CET)
Date:   Tue, 9 Nov 2021 16:29:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Mike Rapoport <rppt@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Serge Semin <fancer.lancer@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Liam Howlett <liam.howlett@oracle.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] MIPS: Allow modules to set board_be_handler
Message-ID: <20211109152905.GA12535@alpha.franken.de>
References: <20211105173110.1237734-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105173110.1237734-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 05, 2021 at 10:30:47AM -0700, Florian Fainelli wrote:
> After making the brcmstb_gisb driver modular with 707a4cdf86e5 ("bus:
> brcmstb_gisb: Allow building as module") Guenter reported that mips
> allmodconfig failed to link because board_be_handler was referenced.
> 
> Thomas indicated that if we were to continue making the brcmstb_gisb
> driver modular for MIPS we would need to introduce a function that
> allows setting the board_be_handler and export that function towards
> modules.
> 
> This is what is being done here: board_be_handler is made static and is
> now settable with a mips_set_be_handler() function which is exported.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Fixes: 707a4cdf86e5 ("bus: brcmstb_gisb: Allow building as module")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/mips/dec/setup.c                 | 6 +++---
>  arch/mips/include/asm/traps.h         | 2 +-
>  arch/mips/kernel/traps.c              | 8 +++++++-
>  arch/mips/sgi-ip22/ip22-berr.c        | 2 +-
>  arch/mips/sgi-ip22/ip28-berr.c        | 2 +-
>  arch/mips/sgi-ip27/ip27-berr.c        | 2 +-
>  arch/mips/sgi-ip32/ip32-berr.c        | 2 +-
>  arch/mips/sibyte/swarm/setup.c        | 2 +-
>  arch/mips/txx9/generic/setup_tx4927.c | 2 +-
>  arch/mips/txx9/generic/setup_tx4938.c | 2 +-
>  arch/mips/txx9/generic/setup_tx4939.c | 2 +-
>  drivers/bus/brcmstb_gisb.c            | 2 +-
>  12 files changed, 20 insertions(+), 14 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
