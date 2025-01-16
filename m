Return-Path: <linux-mips+bounces-7476-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE008A13672
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 10:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F482167E34
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 09:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0001DC184;
	Thu, 16 Jan 2025 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3GJHBpc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DAD1DB54C;
	Thu, 16 Jan 2025 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737019142; cv=none; b=QSjdwvr8drlUP7Kb9H4Kx4eY4C8QQzgHp+x94YI1m0YeqVR9sp/kR6btgFVdBrLGx8ALPRq+H2svi+DcDbyNIaP29rw4iWbyqH1KRRx7KTvq9fgrfOlvBLZXcBmF1lyOftoMVyFjHxUqyK/cVc4FVCNZojnDASIUIZchrJ+ab1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737019142; c=relaxed/simple;
	bh=7pk7ut8lAkUHAourc2vOYc0b3mK1S4RBHBd8UWecoFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPLj9IapXYeDp6mD/FvM4/wVBpthD9DBzy+eqgkrEceILAz1iS1+AntqbxzHMDAXpcfZxAmwhnhungvg2zU6l4uaGrb++39AStMWhl/0ZAxvgZDnn0mVPQTLR8/lwJU9VFsq5dRjjwhE02jYITFFUd2BLPWhzv1OCpfwprOUZog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3GJHBpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F4AC4CEDF;
	Thu, 16 Jan 2025 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737019142;
	bh=7pk7ut8lAkUHAourc2vOYc0b3mK1S4RBHBd8UWecoFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d3GJHBpcWIYQO0ZcHJoaYw4ArQ/p/Y1stJABY22IIzlaIkewce62OHwnNodXTU+Bf
	 vOuxO4FwS7qyrChhzmyEJb4NzaKG6gPjMbHCUe1mjVeLUWLPRwnsPWemvkJ9zzhiq/
	 IGnIVGWoQqvoQ9Dh5yGDK0T3oMYOIYa23MaFcjmIvCVXMf7uGASVeqX0Ni17owdfJ9
	 szGO5FKIlQ7rlgRQYWKnORpMsP5PMVK9vXsO4EFtpkHeHtZ5M8Z0SeTxCE1urmq/Lc
	 RXakyoF4x10neJy7oHRKD0q63XyQUBuTARCG0J+H+3r5ISCSqY6DxXxS4D771SM3qz
	 rOeINwm8wo0Dg==
Message-ID: <1d6833ba-3bf5-44a6-a5e3-6bef76fd640b@kernel.org>
Date: Thu, 16 Jan 2025 10:18:57 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mips: dts: ralink: rt2880: update system controller
 node and its consumers
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-clk@vger.kernel.org
Cc: sboyd@kernel.org, mturquette@baylibre.com, tsbogend@alpha.franken.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 p.zabel@pengutronix.de, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, yangshiji66@outlook.com,
 linux-kernel@vger.kernel.org
References: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
 <20250115153019.407646-3-sergio.paracuellos@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250115153019.407646-3-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 16:30, Sergio Paracuellos wrote:
> Current RT2880 device tree file is out of date and must be merged with real
> device tree file used in openWRT project [0]. As a first iteration for this

No, that's not the reason. Whatever forks have, is their problem. The
reason is that you are improving or adding here missing bits but each
bit must be justified. Again: whatever is in OpenWRT is not
justification. Justification is that device is like this, SoC is like
that or DTS is written not according to bindings.

> changes, align the current file with the needed changes for system controller

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")'.

Use proper commit syntax. '' are wrong, missing commit word.

> 
> [0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/dts/rt2880.dtsi
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/boot/dts/ralink/rt2880.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/rt2880.dtsi b/arch/mips/boot/dts/ralink/rt2880.dtsi
> index 8fc1987d9063..1f2ea3434324 100644
> --- a/arch/mips/boot/dts/ralink/rt2880.dtsi
> +++ b/arch/mips/boot/dts/ralink/rt2880.dtsi
> @@ -1,4 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
> +
>  / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
> @@ -25,9 +27,11 @@ palmbus@300000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  
> -		sysc@0 {
> -			compatible = "ralink,rt2880-sysc";
> +		sysc: syscon@0 {
> +			compatible = "ralink,rt2880-sysc", "syscon";
>  			reg = <0x0 0x100>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;

Nothing from here is explained in commit msg. Why this is suddenly clock
and reset controller?

>  		};
>  


Best regards,
Krzysztof

