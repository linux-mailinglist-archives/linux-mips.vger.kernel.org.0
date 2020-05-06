Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC091C7B30
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 22:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgEFUZQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 16:25:16 -0400
Received: from mga07.intel.com ([134.134.136.100]:32872 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgEFUZQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 16:25:16 -0400
IronPort-SDR: iuyKOFRaSc5UDnIYcz6oLu/mTlBbbftpP66PZXTW2HTv2aLBgBX9vidybh/Bj2eRxHi6t8EZbY
 i+43cy2henJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 13:25:15 -0700
IronPort-SDR: xSrhp4VCcSvP5bv2WtfYo6vFeSsnnsv3N44sSopWfpFOgIk9uc/zRJt3WrQM/g5MZyK9rPCoAV
 JVwDj2vxz4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; 
   d="scan'208";a="461881349"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by fmsmga006.fm.intel.com with ESMTP; 06 May 2020 13:25:14 -0700
Date:   Wed, 6 May 2020 13:25:14 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
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
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V2 05/11] {x86,powerpc,microblaze}/kmap: Move preempt
 disable
Message-ID: <20200506202514.GF1084880@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-6-ira.weiny@intel.com>
 <20200506061113.GA5192@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506061113.GA5192@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 05, 2020 at 11:11:13PM -0700, Christoph Hellwig wrote:
> On Sun, May 03, 2020 at 06:09:06PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > During this kmap() conversion series we must maintain bisect-ability.
> > To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
> > remain functional.
> > 
> > Create a temporary inline version of kmap_atomic_prot within these
> > architectures so we can rework their kmap_atomic() calls and then lift
> > kmap_atomic_prot() to the core.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > ---
> > Changes from V1:
> > 	New patch
> > ---
> >  arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
> >  arch/microblaze/mm/highmem.c          | 10 ++--------
> >  arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
> >  arch/powerpc/mm/highmem.c             |  9 ++-------
> >  arch/x86/include/asm/highmem.h        | 11 ++++++++++-
> >  arch/x86/mm/highmem_32.c              | 10 ++--------
> >  6 files changed, 36 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> > index 0c94046f2d58..ec9954b091e1 100644
> > --- a/arch/microblaze/include/asm/highmem.h
> > +++ b/arch/microblaze/include/asm/highmem.h
> > @@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
> >  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
> >  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
> >  
> > -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> > +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
> > +void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> 
> Shouldn't this be marked inline?

Yes Thanks.  Done.

> 
> The rest looks fine:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks,
Ira

