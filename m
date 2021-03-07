Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEB63304FC
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 23:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhCGW1X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 17:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhCGW1Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 17:27:16 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 246E1C06174A;
        Sun,  7 Mar 2021 14:27:16 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id C3DD792009C; Sun,  7 Mar 2021 23:27:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B7ACC92009B;
        Sun,  7 Mar 2021 23:27:14 +0100 (CET)
Date:   Sun, 7 Mar 2021 23:27:14 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
In-Reply-To: <20210307214740.blgsti6mr546bm43@mobilestation>
Message-ID: <alpine.DEB.2.21.2103072317320.51127@angie.orcam.me.uk>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de> <20210307200612.6ftvptnj4txaf2uy@mobilestation> <20210307212001.GA7835@alpha.franken.de> <20210307214740.blgsti6mr546bm43@mobilestation>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 8 Mar 2021, Serge Semin wrote:

> > some of them are not R2 (SB1), others are. So best bet would be to
> > simply reserve the first 0x1000 bytes for every CPU and special handling
> > for the BMIPS case. Does this cover all cases ?
> 
> I can't say for sure whether it will cover all the cases/platforms. I
> visually analysed all the
> board_{nmi_handler,ejtag_handler,ebase,cache_error}_setup callbacks
> implementation in MIPS arch to create the list above. Exception vectors or
> some other stuff can be setup in some other platform-specific manner. But at
> least reserving a memory below PAGE_SIZE would get the situation partly back
> to before the memory below the kernel stopped being reserved. Hopefully
> one page will be enough for the platforms, which relied on that rule. The
> rest or them sooner or later will manifest itself as it has happened with
> Broadcom.

 I think reserving up to 64KiB might be a bit excessive on one hand while 
having the size of the reservation depend on configured PAGE_SIZE could be 
too unpredictable on the other.  I think 4KiB is a good compromise and I'd 
leave anything else for platform maintainers to sort out.

  Maciej
