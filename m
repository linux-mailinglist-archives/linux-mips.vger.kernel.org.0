Return-Path: <linux-mips+bounces-7399-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35067A0A3B1
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AAA31685B0
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFC21A83E6;
	Sat, 11 Jan 2025 12:53:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9E11A2550;
	Sat, 11 Jan 2025 12:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736600029; cv=none; b=cki32iG04WDRatdw1oW106kYwJ2w9fd6yPaTkFTbB5Rd/xbDbruXAxBRKGXcZdNTAOBDu4+GAzLAwiVfMDvsxuphXGgQbOJH7JoEQnMYp881DCbux8SgnrEVhD/6iiujMJkMXZlKVi7t5Q+qFdiQQHbJ60hJ0fpSWj1UBv3FnSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736600029; c=relaxed/simple;
	bh=8ISbWYr7tnF59VVou7AT5BvE6+p4jAT9RETJVFNv5g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrWS77GEx69kNQnH++yEvNoJkSk8SlWptONIYRFzTJyciQeGZsI2KfAsAyPwbfVSPhrUZY/YJU+HO57QwjoL4gCqhEQzBwamEHJMbK2eDSC5JnRR8luGTVEzZwwJXSiCPB8jlImAkTBqQuyKO6OnNFL90F7VG7aCEMQgHW3b0oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRL-0006NY-00; Sat, 11 Jan 2025 13:18:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 03730C072D; Sat, 11 Jan 2025 13:04:00 +0100 (CET)
Date: Sat, 11 Jan 2025 13:03:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: liujing <liujing@cmss.chinamobile.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix the wrong format specifier
Message-ID: <Z4JeL9eqG2HEuZHW@alpha.franken.de>
References: <20241204092338.6356-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204092338.6356-1-liujing@cmss.chinamobile.com>

On Wed, Dec 04, 2024 at 05:23:38PM +0800, liujing wrote:
> Make a minor change to eliminate a static checker warning. The type
> of cpu is unsigned int, so the correct format specifier should be
> %u instead of %d.
> 
> Signed-off-by: liujing <liujing@cmss.chinamobile.com>
> 
> diff --git a/arch/mips/kernel/cevt-bcm1480.c b/arch/mips/kernel/cevt-bcm1480.c
> index d39a2963b451..2a14dc4ee57e 100644
> --- a/arch/mips/kernel/cevt-bcm1480.c
> +++ b/arch/mips/kernel/cevt-bcm1480.c
> @@ -103,7 +103,7 @@ void sb1480_clockevent_init(void)
>  
>  	BUG_ON(cpu > 3);	/* Only have 4 general purpose timers */
>  
> -	sprintf(name, "bcm1480-counter-%d", cpu);
> +	sprintf(name, "bcm1480-counter-%u", cpu);
>  	cd->name		= name;
>  	cd->features		= CLOCK_EVT_FEAT_PERIODIC |
>  				  CLOCK_EVT_FEAT_ONESHOT;
> -- 
> 2.27.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

