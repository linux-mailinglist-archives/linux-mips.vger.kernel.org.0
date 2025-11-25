Return-Path: <linux-mips+bounces-12347-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B4C83BB9
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 08:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F17F64E20C6
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 07:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B43C19F48D;
	Tue, 25 Nov 2025 07:32:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E441513790B;
	Tue, 25 Nov 2025 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764055942; cv=none; b=lFq7NyuXRchUBKzT1Y9oWpFr3+OKgvwOqFCGKsE44OYs1cx+0IkWuP8ymNNGKkDwKQg1IIsnbGfTyjv77GgsONbwLaAfQiiZjDjCEyZnoSfNXtM+g0/4oLyD/9svZLFHbO6KdeVtAvhUqudlLeN7f9oHrDS1nbi9iyr0b7qBMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764055942; c=relaxed/simple;
	bh=tiZuIg9qyxJ02uuGM/KdVcnoiYCtLE4LBFPzh2mPdK4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JIVJJ5D2Id6plrozTGgKw3sNo7rjpk6UhoP75JwFbP8XTgBYp8Efl1XGqyTMwwLCZiZnmPR7uafJBFY4H/WQ+N7WVtsil3ScfdJHAlxmValWo0rO3B9eS6YjHaPuuPg9WcxaTuo1rKKCMiRV8GhjK11umx8bTep7KqYug89yAfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5972092009E; Tue, 25 Nov 2025 08:32:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 53BF892009C;
	Tue, 25 Nov 2025 07:32:16 +0000 (GMT)
Date: Tue, 25 Nov 2025 07:32:16 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    torvalds@linux-foundation.org, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS fixes for v6.18
In-Reply-To: <aSTT0gbH-NkDOH8A@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511250512500.36486@angie.orcam.me.uk>
References: <aSIhefXIXrLpMaC5@alpha.franken.de> <87wm3f8mcb.fsf@BLaptop.bootlin.com> <aSTT0gbH-NkDOH8A@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Nov 2025, Thomas Bogendoerfer wrote:

> > > Maciej W. Rozycki (2):
> > >       MIPS: Malta: Fix !EVA SOC-it PCI MMIO
> > >       MIPS: mm: Prevent a TLB shutdown on initial uniquification
> > 
> > Today, the kernel v6.18-rc7 no longer boots on EyeQ5 and EyeQ6H (MIPS
> > I6500)-based boards. After a git bisect between v6.18-rc6 and v6.18-rc7,
> > we found that the culprit is the commit "MIPS: mm: Prevent a TLB
> > shutdown on initial uniquification".
> > 
> > Here is the log from a vanilla v6.18-rc7:
> 
> [..]
> 
> I guess your cores have more than 64 TLB entries. The Octeon CPU has
> 256 entries... Patch below fixes the issue there.
> 
> Thomas.
> 
> >From b74abcb21103519ae48726c715d39a6aa3f57462 Mon Sep 17 00:00:00 2001
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Date: Mon, 24 Nov 2025 22:46:43 +0100
> Subject: [PATCH] MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
> 
> Latest MIPS cores could have much more than 64 TLB entries, therefore
> allocate array for unification instead of placing a too small array
> on stack.

 Thank you for chasing this up.

 Indeed, in the absence of a cross-reference from Config1.MMUSize in the 
ISA manual I missed the somewhat recent addition of Config4.MMUSizeExt and 
VTLB/FTLB MMU features I haven't dealt with before.  I've looked through 
the relevant documents and ISTM there's nothing else needed here so let's 
hope your fix covers it all.

 For the record, the I6500 has a documented TLB size of 16 VTLB + 512 FTLB 
entries and the array needs to hold them all.  Though for VTLB/FTLB we 
necessarily rely on the EntryHi.EHINV feature, which means we could skip 
the call to `r4k_tlb_uniquify' altogether.  Something for a possible later 
improvement, I suppose.

> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> index 3facf7cc6c7d..577055b50c41 100644
> --- a/arch/mips/mm/tlb-r4k.c
> +++ b/arch/mips/mm/tlb-r4k.c
> @@ -524,15 +524,19 @@ static int r4k_vpn_cmp(const void *a, const void *b)
>   */
>  static void r4k_tlb_uniquify(void)
>  {
> -	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
>  	int tlbsize = current_cpu_data.tlbsize;
>  	int start = num_wired_entries();
> +	unsigned long *tlb_vpns;
>  	unsigned long vpn_mask;
>  	int cnt, ent, idx, i;
>  
>  	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
>  	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
>  
> +	tlb_vpns = kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
> +	if (!tlb_vpns)
> +		return; /* pray local_flush_tlb_all() is good enough */

 I can't say I'm particularly happy with this bail-out hack, but then I 
have nothing better in my mind right now, so OK, but can you please make 
the comment a proper sentence (starting with a capital letter and ending 
with a full stop)?

  Maciej

