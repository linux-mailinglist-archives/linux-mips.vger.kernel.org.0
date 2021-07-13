Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19CB3C6CF0
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jul 2021 11:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhGMJOK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 05:14:10 -0400
Received: from verein.lst.de ([213.95.11.211]:57900 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234916AbhGMJOK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Jul 2021 05:14:10 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9AF1767373; Tue, 13 Jul 2021 11:11:14 +0200 (CEST)
Date:   Tue, 13 Jul 2021 11:11:14 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: Re: flush_kernel_dcache_page fixes and removal
Message-ID: <20210713091113.GA23518@lst.de>
References: <20210712060928.4161649-1-hch@lst.de> <20210713084648.GF22278@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713084648.GF22278@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 13, 2021 at 09:46:48AM +0100, Russell King (Oracle) wrote:
> I think you need to be careful - I seem to have a recollection that the
> reason we ended up with flush_kernel_dcache_page() was the need to avoid
> the taking of the mmap lock for 32-bit ARM VIVT based CPUs in
> flush_dcache_page(). 32-bit ARM flush_dcache_page() can block.

Where can arm32 flush_dcache_page block?  __flush_dcache_aliases does
walk mapping->i_mmap, but using a spinlock hidden under
flush_dcache_mmap_lock.  If flush_dcache_page did block plenty of code
already calling it e.g. from interrupt and block submission contexts
in various mmc/sdcard drivers would be rather unhappy.  Even today
calls to flush_kernel_dcache_page page in the block I/O path are
vastly outnumber by calls to flush_dcache_page.

> The second issue I have is that, when we are reading a page into a page
> cache page, how can that page be mapped to userspace? Isn't that a
> violation of semantics? If the page is mapped to userspace but does not
> contain data from the underlying storage device, then the page contains
> stale data (if it's a new page, lets hope that's zeroed and not some
> previous contents - which would be a massive security hole.)

I did not come up with the rules, but these are the existing documented
ones for flush_dcache_page:

        Any time the kernel writes to a page cache page, _OR_
	the kernel is about to read from a page cache page and
	user space shared/writable mappings of this page potentially
	exist, this routine is called.

So writing to (aka reading into) a page cache page is not conditional
on it being mapped yet.  Only the kernel reading from the page cache
page has this condition.

> As I
> understand it, the flush_kernel_dcache_page() calls in the block layer
> are primarily there to cope with drivers that do PIO read to write to a
> page cache page to ensure that later userspace mappings can see the data
> in the page cache page - by ensuring that the page cache pages are in
> the same state as far as caches go as if they had been DMA'd to.

PIO is one big case, but also kernel generated data and all kinds of
bounce buffering schemes.

> We know that the current implementation works fine - you're now
> proposing to radically change it, asserting that it's buggy. I'm
> nervous about this change.

Do we know it works?  There are very few calls to
flush_dcache_kernel_page and very few implementations that differ from
flush_dcache_page.  For arm32 the relevant drivers would mostly be
mmc drivers using the sg_miter interface, are they even used much on
the platforms where the difference exists?

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
---end quoted text---
