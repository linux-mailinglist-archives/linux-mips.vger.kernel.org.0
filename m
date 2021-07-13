Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400483C6C3D
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jul 2021 10:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbhGMIuH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 04:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbhGMIuG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Jul 2021 04:50:06 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66807C0613DD;
        Tue, 13 Jul 2021 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2Orx11XPMT4bJdCyRnGQJ/wU1Uuya12976tsLpHhTtE=; b=0sEdtMf40T872e6AkSLPFIQ7V
        mlqyhFpqZRjNPWfcIooDXwck+InEsOvuFjhO1kaLor6KgqZhown+Om1MwulMziAEt/16nGntwf+H0
        4CuMKXlAq8vlCASD+swbxFvg1Zq4dYFoWKPu4fe7jzvJ3ViT00Q5+9X32Cy1osPMEvOpT8XxdjxOz
        yNzeWdKD8muvGBucOq0dDZ96Qx/nTUCzYDEvBVB7lk5+SneFbYK9gVjH0gKIqdydwdgMyajIbUXFQ
        NVrwCfiaJ5XZ2L/uR2ucVQRp8mVnY68zo529L1wSCA+18x22l4L31ILc1FaCdyUQHFeVM59UrsLTz
        Wr4N3URbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46042)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1m3E46-0005lO-4A; Tue, 13 Jul 2021 09:46:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1m3E40-00008w-Tx; Tue, 13 Jul 2021 09:46:48 +0100
Date:   Tue, 13 Jul 2021 09:46:48 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <20210713084648.GF22278@shell.armlinux.org.uk>
References: <20210712060928.4161649-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 12, 2021 at 08:09:22AM +0200, Christoph Hellwig wrote:
> while looking to convert the block layer away from kmap_atomic towards
> kmap_local_page and prefeably the helpers that abstract it away I noticed
> that a few block drivers directly or implicitly call
> flush_kernel_dcache_page before kunmapping a page that has been written
> to.  flush_kernel_dcache_page is documented to to be used in such cases,
> but flush_dcache_page is actually required when the page could be in
> the page cache and mapped to userspace, which is pretty much always the
> case when kmapping an arbitrary page.  Unfortunately the documentation
> doesn't exactly make that clear, which lead to this misused.  And it turns
> out that only the copy_strings / copy_string_kernel in the exec code
> were actually correct users of flush_kernel_dcache_page, which is why
> I think we should just remove it and eat the very minor overhead in
> exec rather than confusing poor driver writers.

I think you need to be careful - I seem to have a recollection that the
reason we ended up with flush_kernel_dcache_page() was the need to avoid
the taking of the mmap lock for 32-bit ARM VIVT based CPUs in
flush_dcache_page(). 32-bit ARM flush_dcache_page() can block.

If you're sure that all these changes you're making do not end up
calling flush_dcache_page() from a path where we are atomic, then fine.

The second issue I have is that, when we are reading a page into a page
cache page, how can that page be mapped to userspace? Isn't that a
violation of semantics? If the page is mapped to userspace but does not
contain data from the underlying storage device, then the page contains
stale data (if it's a new page, lets hope that's zeroed and not some
previous contents - which would be a massive security hole.) As I
understand it, the flush_kernel_dcache_page() calls in the block layer
are primarily there to cope with drivers that do PIO read to write to a
page cache page to ensure that later userspace mappings can see the data
in the page cache page - by ensuring that the page cache pages are in
the same state as far as caches go as if they had been DMA'd to.

We know that the current implementation works fine - you're now
proposing to radically change it, asserting that it's buggy. I'm
nervous about this change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
