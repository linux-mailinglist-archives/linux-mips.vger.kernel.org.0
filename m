Return-Path: <linux-mips+bounces-351-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E557FCEE7
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 07:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 330271C209E4
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 06:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D04D514;
	Wed, 29 Nov 2023 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ua/fyBsY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D06B7473
	for <linux-mips@vger.kernel.org>; Wed, 29 Nov 2023 06:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0297C433C8;
	Wed, 29 Nov 2023 06:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701238455;
	bh=mbLTAPRYp1W0J/xE4UKIoyZfhh5JrrZ9nLLWrbqDiA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ua/fyBsYPFCKRU+n9gjojfDPPjZolZkL02LLa3ytNKIjFIkedHYw6ztgGaRgfSbQp
	 bd4jeL9XWjrHuz5oP2XwJOvq+/jaVEESUMnno0wWNxF/qWY+DKY3+OIjl2mzTAPhQC
	 BNo/MwzRd7g7F4Yj4R0sg28dD+532FAS/7fxleaiJK42hw8yaeWGFddIyb2p2RSdnw
	 tWscpglgRN2p1s4mjGQKCGgMq34Vw5CVS3itPdDAwP6OSxGl3bX0WPNsOvmuGUdjGu
	 wn92Acg55YqavKhcOdB7lQYkqGFFjVHIdQR5el2X/Jb+mYKiNtYPCue5w658OP2e8b
	 FGSihS5oElpnw==
Date: Wed, 29 Nov 2023 08:14:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] mm/mm_init.c: Extend init unavailable range doc info
Message-ID: <20231129061400.GK636165@kernel.org>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-6-fancer.lancer@gmail.com>
 <20231123101854.GF636165@kernel.org>
 <ehlzzv37o4exdn4smmu653wzjdotzdv3dhr3bduvemxssp37ro@sgegnyprquk4>
 <20231124081900.GG636165@kernel.org>
 <h3g6ynqem6h6hefmdawzaspvzf4u5fwfh7rken3ogy5ucr5z5t@d5gagi2ql4ee>
 <20231128071339.GJ636165@kernel.org>
 <z6r4jvuo63deg5ezzrxiewuzgdfwvcluzp45r4gmu7vwx6fmlm@d5r6phck2ovh>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z6r4jvuo63deg5ezzrxiewuzgdfwvcluzp45r4gmu7vwx6fmlm@d5r6phck2ovh>

On Tue, Nov 28, 2023 at 01:51:32PM +0300, Serge Semin wrote:
> On Tue, Nov 28, 2023 at 09:13:39AM +0200, Mike Rapoport wrote:
> > On Fri, Nov 24, 2023 at 02:18:44PM +0300, Serge Semin wrote:
> 
> > Do you mind posting your physical memory layout?
> 
> I actually already did in response to the last part of your previous
> message. You must have missed it. Here is the copy of the message:
 
Sorry, for some reason I didn't scroll down your previous mail :)

> > On Fri, Nov 24, 2023 at 02:18:44PM +0300, Serge Semin wrote:
> > > On Fri, Nov 24, 2023 at 10:19:00AM +0200, Mike Rapoport wrote:
> > > ...
> > > > 
> > > > My guess is that your system has a hole in the physical memory mappings and
> > > > with FLATMEM that hole will have essentially unused struct pages, which are
> > > > initialized by init_unavailable_range().  But from mm perspective this is
> > > > still a hole even though there's some MMIO ranges in that hole.
> > > 
> > > Absolutely right. Here is the physical memory layout in my system.
> > > 0     - 128MB: RAM
> > > 128MB - 512MB: Memory mapped IO
> > > 512MB - 768MB..8.256GB: RAM
> > > 
> > > > 
> > > > Now, if that hole is large you are wasting memory for unused memory map and
> > > > it maybe worth considering using SPARSEMEM.
> > > 
> > > Do you think it's worth to move to the sparse memory configuration in
> > > order to save the 384MB of mapping with the 16K page model? AFAIU flat
> > > memory config is more performant. Performance is critical on the most
> > > of the SoC applications especially when using the 10G ethernet or
> > > the high-speed PCIe devices.
> 
> Could you also answer to my question above regarding using the
> sparsemem instead on my hw memory layout?
 
Currently MIPS defines section size to 256MB, so with your memory layout
with SPARSMEM there will be two sections of 256MB, at 0 and at 512MB, so
you'll save memory map for 256M which is roughly 1M with 16k pages.

It's possible 

With SPARSEMEM the pfn_to_page() and page_to_pfn() are a bit longer in
terms of assembly instructions, but I really doubt you'll notice any
performance difference in real world applications.

> > With FLATMEM the memory map exists for that
> > hole and hence pfn_valid() returns 1 for the MMIO range as well. That makes
> > __update_cache() to check folio state and that check would fail if the memory
> > map contained garbage. But since the hole in the memory map is initialized
> > with init_unavailable_range() you get a valid struct page/struct folio and
> > everything is fine.
> 
> Right. That's what currently happens on MIPS32 and that's what I had
> to fix in the framework of this series by the next patch:
> Link: https://lore.kernel.org/linux-mips/20231122182419.30633-4-fancer.lancer@gmail.com/
> flatmem version of the pfn_valid() method has been broken due to
> max_mapnr being uninitialized before mem_init() is called. So
> init_unavailable_range() didn't initialize the pages on the early
> bootup stage. Thus afterwards, when max_mapnr has finally got a valid
> value any attempts to call the __update_cache() method on the MMIO
> memory hole caused the unaligned access crash.

The fix for max_mapnr makes pfn_valid()==1 for the entire memory map and
this fixes up the struct pages in the hole.
 
> > 
> > With that, the init_unavailable_range() docs need not mention IO space at
> > all, they should mention holes within FLATMEM memory map.
> 
> Ok. I'll resend the patch with mentioning flatmem holes instead of
> mentioning the IO-spaces.
> 
> > 
> > As for SPARSEMEM, if the hole does not belong to any section, pfn_valid()
> > will be false for it and __update_cache() won't try to access memory map.
> 
> Ah, I see. In case of the SPARSEMEM config an another version of
> pfn_valid() will be called. It's defined in the include/linux/mmzone.h
> header file. Right? If so then no problem there indeed.
 
Yes, SPARSMEM uses pfn_valid() defined in include/linux/mmzone.h

> -Serge(y)

-- 
Sincerely yours,
Mike.

