Return-Path: <linux-mips+bounces-3454-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BB8D727D
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jun 2024 00:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D81F280D81
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2024 22:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412851F5E6;
	Sat,  1 Jun 2024 22:23:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6157A1C6BD;
	Sat,  1 Jun 2024 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717280631; cv=none; b=ZGAfQ5LAmTz34NoyGycwmS4Ib0tVX2hD7udsyT3PoBTNmcIades+FMBLcXGwG1np+faisASLvNfLey6NwsAjDvsI30tJ+oKOYHNG9QkZo/4ZHmX/FRAlOvhOuzwyWBt/R905cJUbY1cm3QQ2UC2CxyM2emyfl06506AFiDI9yiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717280631; c=relaxed/simple;
	bh=a2DEIn9JBgr/CBzEsnUbi8PgL8QTJbR6+n1UoaXTpVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TmC3ElvkFC0oXMijhPmutGiHS02MzOFOV9CSNoA9Xg/bRL7BVFWn77eJ3lOGoDDyYWjvJQrRaJH5h1vxJRMgLlgdH8j1dGritLKI/zGU/xeBtypXznS1Hvi+J7B+k4AZiSNSexMfbvGsGtRRWMvxckrj3VAjvoh0iL6RAd5F/bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1C9C592009C; Sun,  2 Jun 2024 00:23:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0E79192009B;
	Sat,  1 Jun 2024 23:23:40 +0100 (BST)
Date: Sat, 1 Jun 2024 23:23:39 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Serge Semin <fancer.lancer@gmail.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] MIPS: csrc-r4k: Refine rating computation
In-Reply-To: <20240511-mips-clks-v1-1-ddb4a10ee9f9@flygoat.com>
Message-ID: <alpine.DEB.2.21.2406012319200.23854@angie.orcam.me.uk>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com> <20240511-mips-clks-v1-1-ddb4a10ee9f9@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 May 2024, Jiaxun Yang wrote:

> Increase frequency addend dividend to 100000000 (10MHz) to

 The value of 100000000 is AFAICT 100MHz.

> diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
> index edc4afc080fa..262896871351 100644
> --- a/arch/mips/kernel/csrc-r4k.c
> +++ b/arch/mips/kernel/csrc-r4k.c
> @@ -111,7 +111,8 @@ int __init init_r4k_clocksource(void)
>  		return -ENXIO;
>  
>  	/* Calculate a somewhat reasonable rating value */
> -	clocksource_mips.rating = 200 + mips_hpt_frequency / 10000000;
> +	clocksource_mips.rating = 200;
> +	clocksource_mips.rating += clamp(mips_hpt_frequency / 100000000, 0, 99);

 And FAOD the code change does match it.

  Maciej

