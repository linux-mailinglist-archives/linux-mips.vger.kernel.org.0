Return-Path: <linux-mips+bounces-4949-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62299568B3
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 12:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 548A5B22D21
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 10:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74D11607BD;
	Mon, 19 Aug 2024 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqvG0/va"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EC915F323;
	Mon, 19 Aug 2024 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724064172; cv=none; b=t++Ao4fxMl1bgneUF0IXGdTK+PkUi/um0MKjIg+WhA1DNqaHr/V53ZSRz015YDDLtHj2aCOYg1q00uYQbE2KqR9L3YyrAxxX/ug+zJpRwpzEjsseFP0m4j7S7uhXSE1XdpZ73l3OCspszhWY16emD5lH1mOH1DP/Fd34bbsHFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724064172; c=relaxed/simple;
	bh=oIaCox6bIms0FlesGQEQV7cxexdJ9wY8BmeMBWUVSTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx7OhMYWteIeKF30QLtrNAGo2cep7ddIHaMmMsRYzTwXJsb+/bOZgfBbMl7YKRSo44mnEu4CRsXgqSHStibUJp5CqW9wQYnQ5QdZHWC84Za7H0h5Sxr+nrf6xzYdlbwlkYnY97i+i5MU+NcNaCY5YWyivG9f1b0P/ygujcHvYDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqvG0/va; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f15790b472so52268721fa.0;
        Mon, 19 Aug 2024 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724064169; x=1724668969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URtxqs+sTJ/MixcFV35CJtFCUUWKl+ehBEcTOR3I+mE=;
        b=JqvG0/vaU7D2eJIp5UNS5T9e2ALHuSBWDLus16Yb4A7NPtnhWP9UvKvyJlX23CcPwM
         Wenm0+/kXCzS0AbVYMANkVZj4svSyp89jb2LCBWTBnjzAitsrSSa+d4Fcut3/4TvcFHX
         4D7AyNW5FVM6FHzUpl8JnuhSrvkQbTLtJIumGoSAAGt2xW0Ib+XbficHAgTssUXayAWK
         FxZ6gHz3cjHkbcINyYSqAYikNPZZr2h3PVvqxR7fuwIJMqpHSEne5W7OmwglCIeSWhPR
         w2P+wSbMHiI1ua7z2QxgCoXAxyHOqZ8UYAhkAn34HFboNc24/j/fp9hkHQ1Hm9XRUWy2
         3F7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724064169; x=1724668969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URtxqs+sTJ/MixcFV35CJtFCUUWKl+ehBEcTOR3I+mE=;
        b=TApdA9+zSzUFTbOle82RfvTiC7bBu2E1M5WoIspr8NkKy1Z2vOjPZcXi/wya3C/aPD
         YUncYNBw2+VdsQ9isWFull9qs1uAhqRnY4R9wzab13ue33vcxLtRkDV2a89j2TSelmog
         R+PEHFhiCFdpj+Ej0+ue39v5GY8mWX/j9m1nGzpmn72T4gJBCM8YrO5Zucel0JCq5wIB
         9WXGw4x+ihdd3HkeY2GBIHpREH1WOFS9sLS8nZgj74FQ0uFLYZwApFHXKMzEO5mTVurn
         CnmQj6/kprh6qNwfoNf1E9stxUQ6IhXhf/s1Hrpe+RRCP2PQWrHQQkGIDq3MQFdV4aS+
         xxmg==
X-Forwarded-Encrypted: i=1; AJvYcCWeMLhhBsIUO/ne/8mwCYzyIY4I9k39CpMTpDNtnfAb49X9rIJOlaVwkGB96dd7WekBG8zaDvQFc5+To8uF0BmVf1AZ8eKk+PBMC+TsiTlz3Zn5WBsAiq+OtYpBGqn21ycrnisoc62Gsg==
X-Gm-Message-State: AOJu0YwnhjOQKyqAHj1nZrzGM97wG/RADfK3vXryc9HL7OgLc4TlgavM
	n0gSYOcCgRVgRZ/zfdB69gcQUK0hu4ttolcx0FfSAz2a68d+Rwve
X-Google-Smtp-Source: AGHT+IEYIdpLj9BzzbNsUHrNVZZZb01mFRKU4uASUS1l4Ib/srnfOvu5RgJ59mE+CmHulDDsFrl5uA==
X-Received: by 2002:a2e:81a:0:b0:2ec:6639:120a with SMTP id 38308e7fff4ca-2f3be578690mr67491071fa.10.1724064168467;
        Mon, 19 Aug 2024 03:42:48 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b746cd25sm15071701fa.9.2024.08.19.03.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:42:48 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:42:45 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: cevt-r4k: Don't call get_c0_compare_int if timer
 irq is installed
Message-ID: <cfjhzqiurzhony75oi6owkifzrvtqj32wfizry5ntqrqborah5@v6qgmujo25va>
References: <20240813-get_c0_compare_int-v1-1-a0a1b007d736@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-get_c0_compare_int-v1-1-a0a1b007d736@flygoat.com>

Hi Jiaxun

On Tue, Aug 13, 2024 at 10:59:08AM +0100, Jiaxun Yang wrote:
> This avoids warning:
> 
> [    0.118053] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
> 
> Caused by get_c0_compare_int on secondary CPU.
> 
> We also skipped saving IRQ number to struct clock_event_device *cd as
> it's never used by clockevent core, as per comments it's only meant
> for "non CPU local devices".
> 
> Reported-by: Serge Semin <fancer.lancer@gmail.com>
> Closes: https://lore.kernel.org/linux-mips/6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

The solution works well for me. Thanks!

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  arch/mips/kernel/cevt-r4k.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 368e8475870f..5f6e9e2ebbdb 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -303,13 +303,6 @@ int r4k_clockevent_init(void)
>  	if (!c0_compare_int_usable())
>  		return -ENXIO;
>  
> -	/*
> -	 * With vectored interrupts things are getting platform specific.
> -	 * get_c0_compare_int is a hook to allow a platform to return the
> -	 * interrupt number of its liking.
> -	 */
> -	irq = get_c0_compare_int();
> -
>  	cd = &per_cpu(mips_clockevent_device, cpu);
>  
>  	cd->name		= "MIPS";
> @@ -320,7 +313,6 @@ int r4k_clockevent_init(void)
>  	min_delta		= calculate_min_delta();
>  
>  	cd->rating		= 300;
> -	cd->irq			= irq;
>  	cd->cpumask		= cpumask_of(cpu);
>  	cd->set_next_event	= mips_next_event;
>  	cd->event_handler	= mips_event_handler;
> @@ -332,6 +324,13 @@ int r4k_clockevent_init(void)
>  
>  	cp0_timer_irq_installed = 1;
>  
> +	/*
> +	 * With vectored interrupts things are getting platform specific.
> +	 * get_c0_compare_int is a hook to allow a platform to return the
> +	 * interrupt number of its liking.
> +	 */
> +	irq = get_c0_compare_int();
> +
>  	if (request_irq(irq, c0_compare_interrupt, flags, "timer",
>  			c0_compare_interrupt))
>  		pr_err("Failed to request irq %d (timer)\n", irq);
> 
> ---
> base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
> change-id: 20240812-get_c0_compare_int-66935853a308
> 
> Best regards,
> -- 
> Jiaxun Yang <jiaxun.yang@flygoat.com>
> 

