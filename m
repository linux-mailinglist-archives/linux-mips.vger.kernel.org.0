Return-Path: <linux-mips+bounces-9842-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D4B07CBC
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 20:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 767C51AA7906
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 18:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0C32BD023;
	Wed, 16 Jul 2025 18:21:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2342BDC11;
	Wed, 16 Jul 2025 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690115; cv=none; b=B4UoAQIPrO9/S+GJQArTW40QTXkS77L5mGkTY+3Rq+mK4IwdzAl5OYlDiWm7OG96/C8SX5ebdvBrrn2gdajhgU0OSg+Dp6Q0Gs1UpaMqDv0kB8mqWipkZ+RQSAFPKpKhADy06H4yotXQDvqkkmANX4mknzHgVBzjtRpNlmDTD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690115; c=relaxed/simple;
	bh=ydtojz9hNJsFsakBuijbNO3E8a7kHM4z42aoSjzWsxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB0XAcV6jBLdE9PH0qqqFWM8JnuahotEdgZw/Pp16bnY2G4TDHA2TP1EISiNvTj478X5SpYQZ1dwJxW8CwZZmRmz/+wkgkaSlcGDdFUP9KieT553ZwNAMd/HbmNAepX7uUStlAzwWzUdx4X81yEh1bDvrEfBlLXvig7dsTtL600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc6ZW-0006DJ-00; Wed, 16 Jul 2025 20:09:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 040E7C076D; Wed, 16 Jul 2025 20:04:54 +0200 (CEST)
Date: Wed, 16 Jul 2025 20:04:53 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: Delete an unnecessary check before
 kfree() in hub_domain_free()
Message-ID: <aHfpxcZG_QMXT_Um@alpha.franken.de>
References: <d3066a18-2e78-43ae-ad3b-8931777ee265@web.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3066a18-2e78-43ae-ad3b-8931777ee265@web.de>

On Tue, Jun 10, 2025 at 12:28:43PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 10 Jun 2025 11:44:20 +0200
> 
> It can be known that the function “kfree” performs a null pointer check
> for its input parameter.
> It is therefore not needed to repeat such a check before its call.
> 
> Thus remove a redundant pointer check.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/sgi-ip27/ip27-irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
> index 288d4d17eddd..20ef663af16e 100644
> --- a/arch/mips/sgi-ip27/ip27-irq.c
> +++ b/arch/mips/sgi-ip27/ip27-irq.c
> @@ -165,7 +165,7 @@ static void hub_domain_free(struct irq_domain *domain,
>  		return;
>  
>  	irqd = irq_domain_get_irq_data(domain, virq);
> -	if (irqd && irqd->chip_data)
> +	if (irqd)
>  		kfree(irqd->chip_data);
>  }
>  
> -- 
> 2.49.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

