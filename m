Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE08C40BD5F
	for <lists+linux-mips@lfdr.de>; Wed, 15 Sep 2021 03:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbhIOBwV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 21:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhIOBwV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Sep 2021 21:52:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF8061211;
        Wed, 15 Sep 2021 01:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631670662;
        bh=z0W70Z4JOetSa7g8CfvjNwgRWC4qCwo9bmhv6sh9Bxs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DhJ6GOb1z9RF8MoKZiSnxeXdJKNkyxJ7YyiEn0qQubMzT9FZtSjTJUt/KUr+QwVKI
         +frjDgFVeOdxWz9IZc7wervGNYWJ63gSfCERzcvLkSnA46r3ypahZL2U/4IHNXcntT
         /DqRf5MOYuMRlQ77Uv0SNMsaDJzboDdlLxIhocqe0R7UgiEK7ZBy99L8v0w5K3bX72
         sJ48QhBWhdiCuNKFPKWm/Qjfkv8EiwrcYFd4jtxEycZyiFEiLrwMg1PFndT/7dOiPM
         zl0gJLYf7yi4Oohaksg8j8XTXXQSSgFUXRaPI/wIqRfum+bBu2e2ldXr9TpWz6n+3M
         stAUSLvG5uH7w==
Date:   Tue, 14 Sep 2021 18:51:01 -0700 (PDT)
From:   Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     rm.skakun@gmail.com
cc:     Jan Beulich <jbeulich@suse.com>,
        Roman Skakun <rm.skakun@gmail.com>,
        Andrii Anisov <andrii_anisov@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>,
        xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        hch@lst.de
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
In-Reply-To: <20210914153046.GB815@lst.de>
Message-ID: <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com> <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <20210914153046.GB815@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 14 Sep 2021, Christoph Hellwig wrote:
> On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> > I'm not convinced the swiotlb use describe there falls under "intended
> > use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
> > the bottom of this page is also confusing, as following "Then we can
> > confirm the modified swiotlb size in the boot log:" there is a log
> > fragment showing the same original size of 64Mb.
> 
> It doesn't.  We also do not add hacks to the kernel for whacky out
> of tree modules.

Also, Option 1 listed in the webpage seems to be a lot better. Any
reason you can't do that? Because that option both solves the problem
and increases performance.
