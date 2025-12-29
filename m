Return-Path: <linux-mips+bounces-12638-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC5CE5CB2
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 04:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 309973013EA2
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 03:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00926271A9A;
	Mon, 29 Dec 2025 03:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xudHUjeP"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF186274650
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 03:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978048; cv=none; b=kQpSb+MPF+ALKV/Z+TY20Mpnx8i92NTnsp9R/zPlUaBy31M2C76PoLK2sEWv4hvGp1sXAQq6hMPhnTtA5o6OWee5ZpIy2f8KkTUZ3oeVjboXU+pKyZ5jSnQu42kNDaM+qAZtq8FKu1P1N125Desdsk+lf8rmlnCFRw78zKUdJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978048; c=relaxed/simple;
	bh=qBCFUDAWRsep9ypsogxegTTrnf54BXOIWdjTbE8EFCs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fWOwLN0Jb0Rb0LGGAmVPPZJPA6NvxZFo969tfq+0xSoJzXYzerQiGFs7n0uw+I9utyOPE1zRhmSSA3IvY3DJ1JicYHp33iYTR7jsoA+LLITfkOX1vBkhwqHQGEed4vQe6vesp25X9NY8jp3jSoXrM/oGb51dpE/uofdTIFM6kfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xudHUjeP; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766978044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1afDEBzhkrjAza00g4g2aJTxEIGJdJZw63+C1Fb5ZI=;
	b=xudHUjePDfaFRoveEwaIphF8mZs/R5mnH9f47udtH04DIRRrs8+LS6GS4z4/Dl/4eYgJsK
	oBr6TOGzLIp7T/sxGOQwSW0OgPsC7SNoPYqwaW6LKziESfl/Vb8AEvdBWzNjrGqBebpb8i
	DehsZ+lJojnmbdQbaGriVFYLNw3k1b4=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH 27/28] mm/hugetlb: drop hugetlb_cma_check()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251228124001.3624742-28-rppt@kernel.org>
Date: Mon, 29 Dec 2025 11:13:03 +0800
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
Message-Id: <2F5422EB-495E-4BC7-8174-13BED1147382@linux.dev>
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-28-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 28, 2025, at 20:39, Mike Rapoport <rppt@kernel.org> wrote:
> 
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb_cma_check() was required when the ordering of hugetlb_cma_reserve()
> and hugetlb_bootmem_alloc() was architecture depended.
> 
> Since hugetlb_cma_reserve() is always called before hugetlb_bootmem_alloc()
> there is no need to check whether hugetlb_cma_reserve() was already called.
> 
> Drop unneeded hugetlb_cma_check() function.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Nice cleanup.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


