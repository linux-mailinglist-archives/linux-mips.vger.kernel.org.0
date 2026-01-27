Return-Path: <linux-mips+bounces-13035-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCklDDgkeWnmvgEAu9opvQ
	(envelope-from <linux-mips+bounces-13035-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 21:46:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2E9A713
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 21:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52A7E301DEE9
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 20:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E7E2877F7;
	Tue, 27 Jan 2026 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PFrp9aEN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400B28727D;
	Tue, 27 Jan 2026 20:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546805; cv=none; b=smuyXjGhqCyDsr1bHFjhP3UGo7VXw/S6pesmW7xDvsQjhY+1qgvTdUZGzxZh6V4lfUkAaQTVxHQ+F2LXAAXXIg94hhXviqTIiUAgYOOb0kLPYEraAKuRgMnmvtSBC21fTvwGJECiDShCUsHAwGww83NgZmXouqmP+kecmB5JLaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546805; c=relaxed/simple;
	bh=dPe4WO5V5xGcqbRrtLSrAnb6cZI7NA2TSDIlxEHcMg0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cY78r2aw1u30xMZeSq9X16/l1n2pWX9d64xv+P7N1XdwRWF62BdSWIP89tF4v38fDGfZ+Dh+hi6fxzO6iAD/ms6VIrSs+1Nd4Lx08NnpWpyW8HSEQrw0aE+mCCn58afRCvIGce7ayXqHnNnqIhlxj9vmNR3K0gXa3+Srmd73f8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PFrp9aEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA31C116C6;
	Tue, 27 Jan 2026 20:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769546804;
	bh=dPe4WO5V5xGcqbRrtLSrAnb6cZI7NA2TSDIlxEHcMg0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PFrp9aENn8GkO3oMV5uU3fw/sDFm4fOIgmG6lOGNP6rxP54wuO7jQTZJOTnpGqGTk
	 NB3Sv2FHYDDBA3dsblyvixrcw3tZ4kXXeRIcFlqab7TMCcctx5uC+lfxG1L0MdwWzA
	 L7gQdZ4FA8nw9mzJUh2KfWM9LIGY8FgBJ+uk9/GM=
Date: Tue, 27 Jan 2026 12:46:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: david@kernel.org, andreas@gaisler.com, richard.weiyang@gmail.com,
 will@kernel.org, peterz@infradead.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com,
 linmag7@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, sparclinux@vger.kernel.org, Qi Zheng
 <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v4 0/8] enable PT_RECLAIM on more 64-bit architectures
Message-Id: <20260127124642.480123beb01ebb487f986a09@linux-foundation.org>
In-Reply-To: <cover.1769515122.git.zhengqi.arch@bytedance.com>
References: <cover.1769515122.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13035-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65B2E9A713
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 20:12:53 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> This series aims to enable PT_RECLAIM on more 64-bit architectures.

Thanks, I updated mm.git's mm-unstable branch to v4.

> Changes in v4:
>  - convert __HAVE_ARCH_TLB_REMOVE_TABLE to CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
>  - fix a WARN_ON_ONCE() on sparc64 (and on ppc)
>    (reported by Andreas Larsson)
>  - collect Acked-by (Hi David, I've kept your Acked-by, feel free to drop it)
>  - rebase onto the v6.19-rc7
> 

Below is how v4 altered mm.git.

I'm not seeing the WARN_ON_ONCE() fix.  I assume that was due to the
Kconfig alterations?



--- a/arch/powerpc/include/asm/tlb.h~b
+++ a/arch/powerpc/include/asm/tlb.h
@@ -37,7 +37,6 @@ extern void tlb_flush(struct mmu_gather
  */
 #define tlb_needs_table_invalidate()	radix_enabled()
 
-#define __HAVE_ARCH_TLB_REMOVE_TABLE
 /* Get the generic bits... */
 #include <asm-generic/tlb.h>
 
--- a/arch/powerpc/Kconfig~b
+++ a/arch/powerpc/Kconfig
@@ -305,6 +305,7 @@ config PPC
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select HAVE_ARCH_TLB_REMOVE_TABLE
 	select MMU_GATHER_MERGE_VMAS
 	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select MODULES_USE_ELF_RELA
--- a/arch/sparc/include/asm/tlb_64.h~b
+++ a/arch/sparc/include/asm/tlb_64.h
@@ -33,7 +33,6 @@ void flush_tlb_pending(void);
 #define tlb_needs_table_invalidate()	(false)
 #endif
 
-#define __HAVE_ARCH_TLB_REMOVE_TABLE
 #include <asm-generic/tlb.h>
 
 #endif /* _SPARC64_TLB_H */
--- a/arch/sparc/Kconfig~b
+++ a/arch/sparc/Kconfig
@@ -74,6 +74,7 @@ config SPARC64
 	select HAVE_KRETPROBES
 	select HAVE_KPROBES
 	select MMU_GATHER_RCU_TABLE_FREE if SMP
+	select HAVE_ARCH_TLB_REMOVE_TABLE if SMP
 	select MMU_GATHER_MERGE_VMAS
 	select MMU_GATHER_NO_FLUSH_CACHE
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
--- a/include/asm-generic/tlb.h~b
+++ a/include/asm-generic/tlb.h
@@ -213,7 +213,7 @@ struct mmu_table_batch {
 #define MAX_TABLE_BATCH		\
 	((PAGE_SIZE - sizeof(struct mmu_table_batch)) / sizeof(void *))
 
-#ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
+#ifndef CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE
 static inline void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
--- a/mm/Kconfig~b
+++ a/mm/Kconfig
@@ -1448,9 +1448,12 @@ config ARCH_HAS_USER_SHADOW_STACK
 	  The architecture has hardware support for userspace shadow call
           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
 
+config HAVE_ARCH_TLB_REMOVE_TABLE
+	def_bool n
+
 config PT_RECLAIM
 	def_bool y
-	depends on MMU_GATHER_RCU_TABLE_FREE
+	depends on MMU_GATHER_RCU_TABLE_FREE && !HAVE_ARCH_TLB_REMOVE_TABLE
 	help
 	  Try to reclaim empty user page table pages in paths other than munmap
 	  and exit_mmap path.
_


