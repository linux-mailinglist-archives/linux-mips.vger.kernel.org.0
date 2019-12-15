Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF8411F73E
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 11:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfLOKsg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 05:48:36 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:33226 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbfLOKsg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 15 Dec 2019 05:48:36 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1igRRq-0007sB-2S; Sun, 15 Dec 2019 11:48:26 +0100
Date:   Sun, 15 Dec 2019 10:48:24 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
        mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/10] soc: qcom: convert to
 devm_platform_ioremap_resource
Message-ID: <20191215104824.658889d3@why>
In-Reply-To: <20191214175447.25482-10-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
        <20191214175447.25482-10-tiny.windzz@gmail.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tiny.windzz@gmail.com, khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl, john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org, mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org, shawnguo@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 14 Dec 2019 17:54:47 +0000
Yangtao Li <tiny.windzz@gmail.com> wrote:

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c    | 7 +------
>  drivers/soc/qcom/qcom-geni-se.c | 4 +---
>  drivers/soc/qcom/qcom_aoss.c    | 4 +---
>  drivers/soc/qcom/qcom_gsbi.c    | 5 +----
>  drivers/soc/qcom/spm.c          | 4 +---
>  5 files changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 429b5a60a1ba..99e19df76889 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
>  static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  		const char *name)
>  {
> -	struct resource *res;
>  	void __iomem *base;
>  	struct regmap_config llcc_regmap_config = {
>  		.reg_bits = 32,
> @@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  		.fast_io = true,
>  	};
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	if (!res)
> -		return ERR_PTR(-ENODEV);
> -
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);

What guarantees do you have that entry 0 matches name?

I find these changes pointless: they don't add much to the readability
or maintainability of the code, and instead introduce creative bugs.

	M.
-- 
Jazz is not dead. It just smells funny...
