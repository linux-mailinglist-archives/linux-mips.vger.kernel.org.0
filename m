Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623F13CE236
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jul 2021 18:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346590AbhGSP3a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jul 2021 11:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348511AbhGSPYx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jul 2021 11:24:53 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A601CC08E88C;
        Mon, 19 Jul 2021 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DEv5AMPYTsRvufOgvEX+iyR62xQvFefugMO+OsVkHzc=; b=DdKXacyQxn7Hz8fN7PJPr6m9x
        d4hT/T0CJ5vKsm+NrCyfhhcEa16qr7fh5ZmNRudBMiNsh2jWmw+8ed7lCBIMi/jmkxYayCvxuuGFK
        4hGzvSFep0kUFA1ZNBEEQeCQdSfzUhQ6zgFkq82drCAMx1t9UybqRKDrNW6URJC1JvCwW0DMXWT0J
        m8V5Vgh2JPge/tTVm8IONzCUUTFB5PbqFmG7VItuZoc2Wg8A7OONJFrHCYD+gnCyml/DiKV1jbrlh
        EcOJfYmvL8Ub22suPEmn9SZalhR+cT/W6dvmJJoHr8kHoEp/k9Sarl2dHD3wp1WISKxfd40O6Ylfs
        YGaL+yUww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46332)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1m5VPo-00054L-KD; Mon, 19 Jul 2021 16:42:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1m5VPi-00066F-Ex; Mon, 19 Jul 2021 16:42:38 +0100
Date:   Mon, 19 Jul 2021 16:42:38 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     hch@lst.de, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, James.Bottomley@hansenpartnership.com,
        guoren@kernel.org, tsbogend@alpha.franken.de, nickhu@andestech.com,
        green.hu@gmail.com, deanbo422@gmail.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org, geoff@infradead.org,
        paul@crapouillou.net, ulf.hansson@linaro.org, alexs@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: flush_kernel_dcache_page fixes and removal
Message-ID: <20210719154238.GS22278@shell.armlinux.org.uk>
References: <20210713084648.GF22278@shell.armlinux.org.uk>
 <20210719053851.GA16780@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719053851.GA16780@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 19, 2021 at 01:38:51PM +0800, Herbert Xu wrote:
> Russell King Oracle <linux@armlinux.org.uk> wrote:
> >
> > I think you need to be careful - I seem to have a recollection that the
> > reason we ended up with flush_kernel_dcache_page() was the need to avoid
> > the taking of the mmap lock for 32-bit ARM VIVT based CPUs in
> > flush_dcache_page(). 32-bit ARM flush_dcache_page() can block.
> > 
> > If you're sure that all these changes you're making do not end up
> > calling flush_dcache_page() from a path where we are atomic, then fine.
> 
> The Crypto API has been calling flush_dcache_page from softirq
> context since before the advent of git (see crypto/scatterwalk.c
> from the initial import).  So if 32-bit ARM blocks on it then this
> has been broken for almost 20 years.

I think what's confusing me is the naming of flush_dcache_mmap_lock().
The mmap lock is a read-write semaphore (see linux/mmap-lock.h), and
is even called "mmap_lock" in mm_struct, but this has nothing to do
with flush_dcache_mmap_lock().

So no, flush_dcache_mmap_lock() doesn't block as I first thought, and
therefore flush_dcache_page() doesn't block either.

Sorry for the noise.

However, I now seem to remember some discussion in the past when I was
trying to get people to use flush_dcache_page() to solve the coherency
problems when block drivers were doing PIO to page cache pages. I seem
to remember there being objections to it, which is one of the reasons
we ended up with a lighter weight flush_kernel_dcache_page(). But
shrug, dim and distant memories.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
