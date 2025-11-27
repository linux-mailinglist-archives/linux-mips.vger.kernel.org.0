Return-Path: <linux-mips+bounces-12361-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D1C90579
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 00:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB903AA401
	for <lists+linux-mips@lfdr.de>; Thu, 27 Nov 2025 23:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F8B315D32;
	Thu, 27 Nov 2025 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWG0rOzc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA673161BC
	for <linux-mips@vger.kernel.org>; Thu, 27 Nov 2025 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764286057; cv=none; b=npZRFnXvOMrvoN1ajN8DqUMoMwYs1eA007elj66v+agXK0DE8BfZT/tvyi2BTB0+MQaaaBH4k/xYZqtq0IHDpASOKhJ4r8o3UxmT8zmbB0FL/g4aGunzAB8uTvyPiwtc2pXwa88YIeUqj954yTSuZKweaqKcjYjAz0hxVBf0F6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764286057; c=relaxed/simple;
	bh=hqYc3cFGHU/yBhGI7w+qQXYrWPzCAXIr35xYhLfrpng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5L1RXtPoNKrdcW3DxycsWS/m+JImcvBoru/Uh9VYRVShXqfFMO9T0lCfuGJ0b9gPjakB/xzqthCD4EAxWWb4i7LcwgBj2JwBdfW6vrYs9tKbUvdxNrBy0A2bdavQvRDB/oMOfuY4A+f69KxQX3YKhQi4AaUu9CmtLj3imnvFvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWG0rOzc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so2070654a12.2
        for <linux-mips@vger.kernel.org>; Thu, 27 Nov 2025 15:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764286054; x=1764890854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhnpSXeYoBgvp0CJbfUw9fPk/lRmn2yL5RV7cUlkoNw=;
        b=iWG0rOzcTApFV+Q1itFP+HwNlGGmYXPDVsZEZ5GEbWVvOfWVyZuJsi2K8rs0G5zVgt
         TLnMh0lfPs8MBl3eOineP3iENKOdtm7DKWchsbKUNPal10+My6LMs+xR1mfIkSRxAC8O
         joEYUGLynuJNhDYi7CoF0dQ7JDEPaNwaAP51iq2hsRNeZW7mYkQtEmB5QenoH2byUPVH
         4WN2uCLd2dRHZIXOdes5ZO87wLUiT9slgCpSekhmShUJojctCm0nsLJM+N5GrMUfJ+sT
         1Tiq4XHL9Rgp6ayWGMkzzCAxai9IAempSPMzlGp0Elyig1FnCVHcwsGTX/UuxuAjUSUk
         kAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764286054; x=1764890854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhnpSXeYoBgvp0CJbfUw9fPk/lRmn2yL5RV7cUlkoNw=;
        b=P25sFTKtYwP5LIF8RvnoyVImzKWFVvmLOr4FUoBS6sPPkAGte687EDx1z287qc0ST4
         n1Nkff1z8T2awHSQNyfHfNWCwxfD6KO2fDBTkInkeondSh6rLpQKyeXi9Zdydq4HsiVV
         oRSiWNp6WKQQ1DvBAWD6mgXclNWndRsVSPocCoSKnj4lvVI40omXg8kOkAJAcB2JDquD
         bBlcgg0MAdvKBx1/0qIDtggXz5C9o/FPlM8tUVYrBraKTAdOMXgL68MicLzEpRETedyy
         YzP7TWVR+1l8hqA4F6C+wOMBi+xJZtxnTo29YqVeRPEhU3HPtQxRb+xBuUJJxu1tRZJh
         bREw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QyD0SbW22pippO08Ih/elS2W5mAC14C49IW7Y3AqM1lLo+0WG2HKZ7YZn2wjgmWTLpYeRfHa2Bcu@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLKVdTfAGyWJ2liF6LaNrpY5KXL5+BNc6uqPCafb9uAQyz5nD
	UQDK7XLWf0pFDu5L3TIOD/xZ2SRuOhedz5MBXUGj7b4SXIeH5sdoBUox
X-Gm-Gg: ASbGnct27PkshH2gLbm6o8OSsxT9d29PRKcSbGh3l1YyOWLPinN5dpA+069pKtYxqME
	IanNk9SBAxbs4N1vfJl9DnJc/sRbpM5BTVmkF+4BO4ZQ9Pudt7oOeVzFF2ZO45ZV7Um50UGuRRX
	6n391Dt+QwIyAU1kA3awZRTGkSEACGlryZis2Q4l0+RtY0oqaJUGPKZDow4USRkC7Js6uKGQo99
	fADn8fURU1U9jV/4iSJLN1aueCXalIhwujovyEeJjSSQHj/cvL8CODgoohdB18QfZbcyk8lnP3D
	ZPePDWHZejJxUJTRC09BTmHT21dmvTYZ6/9HECspaRrKOPGuTlw7yCglPM85hglpwlQkNGya+Ry
	ZN0E+elMWIMo+/ei6q80fPP6D1a9NJm4KOLLfmufTyAXaCFNThyDnGm2fHNSAlwFbUrQJwrpScD
	kJYYmyVAS2dHfWXiND9vMnjHDY
X-Google-Smtp-Source: AGHT+IGyTBWjedow/WbhGjFFV/GGIo0xOMJNhvCHlfctcF8b0tgrIqn9/Uf3kwu6tFPfLf/O9x+p9g==
X-Received: by 2002:a05:6402:524c:b0:643:e2d:1d6c with SMTP id 4fb4d7f45d1cf-645eb213a59mr11090901a12.4.1764286053861;
        Thu, 27 Nov 2025 15:27:33 -0800 (PST)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm3169437a12.20.2025.11.27.15.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 15:27:33 -0800 (PST)
Date: Fri, 28 Nov 2025 00:27:32 +0100
From: Klara Modin <klarasmodin@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Bowler <nbowler@draconx.ca>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <umdusxatsxf5g7x4jhwvf75w3k2265x5dbg3w5wcdxikomjnk5@ver4ackawk2v>
References: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2fo5np5v7bgw2c27"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>


--2fo5np5v7bgw2c27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 2025-11-13 05:21:10 +0000, Maciej W. Rozycki wrote:
> Depending on the particular CPU implementation a TLB shutdown may occur 
> if multiple matching entries are detected upon the execution of a TLBP 
> or the TLBWI/TLBWR instructions.  Given that we don't know what entries 
> we have been handed we need to be very careful with the initial TLB 
> setup and avoid all these instructions.
> 
> Therefore read all the TLB entries one by one with the TLBR instruction, 
> bypassing the content addressing logic, and truncate any large pages in 
> place so as to avoid a case in the second step where an incoming entry 
> for a large page at a lower address overlaps with a replacement entry 
> chosen at another index.  Then preinitialize the TLB using addresses 
> outside our usual unique range and avoiding clashes with any entries 
> received, before making the usual call to local_flush_tlb_all().
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
>  On second thoughts I decided against including wired entries in our VPN 
> matching discovery for clash avoidance.  The reason is as I wrote before 
> it makes no sense to have wired entries for KSEG0 addresses, so it should 
> be safe to assume we won't ever make one, and then if a wired entry maps a 
> large page, which is quite likely, then our clash avoidance logic won't 
> handle an overlap where the two VPN values of a clashing pair don't match, 
> so it makes no sense to pretend we can handle wired entries with the code 
> as proposed.
> 
>  Pasting v2 discussion below verbatim as it still applies.
> 
>  Verified the same way as before, also with some diagnostics added so as 
> to make sure things get set up correctly, with my Malta/74Kf system for a 
> 32-bit configuration and with my SWARM/BCM1250 system for a 64-bit one.
> 
>  In addition to the Wired register setup discussed with v1 I have realised 
> the incoming entries may include large pages, possibly exceeding the size 
> of KSEG0 even.  Such entries may overlap with our temporary entries added 
> in the second step, so truncate any large pages in place as this ensures 
> no clash happens with the received contents of the TLB.
> 
>  NB this doesn't handle incoming PageGrain.ESP having been set, but it's 
> an unrelated preexisting issue that would have to be handled elsewhere.  
> Possibly it doesn't matter in reality.
> 
>  Additionally PageMask is left set at what has been retrieved from the 
> last incoming TLB entry in the first step and has to be reset to our page 
> size before proceeding with the second step.
> 
>  And last but not least the comparator function returned 0 incorrectly 
> when the difference between 64-bit elements was positive but with none of 
> the high-order 32 bits set.  Fixed with a branchless sequence of 3 machine 
> instructions, which I think is the minimum here (only the sign and zero 
> matter here, but this sequence actually produces -1/0/1, because why not).
> No change for the 32-bit case, the difference is returned as is.
> 
>   Maciej
> 
> Changes from v2 (at 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk/>):
> 
> - Revert the v2 update to include wired entries while reading original 
>   contents of TLB.
> 
> Changes from v1 (at 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk/>):
> 
> - Also include wired entries while reading original contents of TLB.
> 
> - Truncate any large pages in place while reading original TLB entries.
> 
> - Reset PageMask to PM_DEFAULT_MASK after reading in TLB entries.
> 
> - Fix the 64-bit case for the sort comparator.
> ---
>  arch/mips/mm/tlb-r4k.c |  100 ++++++++++++++++++++++++++++++-------------------
>  1 file changed, 63 insertions(+), 37 deletions(-)
> 
> linux-mips-tlb-r4k-uniquify-fix.diff
> Index: linux-swarm64/arch/mips/mm/tlb-r4k.c
> ===================================================================
> --- linux-swarm64.orig/arch/mips/mm/tlb-r4k.c
> +++ linux-swarm64/arch/mips/mm/tlb-r4k.c
> @@ -15,6 +15,7 @@
>  #include <linux/mm.h>
>  #include <linux/hugetlb.h>
>  #include <linux/export.h>
> +#include <linux/sort.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/cpu-type.h>
> @@ -508,54 +509,78 @@ static int __init set_ntlb(char *str)
>  
>  __setup("ntlb=", set_ntlb);
>  
> -/* Initialise all TLB entries with unique values */
> +
> +/* Comparison function for EntryHi VPN fields.  */
> +static int r4k_vpn_cmp(const void *a, const void *b)
> +{
> +	long v = *(unsigned long *)a - *(unsigned long *)b;
> +	int s = sizeof(long) > sizeof(int) ? sizeof(long) * 8 - 1: 0;
> +	return s ? (v != 0) | v >> s : v;
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

It seems that for my Edgerouter 6P (identifies itself as "CPU0 revision
is: 000d9602 (Cavium Octeon III)") current_cpu_data.tlbsize is larger
than 1 << MIPS_CONF1_TLBS_SIZE (256 rather than 64) and
num_wired_entries() returns 0 so the loop will overwrite part of the
stack and hangs the system.

If I increase the size to 256 that boots for me but the compiler
complains about the frame size being too large at 2064 bytes.

It seems the tlbsize is increased from 64 to 256 in the
MIPS_CONF4_MMUEXTDEF_MMUSIZEEXT case of decode_config4(), and according
to 1b362e3e350f ("MIPS: Decode c0_config4 for large TLBs.") that seems
to be expected.

Although it boots if I remove the call to r4k_tlb_uniquify(), I have run
into issues when enabling transparent hugepages and hugetlb in the past
but not sure if that's related to this, and I still seem to be able to
trigger that issue sometimes with this patch. Attaching the panic for
that just in case, though.

Regards,
Klara Modin

> +	unsigned long vpn_mask;
> +	int cnt, ent, idx, i;
> +
> +	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
> +	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
>  
>  	htw_stop();
> +
> +	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
> +		unsigned long vpn;
> +
> +		write_c0_index(i);
> +		mtc0_tlbr_hazard();
> +		tlb_read();
> +		tlb_read_hazard();
> +		vpn = read_c0_entryhi();
> +		vpn &= vpn_mask & PAGE_MASK;
> +		tlb_vpns[cnt] = vpn;
> +
> +		/* Prevent any large pages from overlapping regular ones.  */
> +		write_c0_pagemask(read_c0_pagemask() & PM_DEFAULT_MASK);
> +		mtc0_tlbw_hazard();
> +		tlb_write_indexed();
> +		tlbw_use_hazard();
> +	}
> +
> +	sort(tlb_vpns, cnt, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
> +
> +	write_c0_pagemask(PM_DEFAULT_MASK);
>  	write_c0_entrylo0(0);
>  	write_c0_entrylo1(0);
>  

...

--2fo5np5v7bgw2c27
Content-Type: application/gzip
Content-Disposition: attachment; filename="hugepage_panic_decoded.gz"
Content-Transfer-Encoding: base64

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

--2fo5np5v7bgw2c27--

