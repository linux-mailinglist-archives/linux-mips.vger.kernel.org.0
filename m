Return-Path: <linux-mips+bounces-5205-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1CF963F21
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160BF1C24478
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFB918E77C;
	Thu, 29 Aug 2024 08:52:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B423C18E76D;
	Thu, 29 Aug 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921548; cv=none; b=O8KodBVE91oZjeHTdqcFwsa7HjtZK67k/OXR7HmNucxDJ+d5f6NJbxmYffY8lE4eZqZRnSfTryoRYsMrGTSbY++mlhrTbgdbn/OWD2jrUvk/Cqtg+xq3+qesQKvOKxGlMxDS36pe74sebq0Itfvxxutr1JFbLSc0bUdLzWFafr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921548; c=relaxed/simple;
	bh=LaCi94xmJV9tZiCC4kdqkhpdDblGRHjzTxNmEqHTJpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uosyqc3doOkva62tIAGkoa6W7PBBD4jlAvIJuA1TLHbfzeSWkLGX2GaJ+86BJeiUzhGYuLFCgufIp2LlEBp2WdkLYGc0yHtubjAPe/QPpA/bYYhJEEYSBJ1nGZh7LaDSevTDZzpHVM9ca6WOsFYAEMSHluvcoUz3L6Gxt3fRnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005mx-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DBF84C0AD5; Thu, 29 Aug 2024 10:37:45 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:37:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Vincent Legoll <vincent.legoll@gmail.com>
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: ralink: Fix missing `get_c0_perfcount_int`
 prototype
Message-ID: <ZtAzWeLojUP9cKJC@alpha.franken.de>
References: <20240812131803.16475-1-vincent.legoll@gmail.com>
 <20240812131803.16475-3-vincent.legoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812131803.16475-3-vincent.legoll@gmail.com>

On Mon, Aug 12, 2024 at 03:17:43PM +0200, Vincent Legoll wrote:
> Fix the following warning:
> 
>   CC      arch/mips/ralink/irq-gic.o
> arch/mips/ralink/irq-gic.c:15:5: warning: no previous prototype for 'get_c0_perfcount_int' [-Wmissing-prototypes]
>    15 | int get_c0_perfcount_int(void)
>       |     ^~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
> ---
>  arch/mips/ralink/irq-gic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/ralink/irq-gic.c b/arch/mips/ralink/irq-gic.c
> index 3bab51a5fb4c..8bc566ea00e5 100644
> --- a/arch/mips/ralink/irq-gic.c
> +++ b/arch/mips/ralink/irq-gic.c
> @@ -10,6 +10,7 @@
>  #include <linux/of.h>
>  #include <linux/irqchip.h>
>  #include <asm/mips-cps.h>
> +#include <asm/time.h>
>  
>  int get_c0_perfcount_int(void)
>  {
> -- 
> 2.46.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

