Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA251B94DA
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 03:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgD0BQc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 21:16:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:62678 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgD0BQc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 21:16:32 -0400
IronPort-SDR: Lv/v2Jhj0NyWAobklZlghw3MydTkknmxfhC7JeS1RSQhe+MFITHVsWvc2aHAnd5si+epKjfCQu
 IEveEu/quQnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2020 18:16:31 -0700
IronPort-SDR: ZrrKsQ6Zur3/bE2CO6sc6Wdv34dqrhqrjSlpkUGUwoboNwAHWFqd68hpZ33zjqX/g7EQHldNW4
 L627f0bj0fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,321,1583222400"; 
   d="scan'208";a="336090274"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2020 18:16:31 -0700
Date:   Sun, 26 Apr 2020 18:16:30 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200427011630.GC135929@iweiny-DESK2.sc.intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
 <20200426072642.GB22024@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426072642.GB22024@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 12:26:42AM -0700, Christoph Hellwig wrote:
> > diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> > index 4db13a6b9f3b..1cae4b911a33 100644
> > --- a/arch/arc/mm/highmem.c
> > +++ b/arch/arc/mm/highmem.c
> > @@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
> >  {
> >  	int idx, cpu_idx;
> >  	unsigned long vaddr;
> > +	void *addr = kmap_atomic_fast(page);
> >  
> > -	preempt_disable();
> > -	pagefault_disable();
> > -	if (!PageHighMem(page))
> > -		return page_address(page);
> > +	if (addr)
> > +		return addr;
> 
> Wouldn't it make sense to just move kmap_atomic itelf to common code,
> and call out to a kmap_atomic_high for the highmem case, following the
> scheme in kmap?
>

Sure I do like that symmetry between the calls.

>
> Same for the unmap side.

FWIW that would simply be renaming  __kunmap_atomic() to kunmap_atomic_high()

>
> That might require to support
> kmap_atomic_prot everywhere first, which sounds like a really good
> idea anyway, and would avoid the need for strange workaround in drm.

Having a kmap_atomic_prot() seems like a good idea.  But I'm not exactly sure
why CONFIG_x86 is being called out specifically in the DRM code?

Ira

