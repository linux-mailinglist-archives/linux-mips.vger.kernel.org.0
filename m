Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3053316E9
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 20:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCHTBm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 14:01:42 -0500
Received: from elvis.franken.de ([193.175.24.41]:59008 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhCHTBZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 14:01:25 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJL86-0008JB-00; Mon, 08 Mar 2021 20:01:22 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E79F4C1AFC; Mon,  8 Mar 2021 20:00:57 +0100 (CET)
Date:   Mon, 8 Mar 2021 20:00:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Mike Rapoport <rppt@kernel.org>, Roman Gushchin <guro@fb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3] MIPS: kernel: Reserve exception base early to prevent
 corruption
Message-ID: <20210308190057.GA15111@alpha.franken.de>
References: <20210308092447.13073-1-tsbogend@alpha.franken.de>
 <95d12091-d3b0-3034-98ed-9ad73ef21a3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95d12091-d3b0-3034-98ed-9ad73ef21a3b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 08, 2021 at 10:21:10AM -0800, Florian Fainelli wrote:
> On 3/8/21 1:24 AM, Thomas Bogendoerfer wrote:
> > BMIPS is one of the few platforms that do change the exception base.
> > After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> > with kernel_end") we started seeing BMIPS boards fail to boot with the
> > built-in FDT being corrupted.
> > 
> > Before the cited commit, early allocations would be in the [kernel_end,
> > RAM_END] range, but after commit they would be within [RAM_START +
> > PAGE_SIZE, RAM_END].
> > 
> > The custom exception base handler that is installed by
> > bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> > memory region allocated by unflatten_and_copy_device_tree() thus
> > corrupting the FDT used by the kernel.
> > 
> > To fix this, we need to perform an early reservation of the custom
> > exception space. Additional we reserve the first 4k (1k for R3k) for
> > either normal exception vector space (legacy CPUs) or special vectors
> > like cache exceptions.
> > 
> > Huge thanks to Serge for analysing and proposing a solution to this
> > issue.
> > 
> > Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> > Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > Changes in v3:
> >  - always reserve the first 4k for all CPUs (1k for R3k)
> > 
> > Changes in v2:
> >  - do only memblock reservation in reserve_exception_space()
> >  - reserve 0..0x400 for all CPUs without ebase register and
> >    to addtional reserve_exception_space for BMIPS CPUs
> 
> Thomas, do you mind CC'ing me for subsequent versions so you can get a
> chance to have a Tested-by tag? Thank you!

sure, I hope it's the last version ;-)

> Tested-by: Florian Fainelli <f.fainelli@gmail.com>

thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
