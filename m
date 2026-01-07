Return-Path: <linux-mips+bounces-12780-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E247CFD38E
	for <lists+linux-mips@lfdr.de>; Wed, 07 Jan 2026 11:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1EC4301A194
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jan 2026 10:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D75A2FC890;
	Wed,  7 Jan 2026 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG3UgZmi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419192DBF4B;
	Wed,  7 Jan 2026 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781244; cv=none; b=ohDY8wpreqv8XGJyVOw7crRkmGcacGRsi+znTE+3GZEwxBDjzfAEvxfQnqAdIxO2Ru4tthTml5Vb8Rxy+wqoqV08FDL7ZCaaUxYYjr4vzf2V/Pn0KBvnF5ywdcWHGav3wy5NbpJ85U6RftgwMX+CxaLKjbrkinQMVruaKIKbJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781244; c=relaxed/simple;
	bh=2N7QgaN9sMjltiFqaQG4UkyiWR5RDDQ2n4IgHLPouW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEyua+8T5cp4yjT5z4zsBQOsGjJIQKj+73aTCJ/yqN9jBkezrvLTBPUz2k7AVVbmS58tV2qBCAUMWZnbjFJOhdjAaH6hwqsttMofOP6b871+bmybV+iZcDnI+FAfAXuWD+zbuLfTbqKfVXKybwwMk5YdTmum/RMoj5FGyFUHZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG3UgZmi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F3C4CEF7;
	Wed,  7 Jan 2026 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767781243;
	bh=2N7QgaN9sMjltiFqaQG4UkyiWR5RDDQ2n4IgHLPouW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HG3UgZmir72YPYFm/emlV/3aORPdbjLAnBvpX04p5XtFP762LStn/wPAzNuqOQyK8
	 k7OnYBM5tMSwl6jbeHb8PLi19AGtC/53sTnfGuvHRwU1J5fTUCYLII+PuhChCRsuuP
	 lesNvqozgo8UJHTVTNpJsDervk1O2VsPtftbzvVYNlT5k9C+Ou7zoWZDNLa9w7OL7l
	 1I+dvThsPPRQrJPx2bNt/P7eQY786Hlh4y2DUZqzVomuI/Tc2vep7bqbTNymx1RDAb
	 W1AWrPHPHnhn5oDQwiHOAOhH7g90DnMJIt+6Fqkfre323p/NzMyoEh/2zKKa/f4rTg
	 6GL2C2ybj5rcA==
Date: Wed, 7 Jan 2026 12:20:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
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
Subject: Re: [PATCH v2 14/28] powerpc: introduce arch_zone_limits_init()
Message-ID: <aV4zZ8D5eaLC6K-w@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-15-rppt@kernel.org>
 <87ldia9he1.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldia9he1.ritesh.list@gmail.com>

Hi,

On Wed, Jan 07, 2026 at 09:57:34AM +0530, Ritesh Harjani wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Move calculations of zone limits to a dedicated arch_zone_limits_init()
> > function.
> >
> > Later MM core will use this function as an architecture specific callback
> > during nodes and zones initialization and thus there won't be a need to
> > call free_area_init() from every architecture.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index 3ddbfdbfa941..32c496bfab4f 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -221,13 +221,23 @@ static int __init mark_nonram_nosave(void)
> >   * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
> >   * ZONE_DMA.
> >   */
> > -static unsigned long max_zone_pfns[MAX_NR_ZONES];
> > +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> > +{
> > +#ifdef CONFIG_ZONE_DMA
> > +	max_zone_pfns[ZONE_DMA]	= min(zone_dma_limit, max_low_pfn - 1) + 1;
> 
> Hi Mike, 
> 
> This doesn't look correct. Isn't the zone_dma_limit value in bytes actually?
> Shouldn't it be -
> 
>      max_zone_pfns[ZONE_DMA] = min((zone_dma_limit >> PAGE_SHIFT) + 1, max_low_pfn);

You are right, I'll update it for v3. 
 
> -ritesh

-- 
Sincerely yours,
Mike.

