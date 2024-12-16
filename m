Return-Path: <linux-mips+bounces-7052-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C24369F394E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 19:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7701880A03
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 18:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF81207667;
	Mon, 16 Dec 2024 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/g99SEG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4AD26AD0;
	Mon, 16 Dec 2024 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375178; cv=none; b=p0RpCNnItn2wsRkw9z/RukSWmhsKwwhE/wN9liUyKAJfkyC9E8f73gHZi4XnCjqwFf62Ci/ADranp8lHZX79BgZm7B5wQztUT5zz6UZhWsB6vLedp8phbBX1NSdpDinhq6tOR68KN+Q5jgoJGFIoGKU1/SGxIOv/KuDJML8IE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375178; c=relaxed/simple;
	bh=bZj65SuWGaVz4U/Mw2gmR6WaYQy9k6lXJ41s44xx/RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur9fPGaoLAthiDToovDz1WpaNKo4Zd7BzLZNrCbg2HT20YHPJaVLRjnfozy4xrmywgd8YFLH2gl3ymTq2CI2avr8isL9rg9q7oq1hT3FqP+b+gNFysMmhVY6zwd9mhX515r1JQvtZU/KMkWaBrJ7aMgVjWhWV+4uwjWAUPD9Q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/g99SEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BA0C4CED0;
	Mon, 16 Dec 2024 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734375177;
	bh=bZj65SuWGaVz4U/Mw2gmR6WaYQy9k6lXJ41s44xx/RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/g99SEGN/NQKwNiJwJAGb1LcyKRicMc34/+BN1AcNMh3Og82pxHQwT7F5RmhWFNb
	 HxSpMe1mT2c/Pty6hrjZVoPbA23i7RlxCorFz1sIFtbqrhiBcYPnDVaZFmRPQ/SYhx
	 LuqIQTZ9Zr2aMURY2T/ae3sPic8u4bQt3Q5C4rtjI/XYqe9RhiN4CHvV80bA5HivAK
	 qViLjyxF1b67Vpgz0oiNkhHCBF/q6L3obll5t/DBI/JVf1YCNTY7IVQMYoRZeOwzV/
	 LIMiDZ8U/zSvHIiNChGj+EdXMs/eZOxJYnZSU6F0fOxnnBSa2G/TaO3e7pKuMGOUh0
	 heGeGOiH5JHXg==
Date: Mon, 16 Dec 2024 18:52:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <20241216-native-velvet-1d2b765c8b48@spud>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RjFy7T1TUF+hKGbL"
Content-Disposition: inline
In-Reply-To: <20241216031346.2626805-2-chris.packham@alliedtelesis.co.nz>


--RjFy7T1TUF+hKGbL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 04:13:43PM +1300, Chris Packham wrote:
> Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
> controller is slightly unusual in that direct MDIO communication is not
> possible. Instead, the SMI bus and PHY address are associated with a
> switch port and the port number is used when talking to the PHY.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +      realtek,smi-address:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: SMI interface and address for the connected PHY
> +        items:
> +          - description: SMI interface number associated with the port.
> +          - description: SMI address of the PHY for the port.


I don't really understand this property, but I also don't understand the
MDIO bus, so with that caveat
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RjFy7T1TUF+hKGbL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2B3BAAKCRB4tDGHoIJi
0hDmAQDGIM6QOqVJnvrAzEY9PWAcwC4iB4JguSLH5WGfRQSL1QEAg9RZGvhlvVQA
Hc3ogkUW1agU0/LN13T7EEjzcYlm2wQ=
=aj3T
-----END PGP SIGNATURE-----

--RjFy7T1TUF+hKGbL--

