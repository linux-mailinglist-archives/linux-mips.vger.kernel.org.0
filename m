Return-Path: <linux-mips+bounces-10362-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7DB2AF93
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 19:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99BB84E3839
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48EE27B348;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKOZ+3WE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856392773C7;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755538708; cv=none; b=JRtahMtj0stTWGGYzWw6r+RwS2Bm9CzKYmyGMRFvVEObnpHGuqrGKR30KLF/IUrB5Xtj9fkOk4Yc0htCo9tq/yTR0WmwAUjUYfeIY0l13DW6SosnQACaRq/ouj5NdAnrjwtjMrJKs0F36rgcAwzQblnczYr52EFNOlbQYkQZg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755538708; c=relaxed/simple;
	bh=1pBVuLjyy7ynbhC5YoUXbCCJe9KcE2Wm/0qpYZGX5+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdusAAeqOWZKhV629nqhvgjg1O3ZlfNVPLPymmLHHhmtqd1S4YGztdi5vGXMcQnf5lxJUcAW6tIS2D9ISZzL0Cqm5VuV8/kmSxfwsCWT7tlmxDBqA88l3MINqB/yyt18+e/FcasflFxdxxnx0QI7LUbNuN53nqF6NGb/RpNZrgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKOZ+3WE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2A6C113D0;
	Mon, 18 Aug 2025 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755538708;
	bh=1pBVuLjyy7ynbhC5YoUXbCCJe9KcE2Wm/0qpYZGX5+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKOZ+3WEAfIwm8vZRyItZ0bKDrEOSkTjPnSawARV2Ch4yRsx7qx3dLREHwuOIuGIl
	 RnAOg69tqW5xIEk+Qn3lwg/hKDkmRcRnKfDml0AwY+liMsNSNv6LIiVJr7UyrzPJLu
	 xFo5U6NqIaCUCZ9dSDcfLPreLdyjTJIBKVYlCb4F0/PapcR2eES59TBfotmMb06qG2
	 PItJEy/qELjCHmiZqx6RfnnbEYen2EIBE4k8LpNqmHF/SYgTMVahUpq/z4NSqGs6gV
	 CTIt/KK4OarZEkuM+fTVm0G7b3XSmT8cYIEBgp5vwQKo4iDoupHrYOFsGGgrtooUVp
	 6ZC7lVjB/gsiA==
Date: Mon, 18 Aug 2025 18:38:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tsbogend@alpha.franken.de, john@phrozen.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mips: lantiq: Document Lantiq Xway
 GPTU
Message-ID: <20250818-departure-gloss-b99cacb9401e@spud>
References: <20250816132002.3632343-1-olek2@wp.pl>
 <20250816132002.3632343-2-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XaMo6EeDYOS6GU0j"
Content-Disposition: inline
In-Reply-To: <20250816132002.3632343-2-olek2@wp.pl>


--XaMo6EeDYOS6GU0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 03:16:22PM +0200, Aleksander Jan Bajkowski wrote:
> The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../mips/lantiq/lantiq,gptu-xway.yaml         | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,=
gptu-xway.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xw=
ay.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.ya=
ml
> new file mode 100644
> index 000000000000..fcbcd98def46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)
> +
> +maintainers:
> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> +
> +description:
> +  The Lantiq SoC has six built-in 16-bit general purpose timers. The voi=
ce
> +  firmware needs these timers as a reference.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gptu@[0-9a-f]+$"

This is a timer, why are you not using "timer" as the prefix?
Otherwise, this looks okay to me other than...

> +
> +  compatible:
> +    items:
> +      - enum:
> +          - lantiq,ase-gptu
> +          - lantiq,danube-gptu
> +          - lantiq,xrx100-gptu
> +          - lantiq,xrx200-gptu
> +      - const: lantiq,gptu-xway

=2E.the fact that my OCD hates how the fallback inverts the position of
gptu in the compatible!

--XaMo6EeDYOS6GU0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNlDwAKCRB4tDGHoIJi
0mWFAQCoUZtgipeEdjT6o7JXNTlW2+/t0DPCM943r9ic3VXaZwEA9Q43aQUQpRQO
dO5R+ha9bSsFhQuo45sTCAZMz6+BeQM=
=kzRL
-----END PGP SIGNATURE-----

--XaMo6EeDYOS6GU0j--

