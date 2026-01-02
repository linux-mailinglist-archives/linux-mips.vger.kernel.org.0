Return-Path: <linux-mips+bounces-12706-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F3CEEAE2
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 14:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F00301463E
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 13:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DE52D543D;
	Fri,  2 Jan 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX9ohkCy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196251D6BB;
	Fri,  2 Jan 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767360851; cv=none; b=XjeP1WCMBMHFw9pbT1K5GV6WJSWOJyI2ByFWHFOf+RB0MTvRuVHq76QZD5Goyc6lEpG9SaYF9IGX6xm66rVWxaf1JBckGotxx9g5MKu01fdy0IF6UXM17Jn9EwspMqNWnmtWJL8vFxahHM9zDgXPSBWOrfhD50UWXnauuzY+rD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767360851; c=relaxed/simple;
	bh=VEKovfwgFEFRzqHc5DA9b9dzuLkYiDUuroCM/My6HyM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EBKu1CFLNq7PoM7DPeMqWwnCGXYSauqiUdy6xMfxymeY7jh41gOIOtVkojJ3dFvc+bWX+ikgPDwmAw5zNTmerVWazAK2mxL0mpaAZDbqwVL9R4H5P/EoVziu4NxmNifOeDk/b2OfOB3nHjy9k13uF/H4asz4BSucYS+f8v1tPlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oX9ohkCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4BDC116B1;
	Fri,  2 Jan 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767360847;
	bh=VEKovfwgFEFRzqHc5DA9b9dzuLkYiDUuroCM/My6HyM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oX9ohkCyii+h1e50Z5Vh5H4f8tY5Hjzw2EJNiqKkZGIUgaR7R/mIaFZXZBwb5vhJM
	 SgLWl0oO7tgHbtuBMNojb0n5pOMf3VSKVYyg9N6ciT4RlQ7vqsFLdD3sv0AH5EZiPU
	 i77Zvm+ioMEZ8bbotFuuP0ofa9rORe0hgH3mOpzQOSdd/P0/K8oN3gg/CxTXvLYG14
	 7JIFhjYFTrTLsn0wEfzCfHyiJ8wxH4h920buPp4NGFAPL5TIGNQLPPB5EK+Our1pDG
	 t/blL6bFCwatW0blrIAuLcb14M4dUpSC7kkURwIlOsokBF2FDkHTZM5+E+TohOX5tS
	 4oyBTGzhNVS6Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Brian Norris <computersforpeace@gmail.com>,  Kamal Dasu
 <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Paul Cercueil <paul@crapouillou.net>,
  Manivannan Sadhasivam <mani@kernel.org>,  Stefan Agner <stefan@agner.ch>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Nathan
 Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
  Justin Stitt <justinstitt@google.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mips@vger.kernel.org,
  linux-arm-msm@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for
 each OF child loop
In-Reply-To: <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
	(Krzysztof Kozlowski's message of "Fri, 2 Jan 2026 13:49:34 +0100")
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
	<20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 14:33:59 +0100
Message-ID: <86a4yw87g8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Kyzystof,

Thanks for the cleanup.

On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.

Nit: the commit message is a bit too dry. I had to go and look what the
difference between the two variants was. I could make an educated guess
by looking at the patch, but still.

If you end up doing a v2, a one-liner explanation of the difference
between the two loop variants would be nice to have.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> index db948da2c4c5..54c49a8423a2 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -394,15 +394,12 @@ static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
>  static int hisi_spi_nor_register_all(struct hifmc_host *host)
>  {
>  	struct device *dev = host->dev;
> -	struct device_node *np;
>  	int ret;
>  
> -	for_each_available_child_of_node(dev->of_node, np) {
> +	for_each_available_child_of_node_scoped(dev->of_node, np) {
>  		ret = hisi_spi_nor_register(np, host);
> -		if (ret) {
> -			of_node_put(np);
> +		if (ret)
>  			goto fail;
> -		}
>  
>  		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
>  			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");

-- 
Regards,
Pratyush Yadav

