Return-Path: <linux-mips+bounces-3632-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DAD905967
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 19:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFC91C2142C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 17:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B7A1822D7;
	Wed, 12 Jun 2024 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgzt1hqs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D00520335;
	Wed, 12 Jun 2024 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211700; cv=none; b=JaVt4YBRqoBQ1OKvbvSBWIgWsDTHXQNjsLtfsBCEnz0IBiG3i24NMCpiN3llK1TcFsKCP/tSzcMA74s/r9U6Vlwid6fMa8pLFv24okXu6oamLf7QL1qt4mRo/pstEBr4l/TJblzFbCm+qbvgGLsdnv0Iixw8uS1bwv9KZP8hFH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211700; c=relaxed/simple;
	bh=FtbtPkEu/CAJOaRMod1vFsE5eWvd/eF7e60q6ZZWNBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiCFs6vVEU6/v+KEs+c6pPopQWa154/oC5P3g3TJf/F8N7hF5CRTq7iqhpuqVNudNkRQwIQJcnYO/6uRcZg/BKoTtIot3Sqt89cG4ewwu2b0aWO2/ZsPGEmheQaqkRCxi2Ai4SiuhUC/sJxfcpnTo+meqUxMt+44cwu4/u3x8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgzt1hqs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE35C116B1;
	Wed, 12 Jun 2024 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718211699;
	bh=FtbtPkEu/CAJOaRMod1vFsE5eWvd/eF7e60q6ZZWNBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgzt1hqsw4z7D4sHmmUxoh06b0tjaL9KSZsFqQPFJD0/olIMiasYlPbxuGPCS8rWq
	 SkMN60i5zdH/2goD1VYJYW504gw0f0GXaHaNxNYikijrBGCjwv33XqWh91sGD/Z4cT
	 ttb/ZlRJ8ry2WzN2p8+wLlMRGgRvjfgBzZxmypl38eYb/w5pUL+ltDFNzDlf8BhHN/
	 rvev+MSNQVbnNJc5ccNQ9DQn1GrxrZDpRUca3+eQY2/ly8/acY3I2ZSomVNCpp/VNu
	 ERLNLwpsTQvNfKb8J7mnn/zoGPMvdiDDE29wrCXPyQGLPESMNIcNTcPhmKGXmNbNjd
	 oGLO0eefq+FFA==
Date: Wed, 12 Jun 2024 18:01:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: mips: Document mti,mips-cm
Message-ID: <20240612-napping-feel-c12d52787c6d@spud>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-5-a5b55440563c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y5r+h1jTiZPlEeCq"
Content-Disposition: inline
In-Reply-To: <20240612-cm_probe-v2-5-a5b55440563c@flygoat.com>


--y5r+h1jTiZPlEeCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 11:08:57AM +0100, Jiaxun Yang wrote:
> Add devicetree binding documentation for MIPS Coherence Manager.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
>  - Better wording for register desc
>  - cm -> coherency-manager
>  - schema matches compatible
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Do=
cumentation/devicetree/bindings/mips/mti,mips-cm.yaml
> new file mode 100644
> index 000000000000..9f500804737d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS Coherence Manager
> +
> +description: |

The | is not needed here.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--y5r+h1jTiZPlEeCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnUbgAKCRB4tDGHoIJi
0oOpAPwLiMLkcYTVmHudmjZ65NnDNEjy7hajwVhjYq8VALZWjAD/ScMoqm1gB3HV
sAAsuOikAO4ecHkdjqnThXZ0Cv38UQQ=
=l1vO
-----END PGP SIGNATURE-----

--y5r+h1jTiZPlEeCq--

