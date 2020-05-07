Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935721C9EAA
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 00:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgEGWum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 18:50:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:62950 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgEGWum (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 18:50:42 -0400
IronPort-SDR: RjZvXOEqyBvSauYfgqDB9pF/wYilMCoFFAk8qkHwD1DpNoz2FLFas2I/BmmR0VJvaV5dM6o1YG
 7TQrydJZzprg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 15:50:41 -0700
IronPort-SDR: A94YOimG+GBTCtRnotihIHXo/4uYOm9rsXy8xtuLX5Aw2+CVkRWX3diLimU1sfCOXtFd1OcX1r
 bTWfMT7evkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,365,1583222400"; 
   d="scan'208";a="278753786"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga002.jf.intel.com with ESMTP; 07 May 2020 15:50:40 -0700
Date:   Thu, 7 May 2020 15:50:40 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
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
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V3 13/15] parisc/kmap: Remove duplicate kmap code
Message-ID: <20200507225039.GA1428632@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-14-ira.weiny@intel.com>
 <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 01:52:58PM -0700, Andrew Morton wrote:
> On Thu,  7 May 2020 08:00:01 -0700 ira.weiny@intel.com wrote:
> 
> > parisc reimplements the kmap calls except to flush it's dcache.  This is
> > arguably an abuse of kmap but regardless it is messy and confusing.
> > 
> > Remove the duplicate code and have parisc define
> > ARCH_HAS_FLUSH_ON_KUNMAP for a kunmap_flush_on_unmap() architecture
> > specific call to flush the cache.
> 
> checkpatch says:
> 
> ERROR: #define of 'ARCH_HAS_FLUSH_ON_KUNMAP' is wrong - use Kconfig variables or standard guards instead
> #69: FILE: arch/parisc/include/asm/cacheflush.h:103:
> +#define ARCH_HAS_FLUSH_ON_KUNMAP
> 
> which is fair enough, I guess.  More conventional would be
> 
> arch/parisc/include/asm/cacheflush.h:
> 
> static inline void kunmap_flush_on_unmap(void *addr)
> {
> 	...
> }
> #define kunmap_flush_on_unmap kunmap_flush_on_unmap
> 
> 
> include/linux/highmem.h:
> 
> #ifndef kunmap_flush_on_unmap
> static inline void kunmap_flush_on_unmap(void *addr)
> {
> }
> #define kunmap_flush_on_unmap kunmap_flush_on_unmap
> #endif
> 
> 
> static inline void kunmap_atomic_high(void *addr)
> {
> 	/* Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
> 	 * handles re-enabling faults + preemption */
> 	kunmap_flush_on_unmap(addr);
> }
> 
> 
> but I don't really think it's worth bothering changing it.	
> 
> (Ditto patch 3/15)

Yes I was following the pattern already there.

I'll fix up the last patch now.
Ira

