Return-Path: <linux-mips+bounces-13037-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEozFbVveWmIxAEAu9opvQ
	(envelope-from <linux-mips+bounces-13037-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 03:08:53 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016A9C264
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 03:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60AAF300B440
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 02:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8216284B58;
	Wed, 28 Jan 2026 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I3HQOiCH"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB0F284B3B
	for <linux-mips@vger.kernel.org>; Wed, 28 Jan 2026 02:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769566065; cv=none; b=CmRvc7tD8fyqHo/00vBFIfmyVeNZZcragOyp/XrEwufagorIMULWa4c9qbkf4SJh+OtwmzdbumUV5fcEUsuyB0BGyBMyn5AlwDh5selmULk7P/ZR7PbGg20w5JDGKZny3Xl+G5OCj+8WXqtYyVCtdM/8yxW4z/UcpqHM9llh/pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769566065; c=relaxed/simple;
	bh=iKNsG3jb0A1cc8Pzxzt7oiyA3XWv4pR1vlL+x9/L2x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJfnABmbroEgLVpnrDM2N0q6OWgiZifxLXPXsRTEVlSYK904RvDUCHE1+1PnpHWTutsEoJapN4P6HqWOjMyjANPsoxpMlp5d/L4L/PXh8g0+GfKoz55Ij5CXhGs9GbduVB7G/hgpI14Eod4joWdOovo7nXcO0UOl7+xbYJ3KGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I3HQOiCH; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4c171a25-e395-4f83-b767-18525fffbee3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769566051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4t3b1mOfPtHigPq6Z2WHKbf3iNBrW17rXF/iuZKlWU=;
	b=I3HQOiCHRK+ra8CKqHdI7J6UYtfRC6z7IH9vbCxNEd8HoqK7Tyx5NW2XzLCUbSdOwtEHCJ
	PrvEUB70GyyRlx7g5xA0Csz7PDTqbdzG32WNgMGufhfuOIaPPVRKNpL+JiU8gfGGSpRv5N
	IuXL9L87r74XS+4rqkFgpDIaGTmcayA=
Date: Wed, 28 Jan 2026 10:07:22 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/8] enable PT_RECLAIM on more 64-bit architectures
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, andreas@gaisler.com, richard.weiyang@gmail.com,
 will@kernel.org, peterz@infradead.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, linmag7@gmail.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, sparclinux@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1769515122.git.zhengqi.arch@bytedance.com>
 <20260127124642.480123beb01ebb487f986a09@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260127124642.480123beb01ebb487f986a09@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13037-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qi.zheng@linux.dev,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0016A9C264
X-Rspamd-Action: no action



On 1/28/26 4:46 AM, Andrew Morton wrote:
> On Tue, 27 Jan 2026 20:12:53 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
> 
>> This series aims to enable PT_RECLAIM on more 64-bit architectures.
> 
> Thanks, I updated mm.git's mm-unstable branch to v4.
> 
>> Changes in v4:
>>   - convert __HAVE_ARCH_TLB_REMOVE_TABLE to CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
>>   - fix a WARN_ON_ONCE() on sparc64 (and on ppc)
>>     (reported by Andreas Larsson)
>>   - collect Acked-by (Hi David, I've kept your Acked-by, feel free to drop it)
>>   - rebase onto the v6.19-rc7
>>
> 
> Below is how v4 altered mm.git.
> 
> I'm not seeing the WARN_ON_ONCE() fix.  I assume that was due to the
> Kconfig alterations?

Yes, sparc64 and ppc will select HAVE_ARCH_TLB_REMOVE_TABLE, so
PT_RECLAIM will not be enabled. This means it won't affect
sparc64 and ppc, and will not trigger WARN_ON_ONCE().

I don't have a testing environment for sparc64 and ppc, but I
expect it should be able to fix the WARN_ON_ONCE().

Thanks,
Qi

> 
> 
> 
> --- a/arch/powerpc/include/asm/tlb.h~b
> +++ a/arch/powerpc/include/asm/tlb.h
> @@ -37,7 +37,6 @@ extern void tlb_flush(struct mmu_gather
>    */
>   #define tlb_needs_table_invalidate()	radix_enabled()
>   
> -#define __HAVE_ARCH_TLB_REMOVE_TABLE
>   /* Get the generic bits... */
>   #include <asm-generic/tlb.h>
>   
> --- a/arch/powerpc/Kconfig~b
> +++ a/arch/powerpc/Kconfig
> @@ -305,6 +305,7 @@ config PPC
>   	select LOCK_MM_AND_FIND_VMA
>   	select MMU_GATHER_PAGE_SIZE
>   	select MMU_GATHER_RCU_TABLE_FREE
> +	select HAVE_ARCH_TLB_REMOVE_TABLE
>   	select MMU_GATHER_MERGE_VMAS
>   	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
>   	select MODULES_USE_ELF_RELA
> --- a/arch/sparc/include/asm/tlb_64.h~b
> +++ a/arch/sparc/include/asm/tlb_64.h
> @@ -33,7 +33,6 @@ void flush_tlb_pending(void);
>   #define tlb_needs_table_invalidate()	(false)
>   #endif
>   
> -#define __HAVE_ARCH_TLB_REMOVE_TABLE
>   #include <asm-generic/tlb.h>
>   
>   #endif /* _SPARC64_TLB_H */
> --- a/arch/sparc/Kconfig~b
> +++ a/arch/sparc/Kconfig
> @@ -74,6 +74,7 @@ config SPARC64
>   	select HAVE_KRETPROBES
>   	select HAVE_KPROBES
>   	select MMU_GATHER_RCU_TABLE_FREE if SMP
> +	select HAVE_ARCH_TLB_REMOVE_TABLE if SMP
>   	select MMU_GATHER_MERGE_VMAS
>   	select MMU_GATHER_NO_FLUSH_CACHE
>   	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
> --- a/include/asm-generic/tlb.h~b
> +++ a/include/asm-generic/tlb.h
> @@ -213,7 +213,7 @@ struct mmu_table_batch {
>   #define MAX_TABLE_BATCH		\
>   	((PAGE_SIZE - sizeof(struct mmu_table_batch)) / sizeof(void *))
>   
> -#ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
> +#ifndef CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE
>   static inline void __tlb_remove_table(void *table)
>   {
>   	struct ptdesc *ptdesc = (struct ptdesc *)table;
> --- a/mm/Kconfig~b
> +++ a/mm/Kconfig
> @@ -1448,9 +1448,12 @@ config ARCH_HAS_USER_SHADOW_STACK
>   	  The architecture has hardware support for userspace shadow call
>             stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>   
> +config HAVE_ARCH_TLB_REMOVE_TABLE
> +	def_bool n
> +
>   config PT_RECLAIM
>   	def_bool y
> -	depends on MMU_GATHER_RCU_TABLE_FREE
> +	depends on MMU_GATHER_RCU_TABLE_FREE && !HAVE_ARCH_TLB_REMOVE_TABLE
>   	help
>   	  Try to reclaim empty user page table pages in paths other than munmap
>   	  and exit_mmap path.
> _
> 


