Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA12339F80D
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 15:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhFHNqm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 09:46:42 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:52445 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhFHNqm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 09:46:42 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 32C871BF205;
        Tue,  8 Jun 2021 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1623159888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BQMptio49srjsFtDPE0SuFSfbNkfTGwnrL3Zcw/9Xhw=;
        b=XqqpFaA4jHsaQKwcPJUOqYpmSBoFOfEy5cZtaG00J7kWA+Nk7frkzxp/wK0WDlTt9eOaq0
        TA9PtJ4wfcVGFVu+je7VUhQvDBfHVutMeayg+nglVBpi+g9jWqNr3mWo7ZcB4uAo4Sr2Bq
        Sr2DnBMMz/IIF8glXjgmUvYWv1rs+pl+TkgeztvGC3zo1FrXWxmAu0goQ+dBQHUaR47j4m
        0smoLfV3W9U0TUK8tzncrmlyBdoWKeiyobMbQr8XoCYfenSAoxmqGFJaJE67WZ7GR6emV5
        dEuC9DQy/TARQnfPlb/NrUDBSS64ByEBH80kZlaXRga99d95oaez3e7U73G72A==
Date:   Tue, 08 Jun 2021 14:44:35 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH 2/2] mmc: JZ4740: Add support for JZ4775 and rename
 unreasonable array name.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
Message-Id: <B6YDUQ.LVNCFD4XPUIY1@opendingux.net>
In-Reply-To: <1623002884-57244-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623002884-57244-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1623002884-57244-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le lun., juin 7 2021 at 02:08:04 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Y=
anjie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> 1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
> 2.When the support for JZ4775 SoC is added, there will be six=20
> compatible
>   strings, so renaming "jz4740_mmc_of_match[]" to=20
> "jz4740_mmc_of_matches[]"
>   is more reasonable.

Honestly, you can drop #2. We don't really care about the=20
variable/function names not being "perfect". For instance this driver=20
still use "jz4740_mmc*" functions everywhere even though it supports=20
many more SoCs. Besides, renames like that makes it harder to "git=20
blame" afterwards since it fills the git history with non-functional=20
changes.

>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>  drivers/mmc/host/jz4740_mmc.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/mmc/host/jz4740_mmc.c=20
> b/drivers/mmc/host/jz4740_mmc.c
> index b3c636e..ea8434f 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -2,6 +2,7 @@
>  /*
>   *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>   *  Copyright (C) 2013, Imagination Technologies
> + *  Copyright (C) 2021, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
> <zhouyanjie@wanyeetech.com>
>   *
>   *  JZ4740 SD/MMC controller driver
>   */
> @@ -114,6 +115,7 @@ enum jz4740_mmc_version {
>  	JZ_MMC_JZ4740,
>  	JZ_MMC_JZ4725B,
>  	JZ_MMC_JZ4760,
> +	JZ_MMC_JZ4775,
>  	JZ_MMC_JZ4780,
>  	JZ_MMC_X1000,
>  };
> @@ -138,7 +140,7 @@ enum jz4740_mmc_state {
>   * COOKIE_MAPPED: the request was mapped in the irq handler,
>   * and should be unmapped before mmc_request_done is called..
>   */
> -enum jz4780_cookie {
> +enum jz4775_cookie {
>  	COOKIE_UNMAPPED =3D 0,
>  	COOKIE_PREMAPPED,
>  	COOKIE_MAPPED,
> @@ -194,7 +196,7 @@ static void jz4740_mmc_write_irq_mask(struct=20
> jz4740_mmc_host *host,
>  static void jz4740_mmc_write_irq_reg(struct jz4740_mmc_host *host,
>  				     uint32_t val)
>  {
> -	if (host->version >=3D JZ_MMC_JZ4780)
> +	if (host->version >=3D JZ_MMC_JZ4775)
>  		writel(val, host->base + JZ_REG_MMC_IREG);
>  	else
>  		writew(val, host->base + JZ_REG_MMC_IREG);
> @@ -202,7 +204,7 @@ static void jz4740_mmc_write_irq_reg(struct=20
> jz4740_mmc_host *host,
>=20
>  static uint32_t jz4740_mmc_read_irq_reg(struct jz4740_mmc_host *host)
>  {
> -	if (host->version >=3D JZ_MMC_JZ4780)
> +	if (host->version >=3D JZ_MMC_JZ4775)
>  		return readl(host->base + JZ_REG_MMC_IREG);
>  	else
>  		return readw(host->base + JZ_REG_MMC_IREG);
> @@ -674,7 +676,7 @@ static void jz4740_mmc_send_command(struct=20
> jz4740_mmc_host *host,
>  			cmdat |=3D JZ_MMC_CMDAT_WRITE;
>  		if (host->use_dma) {
>  			/*
> -			 * The 4780's MMC controller has integrated DMA ability
> +			 * The JZ4775's MMC controller has integrated DMA ability
>  			 * in addition to being able to use the external DMA
>  			 * controller. It moves DMA control bits to a separate
>  			 * register. The DMA_SEL bit chooses the external
> @@ -682,13 +684,13 @@ static void jz4740_mmc_send_command(struct=20
> jz4740_mmc_host *host,
>  			 * can only use the external controller, and have a
>  			 * single DMA enable bit in CMDAT.
>  			 */
> -			if (host->version >=3D JZ_MMC_JZ4780) {
> +			if (host->version >=3D JZ_MMC_JZ4775) {
>  				writel(JZ_MMC_DMAC_DMA_EN | JZ_MMC_DMAC_DMA_SEL,
>  				       host->base + JZ_REG_MMC_DMAC);
>  			} else {
>  				cmdat |=3D JZ_MMC_CMDAT_DMA_EN;
>  			}
> -		} else if (host->version >=3D JZ_MMC_JZ4780) {
> +		} else if (host->version >=3D JZ_MMC_JZ4775) {
>  			writel(0, host->base + JZ_REG_MMC_DMAC);
>  		}
>=20
> @@ -866,7 +868,7 @@ static int jz4740_mmc_set_clock_rate(struct=20
> jz4740_mmc_host *host, int rate)
>  	writew(div, host->base + JZ_REG_MMC_CLKRT);
>=20
>  	if (real_rate > 25000000) {
> -		if (host->version >=3D JZ_MMC_X1000) {
> +		if (host->version >=3D JZ_MMC_JZ4775) {

This changes the behaviour for the JZ4780.

Even if it is correct, this belongs in its own commit (with a Fixes=20
tag), or at the very least a mention about it in the commit message.

>  			writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
>  				   JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
>  				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
> @@ -955,15 +957,16 @@ static const struct mmc_host_ops jz4740_mmc_ops=20
> =3D {
>  	.enable_sdio_irq =3D jz4740_mmc_enable_sdio_irq,
>  };
>=20
> -static const struct of_device_id jz4740_mmc_of_match[] =3D {
> +static const struct of_device_id jz4740_mmc_of_matches[] =3D {
>  	{ .compatible =3D "ingenic,jz4740-mmc", .data =3D (void *)=20
> JZ_MMC_JZ4740 },
>  	{ .compatible =3D "ingenic,jz4725b-mmc", .data =3D (void=20
> *)JZ_MMC_JZ4725B },
>  	{ .compatible =3D "ingenic,jz4760-mmc", .data =3D (void *)=20
> JZ_MMC_JZ4760 },
> +	{ .compatible =3D "ingenic,jz4775-mmc", .data =3D (void *)=20
> JZ_MMC_JZ4775 },
>  	{ .compatible =3D "ingenic,jz4780-mmc", .data =3D (void *)=20
> JZ_MMC_JZ4780 },

Looks to me that the JZ4775 and JZ4780 have the exact same behaviour,=20
so this patch could have been a one-liner, adding "ingenic,jz4775-mmc"=20
with the JZ_MMC_JZ4780 ID.

Cheers,
-Paul

>  	{ .compatible =3D "ingenic,x1000-mmc", .data =3D (void *) JZ_MMC_X1000=20
> },
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, jz4740_mmc_of_match);
> +MODULE_DEVICE_TABLE(of, jz4740_mmc_of_matches);
>=20
>  static int jz4740_mmc_probe(struct platform_device* pdev)
>  {
> @@ -980,7 +983,7 @@ static int jz4740_mmc_probe(struct=20
> platform_device* pdev)
>=20
>  	host =3D mmc_priv(mmc);
>=20
> -	match =3D of_match_device(jz4740_mmc_of_match, &pdev->dev);
> +	match =3D of_match_device(jz4740_mmc_of_matches, &pdev->dev);
>  	if (match) {
>  		host->version =3D (enum jz4740_mmc_version)match->data;
>  	} else {
> @@ -1124,7 +1127,7 @@ static struct platform_driver jz4740_mmc_driver=20
> =3D {
>  	.driver =3D {
>  		.name =3D "jz4740-mmc",
>  		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> -		.of_match_table =3D of_match_ptr(jz4740_mmc_of_match),
> +		.of_match_table =3D of_match_ptr(jz4740_mmc_of_matches),
>  		.pm =3D pm_ptr(&jz4740_mmc_pm_ops),
>  	},
>  };
> --
> 2.7.4
>=20


