Return-Path: <linux-mips+bounces-12194-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04BC4DAB6
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 13:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA843189570C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 12:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB01358D04;
	Tue, 11 Nov 2025 12:27:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AC1358D29;
	Tue, 11 Nov 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864047; cv=none; b=fu7cubmooS0KLWV8hNaQNZkL7GWHh0RMCgBvox7Bf7P6BuQAVMhm2oJMphSh2E6Z554vXYJXJ0XhO1onfnSAhmj1VbLY577i6GEcLf3S7xJXBk0DKTY/l+t9Jj3DDkSt7xsYev+VdJuKazCfguxEHrZPBijE826o10vBS8RvbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864047; c=relaxed/simple;
	bh=zuaFHxQjmXEUb9VOlkPS8DlhHhSFK+myYBh+1TvFnfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6ZJtCC8/sp6udneWTvqEounpsYgxP2sKZ9+7wHFbRXmogj8UY2Q6VT7etB9jjwKdIkdoEZx8gQcaXAPTL5EXSt26MtCjLxP8fCDyEBCF1bPF4Cu/KsCgXdRLZuzBMB/9QQA1MK2P4I3kdWKqp7KnSVdCmmswen6ZnIF7NMLzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vInSx-0008Ky-00; Tue, 11 Nov 2025 13:27:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 46298C0591; Tue, 11 Nov 2025 13:27:06 +0100 (CET)
Date: Tue, 11 Nov 2025 13:27:06 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <aRMrmjJcLJYR8QO-@alpha.franken.de>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>

On Tue, Nov 11, 2025 at 06:21:46AM +0000, Maciej W. Rozycki wrote:
> Depending on the particular CPU implementation a TLB shutdown may occur 
> if multiple matching entries are detected upon the execution of a TLBP 
> or the TLBWI/TLBWR instructions.  Given that we don't know what entries 
> we have been handed we need to be very careful with the initial TLB 
> setup and avoid all these instructions.
> 
> Therefore read all the TLB entries one by one with the TLBR instruction, 
> bypassing the content addressing logic, and preinitialize the TLB using 
> addresses outside our usual unique range and avoiding clashes with any 
> incoming contents before making the usual call to local_flush_tlb_all().
> 
> This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB 
> entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual 
> address).
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> Cc: stable@vger.kernel.org # v6.17+
> ---
> Hi,
> 
>  I have verified this lightly, also with some diagnostics added so as to 
> make sure things get set up correctly, with my Malta/74Kf system for a 
> 32-bit configuration and with my SWARM/BCM1250 system for a 64-bit one.  
> Sadly the latter box does not finish booting either way, but it's to be 
> bisected separately.
> 
>  Can you please give it a try with your systems?

it's booting on my R4400 SGI Indy, but I see a lot of segmentation
faults during system start. If I comment out r4k_tlb_uniquify() every-
thing boots fine, which is kind of strange as there is a local_flush_tlb_all(),
which should leave the TLB in the same stage.... No idea why, yet.

>  arch/mips/mm/tlb-r4k.c |   92 +++++++++++++++++++++++++++++--------------------
>  1 file changed, 55 insertions(+), 37 deletions(-)
> 
> linux-mips-tlb-r4k-uniquify-fix.diff
> Index: linux-macro/arch/mips/mm/tlb-r4k.c
> ===================================================================
> --- linux-macro.orig/arch/mips/mm/tlb-r4k.c
> +++ linux-macro/arch/mips/mm/tlb-r4k.c
> @@ -15,6 +15,7 @@
>  #include <linux/mm.h>
>  #include <linux/hugetlb.h>
>  #include <linux/export.h>
> +#include <linux/sort.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/cpu-type.h>
> @@ -508,54 +509,70 @@ static int __init set_ntlb(char *str)
>  
>  __setup("ntlb=", set_ntlb);
>  
> -/* Initialise all TLB entries with unique values */
> +
> +/* Comparison function for EntryHi VPN fields.  */
> +static int r4k_vpn_cmp(const void *a, const void *b)
> +{
> +	return ((*(unsigned long *)a - *(unsigned long *)b) >>
> +		(sizeof(unsigned long) - sizeof(int)) * 8);
> +}
> +
> +/*
> + * Initialise all TLB entries with unique values that do not clash with
> + * what we have been handed over and what we'll be using ourselves.
> + */
>  static void r4k_tlb_uniquify(void)
>  {
> -	int entry = num_wired_entries();
> +	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
> +	int tlbsize = current_cpu_data.tlbsize;
> +	int start = num_wired_entries();
> +	unsigned long vpn_mask;
> +	int cnt, ent, idx, i;
> +
> +	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
> +	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
>  
>  	htw_stop();
> +
> +	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {

shouldn't we read all TLB entries here ? 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

