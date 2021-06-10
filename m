Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74473A2CE1
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 15:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhFJN04 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 10 Jun 2021 09:26:56 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:41473 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhFJN0z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 09:26:55 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id D51B3C2D4D;
        Thu, 10 Jun 2021 13:16:06 +0000 (UTC)
Received: (Authenticated sender: paul@opendingux.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 70543C0005;
        Thu, 10 Jun 2021 13:15:40 +0000 (UTC)
Date:   Thu, 10 Jun 2021 14:15:31 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/2] mmc: JZ4740: Add support for JZ4775.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <V5MHUQ.E8C6HNTG18GS3@crapouillou.net>
In-Reply-To: <1623329930-14387-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1623329930-14387-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le jeu., juin 10 2021 at 20:58:50 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> 1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
> 2.The drive clock selection and sample clock selection have been
>   supported since JZ4775, not X1000. So support for these two
>   functions has been added for JZ4775 and JZ4780.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Now that's a good-looking patch ;)
Thanks for working on it.

Cheers,
-Paul

> ---
> 
> Notes:
>     v1->v2:
>     1.Remove unnecessary renaming as Paul Cercueil's suggestion.
>     2.Reuse the ID of JZ4775 and JZ4780 to simplify the code.
>     3.Add support of drive clock selection and sample clock
>       selection for JZ4775 and JZ4780.
> 
>  drivers/mmc/host/jz4740_mmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/jz4740_mmc.c 
> b/drivers/mmc/host/jz4740_mmc.c
> index b3c636e..f3172e5 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -674,7 +674,7 @@ static void jz4740_mmc_send_command(struct 
> jz4740_mmc_host *host,
>  			cmdat |= JZ_MMC_CMDAT_WRITE;
>  		if (host->use_dma) {
>  			/*
> -			 * The 4780's MMC controller has integrated DMA ability
> +			 * The JZ4780's MMC controller has integrated DMA ability
>  			 * in addition to being able to use the external DMA
>  			 * controller. It moves DMA control bits to a separate
>  			 * register. The DMA_SEL bit chooses the external
> @@ -866,7 +866,7 @@ static int jz4740_mmc_set_clock_rate(struct 
> jz4740_mmc_host *host, int rate)
>  	writew(div, host->base + JZ_REG_MMC_CLKRT);
> 
>  	if (real_rate > 25000000) {
> -		if (host->version >= JZ_MMC_X1000) {
> +		if (host->version >= JZ_MMC_JZ4780) {
>  			writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
>  				   JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
>  				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
> @@ -959,6 +959,7 @@ static const struct of_device_id 
> jz4740_mmc_of_match[] = {
>  	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) 
> JZ_MMC_JZ4740 },
>  	{ .compatible = "ingenic,jz4725b-mmc", .data = (void 
> *)JZ_MMC_JZ4725B },
>  	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) 
> JZ_MMC_JZ4760 },
> +	{ .compatible = "ingenic,jz4775-mmc", .data = (void *) 
> JZ_MMC_JZ4780 },
>  	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) 
> JZ_MMC_JZ4780 },
>  	{ .compatible = "ingenic,x1000-mmc", .data = (void *) JZ_MMC_X1000 
> },
>  	{},
> --
> 2.7.4
> 


