Return-Path: <linux-mips+bounces-34-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC87EA27B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 19:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E1641C20490
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 18:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D9622EEE;
	Mon, 13 Nov 2023 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V28qkMWl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E291822EE3;
	Mon, 13 Nov 2023 18:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27800C433C7;
	Mon, 13 Nov 2023 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699898471;
	bh=/fQB8yzDRwI8suGbN18tEiqj2tDHOeeWavzxzxadeqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V28qkMWlDEpLGChLVOSuTSVOqsy48qAtgXtDB2uF7uhrJEi1ey5P4BeKAnt+AaIFt
	 vxlsjlZO4BmgfXlGasbfGW95XvRWaPUNlQBxz8cm3yIRq6yZSVj3vlTXemAEuuc99a
	 rpuwtjbcXqkc7twnSRwrTRqImpsKuWYJhGIuCo7aTJtejQep4BFoJfqijZLlSf0MHW
	 rlxUM7YXWR1QAMpmDUJrhcAi0Zq+II2Sj5mAG2Ydkb0NavWdI+YmTn19VAD8G0Jtnu
	 2COdOM3m5e5zuo+006I+/S5Sh91jdtUNiRiks5uPZhyePOVzsFJBr2UHc3hlB2Ir9f
	 lqzd5IGAL/w9Q==
Date: Mon, 13 Nov 2023 18:01:07 +0000
From: Simon Horman <horms@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: |PATCH] stmmac: dwmac-loongson: Add architecture dependency
Message-ID: <20231113180107.GA52493@kernel.org>
References: <20231113154522.0bca3521@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113154522.0bca3521@endymion.delvare>

On Mon, Nov 13, 2023 at 03:45:22PM +0100, Jean Delvare wrote:
> Only present the DWMAC_LOONGSON option on architectures where it can
> actually be used.
> 
> This follows the same logic as the DWMAC_INTEL option.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> I'm not familiar with the hardware, so please let me know if the
> dependency needs to be adjusted somehow.
> 
>  drivers/net/ethernet/stmicro/stmmac/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-6.6.orig/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ linux-6.6/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -269,7 +269,7 @@ config DWMAC_INTEL
>  config DWMAC_LOONGSON
>  	tristate "Loongson PCI DWMAC support"
>  	default MACH_LOONGSON64
> -	depends on STMMAC_ETH && PCI
> +	depends on MACH_LOONGSON64 && STMMAC_ETH && PCI

Hi Jean,

Could we consider also allowing the build to occur if COMPILE_TEST is set?
This would maintain the current level of build test coverage.

Something line this (completely untested!):

	depends on (MACH_LOONGSON64 || COMPILE_TEST) && STMMAC_ETH && PCI

>  	depends on COMMON_CLK
>  	help
>  	  This selects the LOONGSON PCI bus support for the stmmac driver,
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
> 

