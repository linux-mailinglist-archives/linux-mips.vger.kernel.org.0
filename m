Return-Path: <linux-mips+bounces-8965-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76474AAFE35
	for <lists+linux-mips@lfdr.de>; Thu,  8 May 2025 17:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB023ABEBD
	for <lists+linux-mips@lfdr.de>; Thu,  8 May 2025 15:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329AB279331;
	Thu,  8 May 2025 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOTXCCSA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024751A239F;
	Thu,  8 May 2025 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716668; cv=none; b=Z21MbiEk5g3kFQRgK/6uz1ssXHt2Se4oB2ZWx8tHT5Jo1yiuqu1X/oCO3xca6c82/eSMpTdP4bz/K8FUExPs40Zx6GLegJ+jj1nzeCpwu/Zb7DCEO121Is28KmmAITUsuef7WHI0oou35jEwdkHfqdmGjTfiA6iWbQ9H6D/azWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716668; c=relaxed/simple;
	bh=c5bTUndvoSk/LCQ9YKscgEc8izUm7t5jXXikiF5wudk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp7iJpBMO5GxMVzmBOkOG8W072hIf/Eu5+m16QLUw/ffjYvD+BU79y+krBf5OTPrgRHmNcjMwbsTn18NIDfyBi4+BNwOzaPOJz5B8IToEejG67Q6hqMIHQc5VCR4EvAhGw3lf2HHSFIBmR7al8QK7VUTd+PMgC3Sk/Dt9X1WwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOTXCCSA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFC9C4CEE7;
	Thu,  8 May 2025 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716667;
	bh=c5bTUndvoSk/LCQ9YKscgEc8izUm7t5jXXikiF5wudk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOTXCCSAN9DztqZ9FMrJzDmKf6jiC2Kh3BVndlnz1RS1zyLRgt5AKm0bshBwhGKe8
	 R87EDwG1ay23bcheNPX9wu10UgnXvwpbCQGjX1Re/3B1JB0P4hZY3Zdvzf67KswGDU
	 58Q/uoExYXrnS1wtEsxLiCxhEdu7dyXzCAMyqlrnZHLe28CgOmvHUThlpm3UmbOeg9
	 kXiJ/BIPRLBmQ9IwTz0Xezs4crbLXGqlpzgXrF3Kix8/jsh+e8g9dVIOtLi6i9QQu4
	 RbKyNwvVp1K81523KC1vRIu8SaiivRdoWFYpKIuqJ+6wzqapExJBR/gQZXyRbJDWrt
	 3AMRodQYw/EKA==
Date: Thu, 8 May 2025 16:04:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-binding: mmc: microchip,sdhci-pic32: convert text
 based binding to json schema
Message-ID: <20250508-study-pursuable-05ea1564c9cd@spud>
References: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
 <20250507-mchp-sdhci-v1-2-ed29de05295a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4wgHxJmsG+LEB3GD"
Content-Disposition: inline
In-Reply-To: <20250507-mchp-sdhci-v1-2-ed29de05295a@gmail.com>


--4wgHxJmsG+LEB3GD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 06:29:36AM +0000, Charan Pedumuru wrote:
> Update text binding to YAML.
> Changes during conversion:
> Add appropriate include statements for interrupts and clock-names
> to resolve errors identified by `dt_binding_check` and `dtbs_check`.
>=20
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/mmc/microchip,sdhci-pic32.txt         | 29 ----------
>  .../bindings/mmc/microchip,sdhci-pic32.yaml        | 66 ++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+), 29 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.=
txt b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
> deleted file mode 100644
> index f064528effed31f30d1d1c6e0b49c02e215d99af..0000000000000000000000000=
000000000000000
> --- a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* Microchip PIC32 SDHCI Controller
> -
> -This file documents differences between the core properties in mmc.txt
> -and the properties used by the sdhci-pic32 driver.
> -
> -Required properties:
> -- compatible: Should be "microchip,pic32mzda-sdhci"
> -- interrupts: Should contain interrupt
> -- clock-names: Should be "base_clk", "sys_clk".
> -               See: Documentation/devicetree/bindings/resource-names.txt
> -- clocks: Phandle to the clock.
> -          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
> -- pinctrl-names: A pinctrl state names "default" must be defined.
> -- pinctrl-0: Phandle referencing pin configuration of the SDHCI controll=
er.
> -             See: Documentation/devicetree/bindings/pinctrl/pinctrl-bind=
ings.txt
> -
> -Example:
> -
> -	sdhci@1f8ec000 {
> -		compatible =3D "microchip,pic32mzda-sdhci";
> -		reg =3D <0x1f8ec000 0x100>;
> -		interrupts =3D <191 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks =3D <&rootclk REF4CLK>, <&rootclk PB5CLK>;
> -		clock-names =3D "base_clk", "sys_clk";
> -		bus-width =3D <4>;
> -		cap-sd-highspeed;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&pinctrl_sdhc1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.=
yaml b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ca0ca7df9ee991d8402bc4c62=
b1235ef5db2e85f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/microchip,sdhci-pic32.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PIC32 SDHI Controller
> +
> +description:
> +  The Microchip PIC32 family of microcontrollers (MCUs) includes models =
with
> +  Secure Digital Host Controller Interface (SDHCI) controllers, allowing=
 them
> +  to interface with Secure Digital (SD) cards. This interface is used fo=
r reading,
> +  writing, and managing data on SD cards, enabling storage and data tran=
sfer
> +  capabilities in embedded systems.
> +
> +allOf:
> +  - $ref: mmc-controller.yaml
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: microchip,pic32mzda-sdhci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: base_clk
> +      - const: sys_clk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

> +  - pinctrl-names
> +  - pinctrl-0

In a similar conversion for the platform, Rob dropped these from
required. I think you could probably do the same here.
Either way,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/microchip,pic32-clock.h>
> +    mmc@1f8ec000 {
> +        compatible =3D "microchip,pic32mzda-sdhci";
> +        reg =3D <0x1f8ec000 0x100>;
> +        interrupts =3D <191 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&rootclk REF4CLK>, <&rootclk PB5CLK>;
> +        clock-names =3D "base_clk", "sys_clk";
> +        bus-width =3D <4>;
> +        cap-sd-highspeed;
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&pinctrl_sdhc1>;
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--4wgHxJmsG+LEB3GD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzH9wAKCRB4tDGHoIJi
0p23AQDMp3JFuKFp541wH/nqPFup1w8vmSrU1JMUGXVkOUrPGQD/ezUb3G/nFjHF
ZrGifoDSY/m2pXMoLCS2xrA52j9u5QA=
=+53Z
-----END PGP SIGNATURE-----

--4wgHxJmsG+LEB3GD--

