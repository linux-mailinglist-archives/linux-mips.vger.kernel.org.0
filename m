Return-Path: <linux-mips+bounces-12666-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F3CEDB0D
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 07:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D6933000B26
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 06:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166392C15BA;
	Fri,  2 Jan 2026 06:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JURDexdX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDB6186E58;
	Fri,  2 Jan 2026 06:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337176; cv=none; b=NyfnD/ybUBVsxCBV0lRVZ/AkY5fJ/uBL0wXiQ4utIXLmHQ3Ws1TAJz94MTSZAc0dEjRqFUp/86PU5U6NL84dGz+Ly8YB+xqriR6qHGP5Xar7ITi+lQkrej0oZaN05HLAK0G+Nd59YN+vcxaxDQLlForVNi0nDY4zPnTCvaKT2aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337176; c=relaxed/simple;
	bh=6UamW9ypeYvnLArvWXDR1zXy9G1XczNWSIs66XcI5UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JILajEJeZ35MRLyMg7Iw0q+IpK4NlAevAUYR+NtsUQHsxl5tORiTn6hhbxSBkuBqg0qGKIcwyXY9u7IwTHEmL3BzB7mLspJyK+U8mnn4ZyRITrANbJ7LTsH5OKh2cP6mc5dr7G0DnBZkdbDVoTtC1iLJBXqrDAT8Ygd/3FZWYLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JURDexdX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B4AC116B1;
	Fri,  2 Jan 2026 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337175;
	bh=6UamW9ypeYvnLArvWXDR1zXy9G1XczNWSIs66XcI5UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JURDexdXezRaYfVCWbUaXW3lzvXlm31RIqEgAxJWeFjD7mvppUL+nB5Q6DW/syoE7
	 9KCN3XX0+IFrZ6lXHKvj23Zbubf1juMpQoyVR3R5K+W0wTXoTePytdymIvKf7/FuUt
	 b7F7Op6aP4W0iuoMzjx2QqloKghcV05PUK7YhWlqmCDHRezSFJ5+E+XxOvd9U94KrO
	 yMpXKhnr9xm6zugptlmyDIWLkIzbYaeb0b/lyAP5EPPZjPoSkHAZCyI/7qGe07Bh3c
	 ZF/OMYqQXU+WaQeAzqytLFSZafleWXTxSNL1jQdGV6O5YweZiL0UFX3Jm+OycztA8g
	 kFuOhUi2qJ56g==
Date: Fri, 2 Jan 2026 08:59:12 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
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
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH 00/28] arch, mm: consolidate hugetlb early reservation
Message-ID: <aVdswNM9PUN6Kr8Q@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>

On Wed, Dec 31, 2025 at 05:27:14PM -0800, Andrew Morton wrote:
> On Sun, 28 Dec 2025 14:39:30 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > Order in which early memory reservation for hugetlb happens depends on
> > architecture, on configuration options and on command line parameters.
> > 
> > Some architectures rely on the core MM to call hugetlb_bootmem_alloc()
> > while others call it very early to allow pre-allocation of HVO-style
> > vmemmap.
> > 
> > When hugetlb_cma is supported by an architecture it is initialized during
> > setup_arch() and then later hugetlb_init code needs to understand did it
> > happen or not.
> > 
> > To make everything consistent and unified, both reservation of hugetlb
> > memory from bootmem and creation of CMA areas for hugetlb must be called
> > from core MM initialization and it would have been a simple change.
> > However, HVO-style pre-initialization ordering requirements slightly
> > complicate things and for HVO pre-init to work sparse and memory map should
> > be initialized after hugetlb reservations.
> > 
> > This required pulling out the call to free_area_init() out of setup_arch()
> > path and moving it MM initialization and this is what the first 23 patches
> > do.
> > 
> > These changes are deliberately split into per-arch patches that change how
> > the zone limits are calculated for each architecture and the patches 22 and
> > 23 just remove the calls to free_area_init() and sprase_init() from arch/*.
> > 
> > Patch 24 is a simple cleanup for MIPS.
> > 
> > Patches 25 and 26 actually consolidate hugetlb reservations and patches 27
> > and 28 perform some aftermath cleanups.
> 
> Thanks for the diligence - this can't have been the most exciting thing
> to work on!
> 
> > I tried to trim the distribution list and although it's still quite long
> > if you feel that someone was wrongly excluded please add them back.
> 
> I'll add these to mm.git's mm-new branch for some testing.  I'll
> suppress the usual email storm because 41 * 28 is a lot of emails ;)

kbuild reported failures on some configurations so I'm anyway going to send
a lot of emails for v2 :)

-- 
Sincerely yours,
Mike.

