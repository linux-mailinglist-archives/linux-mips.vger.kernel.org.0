Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF331C7B58
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 22:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgEFUdr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 16:33:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:33389 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgEFUdq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 16:33:46 -0400
IronPort-SDR: iwj0sBkj/cjFpBhO79fExKo6hqhTLJjIzY9/dVy0zuLVt85sGotipJ12VQOun2+EdxWQ+Lo0ZU
 iixUW2SnnWLg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 13:33:46 -0700
IronPort-SDR: M/8biaEifOtf/KVemcKvoXhaN/dNTMq07DSDleAl9z1EKDvsLY2Gj1/J5kQQSyza0fRBg4vIeY
 Ynf/+fytsXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; 
   d="scan'208";a="435017008"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2020 13:33:40 -0700
Date:   Wed, 6 May 2020 13:33:39 -0700
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
Subject: Re: [PATCH V2 08/11] arch/kmap: Ensure kmap_prot visibility
Message-ID: <20200506203339.GG1084880@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-9-ira.weiny@intel.com>
 <20200506061326.GD5192@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506061326.GD5192@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 05, 2020 at 11:13:26PM -0700, Christoph Hellwig wrote:
> On Sun, May 03, 2020 at 06:09:09PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > We want to support kmap_atomic_prot() on all architectures and it makes
> > sense to define kmap_atomic() to use the default kmap_prot.
> > 
> > So we ensure all arch's have a globally available kmap_prot either as a
> > define or exported symbol.
> 
> FYI, I still think a
> 
> #ifndef kmap_prot
> #define kmap_prot PAGE_KERNEL
> #endif
> 
> in linux/highmem.h would be nicer.  Then only xtensa and sparc need
> to override it and clearly stand out.

That would be nice...  But...  in this particular patch kmap_prot needs to be
in arch/microblaze/include/asm/highmem.h to preserve bisect-ability.

So there would be an inversion with this define and the core #ifndef...

I like the change but I'm going to add this change as a follow on patch because
at the end of the series microblaze no longer needs this.

If this is reasonable could I get a review on this patch to add to the next
series?

Ira

