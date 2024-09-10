Return-Path: <linux-mips+bounces-5497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9CE973791
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 14:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A491F26689
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50A2191F8C;
	Tue, 10 Sep 2024 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVZDJ3nl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EBF191F7B;
	Tue, 10 Sep 2024 12:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971823; cv=none; b=ZXS+Lx5rF1tzbsc1t1+Be5mvrQ0/OGBMtxFbjn92FFSfiAW1QL++PUVBSJhqIwSh5wdpIwUXP2rDHxvsEvCLvnFJVaTBG5LGc7faOfYgROak/tYGIHQAOJ1G1dQeznTTy2aPzQq6PlxgFn6s9rDRy2hQX8MRf5BxTZDJBZwDgP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971823; c=relaxed/simple;
	bh=3YBxnINn/t0lQcFrU81o08vn8d3pzQWi3VoH07aTmPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6UAXW+5i0yBKUath+0eun1OBJQBrH3IvYHFJ5pwglt7GRKHil+mMNk98daFv1k0vSD5KHTPMagbi9CD+eblFYIu3+nAfDlahFHE5UrHyLcu8YasG1zVzY35vez6GEFsuAIfWh7Fp7+1F31i+NoYbIkmM9Ymbnxal4291sO+Tp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVZDJ3nl; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5344ab30508so6017691e87.0;
        Tue, 10 Sep 2024 05:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725971820; x=1726576620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GfDwurtxEMjjQNq4SMlCCzib1zx52Gjtutww8fMlFNY=;
        b=ZVZDJ3nlbWuXbI/6lqSCh6CT08EvUxrrZtB3BKmqXN2w26M5M3RPZ1aTmZuZbdIhVC
         eWqVLZaK5BrCEDy5R20VTd6BzTXyJbyw4/rj4Y+FZIlYT1bFM4SgVxgDV+bQ/HJnBOqm
         7/WUkKjXFo8RMYWYYxyJWBups3ZV2w/788Fl8AfgvvV3sieaSLXyKu3WmGuu4hny5pRO
         3JF1RUUrC3k7ntPv8IhXcM+f4h3tGvHdlxAUbJRJOgPUGcX1771HaZKN852CJs+GyNU1
         dp+gpP4NxKMGXbBme9atPa1XTU+yu+mI+xnf+q5AEZ7bZa0kvtc7lCRoC4dO/2JWdEfR
         YBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971820; x=1726576620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfDwurtxEMjjQNq4SMlCCzib1zx52Gjtutww8fMlFNY=;
        b=c1zdElFDZzJ6g0uHtU9jWrGEA/Rr5pugI9Ud/cE/LPbZUJXEmWBqZZEgJSZljo6ZGX
         juN/Yi28mPQnoQcVPhhDwMLp6ermmJbiwNyqZz1A7dgSgHoUFLtLKgmid4zARja1pzRP
         79cXeLG55HAuEdZy/HOULcA5U8ayaCoMHg/QdXcnx6QlQirPU2K5HoLbG4CvfzKEn7MI
         n3eLzIh+AdwizdZ/qnREkKMbH10nnrOsO5WKMUn/D/XeN5YnkVeYpZAHZZLGWXCv7jE6
         5gLsC+hh298yCa7jFYXhYfiH55DyjCJVP35J8tMoUgUWirnQ4XSN2bpJmifEdGjnf9NR
         6ivg==
X-Forwarded-Encrypted: i=1; AJvYcCW/9NA9UH9TvniYVwQMNhOtDYC4rRkbb0BoHm61s/dPnY0dLmxAvlVHiIVdzd8HLPGUJneMnbn5H/6N@vger.kernel.org, AJvYcCW1pm/bLGjI/WZ14HsM3IcE+4K1pZRwu5j/cm22M/bSWntaQPYKUlCKNFrfJchooqpsQg+uZ1eKWoetPQ==@vger.kernel.org, AJvYcCW7bsg5t3csl+zzG87inwuL4P9Sfd/I0HDog+3qw4qKV1dXzWRBo1BPtE2e5Ci1P/KDNLTybx1nfi2NUzxy@vger.kernel.org
X-Gm-Message-State: AOJu0YymmR2Y3bozp3Mosc/r3j4rpK8hocAbifXnoJezUymU+sqfi9xH
	139rV7PFvDPZznLmU+0IOPn4fEtQqom2XVGziAGPKCOPuYP4HjCvLhweWg==
X-Google-Smtp-Source: AGHT+IGABtalMW6NjNIBosO4jGbAECXIzDFUD+8ZsQLiYbEkkK8hialMMjrCFPIp8uViNf8RYwgbcw==
X-Received: by 2002:a05:6512:2814:b0:52f:336:e846 with SMTP id 2adb3069b0e04-5366b933140mr911353e87.14.1725971819358;
        Tue, 10 Sep 2024 05:36:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d4d3sm1139438e87.270.2024.09.10.05.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:36:58 -0700 (PDT)
Date: Tue, 10 Sep 2024 15:36:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] MIPS: cm: Probe GCR address from DeviceTree
Message-ID: <ekvyyq3vzdbyi5suf4irfixyprvtko7rpkffwpc267kiex4ex2@lpu3ctysuviw>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>

Hi Jiaxun, Thomas

On Wed, Jun 12, 2024 at 11:08:58AM +0100, Jiaxun Yang wrote:
> Traditionally, CM GCR address can be probed from CP0_CMGCRBase.
> 
> However there are chips in wild that do have CM GCR but CP0_CMGCRBase
> is not available from CPU point of view. Thus we need to be able to
> probe GCR address from DeviceTree.
> 
> It is implemented as:
> - If only CP0_CMGCRBase present, trust CP0_CMGCRBase
> - If only mti,mips-cm node present, trust mti,mips-cm reg prop
> - If both present, remap address space to address specified in dt
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Fix build warning (test bot)
> ---
>  arch/mips/kernel/mips-cm.c | 61 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 55 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
> index dddc9428fe58..02afc795ba8a 100644
> --- a/arch/mips/kernel/mips-cm.c
> +++ b/arch/mips/kernel/mips-cm.c
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <linux/errno.h>
> +#include <linux/of_address.h>
> +#include <linux/of_fdt.h>
>  #include <linux/percpu.h>
>  #include <linux/spinlock.h>
>  
> @@ -179,23 +181,70 @@ static char *cm3_causes[32] = {
>  static DEFINE_PER_CPU_ALIGNED(spinlock_t, cm_core_lock);
>  static DEFINE_PER_CPU_ALIGNED(unsigned long, cm_core_lock_flags);
>  
> +static int __init mips_cm_fdt_scan(unsigned long node, const char *uname,
> +		int depth, void *data)
> +{
> +	u64 addr;
> +	unsigned long *cmgcr = data;
> +
> +	if (!of_flat_dt_is_compatible(node, "mti,mips-cm"))
> +		return 0;
> +
> +	addr = of_flat_dt_translate_address(node);
> +	if (addr == OF_BAD_ADDR || addr >= ULONG_MAX)
> +		*cmgcr = 0;
> +	else
> +		*cmgcr = addr;
> +
> +	return 0;
> +}
> +
>  phys_addr_t __init __weak mips_cm_phys_base(void)
>  {
> -	unsigned long cmgcr;
> +	unsigned long gcr_reg = 0, gcr_dt = 0;
> +
> +	if (of_have_populated_dt()) {
> +		int err;
> +		struct resource res;
> +		struct device_node *cm_node;
> +
> +		cm_node = of_find_compatible_node(of_root, NULL, "mti,mips-cm");
> +		if (cm_node) {
> +			err = of_address_to_resource(cm_node, 0, &res);
> +			of_node_put(cm_node);
> +			if (!err)
> +				gcr_dt = res.start;
> +		}
> +	} else {
> +		of_scan_flat_dt(mips_cm_fdt_scan, &gcr_dt);
> +	}
>  
>  	/* Check the CMGCRBase register is implemented */
>  	if (!(read_c0_config() & MIPS_CONF_M))
> -		return 0;
> +		return gcr_dt;
>  
>  	if (!(read_c0_config2() & MIPS_CONF_M))
> -		return 0;
> +		return gcr_dt;
>  
>  	if (!(read_c0_config3() & MIPS_CONF3_CMGCR))
> -		return 0;
> +		return gcr_dt;
>  
>  	/* Read the address from CMGCRBase */
> -	cmgcr = read_c0_cmgcrbase();
> -	return (cmgcr & MIPS_CMGCRF_BASE) << (36 - 32);
> +	gcr_reg = read_c0_cmgcrbase();
> +	gcr_reg = (gcr_reg & MIPS_CMGCRF_BASE) << (36 - 32);
> +
> +	/* If no of node, return straight away */
> +	if (!gcr_dt)
> +		return gcr_reg;
> +
> +	/* If the CMGCRBase mismatches with dt, remap it */
> +	if (gcr_reg != gcr_dt) {
> +		pr_info("Remapping CMGCRBase from 0x%08lx to 0x%08lx\n",
> +			gcr_reg, gcr_dt);

> +		change_gcr_base(CM_GCR_BASE_GCRBASE, gcr_dt);

This causes the kernel boot-up procedure to crash/hang-up because the
CM GCR base address is supposed to be redefined by means of the
already mapped CM GCR address space by accessing the
CM_GCR_BASE_GCRBASE register:
change_gcr_base()
+-> read_gcr_base()
    +-> addr_gcr_base()
        +-> return mips_gcr_base + CM_GCR_BASE_GCRBASE

By the time of the change_gcr_base() call in mips_cm_phys_base(), the
mips_gcr_base variable hasn't been defined. So the IO operations
performed in the change_gcr_base() method would be accessing the
NULL-based memory space. That's why the kernel crash/hanging-up.

In order to fix this we have to first map the CM GCR block at the
default base-address, then update the CM GCR-base CSR and after that
remap the CM GCR-space.

Please also note, the GCR_BASE field might be RO. It depends on the
IP-core configuration. So it's possible that the CM_GCR_BASE_GCRBASE
field update won't work. Although that will be detected a bit later in
the mips_cm_probe() method by comparing the address returned from
mips_cm_phys_base() and retrieved from the CM GCR-base CSR.

-Serge(y)

> +	}
> +
> +	return gcr_dt;
>  }
>  
>  phys_addr_t __init __weak mips_cm_l2sync_phys_base(void)
> 
> -- 
> 2.43.0
> 

