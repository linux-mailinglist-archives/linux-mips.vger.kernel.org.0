Return-Path: <linux-mips+bounces-12372-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A679EC91FD8
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 13:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AFC3A6616
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 12:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB57308F05;
	Fri, 28 Nov 2025 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U77aaX9r"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB11307AFC
	for <linux-mips@vger.kernel.org>; Fri, 28 Nov 2025 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764333038; cv=none; b=K4hpyBMy0dy5KxuRt/cawije4YsjUoFrD4NzkORiiqPyulZjlJSygcKGttBGbsYjOJQsSoqRg3FlTNbPWDOwOWYd3ys93asR+8WbIlGbbrOIapn/POwzmRTlypXmFR+Jq7Qw/dFX74rRw6z4uvUe1DkZZI1Xx5LjKUy81fvEPaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764333038; c=relaxed/simple;
	bh=RCpVfMY8YflDYhOsUSueMZU3u8sOaYoM3qPlXi+Xo84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BroKZxUiLDj4lw1e5L9ZAkcHIrvRqo6vJ4DvOi1lluZjSxt+OVTrbHKM6UWPO6TE8yLK8dzJxQD7oVXVaYJWI5/waX8hvVxw7BC+omDe9O95GJTs1vSKMmLazGvl2OBaFgPah/4Zqz1U5KH7blpwjDMTbTIsqLv5wFB0jzSA/qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U77aaX9r; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso17757301fa.3
        for <linux-mips@vger.kernel.org>; Fri, 28 Nov 2025 04:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764333034; x=1764937834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8nYzcCrGhibFceNd5SP4Weut9QAWRWU6RVQAH3PTrI=;
        b=U77aaX9rdkCtWQdFajA1d2ouw5vga7PhqgMRkYL4NDipl9WPlJ5LZAjo+UPTvD9j1V
         ZjqgtvcijN+gkbOtMKhU0rA+fnzrUamYd+A3uwW/eD9zksbCJ+frDLjm/UIbURrs493d
         cpmWve23o5F4j1V5GbUa6uCRArI4Jjuggcxty7fuXH0nbHBjz1jd6dUK3qBHhgw04x/3
         851b+EUG4+ismThwjOa63rqhJ1/rqECbOdse+p0PVShodaLcV6uyOKUHDMJcFsZrZ7Cp
         M3GmrV00rBLlYJ0VELTbHwyjPkOoR6W1vR8eHzkJVFdoeEEgqKeneBXKF1cEpTZwTRaB
         Rh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764333034; x=1764937834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8nYzcCrGhibFceNd5SP4Weut9QAWRWU6RVQAH3PTrI=;
        b=hxrmG4ekCwMPIp9Q9UgpAS37TdJeO7M/lhA31MYQXK/KohxYnKGrIzMTCqAbWQomNB
         YzqsoVtklNy2QscwWThtOAf94XEh9yzrehiXYNRDU1ixNd1PDW9mbnn853lBqGYV6E/d
         YaaXHL80d2vDya1/LEdslKm9Z8eYHogXJDPQD8hQa1gRiS6ipStuOTvEwMYobglu+brP
         snn5H+1wuXvyvzG4Tn7peRWewgELuXeu+1wjRcj4W7CKo3AFRW54Qa2eajvTaGuM9plu
         Invg0VTeEQCRF1XwW/BQJWZC09oDP4r/I5ZQzMM3Rzr3y8/N+pkSzsLWRNchVi2djjWk
         Jyxw==
X-Forwarded-Encrypted: i=1; AJvYcCW1/khRXSTupyWU/pa9mkldfMpzXsBQ5tZfzJ7Vn0tFdOw6itMCFrmP0ZrYkQKJQ3D9XNoC5kQ4NZFT@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxsXVlz9N2jC6Re+5Pwcqn86SWf8pLI198wEixGYVe53bL6Ph
	lUfAMb6hoaW2vZoChAyQttXQ/Xcwgq1E2jyljBM0X8pFGM0lGiuQiN5Z
X-Gm-Gg: ASbGncu8/Pua79qaIVt1dNwL/+MHhHjofqVeChPgRhwFiBjsT3jnl2BzVn3te2snNzP
	am1SsMenhV38QatWRk1Hu/GnKG7RuisEoEzwTeIes1i4wDUhOTo8Qg430CNZkNH+Hj3Q7HM7P3Y
	L1UkudAs9d8PpTRW6gxUeSpdGaMKG14sV4Le7muD/PmSzWkPycLsQR6Fq6ookuYmw3obQKPSDRp
	I2YjbAWXxEfpI5tCgKG3tWv5bmDFsEgtV6Hwv6MT6O0LJfPSdJH6NtQUb8LZjgVE3n3KPdlg3f6
	fMD9SV58ztOpjPPk2ybhQCd+8UtiOGoBQLXQ1U0G0aJ6VbYC5CeWbW6yXDsvxUptnfUaewlBbi4
	sCKJLyzwBGix/bRDbHsNZEQQIwgDjDUgcCnoCxiMCAnTwZBMArFiKAoHpoPr+n9x04xGemeq1Pf
	ZwOzacvFBfbg==
X-Google-Smtp-Source: AGHT+IHYWZuzVkc+leDJVQjXukjvJyxtfj1YYfjAId2NY7k2YHCNmlZzXXXZ+oM5h7CaXHXC/ycd+g==
X-Received: by 2002:a2e:2e0d:0:b0:37a:600e:ca52 with SMTP id 38308e7fff4ca-37d078b45femr31642831fa.23.1764333033950;
        Fri, 28 Nov 2025 04:30:33 -0800 (PST)
Received: from localhost ([2001:6b0:1:1041:f9b4:5409:8dcc:9750])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2368e40csm9128751fa.5.2025.11.28.04.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 04:30:33 -0800 (PST)
Date: Fri, 28 Nov 2025 13:30:34 +0100
From: Klara Modin <klarasmodin@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
Message-ID: <6sfwzx2nryk22qjfdjocnail3sxdl7srxq6kyzv6fb3eswvkaq@r3fdeunuytrl>
References: <alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk>

Hi,

On 2025-11-28 05:53:42 +0000, Maciej W. Rozycki wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+ 
> cores can have more than 64 TLB entries.  Therefore allocate an array 
> for uniquification instead of placing too small an array on the stack.
> 
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> Co-developed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: stable@vger.kernel.org # v6.17+: 9f048fa48740: MIPS: mm: Prevent a TLB shutdown on initial uniquification
> Cc: stable@vger.kernel.org # v6.17+

This fixes a boot failure on my Edgerouter 6P (Cavium Octeon III).

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

> ---
>  Verified with Malta/74Kf and Malta/interAptiv for initial and secondary 
> CPU bootstrap.  The PM path hasn't been covered, but is expected to be 
> the same as secondary CPU bootstrap.
> 
>  NB Malta/interAptiv has issues later on in SMP boot (boots fine UP) and 
> hangs with repeated:
> 
> irq 23: nobody cared (try booting with the "irqpoll" option)
> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.18.0-rc1-dirty #2 NONE
> 
> messages (for the CP0 timer interrupt AFAICT; GIC timer is supposed to 
> be used instead).  This will have to be bisected.
> 
> Changes from v3:
> 
> - Rearrange tags including stable backport ones so as to pick the original 
>   change together with this fix only.
> 
> Changes from v2:
> 
> - Use the bootmem allocator for early calls (CPU #0 bootstrap).
> 
> - Update the change description; mark for stable backporting.
> ---
>  arch/mips/mm/tlb-r4k.c |   16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> linux-mips-tlb-r4k-uniquify-tlbsize.diff
> Index: linux-macro/arch/mips/mm/tlb-r4k.c
> ===================================================================
> --- linux-macro.orig/arch/mips/mm/tlb-r4k.c
> +++ linux-macro/arch/mips/mm/tlb-r4k.c
> @@ -12,6 +12,7 @@
>  #include <linux/init.h>
>  #include <linux/sched.h>
>  #include <linux/smp.h>
> +#include <linux/memblock.h>
>  #include <linux/mm.h>
>  #include <linux/hugetlb.h>
>  #include <linux/export.h>
> @@ -524,15 +525,24 @@ static int r4k_vpn_cmp(const void *a, co
>   */
>  static void r4k_tlb_uniquify(void)
>  {
> -	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
>  	int tlbsize = current_cpu_data.tlbsize;
> +	bool use_slab = slab_is_available();
>  	int start = num_wired_entries();
> +	phys_addr_t tlb_vpn_size;
> +	unsigned long *tlb_vpns;
>  	unsigned long vpn_mask;
>  	int cnt, ent, idx, i;
>  
>  	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
>  	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
>  
> +	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
> +	tlb_vpns = (use_slab ?
> +		    kmalloc(tlb_vpn_size, GFP_KERNEL) :
> +		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
> +	if (WARN_ON(!tlb_vpns))
> +		return; /* Pray local_flush_tlb_all() is good enough. */
> +
>  	htw_stop();
>  
>  	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
> @@ -585,6 +595,10 @@ static void r4k_tlb_uniquify(void)
>  	tlbw_use_hazard();
>  	htw_start();
>  	flush_micro_tlb();
> +	if (use_slab)
> +		kfree(tlb_vpns);
> +	else
> +		memblock_free(tlb_vpns, tlb_vpn_size);
>  }
>  
>  /*

