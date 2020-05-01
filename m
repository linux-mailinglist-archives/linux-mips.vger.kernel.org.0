Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072D41C19A6
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 17:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgEAPfy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 11:35:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:28117 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729192AbgEAPfx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 May 2020 11:35:53 -0400
IronPort-SDR: om++zbgi8t0E9EUnZB7AyPCLPuQAPCjnj/zFX64x2eaBk/erR7UuRqJ1JoBXAGhiBeaoif/z1l
 qI08VoMXuFZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 08:35:52 -0700
IronPort-SDR: eiOWyZIKI7vO19DR7OCFr64BqstCK2TpjbIFtfZ8MAqSSlMpCoVlOTcj7hUJ1GBJabMYzWffE+
 Y8JGzvryIPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; 
   d="scan'208";a="460295055"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2020 08:35:52 -0700
Date:   Fri, 1 May 2020 08:35:52 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        dri-devel@lists.freedesktop.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Helge Deller <deller@gmx.de>, x86@kernel.org,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Chris Zankel <chris@zankel.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: sparc-related comment, to Re: [PATCH V1 07/10] arch/kmap: Ensure
 kmap_prot visibility
Message-ID: <20200501153551.GA673107@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-8-ira.weiny@intel.com>
 <20200501084446.GG27858@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501084446.GG27858@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 01, 2020 at 01:44:46AM -0700, Christoph Hellwig wrote:
> > --- a/arch/sparc/mm/highmem.c
> > +++ b/arch/sparc/mm/highmem.c
> > @@ -33,6 +33,7 @@
> >  #include <asm/vaddrs.h>
> >  
> >  pgprot_t kmap_prot;
> > +EXPORT_SYMBOL(kmap_prot);
> 
> Btw, I don't see why sparc needs this as a variable, as there is just
> a single assignment to it.

Because sparc uses non-standard defines which I'm not familiar with.

        kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);

SRMMU_ET_PTE and friends are defined in 

arch/sparc/include/asm/pgtsrmmu.h

Since I can't readily test sparc this was easier to put out than let 0-day
crank on the entire series checking if including that header in the common
header chain would be an issue.

> 
> If sparc is sorted out we can always make it a define, and use a define
> for kmap_prot that defaults to PAGE_KERNEL, avoiding a little
> more duplication.

Agreed.  But it seems easier as a follow up (for me with 0-day).  Perhaps
someone from sparc can weigh in on the specifics of those defines and why they
are different from the normal ones?  Or even provide a follow on patch?

Ira

