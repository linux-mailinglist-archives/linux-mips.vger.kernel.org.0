Return-Path: <linux-mips+bounces-6988-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A69EFEE7
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 23:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC989188E077
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 22:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BFA1C9B62;
	Thu, 12 Dec 2024 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vATraj/l"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307415696E;
	Thu, 12 Dec 2024 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734040929; cv=none; b=ZBuF48HzkavnPvKLG2kGp9mkc474ckOcfjc+rr2P5TMqT7/Fbn+Y5+JDCVqENCLeF0u+YNFb3M1WbhUX18x57z9A6HqBbD+dZUI7RrWuTtguKJPL3ROknSUQgUAHZ68ZzXGjqnYpRHJol6x94FqtaVEr2/iSsvDpw8uxBOQ7me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734040929; c=relaxed/simple;
	bh=d6w71hnmNNqeEhPnuQXhVuwXzQgtPB/lkPKn7KnvGrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXmY5taQDLz2U7qVm2QDYPnPzzzmZntBwCaD66cII2ScKLwun/jU5OO4bPOb0VCY451MoVjZwlP5lKuVCOQt0/aTLyYMCYjkhGzp32nUHcbryaXN+LDYJ8WAtoC0ByF3Ew1mr/0KXvmH49Ao0W4+DbsoJwAEc9womcpvSNPVG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vATraj/l; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nUU3k3ndx8hCjIEVI0vAEW5jsu/OGAg5GP0kOz2LdOQ=; b=vATraj/l7BYi45J3o09OIopaxJ
	C8jNjTPCPsm9QpjuSJ1IY9oPT5mUdBMuSKqTmLPfzVHPEsRg9jIMEmxtX5EH+CBf2Ad5QJkAzCOb0
	QIBWWnrVmjlWPROLIj1nnhmGbebpQ72pM/mYvVSSI7b+XJoia4xx6JsI/qmb+lwoDY8J6kpWtw2sy
	nSq0P9/nMLk51OkHcgu7wfznTwDcJV87JcZ7lYZRgkl/n/cZDkdLwKwkwqCciizJ2Mw/AcIegRxYt
	kYJ96xWeFCCL6IUF+RLxWDxyxyavltxwOVk9mRXBnRhuepZag1Y3wIlzjK2IUkkHDKONd/95VcvEW
	bk/ki6/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrFA-00000008PIi-3DGS;
	Thu, 12 Dec 2024 22:01:12 +0000
Date: Thu, 12 Dec 2024 22:01:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com,
	riel@surriel.com, david@redhat.com, minchan@kernel.org,
	jyescas@google.com, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
	leitao@debian.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@android.com, android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <Z1tdKHFfz-tMTXit@casper.infradead.org>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>

On Wed, Dec 11, 2024 at 03:27:38PM -0800, Kalesh Singh wrote:
> Hi all,
> 
> This is v2 othe the arch_mmap_hint() series.
> 
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate most of the error handling in arch_mmap_hint().
>   - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
>     Patch 2 ("mm: x86: Introduce arch_mmap_hint()")
> 
> v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/
> 
> =======
> 
> This series introduces arch_mmap_hint() to handle allocating VA space
> for the hint address.

But why?  You're basically forcing me to read the entire series to
figure out what you're doing and why.  I decline.

> Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
> issue of mmap hint being ignored in some cases due to THP alignment [1]
> 
> [1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/
> 
> Thanks,
> Kalesh
> 
> 
> Kalesh Singh (16):
>   mm: Introduce generic_mmap_hint()
>   mm: x86: Introduce arch_mmap_hint()
>   mm: arm: Introduce arch_mmap_hint()
>   mm: alpha: Introduce arch_mmap_hint()
>   mm: arc: Use generic_mmap_hint()
>   mm: csky: Introduce arch_mmap_hint()
>   mm: loongarch: Introduce arch_mmap_hint()
>   mm: mips: Introduce arch_align_mmap_hint()
>   mm: parisc: Introduce arch_align_mmap_hint()
>   mm: s390: Use generic_mmap_hint()
>   mm: sh: Introduce arch_mmap_hint()
>   mm: sparc32: Introduce arch_mmap_hint()
>   mm: sparc64: Introduce arch_mmap_hint()
>   mm: xtensa: Introduce arch_mmap_hint()
>   mm: powerpc: Introduce arch_mmap_hint()
>   mm: Respect mmap hint before THP alignment if allocation is possible
> 
>  arch/alpha/include/asm/pgtable.h           |   1 +
>  arch/alpha/kernel/osf_sys.c                |  31 +++---
>  arch/arc/include/asm/pgtable.h             |   1 +
>  arch/arc/mm/mmap.c                         |  43 +++++----
>  arch/arm/include/asm/pgtable.h             |   1 +
>  arch/arm/mm/mmap.c                         | 107 +++++++++------------
>  arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
>  arch/csky/abiv1/mmap.c                     |  68 +++++++------
>  arch/loongarch/include/asm/pgtable.h       |   1 +
>  arch/loongarch/mm/mmap.c                   |  49 +++++-----
>  arch/mips/include/asm/pgtable.h            |   1 +
>  arch/mips/mm/mmap.c                        |  50 +++++-----
>  arch/parisc/include/asm/pgtable.h          |   1 +
>  arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
>  arch/powerpc/include/asm/book3s/64/slice.h |   1 +
>  arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
>  arch/s390/include/asm/pgtable.h            |   1 +
>  arch/s390/mm/mmap.c                        |  51 +++++-----
>  arch/sh/include/asm/pgtable.h              |   1 +
>  arch/sh/mm/mmap.c                          |  83 ++++++----------
>  arch/sparc/include/asm/pgtable_32.h        |   1 +
>  arch/sparc/include/asm/pgtable_64.h        |   1 +
>  arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
>  arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
>  arch/x86/include/asm/pgtable_64.h          |   1 +
>  arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
>  arch/xtensa/kernel/syscall.c               |  31 ++++--
>  include/linux/sched/mm.h                   |   9 ++
>  mm/huge_memory.c                           |  17 ++--
>  mm/mmap.c                                  |  86 +++++++++++------
>  30 files changed, 491 insertions(+), 424 deletions(-)
> 
> -- 
> 2.47.0.338.g60cca15819-goog
> 
> 

