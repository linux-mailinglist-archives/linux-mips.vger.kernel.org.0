Return-Path: <linux-mips+bounces-3751-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B875F9108C5
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B12BB257AC
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 14:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630B01AE858;
	Thu, 20 Jun 2024 14:46:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4011E497;
	Thu, 20 Jun 2024 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894761; cv=none; b=HDsB+jgH3qD0gufEcRrEi+xMhJb5ishgU5t8FrtzdAbxuLj5QVq07abmUPKN/e6eHwS0j3zDxZqZQZbKEor+/0LY7nur2XR6vDxSoQ0iW1VtqrlvZyBpcaMSVAC39FCAldqo9YkHdZUBvqoJuRLDVnJQG/6YyCQmLJUnb0DpZH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894761; c=relaxed/simple;
	bh=qDGnScQ7WuPpwcBEvsp6QgrvUYW/bjdBDuuaefI7n1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnqiqqEEEA2zdYSlRoMLpHh/8joVqzYg3idOy1Jgr081+Ct5iLrXPgqh1oRR2uXGrNuHCY9fS9sZtyDvpSYm2N7cH3FWLw8Q3zC0d1hm308QzdjH2IfqpQOOQIYm2AqVUGL0lH0iuVluVO+RfyW31PK22ALd5c8qsZeY8m/SdBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKJ2m-0000tH-00; Thu, 20 Jun 2024 16:45:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 661D3C0120; Thu, 20 Jun 2024 16:31:15 +0200 (CEST)
Date: Thu, 20 Jun 2024 16:31:15 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH fixes] MIPS: ip30: ip30-console: Add missing include
Message-ID: <ZnQ9M4Q/TTZi13Sg@alpha.franken.de>
References: <20240616-ip30-buildfix-v1-1-0ab2b9aec9f5@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240616-ip30-buildfix-v1-1-0ab2b9aec9f5@flygoat.com>

On Sun, Jun 16, 2024 at 06:54:24PM +0100, Jiaxun Yang wrote:
> Include linux/processor.h to fix build error:
> 
> arch/mips/sgi-ip30/ip30-console.c: In function ‘prom_putchar’:
> arch/mips/sgi-ip30/ip30-console.c:21:17: error: implicit declaration of function ‘cpu_relax’ [-Werror=implicit-function-declaration]
>    21 |                 cpu_relax();
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/sgi-ip30/ip30-console.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/sgi-ip30/ip30-console.c b/arch/mips/sgi-ip30/ip30-console.c
> index 7c6dcf6e73f7..a5f10097b985 100644
> --- a/arch/mips/sgi-ip30/ip30-console.c
> +++ b/arch/mips/sgi-ip30/ip30-console.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/io.h>
> +#include <linux/processor.h>
>  
>  #include <asm/sn/ioc3.h>
>  #include <asm/setup.h>
> 
> ---
> base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
> change-id: 20240616-ip30-buildfix-20d62f2d6186

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

