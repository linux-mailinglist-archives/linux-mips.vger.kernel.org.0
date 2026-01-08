Return-Path: <linux-mips+bounces-12788-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281DD05D7B
	for <lists+linux-mips@lfdr.de>; Thu, 08 Jan 2026 20:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E373D3009552
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jan 2026 19:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDDD329390;
	Thu,  8 Jan 2026 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CVumgl5u"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D72D12F5;
	Thu,  8 Jan 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767899962; cv=none; b=mjs8T2vDHw0bFs87Ph022gMftAZ4mpsPNBhvUaHy1uvHp06gsXg1J8aqicnTy5104oMJGQmfRVTjFJCsulgLsnb8dnCQzLOAHGAmbVs1d5Kb8pIQrAn8FkfTV/cr6Y33p78/QVg4uXAjn6gUx8mMN2/BvsvKDtL3qttBF793ksM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767899962; c=relaxed/simple;
	bh=fSg1rFUc7Lj8obCBDIiOBzwmsy2PDWnpS6aiVKuno6E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lZKq+/mNe0KkgH7LqfphQ7mITA5boXiSsOZb1fO6dG1msYF0oQY4rHX/q1PT8lXdRRxRYhC7ci9oTqGCRHw86ehlq03pKvT7/2IxDj9+uWjydrrSrrRrVc755AKVyrHS03EGAM5vQq3055who61jnZGEaFF7Pyu9fuP598OKG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CVumgl5u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE9CC116C6;
	Thu,  8 Jan 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767899961;
	bh=fSg1rFUc7Lj8obCBDIiOBzwmsy2PDWnpS6aiVKuno6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CVumgl5uYfQfaLqYgweLov8FT7OgO1ch7qHlwuZbONKicqb+bmGFoLIsYAxoWfRsr
	 6BxVTZH+QFJx2xSpWVk0NUrA2Ddxjwu2/Wcc1JG/gPIWft2fVjXp2CIt9nEHIpeVml
	 fnOoO4sO6q/7KPmJQudmyHeHcLC9E7nvlzSuO+ys=
Date: Thu, 8 Jan 2026 11:19:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>, Alex Shi <alexs@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson
 <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, David
 Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Heiko
 Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Johannes Berg
 <johannes@sipsolutions.net>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, Matt
 Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek
 <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador
 <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav
 <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King
 <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Suren
 Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent
 of the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate
 initialization of nodes, zones and memory map)
Message-Id: <20260108111919.ac5f811132672e760f47fbab@linux-foundation.org>
In-Reply-To: <aVpWpLV4Dut5Muo2@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
	<20260102070005.65328-23-rppt@kernel.org>
	<aVhN2NgQEKe0yzva@soda.int.kasm.eu>
	<aVll339wim7dCIaQ@kernel.org>
	<aVlwOyicOLPB9SOa@parmesan.int.kasm.eu>
	<aVpWpLV4Dut5Muo2@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Jan 2026 14:01:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Can you please stick this between patch 3 (arm: introduce
> arch_zone_limits_init()) and patch 4 (arm64: introduce
> arch_zone_limits_init())?

Did, thanks.  I made this a standalone patch rather than  a
squashable -fix.

> >From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> From: Klara Modin <klarasmodin@gmail.com>
> Date: Sat, 3 Jan 2026 20:40:09 +0200
> Subject: [PATCH] arm: make initialization of zero page independent of the
>  memory map
> 
> Unlike most architectures, arm keeps a struct page pointer to the
> empty_zero_page and to initialize it requires conversion of a virtual
> address to page which makes it necessary to have memory map initialized
> before creating the empty_zero_page.
> 
> Make empty_zero_page a stataic array in BSS to decouple it's
> initialization from the initialization of the memory map.
> 
> This also aligns arm with vast majorty of architectures.

Russell, can you please update us on your concerns with this change?

