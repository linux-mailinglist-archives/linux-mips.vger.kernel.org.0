Return-Path: <linux-mips+bounces-5208-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB6963F27
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2A0281A72
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2497C18CC18;
	Thu, 29 Aug 2024 08:52:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D66C18C901
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921550; cv=none; b=b4JgM+rRrbyITEqsfmJOF/Z+R4d2gZgGXG0oYK67t/whWoqE144hbNh4dVb/IP0GMjt3QpLmB70+W5L/XQOCCc7EQFcTb8PzYtk/yUyXWsnQR/nGUTXcJI0SCmc5NvzRl0IoUNK6C5xbvrtgZh/ujuk5BJdUTxzAcauviWR0r7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921550; c=relaxed/simple;
	bh=GGiVL2/b1kGkMeBJlA0R7wObAlOh5GkHvlNiQaJjFpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/WSL/Tc290Dki6SEMk5X72zQ678uu3ZHH2l1Dzg1bhbZCMsizS8xksk8TfdJqhHH09+CamgQPEDOhEzmfpQ1YR66YJ1sn5Q0O9qb2mugqRKcIa/1tIc1UATLyXnC/P5zED2ciu9WAtDvRs04gUMeTBgLwgDmqNQimpXkDlPLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005n9-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C02DCC0BFD; Thu, 29 Aug 2024 10:48:32 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:48:32 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: macro@orcam.me.uk, linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: dec: prom: Remove unused
 unregister_prom_console() declaration
Message-ID: <ZtA14BRv5u6R1MHl@alpha.franken.de>
References: <20240814104312.2056096-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814104312.2056096-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:43:12PM +0800, Gaosheng Cui wrote:
> The unregister_prom_console() has been removed since
> commit 36a885306fdf ("[MIPS] Fix and cleanup the mess that a dozen
> prom_printf variants are."), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/include/asm/dec/prom.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/dec/prom.h b/arch/mips/include/asm/dec/prom.h
> index 908e96e3a311..8fcad6984389 100644
> --- a/arch/mips/include/asm/dec/prom.h
> +++ b/arch/mips/include/asm/dec/prom.h
> @@ -160,6 +160,5 @@ extern void prom_identify_arch(u32);
>  extern void prom_init_cmdline(s32, s32 *, u32);
>  
>  extern void register_prom_console(void);
> -extern void unregister_prom_console(void);
>  
>  #endif /* _ASM_DEC_PROM_H */
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

