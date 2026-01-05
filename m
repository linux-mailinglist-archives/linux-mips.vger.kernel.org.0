Return-Path: <linux-mips+bounces-12745-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FFCF240D
	for <lists+linux-mips@lfdr.de>; Mon, 05 Jan 2026 08:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F94C301E5A0
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jan 2026 07:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D66E1F471F;
	Mon,  5 Jan 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tgd70OPn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397744A35;
	Mon,  5 Jan 2026 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599156; cv=none; b=izdw6ABlSmoj0UBz5CUfTEJiNjGed8D+HniDktIhM+pdfDCEnakc81MM5upTYZys04nufy3mHDEE5XYf1HeWsZYpv3PPyfBnAJFSq7e4F8Sf9FxXzSeScDX/twR1vVBAp+jGLlzNkm4il/qgASgR5GtHG5RCFTJLw5SMcf1cazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599156; c=relaxed/simple;
	bh=k6Tt5yTwHGvGjAYNj5vnutG3De0UqSFPh6CVE9bICIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbqY5bce8ZnFt3jjT6OQNR5mdYc8zEd85OKYmgc5G+Dse8EIghZqgTjmxoAPyL0FOMWzinY3ZF0kOv1iag/EbnXx7hiEzq/CpL8Fz1/jug4Jqku4R8bxCQDTk2mkukrtYeFNl0NtCc9bp3KRJ40ForqPSUndaO+MsDmL5MhMSJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tgd70OPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24ABC116D0;
	Mon,  5 Jan 2026 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599155;
	bh=k6Tt5yTwHGvGjAYNj5vnutG3De0UqSFPh6CVE9bICIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tgd70OPnYQqVw0gUaYhdLwpZd5uyr3gmOOwrOOISPEe1PV+NfPyxEgvyKroSXQFyS
	 RPLee18ZDQreq/UEC8Vzaon3yiJSreHoRw+zRJdWkWWZQP/Eq9UoICMFdwF5ewenMt
	 6f8f1FBgqBx9nZnYCqaaOO6xXsQj1b/ckDCRe6yMQSEmvjZmNj1rIqhoVrVW+oAkv3
	 q/knFwQZk8DXriN2bIqDVH0rS/m/Ofc9M+BXWuoHKFclPvp/aL2hY+Sq4iBYGjO/S7
	 GXAOZZjEyPHFr1x+oLCf9qdvAn47y6gwh+RgAeKt/YjyoAT9CfCc7jyWWOk/Dwl9r6
	 CQHuY5T/Qyg0Q==
Date: Mon, 5 Jan 2026 13:15:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Stefan Agner <stefan@agner.ch>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF
 child loop
Message-ID: <yy6nfsezapap7o2pnbydczoh6376crzr33oibkuwonygxnhsky@ongy4c6cy67m>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>

On Fri, Jan 02, 2026 at 01:49:31PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 4dd6f1a4e797..b7e79b76654d 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2206,16 +2206,14 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
>  {
>  	struct device *dev = nandc->dev;
> -	struct device_node *dn = dev->of_node, *child;
> +	struct device_node *dn = dev->of_node;
>  	struct qcom_nand_host *host;
>  	int ret = -ENODEV;
>  
> -	for_each_available_child_of_node(dn, child) {
> +	for_each_available_child_of_node_scoped(dn, child) {
>  		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> -		if (!host) {
> -			of_node_put(child);
> +		if (!host)
>  			return -ENOMEM;
> -		}
>  
>  		ret = qcom_nand_host_init_and_register(nandc, host, child);
>  		if (ret) {
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

