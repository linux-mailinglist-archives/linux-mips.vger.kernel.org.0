Return-Path: <linux-mips+bounces-12352-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE76C849D6
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 12:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FCE13AC2E6
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 11:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF360D271;
	Tue, 25 Nov 2025 11:01:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA12D877D;
	Tue, 25 Nov 2025 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068460; cv=none; b=Q2EZbxUBHcfho2QlkoxsIYWqulhULssOBZrYn098Kpo06HrFcnoiVrHJCW25mKscd9Oo3ZB83v4Zk6rYeyK++O4WD2vKUeJk+ZfII02bKgsfOciow3sLAKrcMPHE5v5EqkEl33lCXt+xs87N7bYg0grxCrKa1RLZoFGT6LlUgI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068460; c=relaxed/simple;
	bh=U7iSlsIGEKADKhAh0Kl8hngsMYHc//qA5d2tjzuCxhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRt4J5IBRV5XNXBD+a02HlFj+CX7OYMR+HS/+OeapjVn+x09WHAcRcZLZVtpNjPq/xufeaf4npAOwq3USKrh7A1sz0I5V3WKvePUNZdIB0xmJrMksmjNOw9bE4XK2YqeAw2LFz6CCvD8iU16hcBvebYW80+KfSu720QA3D0QfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vNqmy-0001ew-00; Tue, 25 Nov 2025 12:00:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EA479C0256; Tue, 25 Nov 2025 12:00:41 +0100 (CET)
Date: Tue, 25 Nov 2025 12:00:41 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS fixes for v6.18
Message-ID: <aSWMWVCXTV5Kl9eq@alpha.franken.de>
References: <aSIhefXIXrLpMaC5@alpha.franken.de>
 <87wm3f8mcb.fsf@BLaptop.bootlin.com>
 <aSTT0gbH-NkDOH8A@alpha.franken.de>
 <alpine.DEB.2.21.2511250512500.36486@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511250512500.36486@angie.orcam.me.uk>

On Tue, Nov 25, 2025 at 07:32:16AM +0000, Maciej W. Rozycki wrote:
> On Mon, 24 Nov 2025, Thomas Bogendoerfer wrote:
> 
> > > > Maciej W. Rozycki (2):
> > > >       MIPS: Malta: Fix !EVA SOC-it PCI MMIO
> > > >       MIPS: mm: Prevent a TLB shutdown on initial uniquification
> > > 
> > > Today, the kernel v6.18-rc7 no longer boots on EyeQ5 and EyeQ6H (MIPS
> > > I6500)-based boards. After a git bisect between v6.18-rc6 and v6.18-rc7,
> > > we found that the culprit is the commit "MIPS: mm: Prevent a TLB
> > > shutdown on initial uniquification".
> > > 
> > > Here is the log from a vanilla v6.18-rc7:
> > 
> > [..]
> > 
> > I guess your cores have more than 64 TLB entries. The Octeon CPU has
> > 256 entries... Patch below fixes the issue there.
> > 
> > Thomas.
> > 
> > >From b74abcb21103519ae48726c715d39a6aa3f57462 Mon Sep 17 00:00:00 2001
> > From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Date: Mon, 24 Nov 2025 22:46:43 +0100
> > Subject: [PATCH] MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
> > 
> > Latest MIPS cores could have much more than 64 TLB entries, therefore
> > allocate array for unification instead of placing a too small array
> > on stack.
> 
>  Thank you for chasing this up.
> 
>  Indeed, in the absence of a cross-reference from Config1.MMUSize in the 
> ISA manual I missed the somewhat recent addition of Config4.MMUSizeExt and 
> VTLB/FTLB MMU features I haven't dealt with before.  I've looked through 
> the relevant documents and ISTM there's nothing else needed here so let's 
> hope your fix covers it all.
> 
>  For the record, the I6500 has a documented TLB size of 16 VTLB + 512 FTLB 
> entries and the array needs to hold them all.  Though for VTLB/FTLB we 
> necessarily rely on the EntryHi.EHINV feature, which means we could skip 
> the call to `r4k_tlb_uniquify' altogether.  Something for a possible later 
> improvement, I suppose.
> 
> > diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> > index 3facf7cc6c7d..577055b50c41 100644
> > --- a/arch/mips/mm/tlb-r4k.c
> > +++ b/arch/mips/mm/tlb-r4k.c
> > @@ -524,15 +524,19 @@ static int r4k_vpn_cmp(const void *a, const void *b)
> >   */
> >  static void r4k_tlb_uniquify(void)
> >  {
> > -	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
> >  	int tlbsize = current_cpu_data.tlbsize;
> >  	int start = num_wired_entries();
> > +	unsigned long *tlb_vpns;
> >  	unsigned long vpn_mask;
> >  	int cnt, ent, idx, i;
> >  
> >  	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
> >  	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
> >  
> > +	tlb_vpns = kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
> > +	if (!tlb_vpns)
> > +		return; /* pray local_flush_tlb_all() is good enough */
> 
>  I can't say I'm particularly happy with this bail-out hack, but then I 
> have nothing better in my mind right now, so OK, but can you please make 
> the comment a proper sentence (starting with a capital letter and ending 
> with a full stop)?

I'll add a WARN_ON() to inform users about the issue, but as this is
pretty early during boot, I don't think anybody will see it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

