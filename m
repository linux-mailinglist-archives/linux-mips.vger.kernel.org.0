Return-Path: <linux-mips+bounces-3853-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37D9133CB
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 14:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050862831E4
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 12:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BDF155A4E;
	Sat, 22 Jun 2024 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCWnE1po"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166CC14D282;
	Sat, 22 Jun 2024 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719058293; cv=none; b=oR/9Y0sL+RzdHsPsI8utEQPar6PZelU+DNIFsX8CNX4Wfka/2EwU1CI9Ox68OltV3cTAHj3WztPhOaQ8bNkbaiUyIthTMRm32EPbx57MVucLp3IRR1R86Mq/UN9aJQLg7FK236RF+ACtrbvviGUBDGSiuA5tYV4IUMgLt4fyOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719058293; c=relaxed/simple;
	bh=p9+zKd85VlH7wxYA1VEPWlG2o50BybxPIWVI6EowLkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6EJ/a5oSgh0I7fj9ySExCRsa8CDWjSP9rs1rGNRQehPcCsnfYwwQqO0EXnLBXZPyHI5Ftji/Q9e7bOrePLgDoUE9Cmp2Wx6FTfNLnrzrbVZNQx47XDqAmiRJMpPGxpeFmwLKa5SjDIxmlYB/94/9MH3+6hJTlcSmOe0ZvwCdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCWnE1po; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28363C32789;
	Sat, 22 Jun 2024 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719058292;
	bh=p9+zKd85VlH7wxYA1VEPWlG2o50BybxPIWVI6EowLkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCWnE1poQe/xT5OWv75h2G5p4+SFg63ICLctmxRbv5CiI3wRU6XJd6k7V8pwBlpid
	 PVHTr94RkPlawgshrfzkd0CuAd5TSH+vtFBP4D6CCiaM21TN5y3orI6GoI7PKLL1oj
	 8f4ENSLeglSV7yik1fmpgDsUd5gtaK1NTuaJ/391PyHgdIwLzP8O0T30gAffpOyc7L
	 mdgMyywr+ZnYyOmee+Y447L2kFWCwhwwbRWggWjGNp/uZVO1130/mJjA+S11uDorYZ
	 hcFLCUN3cfmoJp6ip/1Th0r0KEw4vdhrnxByEqpf3LKv6b2+d55Dsx0DmcwrR8l8NC
	 VEY4mPft+5O5g==
Date: Sat, 22 Jun 2024 13:11:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org, paulburton@kernel.org,
	peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com,
	john@phrozen.org, sander@svanheule.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH 2/6] dt-bindings: timer: Add schema for realtek,otto-timer
Message-ID: <20240622-dagger-willpower-8dc828553384@spud>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
 <20240621042737.674128-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sgReacbdNMQBuDUw"
Content-Disposition: inline
In-Reply-To: <20240621042737.674128-3-chris.packham@alliedtelesis.co.nz>


--sgReacbdNMQBuDUw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 04:27:33PM +1200, Chris Packham wrote:
> Add the devicetree schema for the realtek,otto-timer present on a number
> of Realtek SoCs.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../bindings/timer/realtek,otto-timer.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/timer/realtek,otto-timer.y=
aml b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
> new file mode 100644
> index 000000000000..b6e85aadbc99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/realtek,otto-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek Otto SoCs Timer/Counter
> +
> +description:
> +  Realtek SoCs support a number of timers/counters. These are used
> +  as a per CPU clock event generator and an overall CPU clocksource.
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +properties:
> +  $nodename:
> +    pattern: "^timer@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - realtek,rtl930x-timer
> +      - const: realtek,otto-timer
> +  reg:
> +    minItems: 5
> +    maxItems: 5

Since minitems =3D=3D maxitems, can you just make this a list, and define
what they all are? Ditto interrupts.

reg:
  items:
    - foo
    - bar
    - baz

etc.


> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 5
> +    maxItems: 5
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer0: timer@3200 {

The label here isn't needed FYI.

Thanks,
Conor.

> +      compatible =3D "realtek,rtl930x-timer", "realtek,otto-timer";
> +      reg =3D <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
> +            <0x3230 0x10>, <0x3240 0x10>;
> +
> +      interrupt-parent =3D <&intc>;
> +      interrupts =3D <7 4>, <8 4>, <9 4>, <10 4>, <11 4>;
> +      clocks =3D <&lx_clk>;
> +    };
> --=20
> 2.45.2
>=20

--sgReacbdNMQBuDUw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZna/bgAKCRB4tDGHoIJi
0gbnAQC9gPP443xGmOaaeQ56ad76zWt00F/OOmPE57ItyhpruQEA+IF6V4BtxTe6
3J1e4M0BTiXkKtYVuJZKI6yUQ11NNw0=
=f9wc
-----END PGP SIGNATURE-----

--sgReacbdNMQBuDUw--

