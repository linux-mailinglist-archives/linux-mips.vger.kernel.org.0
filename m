Return-Path: <linux-mips+bounces-7602-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E1A1B500
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2025 12:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C0D416CCCD
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2025 11:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC16219EA0;
	Fri, 24 Jan 2025 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BUvQ8lth"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9064A1D;
	Fri, 24 Jan 2025 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737719295; cv=none; b=faXkzvF7PqqdlPQcknaKJDuU4AP0RoX3FrghCVfGp2yh8WPwGS334tE7sQp+o1a/6O9HFkvjJk1mX8njoVFCgisRtCfVy47KcvDIq5/N+ZEzmJq4jafFUZRI0L1muzjHK0ju2EEsNpkz4b0mfzMcymmt75m/LfdqecClf3uFyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737719295; c=relaxed/simple;
	bh=EGnvy1wYdb+Tjv033mzkvJFBX8jW6avTQFyEtIjj4t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAvr/mW4Z+Tf94kynsCyXJDE+GqMF9QEuUbMcZmGGNi7sHG1yYKRu89N2OZn3tljgX6SHS0aS5GwM6GvLCMjhzvR8BlfOAQHcqTcYBT49uyDgOi+ZKK6tP84CvY4ush8Jn/Fdr6GV9NeFrKoxaYA54jbdzssaStXeQqev3aMmzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BUvQ8lth; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FHz4xRyFvnCB+fzQfYx1bd2piIN9WzxnnPBHmtG/vRk=; b=BUvQ8lthZ9k+2zHpGZvP9tKKD1
	lquaViIsl97XMxi+w8EPv26S5U4qI49wLbq/7Z70Dx1PNQlAWLNHyX5MOxOeVxP4Nte4BT4YUIzDX
	F52rfiWnKleajUvXOvI/YtkLPGiQgfJbZ65zkBnOUrhxWnmgueeVKpxckt259crPtJcZ5rXVXpoFM
	syCjHshJlr2WeOAArElAVkHqGgsD05TidNMiKYomegI18TgNnu1EUL7Y8XuoZThBl3xAcYvswTFQ+
	+U1i57UNVCfKIrAKHrrJDCOr78rXxcqssi79dyjWqepk2cPB8NNNMD1JuTWfQw+x7WshfCesUldTR
	AWx3WONg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIAK-0000000FV1z-0JOS;
	Fri, 24 Jan 2025 11:48:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4550D300619; Fri, 24 Jan 2025 12:47:59 +0100 (CET)
Date: Fri, 24 Jan 2025 12:47:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kevin.brodsky@arm.com, riel@surriel.com, vishal.moola@gmail.com,
	david@redhat.com, jannh@google.com, hughd@google.com,
	willy@infradead.org, yuzhao@google.com, muchun.song@linux.dev,
	akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org,
	npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
	rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org, x86@kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Message-ID: <20250124114759.GB15996@noisy.programming.kicks-ass.net>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>

On Thu, Jan 23, 2025 at 09:26:13PM +0800, Qi Zheng wrote:
> Hi all,
> 
> As suggested by Peter Zijlstra below [1], this series aims to remove
> tlb_remove_page_ptdesc().
> 
> : Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
> : there should not be a page-table anywhere near here *ever*.
> :
> : Yes, some architectures use tlb_remove_page() for page-tables too, but
> : that is more or less an implementation detail that can be fixed.
> 
> After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
> to remove the page table pages. In the future, once all architectures using
> tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
> may be possible to use only tlb_remove_ptdesc().

Right, so I don't think Sparc and Power care to use ptdesc, they're
using non page page-tables.

At the very least we should do something like this, the only point of
having tlb_remove_ptdesc() is type safety, there really is no benefit
from it in any other way.

---
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index dec030cb1210..a6731328db6f 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -504,7 +504,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
-static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 {
 	tlb_remove_table(tlb, pt);
 }

