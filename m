Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311231C9EB9
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 00:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgEGWvK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 18:51:10 -0400
Received: from mga05.intel.com ([192.55.52.43]:21779 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgEGWvK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 18:51:10 -0400
IronPort-SDR: vw/e2MqeB/h5k3zreXy2lpvnku/QsEh2njn2MQpCmDJBA5zNEydqk6K0asPBDqDeSZ2Mza0yZP
 ZldPXEooPtmg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 15:51:10 -0700
IronPort-SDR: KkjD1YAKdFT3e8D2XZABzY3aQLKnEXKOn0h0SQMKXa5uihRm4jFYYxRo95q/YttHS9mZ9NUdq7
 NTH13HRvGuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,365,1583222400"; 
   d="scan'208";a="251643272"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by fmsmga008.fm.intel.com with ESMTP; 07 May 2020 15:51:09 -0700
Date:   Thu, 7 May 2020 15:51:09 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>,
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
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V3 15/15] kmap: Consolidate kmap_prot definitions
Message-ID: <20200507225109.GB1428632@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-16-ira.weiny@intel.com>
 <20200507135307.4ba10d99c611f17beab31751@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507135307.4ba10d99c611f17beab31751@linux-foundation.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 01:53:07PM -0700, Andrew Morton wrote:
> On Thu,  7 May 2020 08:00:03 -0700 ira.weiny@intel.com wrote:
> 
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > Most architectures define kmap_prot to be PAGE_KERNEL.
> > 
> > Let sparc and xtensa define there own and define PAGE_KERNEL as the
> > default if not overridden.
> > 
> 
> checkpatch considered useful ;)

Yes sorry...  V3.1 on it's way...

Ira

> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: kmap-consolidate-kmap_prot-definitions-checkpatch-fixes
> 
> WARNING: macros should not use a trailing semicolon
> #134: FILE: arch/sparc/include/asm/highmem.h:33:
> +#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
> 
> total: 0 errors, 1 warnings, 100 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> ./patches/kmap-consolidate-kmap_prot-definitions.patch has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> Please run checkpatch prior to sending patches
> 
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  arch/sparc/include/asm/highmem.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/sparc/include/asm/highmem.h~kmap-consolidate-kmap_prot-definitions-checkpatch-fixes
> +++ a/arch/sparc/include/asm/highmem.h
> @@ -30,7 +30,7 @@
>  /* declarations for highmem.c */
>  extern unsigned long highstart_pfn, highend_pfn;
>  
> -#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
> +#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE)
>  extern pte_t *pkmap_page_table;
>  
>  void kmap_init(void) __init;
> _
> 
