Return-Path: <linux-mips+bounces-2764-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5C8A4A78
	for <lists+linux-mips@lfdr.de>; Mon, 15 Apr 2024 10:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A56B01C22057
	for <lists+linux-mips@lfdr.de>; Mon, 15 Apr 2024 08:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E5D3EA90;
	Mon, 15 Apr 2024 08:36:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2850D3C062
	for <linux-mips@vger.kernel.org>; Mon, 15 Apr 2024 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170171; cv=none; b=EsFp2e5xPHMTGktzziG6Ja5rmbADrUARl+F0XcxjX8jpBZcNCR5N+fZ27kIMuvYnPuuXWiuwEfa88u71ZvZjUDTYr83TNZlv+vrTcVFFmZ6ZBjp9ZPQnIYRLFsjZGk0w25RzQsBcNs972su0Sm9toO+bLtujs49q4D4AH7SxWBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170171; c=relaxed/simple;
	bh=jiWSQfe+obpLUrwI+Zs7nwJ2Utpv2bV4CUBZMBToLk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbFqnnMqIsHG62ebA1YG89GMn4jLFknSG7M+4gQ1nxqWl9MWBnHFMze5IvNXYfzdK8BjnqWvDFNXBWsXioH/WBbQpU7OUFZAXt6McHTMVGOWJkXOL/7r8TNLqEA2ni3MpB2efe3w5wiISmxLZHmp+4MNdF9dWZ9cK0XW7mdwvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rwHob-0004hs-00; Mon, 15 Apr 2024 10:35:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 642EAC0486; Mon, 15 Apr 2024 10:33:57 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:33:57 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Cc: hauke@hauke-m.de, zajec5@gmail.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM47XX: include header for
 bcm47xx_prom_highmem_init() prototype
Message-ID: <ZhzmdcpJaWIGu/zT@alpha.franken.de>
References: <20240315022923.178593-1-zhangyongzhen@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315022923.178593-1-zhangyongzhen@kylinos.cn>

On Fri, Mar 15, 2024 at 10:29:23AM +0800, Yongzhen Zhang wrote:
> bcm47xx_prom_highmem_init() is a global function declared in
> arch/mips/bcm47xx/bcm47xx_private.h, but this header is not
> included before the definition, causing a error:
> 
> arch/mips/bcm47xx/prom.c:134:13: error: no previous prototype for ‘bcm47xx_prom_highmem_init’ [-Werror=missing-prototypes]
>   134 | void __init bcm47xx_prom_highmem_init(void)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>  arch/mips/bcm47xx/prom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
> index 99a1ba5394e0..7344a5eb990e 100644
> --- a/arch/mips/bcm47xx/prom.c
> +++ b/arch/mips/bcm47xx/prom.c
> @@ -35,6 +35,7 @@
>  #include <asm/bootinfo.h>
>  #include <bcm47xx.h>
>  #include <bcm47xx_board.h>
> +#include "bcm47xx_private.h"
>  
>  static char bcm47xx_system_type[20] = "Broadcom BCM47XX";
>  
> -- 
> 2.34.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

