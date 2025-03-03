Return-Path: <linux-mips+bounces-8076-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B9A4CF7C
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 00:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FF961891D59
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 23:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77251F4160;
	Mon,  3 Mar 2025 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iru1kz8e"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792181F3BA4;
	Mon,  3 Mar 2025 23:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046014; cv=none; b=haEXmeCajwEvx/RlvMdmjLg5nVV6aaIE1yqdzv+BaIlItDCed2HvyYnu3vPBLcAW4JJwIMJ4GpTwBIgBcNz41azm+gwJ3XpdcOaRqwGq3dagyXbsNaLcLnNv8vx5lxUuv+1+7q+jV3O27QLszSDcGcpzkzTJ9OiWWjA2ncCN/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046014; c=relaxed/simple;
	bh=SrQtbfxYGblSpvS8LPwAgsKM2zI/YMCSsrpy1uMUZvU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=d71d3DswuFhpW/GJK5Qtd95pPyCYWu2n7Y5xRLyfdMnP3sSUeIoflHhTzfkE/BDKzTM5PWJGrWELsgHZmBSCA60Fa8QyGBz5yrK1C8QkiLMTdyJENzggycXi2CCZ3dRc2p7jmNL2GnptvMl/R1msGX3lqf86OtvigrqCYUXIPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iru1kz8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0037FC4CEE4;
	Mon,  3 Mar 2025 23:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741046012;
	bh=SrQtbfxYGblSpvS8LPwAgsKM2zI/YMCSsrpy1uMUZvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iru1kz8eq+EO/xgcHrFXDnYxmdtltZ7HKDfYUYddhUyXIwLnElsYIp63ESBZEJTKx
	 20QT7RWf+uU+xBUqIpZgldSFkrt7I8Ub9UgRKVHhsmRSgrMICJwd4jOLrI8Bw2DMys
	 tlGrdvsjvMaxS/SprlLy5ikI+6BesGB7n/0hWGA8=
Date: Mon, 3 Mar 2025 15:53:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/6 update] mm: pgtable: convert some architectures
 to use tlb_remove_ptdesc()
Message-Id: <20250303155331.de9b2fff9b04984a255a7bc2@linux-foundation.org>
In-Reply-To: <20250303072603.45423-1-zhengqi.arch@bytedance.com>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
	<20250303072603.45423-1-zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Mar 2025 15:26:03 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
> tlb_remove_page()). This is the same as the implementation of
> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
> convert these architectures to use tlb_remove_ptdesc().
> 

checkpatch warns.

Do these things have to be macros?  Switching to static inline fixes
the unused-arg warning in a nice fashion.

I'll fix the trailing-semicolon issue locally.

WARNING: Argument 'address' is not used in function-like macro
#51: FILE: arch/csky/include/asm/pgalloc.h:64:
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'addr' is not used in function-like macro
#66: FILE: arch/hexagon/include/asm/pgalloc.h:90:
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'address' is not used in function-like macro
#80: FILE: arch/loongarch/include/asm/pgalloc.h:58:
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));

WARNING: macros should not use a trailing semicolon
#80: FILE: arch/loongarch/include/asm/pgalloc.h:58:
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));

WARNING: Argument 'addr' is not used in function-like macro
#95: FILE: arch/m68k/include/asm/sun3_pgalloc.h:20:
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'address' is not used in function-like macro
#110: FILE: arch/mips/include/asm/pgalloc.h:51:
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'addr' is not used in function-like macro
#125: FILE: arch/nios2/include/asm/pgalloc.h:31:
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'addr' is not used in function-like macro
#139: FILE: arch/openrisc/include/asm/pgalloc.h:67:
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'addr' is not used in function-like macro
#153: FILE: arch/sh/include/asm/pgalloc.h:35:
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'address' is not used in function-like macro
#167: FILE: arch/um/include/asm/pgalloc.h:28:
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))

WARNING: Argument 'address' is not used in function-like macro
#176: FILE: arch/um/include/asm/pgalloc.h:33:
+#define __pmd_free_tlb(tlb, pmd, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))

WARNING: Argument 'address' is not used in function-like macro
#185: FILE: arch/um/include/asm/pgalloc.h:38:
+#define __pud_free_tlb(tlb, pud, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud))

total: 0 errors, 12 warnings, 122 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

./patches/mm-pgtable-convert-some-architectures-to-use-tlb_remove_ptdesc-v2.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


