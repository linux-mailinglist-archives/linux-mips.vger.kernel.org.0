Return-Path: <linux-mips+bounces-3803-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E596911112
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 20:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30902819AD
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D7A1C0059;
	Thu, 20 Jun 2024 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOmTno0Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26CB1C0052;
	Thu, 20 Jun 2024 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718908021; cv=none; b=MeQOyW1aqbJGqK7tUTqJdyEUwf9zgo6WD7AqkWeeq6btnxAoRIjXtMxtR9y0AOEJieeO8I145MGLjOLSh3LSoIE8lK9rdP/AvdmCPrN+wikQrSHmmqjScM0zFVy2AqV4oBSwVdVfP4cgm1iCGBv/v7422EHlCLogjT7ZjdgIUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718908021; c=relaxed/simple;
	bh=Npw3k9d4pOutQAzbANjN50tc75Fu4ciumJhM6mJHTaI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=RcwVvziCk5NelpivnplSV4kU9AMUejA1W+xKdU5ErNO//p1crVEBsGstGBGJ0+vPlsNRgSnW7N/0Txw5hZeAId7/LFVZR+p3XQt5UyIyyvWD4A+m/XHrg/4vz1vufHH+UgFLy3pX37lvAcd55zXjHl+/dgnRqhwFSJV2Lh1/j5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOmTno0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18134C4AF0D;
	Thu, 20 Jun 2024 18:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718908020;
	bh=Npw3k9d4pOutQAzbANjN50tc75Fu4ciumJhM6mJHTaI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bOmTno0ZAI/lrVwWk8qZeZQp/7E/IKb2Zd/nPKbHfQIXzdr4xKlznfmGOBnZ19kmz
	 5t0O0cirHqQ82XIkzwF1JS0GWfDBqVYHz+sLqD1uO16yYfORLy1Hrl5W6Gry3GkAbI
	 TCNjzb4VuuaFyzxCG5d+teNDRnRF5uhhOFUdyZprHz1qQ0qS6uRUPSE2CgQtV4ISQT
	 jRqL15VjUnjBfyZrsfvdIoZvYcgP9hKjZn2/VTDJRx0ahRaXV4k0nQJEhY0G/EhPpa
	 MHJmow22NZFWdVY26rcRCvMVmRW40oJzvm6b95dV45V9Uws1/U2mpez6vVY2wGhUgX
	 K2uIZa0Egkg4w==
Date: Thu, 20 Jun 2024 12:26:58 -0600
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
In-Reply-To: <20240620-mbly-olb-v3-4-5f29f8ca289c@bootlin.com>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-4-5f29f8ca289c@bootlin.com>
Message-Id: <171890801727.3178289.9824854320457865934.robh@kernel.org>
Subject: Re: [PATCH v3 4/9] dt-bindings: soc: mobileye: add EyeQ OLB system
 controller


On Thu, 20 Jun 2024 19:30:56 +0200, Théo Lebrun wrote:
> Add documentation to describe the "Other Logic Block" system-controller.
> It deals with three platforms: EyeQ5, EyeQ6L and EyeQ6H. First two have
> a single instance, whereas EyeQ6H has seven named instances.
> 
> Features provided are:
>  - Clocks, children to main crystal. Some PLLs and divider clocks.
>  - Resets. Some instances DO NOT have reset.
>  - Pinctrl. Only EyeQ5 has such feature.
> 
> Those are NOT the only features exposed in OLB system-controllers! Many
> individual registers, related to IP block integration, can be found.
> Additional features will be exposed over time.
> 
> We simplify devicetree phandles to OLB in two ways:
> 
>  - Compatibles exposing a single clock do not ask for a index argument.
>    This means we use EyeQ6H OLB south (it has four clocks):
> 
>       clocks = <&olb_south EQ6HC_SOUTH_PLL_PER>;
> 
>    But use EyeQ6H OLB east (it has one clock):
> 
>       clocks = <&olb_east>;
> 
>  - Compatibles exposing a single reset domain do not ask for a domain
>    index, only a reset index.
>    This means we use EyeQ5 OLB (it has three domains):
> 
>      resets = <&olb 0 10>;
> 
>    But use EyeQ6H west reset (it has one domain):
> 
>       resets = <&olb_west 3>;
> 
> About pinctrl subnodes: all pins have two functionality, either GPIO or
> something-else. The latter is pin dependent, we express constraints
> using many if-then.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
>  MAINTAINERS                                        |   2 +
>  include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  21 ++
>  3 files changed, 397 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml: ^.*@[1-4]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.yaml: oneOf: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.yaml: oneOf: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml: ^.*@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dtb: /example-0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620-mbly-olb-v3-4-5f29f8ca289c@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


