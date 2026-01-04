Return-Path: <linux-mips+bounces-12743-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE0CF1676
	for <lists+linux-mips@lfdr.de>; Sun, 04 Jan 2026 23:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63100300C0C4
	for <lists+linux-mips@lfdr.de>; Sun,  4 Jan 2026 22:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C9B304BB8;
	Sun,  4 Jan 2026 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gScty2Ff"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB512820A4;
	Sun,  4 Jan 2026 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767564465; cv=none; b=rdVQCrfIebnfhOvwYUnOgEeVlBV45L2zHwbO1xOg9UWPP6OPZ5qXuv9kFxUy5+P30Voxk1bMhAsNdDiQ+0YiDs2qKgClyl7Cfc1+QoSYvAB50huimiWF7Sa3PABLn9/7/a/2KypUf3Iism/Jb4+HGeGVNLMEUgMs5KvcftP6/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767564465; c=relaxed/simple;
	bh=Ee42W97PW2cmqfwn1Sv3QlRj9Q5zCvDbUSuBQxv/Op0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8HLYx1cMog07vD01vHXdwUj3X2izcGioc9f5SKQh/C8I1Hub+vYP0RJ0dFxRKxIiQPwcG4lr0pSwdOCZiH+lIakQ/j04VG9RclpTr1/z/oGe/AoGWScdG41Mnnq0bI2VErkh4dOsIN+C5PmuAgzqfjOIu65LJ3LgcxrKlDtfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gScty2Ff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E756CC4CEF7;
	Sun,  4 Jan 2026 22:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767564464;
	bh=Ee42W97PW2cmqfwn1Sv3QlRj9Q5zCvDbUSuBQxv/Op0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gScty2FfULdESXHMa7hr8G8loXGEUlcQN5S80gDD5UqJ9suJ3KSg5EBnAfBmPbN4t
	 9i+loVAvbh0AVx5Yk4Koh1k8IXcYongXSPkBU/coQveXqy9HIob5+WjT9N8n85Gjtm
	 QC1qHBE6xVD7AdKk4C44SLTYTxRO2wXx2AsAtG8JDeEhyiIAC6f2WQDRBjpGsCOR0w
	 FS8iQ8IYIJkUJd7l21ONO+cGDEowjKvrtTSsbbdAQreKdAJdoXpAyGIgxSjm5iGWsN
	 P4fDUybYnndFC6q8lAflfYkDiUy/1o2TDN1ho6i4H4kKv0NoHgcQix3vta1Wo/qJz4
	 ESWpk4nesfdDw==
Date: Mon, 5 Jan 2026 00:07:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent of
 the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate
 initialization of nodes, zones and memory map)
Message-ID: <aVrkmnzgwM5i1VqX@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-23-rppt@kernel.org>
 <aVhN2NgQEKe0yzva@soda.int.kasm.eu>
 <aVll339wim7dCIaQ@kernel.org>
 <aVlwOyicOLPB9SOa@parmesan.int.kasm.eu>
 <aVpWpLV4Dut5Muo2@kernel.org>
 <aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk>

On Sun, Jan 04, 2026 at 08:56:45PM +0000, Russell King (Oracle) wrote:
> On Sun, Jan 04, 2026 at 02:01:40PM +0200, Mike Rapoport wrote:
> > From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> > From: Klara Modin <klarasmodin@gmail.com>
> > Date: Sat, 3 Jan 2026 20:40:09 +0200
> > Subject: [PATCH] arm: make initialization of zero page independent of the
> >  memory map
> > 
> > Unlike most architectures, arm keeps a struct page pointer to the
> > empty_zero_page and to initialize it requires conversion of a virtual
> > address to page which makes it necessary to have memory map initialized
> > before creating the empty_zero_page.
> > 
> > Make empty_zero_page a stataic array in BSS to decouple it's
> > initialization from the initialization of the memory map.
> 
> I see you haven't considered _why_ ARM does this.
> 
> You are getting rid of the flush_dcache_page() call, which ensures
> that the zeroed contents of the page are pushed out of the cache
> into memory. This is necessary.
> 
> BSS is very similar. It's memset() during the kernel boot _after_
> the caches are enabled. Without an explicit flush, nothing
> guarantees that those writes will be visible to userspace.

There's a call to flush_cache_all() paging_init()->devicemaps_init() that
will guarantee that those writes are flushed long before userspace starts.
 
> To me, this seems like a bad idea, which will cause userspace to
> break.
> 
> We need to call flush_dcache_page(), and _that_ requires a struct
> page.

Right now there's __flush_dcache_folio() that will break anyway when folio
divorces from struct page.   

-- 
Sincerely yours,
Mike.

