Return-Path: <linux-mips+bounces-12640-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A394CE5CAF
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 04:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E41B13000F89
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 03:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF1A27146A;
	Mon, 29 Dec 2025 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CsTctdZ8"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50911271443
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 03:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978070; cv=none; b=jeIDB+zgfy4QtyPWjllx5CWNIlYr3RhxHs0cdLvNLVfZxuWyLvTLOJAVIHygLzctmvXvriitoiAN/T0hjV1olJqrYy5iOYyAGHqQFZnnDTvGgPGQ6bIuL9P9XVCMr7R8k1/c2lpScMDKQMCq6XX2AX3XWu9Sb5ZoMjOReamGl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978070; c=relaxed/simple;
	bh=zJVh7Eiu9Qmqvv/80ZNMMMHzubfHqn+LQIj/Vkbafgs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Z4IRYdXAW6/+9xdKAr1aQZQOynZ0IvPqveSjaWAuALRcuWFrZiHHaBXXpGtrG36CBhUl4R205+hiDsJJHZt5ZPl7g2T+3ogbgLL3iuURxsMiF2PLO86qIjqK7ESiWgCQ0710KHWbeYhDdBYLz6t4r8kZhdH8ivYFQ1529ugSKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CsTctdZ8; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766978065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23WFVh4QD8EwOyb+DiEjMorTSabGcCdF0HCkzTj5UcI=;
	b=CsTctdZ8U9pUZlVucTzftHHmp2gnI1r0CzZFlnpRDH9PaP1qXa4UPAYSva2HLine9CfV90
	9W72CV4/QFwNiVWLYQ5mHLAgZrQcKb5qzwdX5woVQVU6YQn8JsHteRlat/Z+Spad7CIWaS
	h++GDN5U6j2LdFzXpT0UvZYdzjPHOv4=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH 28/28] Revert "mm/hugetlb: deal with multiple calls to
 hugetlb_bootmem_alloc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251228124001.3624742-29-rppt@kernel.org>
Date: Mon, 29 Dec 2025 11:13:26 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alex Shi <alexs@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>,
 Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>,
 Michal Simek <monstr@monstr.eu>,
 Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>,
 x86@kernel.org,
 linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C8C5C80F-BA99-445D-9711-2665B1262C66@linux.dev>
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-29-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 28, 2025, at 20:39, Mike Rapoport <rppt@kernel.org> wrote:
> 
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb_bootmem_alloc() is called only once, no need to check if it was
> called aready at its entry.
> 
> Other checks performed during HVO initialization are also no longer
> necessary because sparse_init() that calls hugetlb_vmemmap_init_early()
> and hugetlb_vmemmap_init_late() is alaways called after
> hugetlb_bootmem_alloc().
> 
> This reverts commit d58b2498200724e4f8c12d71a5953da03c8c8bdf.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Nice cleanup.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


