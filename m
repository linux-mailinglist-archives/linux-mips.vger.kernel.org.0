Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FFD40B320
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 17:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbhINPcJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 11:32:09 -0400
Received: from verein.lst.de ([213.95.11.211]:60860 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233202AbhINPcJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Sep 2021 11:32:09 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 375B567373; Tue, 14 Sep 2021 17:30:47 +0200 (CEST)
Date:   Tue, 14 Sep 2021 17:30:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jan Beulich <jbeulich@suse.com>
Cc:     Roman Skakun <rm.skakun@gmail.com>,
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
        Christoph Hellwig <hch@lst.de>,
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
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
Message-ID: <20210914153046.GB815@lst.de>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com> <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> I'm not convinced the swiotlb use describe there falls under "intended
> use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
> the bottom of this page is also confusing, as following "Then we can
> confirm the modified swiotlb size in the boot log:" there is a log
> fragment showing the same original size of 64Mb.

It doesn't.  We also do not add hacks to the kernel for whacky out
of tree modules.
