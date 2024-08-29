Return-Path: <linux-mips+bounces-5209-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D7963F29
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2875284A6E
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087A018F2F8;
	Thu, 29 Aug 2024 08:52:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3377C18F2DA;
	Thu, 29 Aug 2024 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921553; cv=none; b=YH9ApUFLgALHwdus3hJQRkZiLpawIJCHAiw6PgYHiApD4EVxZ9VykeXCxqLfRuTJtwJ9R6ZHxatFNTJevaco/jDtP3AojNnd7VLNejJf3E1hkqx2MmjiaJfsHhtk3AKGlkJS5Ffa/D63bvfd79+MEaykWrEbHYZOBq09Nq6Tt9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921553; c=relaxed/simple;
	bh=4xjmmhD0t1RcJqf0/cUH8fQArokFO7h6U8DCNUQ+XU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlWMOFgV8uhzwgpEjHYDe7idbX1Zsw+f0woyPvHvfUOZDCCz8dGB4pUOPmyAff/U+xhpp1ieANcUzxz6M+yHKeF8Zf3NPEIK+jftcPhOLA/1APhi/TIjmJ+aBqkK7UPhu+7FJwldEoVSTHFVQBS8ZjsTmEiCeUcR3fXcCuWPtKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005nB-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CF226C0C35; Thu, 29 Aug 2024 10:49:14 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:49:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Remove posix_types.h include from sigcontext.h
Message-ID: <ZtA2CjzGY9CK6jPh@alpha.franken.de>
References: <20240828030413.143930-2-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828030413.143930-2-xry111@xry111.site>

On Wed, Aug 28, 2024 at 11:04:14AM +0800, Xi Ruoyao wrote:
> Nothing in sigcontext.h seems to require anything from
> linux/posix_types.h.
> 
> It seems only a relict: in a Linux 2.6.11-rc2 patch [1] the
> linux/types.h include was unexplainedly changed to a linux/posix_types.h
> include.  I can only assume it was just an error.  Finally headers_check
> complained "found __[us]{8,16,32,64} type without #include
> <linux/types.h>" and commit ae612fb05b0f ("headers_check fix: mips,
> sigcontext.h") added back the linux/types.h include, but it didn't
> remove the posix_types.h include.
> 
> Remove it now.
> 
> [1]:https://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.11-rc2/2.6.11-rc2-mm2/broken-out/mips-generic-mips-updates.patch
> 
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/include/uapi/asm/sigcontext.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/include/uapi/asm/sigcontext.h b/arch/mips/include/uapi/asm/sigcontext.h
> index d0a540e88bb4..d10afd13ee5b 100644
> --- a/arch/mips/include/uapi/asm/sigcontext.h
> +++ b/arch/mips/include/uapi/asm/sigcontext.h
> @@ -56,7 +56,6 @@ struct sigcontext {
>  
>  #if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
>  
> -#include <linux/posix_types.h>
>  /*
>   * Keep this struct definition in sync with the sigcontext fragment
>   * in arch/mips/kernel/asm-offsets.c
> -- 
> 2.46.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

