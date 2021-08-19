Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307763F1667
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 11:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237587AbhHSJju convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 19 Aug 2021 05:39:50 -0400
Received: from aposti.net ([89.234.176.197]:42636 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237540AbhHSJju (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Aug 2021 05:39:50 -0400
Date:   Thu, 19 Aug 2021 11:39:05 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 04/11] clk: Ingenic: Fix problem of MAC clock in
 Ingenic X1000 and X1830.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <5TY2YQ.FMFB4RRIWORV1@crapouillou.net>
In-Reply-To: <1627119286-125821-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1627119286-125821-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juil. 24 2021 at 17:34:39 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> X1000 and X1830 have two MAC related clocks, one is MACPHY, which is
> controlled by MACCDR register, the other is MAC, which is controlled
> by the MAC bit in the CLKGR register (with CLK_AHB2 as the parent).
> The original driver mistakenly mixed the two clocks together.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v1->v2:
>     1.Add MACPHY and I2S for X1000, and add MACPHY for X1830.
>     2.Add Paul Cercueil's Reviewed-by and Rob Herring's Acked-by.
> 
>     v2->v3:
>     No change.
> 
>     v3->v4:
>     No change.
> 
>     v4->v5:
>     Add CIM, AIC, DMIC for X1000, and add CIM, AIC, DMIC, I2S for 
> X1830.
> 
>     v5->v6:
>     No change.
> 
>     v6->v7:
>     No change.
> 
>  drivers/clk/ingenic/x1000-cgu.c | 11 ++++++++---
>  drivers/clk/ingenic/x1830-cgu.c | 11 ++++++++---
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/ingenic/x1000-cgu.c 
> b/drivers/clk/ingenic/x1000-cgu.c
> index 9aa20b5..53e5fe0 100644
> --- a/drivers/clk/ingenic/x1000-cgu.c
> +++ b/drivers/clk/ingenic/x1000-cgu.c
> @@ -296,12 +296,11 @@ static const struct ingenic_cgu_clk_info 
> x1000_cgu_clocks[] = {
>  		.gate = { CGU_REG_CLKGR, 31 },
>  	},
> 
> -	[X1000_CLK_MAC] = {
> -		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +	[X1000_CLK_MACPHY] = {
> +		"mac_phy", CGU_CLK_MUX | CGU_CLK_DIV,
>  		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL },
>  		.mux = { CGU_REG_MACCDR, 31, 1 },
>  		.div = { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
> -		.gate = { CGU_REG_CLKGR, 25 },
>  	},
> 
>  	[X1000_CLK_LCD] = {
> @@ -452,6 +451,12 @@ static const struct ingenic_cgu_clk_info 
> x1000_cgu_clocks[] = {
>  		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
>  		.gate = { CGU_REG_CLKGR, 21 },
>  	},
> +
> +	[X1000_CLK_MAC] = {
> +		"mac", CGU_CLK_GATE,
> +		.parents = { X1000_CLK_AHB2 },
> +		.gate = { CGU_REG_CLKGR, 25 },
> +	},
>  };
> 
>  static void __init x1000_cgu_init(struct device_node *np)
> diff --git a/drivers/clk/ingenic/x1830-cgu.c 
> b/drivers/clk/ingenic/x1830-cgu.c
> index 950aee2..59342bc 100644
> --- a/drivers/clk/ingenic/x1830-cgu.c
> +++ b/drivers/clk/ingenic/x1830-cgu.c
> @@ -270,13 +270,12 @@ static const struct ingenic_cgu_clk_info 
> x1830_cgu_clocks[] = {
>  		.gate = { CGU_REG_CLKGR0, 31 },
>  	},
> 
> -	[X1830_CLK_MAC] = {
> -		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +	[X1830_CLK_MACPHY] = {
> +		"mac_phy", CGU_CLK_MUX | CGU_CLK_DIV,
>  		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
>  					 X1830_CLK_VPLL, X1830_CLK_EPLL },
>  		.mux = { CGU_REG_MACCDR, 30, 2 },
>  		.div = { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
> -		.gate = { CGU_REG_CLKGR1, 4 },
>  	},
> 
>  	[X1830_CLK_LCD] = {
> @@ -428,6 +427,12 @@ static const struct ingenic_cgu_clk_info 
> x1830_cgu_clocks[] = {
>  		.gate = { CGU_REG_CLKGR1, 1 },
>  	},
> 
> +	[X1830_CLK_MAC] = {
> +		"mac", CGU_CLK_GATE,
> +		.parents = { X1830_CLK_AHB2 },
> +		.gate = { CGU_REG_CLKGR1, 4 },
> +	},
> +
>  	[X1830_CLK_OST] = {
>  		"ost", CGU_CLK_GATE,
>  		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
> --
> 2.7.4
> 


