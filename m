Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A3C2B5B92
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 10:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgKQJOu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 04:14:50 -0500
Received: from elvis.franken.de ([193.175.24.41]:37803 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgKQJOu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 04:14:50 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kex4Z-0008Mm-00; Tue, 17 Nov 2020 10:14:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C1F11C0206; Tue, 17 Nov 2020 10:13:56 +0100 (CET)
Date:   Tue, 17 Nov 2020 10:13:56 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Message-ID: <20201117091356.GA7572@alpha.franken.de>
References: <20201116174516.144243-1-tsbogend@alpha.franken.de>
 <20201116200554.rhbyvfmdzmchwwbs@mobilestation>
 <20201117080518.GH370813@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117080518.GH370813@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 17, 2020 at 10:05:18AM +0200, Mike Rapoport wrote:
> On Mon, Nov 16, 2020 at 11:05:54PM +0300, Serge Semin wrote:
> > On Mon, Nov 16, 2020 at 06:45:15PM +0100, Thomas Bogendoerfer wrote:
> > > The loop over all memblocks works with PFN numbers and not physical
> > > addresses, so we need for_each_mem_pfn_range().
> > 
> > Great catch! Don't know how that has been working so far. Anyway
> 
> The loop is relevant only for systems with highmem, apparently there are
> not many highmem users out there.

I found the bug on a SGI IP22 probably because PHYS_OFFSET is != 0.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
