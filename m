Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730641D844E
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 20:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732756AbgERSLK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 14:11:10 -0400
Received: from mga04.intel.com ([192.55.52.120]:52500 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728606AbgERSLI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 14:11:08 -0400
IronPort-SDR: MEihRUQKPD9yLYzUOyQEKFWM725X5E1TW5wxJL26f7d7grexz9Y/SMaIpHJZCs3EXY9zAUzGC1
 OcI675kOf6IQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 11:11:08 -0700
IronPort-SDR: 4PTj0JCNuHA2KBITWxMsHBG0lvanYZRK6CkXelcZuJd9rLLbOv9o5Xe4vuYLc2cXwOltPBKNMq
 LeWae4iARKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="308177709"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by FMSMGA003.fm.intel.com with ESMTP; 18 May 2020 11:11:08 -0700
Date:   Mon, 18 May 2020 11:11:08 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518181107.GC3025231@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
 <20200518042932.GA59205@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518042932.GA59205@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 17, 2020 at 09:29:32PM -0700, Guenter Roeck wrote:
> On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:
> > On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
> > > On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> > > > From: Ira Weiny <ira.weiny@intel.com>
> > > > 
> > > > Every single architecture (including !CONFIG_HIGHMEM) calls...
> > > > 
> > > > 	pagefault_enable();
> > > > 	preempt_enable();
> > > > 
> > > > ... before returning from __kunmap_atomic().  Lift this code into the
> > > > kunmap_atomic() macro.
> > > > 
> > > > While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> > > > be consistent.
> > > > 
> > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > This patch results in:
> > > 
> > > Starting init: /bin/sh exists but couldn't execute it (error -14)
> > > 
> > > when trying to boot microblazeel:petalogix-ml605 in qemu.
> > 
> > Thanks for the report.  I'm not readily seeing the issue.
> > 
> > Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?
> > 
> See below. Yes, CONFIG_HIGHMEM is set.
> 
> The scripts used to build and boot the image are at:
> 
> https://github.com/groeck/linux-build-test/tree/master/rootfs/microblazeel
> 
> Hope this helps,

Thank you ...

Could you try the following patch?


commit 82c284b2bb74ca195dfcd35b70a175f010b9fd46 (HEAD -> lm-kmap17)
Author: Ira Weiny <ira.weiny@intel.com>
Date:   Mon May 18 11:01:10 2020 -0700

    microblaze/kmap: Don't enable pagefault/preempt twice
    
    The kunmap_atomic clean up failed to remove the pagefault/preempt
    enables on this path.
    
    Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
    Signed-off-by: Ira Weiny <ira.weiny@intel.com>

diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index ee8a422b2b76..92e0890416c9 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -57,11 +57,8 @@ void kunmap_atomic_high(void *kvaddr)
        int type;
        unsigned int idx;
 
-       if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-               pagefault_enable();
-               preempt_enable();
+       if (vaddr < __fix_to_virt(FIX_KMAP_END))
                return;
-       }
 
        type = kmap_atomic_idx();
 
