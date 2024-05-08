Return-Path: <linux-mips+bounces-3162-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8EC8BF704
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 09:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07E2D1F23E38
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745DB28387;
	Wed,  8 May 2024 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRe5l1wB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC2D22EF5;
	Wed,  8 May 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715153328; cv=none; b=FM4vdLgAhdzRntN5gyMPZnD2mmy8elU/7PnIVrGCpZhmmusxwZPXNOCMvlVMXPaQoPn6VJ9C4zG5gDAx/QIi1et9sJqM1Z25u3PpbRzQz74FP22TLXbPb1AuKTs1O2r1fYR+c4J4Yeq6+e0BwIY9bMASZTtrHp2OTQeubBcN9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715153328; c=relaxed/simple;
	bh=YA3v3y8udHRYWjzxIZShcq66CRDcub/rDzX+f6h+13M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl58dgCAIIo5fB9uSDSn0z8WXDkNZQ+AJ3coys4tYltcXaaN0iTwUNxaftav17is6XGU0TVEQz9GRRDVMpem4kjMDkMd/Ud+yWALC0ADuA1sxHaMmrRVvmoCeloVsUKiqpmkM0vlLdyx/yA6Yb22DOlecNY/CjMdzwt6gJRQ62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRe5l1wB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ECAC113CC;
	Wed,  8 May 2024 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715153327;
	bh=YA3v3y8udHRYWjzxIZShcq66CRDcub/rDzX+f6h+13M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jRe5l1wBuYBydqwX6feUGrrfHUkZ76D//acOjszQuakgqYFSPYdZWrHxSzbg24bDB
	 iTQN17/IEVwfcESLOIeQmBorrh5i0CIZXW9vB7miF9KmdzoMlu2In1KmzKEiAwTZQS
	 kjZIqnA3BJ06k/sH6TeiyJFCQ79//Y8PhQfzUTXAbiQoa1+Ov621MtZpABG+Pken6V
	 fFwC4RuEjWCVZxDpM04goL+TKDxYOzx5gkKLR/AF7EgyYJgJCBcQc+dQX6NMc4VRUA
	 QM1afoGNwo0qXk1Ds95GWZs16MW/IqBhi/Cp1f2gKtpqljZ/5wA1AXtazv2stTYhSW
	 bUbq8PkP4p1cA==
Message-ID: <7c4689c9-34a8-454a-a514-8ff0c77d74a8@kernel.org>
Date: Wed, 8 May 2024 09:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] MIPS: mobileye: Add EyeQ6H device tree
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
 <20240506-eyeq6h-v1-2-f29b5269cc43@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240506-eyeq6h-v1-2-f29b5269cc43@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/05/2024 18:16, Gregory CLEMENT wrote:
> EyeQ6H (or “High”) is an other SoC from Mobileye still based on the
> MIPS I6500 architecture as the EyeQ5. The 2 clusters of this SoC
> contains 4 cores which are capable of running 4 threads. Besides this,
> it features multiple controllers such as the classic UART, high speed
> I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
> interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
> also includes a Hardware Security Module, Functional Safety Hardware,
> and video encoders and more.
> 
> This commit provides the initial device tree files with support for
> UART, GPIO and pinctrl, as well as fixed clocked.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts        | 22 +++++
>  .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     | 52 ++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi       | 88 +++++++++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi            | 99 ++++++++++++++++++++++
>  4 files changed, 261 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
> new file mode 100644
> index 000000000000..ebc0d363fbf8
> --- /dev/null
> +++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2024 Mobileye Vision Technologies Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "eyeq6h.dtsi"
> +
> +/ {
> +	compatible = "mobileye,eyeq6-epm6", "mobileye,eyeq6";
> +	model = "Mobile EyeQ6H MP6 Evaluation board";
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x1 0x00000000 0x1 0x00000000>;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
> new file mode 100644
> index 000000000000..8bb806eb567e
> --- /dev/null
> +++ b/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2023 Mobileye Vision Technologies Ltd.
> + */
> +
> +#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
> +
> +/ {
> +	xtal: xtal {

You should use common prefixes or even preferred clock node name.

https://lore.kernel.org/all/20240430180415.657067-1-robh@kernel.org/

...

> +
> +	soc: soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		compatible = "simple-bus";

compatible is *always* the first property. This applies to all your
patches. See DTS coding style for the order.

Best regards,
Krzysztof


