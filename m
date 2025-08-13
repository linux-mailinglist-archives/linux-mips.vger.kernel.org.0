Return-Path: <linux-mips+bounces-10258-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC6B250AD
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 19:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D62F55A2E6B
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 16:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9DB286D69;
	Wed, 13 Aug 2025 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzytL42x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5062DF68;
	Wed, 13 Aug 2025 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104331; cv=none; b=pKuoNaJupSlwutzVuQ7r27N1Oh80hRNC3abZvsEXi/TaDYMXzVXAfXr4+2fWRpgHK1JmTAME0+BJMwoos0iNtL1Y9+qeLJO/Uv8jxIEGGEK5ycZ9CZsgAta1IBxPgCvRm4piq8Y3a0jBxCIBxh+ZJcGwwcpGMgPnvH31P7hpato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104331; c=relaxed/simple;
	bh=KIj8yRKZn+5Ed7R2bYlN6ypghV5xN0JHlTp6GulnulQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/KxbYN6qSr/ff1gh0SykTIuTwvv6laXZu075QsqqujIClHtFeTlXWrYCV74rnYQwy3fMQgShK7bENi6QfObea8hB7NSa+I9nGdvVF/Fj5LjiQCW2BYI2b1iZXvpSgHDC06o/K3F97wPSG9T8QH85VVM00/SKfwmXq4onQ/TA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzytL42x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F47EC4CEEB;
	Wed, 13 Aug 2025 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755104330;
	bh=KIj8yRKZn+5Ed7R2bYlN6ypghV5xN0JHlTp6GulnulQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzytL42xSAJDY3fDH6Tg8aGWEG8CxSrRH2Zo8fhfMrYYhQY2YiW1SLnV1Nz+shQLr
	 TrrPtvNqbBFWkROMULeOPxGd6mLMmR9kpYkUJO6ZE+VuT5MvY3mOZOj8OaT91dLRmx
	 tQ4XAE/vekTblGpmkeYvWxtgTqhOsjTTxCp4ZVmWHTEmNPFbwcZbdIwi9cK3kcpado
	 9JkGGIdPBu/J7XdxRz8O0g7t6gU5Fo/fMM6Hh/oncOXIU9x0BDIQNzQvpGYYbLpZbi
	 SeDUGdlT+OfaR8FxdlIKy+g8EdM4v/PvY/z2WapJ8VNF6fMcTha6P6XzIYqvDHoJxG
	 WT1nmLP+B2DvA==
Date: Wed, 13 Aug 2025 17:58:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, heiko@sntech.de,
	kever.yang@rock-chips.com, mani@kernel.org,
	tsbogend@alpha.franken.de, john@phrozen.org, masahiroy@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add British Telecom
Message-ID: <20250813-scorecard-sanction-d3ed821909e7@spud>
References: <20250813142917.2053814-1-olek2@wp.pl>
 <20250813142917.2053814-2-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sy/5Z08SDOE3s5yi"
Content-Disposition: inline
In-Reply-To: <20250813142917.2053814-2-olek2@wp.pl>


--sy/5Z08SDOE3s5yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 04:21:32PM +0200, Aleksander Jan Bajkowski wrote:
> British Telecom is a telecommunications operator. It provides various
> home routers popular among OpenWRT enthusiasts.
> Link: https://www.bt.com/
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

The blank line should be before the Link, not between Link and signoff
FWIW.
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 77160cd47f54..e91879137e43 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -243,6 +243,8 @@ patternProperties:
>      description: Shanghai Broadmobi Communication Technology Co.,Ltd.
>    "^bsh,.*":
>      description: BSH Hausgeraete GmbH
> +  "^bt,.*":
> +    description: British Telecom
>    "^bticino,.*":
>      description: Bticino International
>    "^buffalo,.*":
> --=20
> 2.47.2
>=20

--sy/5Z08SDOE3s5yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzERAAKCRB4tDGHoIJi
0rixAP9R49qRJeqsmEulMyZRNTvNzRojYxBZNZJUwbon1QFofgD+LCRXjdpSxpgs
Uw+T6ppFQhKFMkZwHs1FlL/o0BMzPwY=
=LrQ/
-----END PGP SIGNATURE-----

--sy/5Z08SDOE3s5yi--

