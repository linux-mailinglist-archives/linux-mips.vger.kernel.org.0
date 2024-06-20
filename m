Return-Path: <linux-mips+bounces-3802-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33943911110
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 20:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE251F21E49
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737081C0048;
	Thu, 20 Jun 2024 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sH0IQHW6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2111B5819;
	Thu, 20 Jun 2024 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718908019; cv=none; b=H/Nwhk0V0grKYEFUFZQXKuEfhRe5zj+f5mT6Ks7p9vl/nvs5K2O8F4CjEYTKxJXoMIGsWobL5RzPZkxbnlRUUQWrw5fWvUMjnICqnyKf2rtiof1UNIm4uiBgg5sQOADDv5EneUNaKiwBs2ke72ebU0JFW2FWcVjs4f3qX9wJPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718908019; c=relaxed/simple;
	bh=GCVz56YUsKhMOPZ3/lT8irkwPfCF1lu1XjYmgk8WXFo=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=juKOzPh7OqMfudfwCAVhQ2cydmFjgw1jCT/5wzlQ3n1oGzOcsoxGOYDIy+QRWagq2PoSQO8RfUemTVEXjBgnfI+mgGRPr3jD9pXt5+7yc8gq9t8p3eA6o3eovWlGk04ser+T3FdxejLJBSktcpfHzUQUFvHAUVmp+om2Opyy6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sH0IQHW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5620DC4AF0D;
	Thu, 20 Jun 2024 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718908018;
	bh=GCVz56YUsKhMOPZ3/lT8irkwPfCF1lu1XjYmgk8WXFo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sH0IQHW62SBgLfg2w1RlHsuXBIjJKjKgC2GKV6jn5aNfgOWnsLrmbkRnSq1oBuq9s
	 yNMFt0FuMhrxubu7q2VOFDud2LdMWRSz4zrgjNH8KKFJKnB55wdy77CN3bv6AfBImw
	 CPKPJ96Y4OK+3COJ8NRZtzFerQN9DXQgnWe1a0WBefVHD/IPAIktInzcbY1/O3VMDJ
	 X1O8GbAgk412PdDUnyMcHZ88gfF3iiv7Z8r063njG8NrS79wXc9NkjZbIn8Uf/ngLY
	 eTH0HccRIvkNfVvTSr8q3aUu2DmhrL1WGocYNgq4M8votV1TsC2gRbyCfOaOb6foC7
	 CZr6CaHy8SyPQ==
Date: Thu, 20 Jun 2024 12:26:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
In-Reply-To: <20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com>
Message-Id: <171890801579.3178249.13779438329936311446.robh@kernel.org>
Subject: Re: [PATCH v3 2/9] Revert "dt-bindings: reset:
 mobileye,eyeq5-reset: add bindings"


On Thu, 20 Jun 2024 19:30:54 +0200, Théo Lebrun wrote:
> Switch from one sub-node per functionality in the system-controller to a
> single node representing the entire OLB instance. This is the
> recommended approach for controllers handling many different
> functionalities; it is a single controller and should be represented by
> a single devicetree node.
> 
> The reset bindings is removed and all properties will be described by:
> soc/mobileye/mobileye,eyeq5-olb.yaml
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/reset/mobileye,eyeq5-reset.yaml       | 43 ----------------------
>  1 file changed, 43 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dtb: /example-0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


