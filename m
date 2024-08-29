Return-Path: <linux-mips+bounces-5203-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8869963F1E
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A531C2451F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B71D18CC1D;
	Thu, 29 Aug 2024 08:52:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7D318E75F
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921548; cv=none; b=LhxcWQQvOkxjjf5JcRRrmmlOG1RQxw7TekMlPsZtKjX7+MdYGexik1S5WVVaJawEWv2ywhkJntf0PwgUsS4YgQl99wCgkt3C10bBvOdIMkUPQOWb8kqEK6IkB7ilio7/jA9OicQJ778D3TxnUO60+tkKGAaxNW5wml634Yd6IWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921548; c=relaxed/simple;
	bh=3BEhd11d1PsuckRcbd2wfeQHKWWfMpUW4kncoFhQvfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsHSOVdRvdPpEskO4qw20iG2ButVKRjvU2D4IKDD440s3LLnn7tCNS1aH7RcsB3cv6G3bquH74H+FR8Zsoo6EccUS8QllkhYlXBA/ZUIwqT/QG+z96TYtTxeGNgN4wj8FMsfnl+bBzSMRFNznvPROdyGTVwRK1d2S0LhTPSuQho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005n7-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 12C5EC0B84; Thu, 29 Aug 2024 10:48:18 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:48:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Remove unused mips_display/_scroll_message()
 declarations
Message-ID: <ZtA10rhwmlNJMwtv@alpha.franken.de>
References: <20240814104156.2055924-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814104156.2055924-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:41:56PM +0800, Gaosheng Cui wrote:
> The mips_display/_scroll_message() have been removed since
> commit 0b0037490f37 ("MIPS: malta: Use img-ascii-lcd driver for LCD
> display"), so remove them.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/include/asm/mips-boards/generic.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mips-boards/generic.h b/arch/mips/include/asm/mips-boards/generic.h
> index c904c24550f6..5befba569c9f 100644
> --- a/arch/mips/include/asm/mips-boards/generic.h
> +++ b/arch/mips/include/asm/mips-boards/generic.h
> @@ -73,7 +73,4 @@ extern void mips_pcibios_init(void);
>  #define mips_pcibios_init() do { } while (0)
>  #endif
>  
> -extern void mips_scroll_message(void);
> -extern void mips_display_message(const char *str);
> -
>  #endif	/* __ASM_MIPS_BOARDS_GENERIC_H */
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

