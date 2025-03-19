Return-Path: <linux-mips+bounces-8223-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97DA68905
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 503E616931B
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2256C2066C9;
	Wed, 19 Mar 2025 10:04:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137B11E1DE6;
	Wed, 19 Mar 2025 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378692; cv=none; b=Muvdxm/OmlR2pS/z/HGbPFZ6wucUOTjfKIWtAjnIRpOAGVhJZHrFU4DQcUliiMZJ4jtHeUdDeAwgp+WSNI6w66ic24SFLJk6fLvGdSj6i9pNW2uaqo8qw62YkOOH3Kg/IofrtS4BKitRyqhi0xSqM396wG9lvAP+oYS3yfotd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378692; c=relaxed/simple;
	bh=BfILZxUpUIh6oh5aLTLXWSOinqWZCrgoMXdF8nNQ2tA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVspKPwpTGDeFednixE1Dwmsw64zXITMjhsTWufj/v3AqCRw4sVHrBPO54iuybfmYCd7xU43TjZ26pRtoeIXFfLZdEbc3HLRqfU0uCZhal7dsYjps/MlzFtYABqGdk0cJKvzBr7DCGKsRk//NAMuCIMJlNuN2woTx6MQRspXiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tupfX-0002zE-00; Wed, 19 Mar 2025 10:24:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BB377C0135; Wed, 19 Mar 2025 10:24:16 +0100 (CET)
Date: Wed, 19 Mar 2025 10:24:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: cm: Fix warning if MIPS_CM is disabled
Message-ID: <Z9qNQA_uyLG8bToX@alpha.franken.de>
References: <20250228143703.33381-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228143703.33381-1-tsbogend@alpha.franken.de>

On Fri, Feb 28, 2025 at 03:37:02PM +0100, Thomas Bogendoerfer wrote:
> Commit e27fbe16af5c ("MIPS: cm: Detect CM quirks from device tree")
> introduced
> 
> arch/mips/include/asm/mips-cm.h:119:13: error: ‘mips_cm_update_property’
> 	defined but not used [-Werror=unused-function]
> 
> Fix this by making empty function implementation inline
> 
> Fixes: e27fbe16af5c ("MIPS: cm: Detect CM quirks from device tree")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mips-cm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
> index 3bfe0633b576..407f253bb4a1 100644
> --- a/arch/mips/include/asm/mips-cm.h
> +++ b/arch/mips/include/asm/mips-cm.h
> @@ -116,7 +116,7 @@ static inline bool mips_cm_present(void)
>  #ifdef CONFIG_MIPS_CM
>  extern void mips_cm_update_property(void);
>  #else
> -static void mips_cm_update_property(void) {}
> +static inline void mips_cm_update_property(void) {}
>  #endif
>  
>  /**
> -- 
> 2.35.3

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

