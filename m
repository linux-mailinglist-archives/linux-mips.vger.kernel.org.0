Return-Path: <linux-mips+bounces-12311-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A865AC73F24
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 13:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A2154E9071
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 12:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0751727D782;
	Thu, 20 Nov 2025 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gxwhsY5W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BE5FrwEb"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50552824A3;
	Thu, 20 Nov 2025 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641182; cv=none; b=lV+RNf3KHeU3LpJkYZDREgmi9lMmcBmms/PTbCSDofVPqcbZ0pWSEbukwi50oAok9wOG+E8vmCpKPaTaKBtViymumNInMuhLKbnQfE2RgjocCF/aB1nZd+Zo0m2QIDai/RLRGcpDKtMyT+fdhZvta8Zt67OFmTxLUSYPVP1vPT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641182; c=relaxed/simple;
	bh=3qjKWPkVGqM4izvTl9B7VvRuWueVAWmZ7SJ2GjEopFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD1LBF+HFqFPrgJggCSd++Tuv77o996k2VaO1RT9JMihe3/MM1R6p2u5cUbKwwyFB5s6i9c9fhUwzULmg75dL7s7s8bzoJV48BDkdRdJHYYqkj6Oh+j5/yHz/dznQ9mzKyjlbNw+wiNr0GMJmA/oedWcpHzmLu8v21vzyq4Ncfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gxwhsY5W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BE5FrwEb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 20 Nov 2025 13:19:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763641179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhs67YlvgSpAMgDGklAQ+v7NQItlYfu/qIzIce5l8/Y=;
	b=gxwhsY5Wzsp+JOuV1IIrFilKaFwT+ZIPQKIX9WpWXr+AZ6uVMFkqGoHGfgr2jdj43jzg2m
	AADZ+m1hdDGIvyfyC9+iSbHyc5Gvr6x9VrFI5tL7AagD/DTJ6AxnbCbcQbReHJ1cEhceo9
	yeRtG2WY2cwVdpJYsXshXqWmsrL6ZH9S8aTkCCDTCCvnpTXF+WxfEeyOZcpouev8b/Efd9
	g/Es4XzuKBhYwUm0hv7VtLtIRGW/3tVKQw8/FRMo+fPqZqYaY9yc7zRIyGhqrtIURKvaBZ
	D7dQHjcUE4RyQ6voaOIqnMud/R36rfz1y6PoiYBgrWSIsYhjRxDy5rxWJ+GP7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763641179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhs67YlvgSpAMgDGklAQ+v7NQItlYfu/qIzIce5l8/Y=;
	b=BE5FrwEbmx1ufDZcqJ0KKmMzgtC61+16YSnfbzCuesDAIh/ql68fnr35b9Drp5gczIOhv0
	b8QqCfSXlaWO9oCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: kernel: Fix random segmentation faults
Message-ID: <20251120131654-78e73c37-988f-4f58-aefc-ea6dacc11603@linutronix.de>
References: <20251120121030.28524-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120121030.28524-1-tsbogend@alpha.franken.de>

On Thu, Nov 20, 2025 at 01:10:29PM +0100, Thomas Bogendoerfer wrote:
> Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
> implementation") switches to a generic vdso storage, which increases
> the number of data pages from 1 to 4. But there is only one page
> reserved, which causes segementation faults depending where the VDSO
> area is randomized to. To fix this use the same size of reservation
> and allocation of the VDSO data pages.
> 
> Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")

Thanks!

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> v2: Don't reserve additionnal VDSO_NR_PAGES, but reserve VDSO_NR_PAGES
>     instead of the one page before.
>     Reworked description
> v1: https://lore.kernel.org/all/20251117191815.69556-1-tsbogend@alpha.franken.de/
> 
>  arch/mips/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index 29191fa1801e..a3101f2268c6 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -692,7 +692,7 @@ unsigned long mips_stack_top(void)
>  	/* Space for the VDSO, data page & GIC user page */
>  	if (current->thread.abi) {
>  		top -= PAGE_ALIGN(current->thread.abi->vdso->size);
> -		top -= PAGE_SIZE;
> +		top -= VDSO_NR_PAGES * PAGE_SIZE;
>  		top -= mips_gic_present() ? PAGE_SIZE : 0;
>  
>  		/* Space to randomize the VDSO base */
> -- 
> 2.43.0
> 

