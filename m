Return-Path: <linux-mips+bounces-12353-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C7C85684
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 15:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD8203A6DA0
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD3A3246F0;
	Tue, 25 Nov 2025 14:25:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BF223D281;
	Tue, 25 Nov 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080732; cv=none; b=KBlbau2RZcE4GyBOmaS3OP+CMzhS64wg2pqXmaXLEhiqYl/vXdzQHPPSBFqVlk3YeMBXx14UAs76GwNVWzA+JcNSIbsLwjC0B5WKdwPSqVzFkmBEUg7eiIacACs6gzMG70upZlyPCqW4PcvPDxsLAUCu4nYM81NTQ5NaXInch/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080732; c=relaxed/simple;
	bh=FkcabtGBFFZhgWI0O4iJMBivqs5C2zApAG0MK7Mixqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mmg1tpIP7gY2bLttEjJFwdwh5fiqsapLuom0GDYbmFbTm3FZYwlo9Zt60QQym9C1F9zHkYkSwB9ph94lC+VnlanBcTmc6e/9Dy3evedci0DmegSQAnevWO2mJ4M927fnxt2SE+C0xHGV8v81oqPpQg+etmlhp7ZJJLIJvBkwSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8933592009E; Tue, 25 Nov 2025 15:25:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8339692009D;
	Tue, 25 Nov 2025 14:25:26 +0000 (GMT)
Date: Tue, 25 Nov 2025 14:25:26 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS fixes for v6.18
In-Reply-To: <aSWMWVCXTV5Kl9eq@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511251404510.36486@angie.orcam.me.uk>
References: <aSIhefXIXrLpMaC5@alpha.franken.de> <87wm3f8mcb.fsf@BLaptop.bootlin.com> <aSTT0gbH-NkDOH8A@alpha.franken.de> <alpine.DEB.2.21.2511250512500.36486@angie.orcam.me.uk> <aSWMWVCXTV5Kl9eq@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Nov 2025, Thomas Bogendoerfer wrote:

> > > diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> > > index 3facf7cc6c7d..577055b50c41 100644
> > > --- a/arch/mips/mm/tlb-r4k.c
> > > +++ b/arch/mips/mm/tlb-r4k.c
> > > @@ -524,15 +524,19 @@ static int r4k_vpn_cmp(const void *a, const void *b)
> > >   */
> > >  static void r4k_tlb_uniquify(void)
> > >  {
> > > -	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
> > >  	int tlbsize = current_cpu_data.tlbsize;
> > >  	int start = num_wired_entries();
> > > +	unsigned long *tlb_vpns;
> > >  	unsigned long vpn_mask;
> > >  	int cnt, ent, idx, i;
> > >  
> > >  	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
> > >  	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
> > >  
> > > +	tlb_vpns = kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
> > > +	if (!tlb_vpns)
> > > +		return; /* pray local_flush_tlb_all() is good enough */
> > 
> >  I can't say I'm particularly happy with this bail-out hack, but then I 
> > have nothing better in my mind right now, so OK, but can you please make 
> > the comment a proper sentence (starting with a capital letter and ending 
> > with a full stop)?
> 
> I'll add a WARN_ON() to inform users about the issue, but as this is
> pretty early during boot, I don't think anybody will see it.

 Umm, `kmalloc' by default warns about allocation failures anyway and if 
it does cause a hang or crash as seen with these reports, it should be 
hard to miss.

 Then it seems unlikely enough an allocation will fail of say 4KiB for a 
very large TLB to add any special handling for it given that the vast 
majority of systems seems not to need this TLB preinitialisation in most 
cases.  It just feels odd to me.

  Maciej

