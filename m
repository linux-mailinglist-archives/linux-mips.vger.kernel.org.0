Return-Path: <linux-mips+bounces-7053-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2F9F3956
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 19:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACD916A860
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 18:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25B3207A03;
	Mon, 16 Dec 2024 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8otgIh2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF41E493;
	Mon, 16 Dec 2024 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375230; cv=none; b=s6w9UDOll7P+dpTp7HllVPKlK6cgEZ1UOArvZNSgHxTbw9RDNSy/Y21GxtAxmwWYmlsPZGDaN0biMb3zFTEFj/93YUrGGHqJoYGzwVa9YBg9r6SwkFa7tBEM3yZmFK+53z51ZUHcDcAi13/B45Yawfd6uoVTCyCA/o+tJ2xAnk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375230; c=relaxed/simple;
	bh=ZaQG536UeJ963kq03tgE2h6T+EowUyXzuNs7SMRaKlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2h+E/dWVBEfT8VkqFJKyqSJdUi4OZ/z2vZM6wVX+sGRLC22jVK27Wljxs6Vk+BoleKD+qQelZBKrvhrrib66tbiAadoRCYidxCYtfY+PzrgFtgNPnzjJYmjYCQ59WI26QiTrEc4gKpBo1cw5X/RWyELyeYDgwbEobfLCtOOmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8otgIh2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044E5C4CED0;
	Mon, 16 Dec 2024 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734375230;
	bh=ZaQG536UeJ963kq03tgE2h6T+EowUyXzuNs7SMRaKlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8otgIh2jgktQNerxOEt0HNVjEC7a6nGp4BMqW1POaHQCyjmtN0WuRy6ulaRvqIzF
	 jisL8eYolS0n2FoDXyATRZFr+62UPu8qqklHXiS4JFF8eWZdseHWJ9RDJpLFLLF4LW
	 aeqawx4q5SbltF7TMfmX+NqnA4zPHrTUCTDlyj44B38S7cvfRf2Ly5rZ1f74Su5GT6
	 hW7tfbmJLgujW0MDvf/ezyvXskkAJUVMS1ea2rp1z/58K7GjaATS4S0CviY/won6QA
	 d7TUcrxvWbtDu6IvGFS1w0QIWlC9S68Cu8yke9aJe7419m2LuxI/mtc1kV/rp8rFVe
	 2iUA7vjeov33g==
Date: Mon, 16 Dec 2024 18:53:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Message-ID: <20241216-neurosis-untagged-86622f8e2163@spud>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jgYBn6OpsX/kWRIj"
Content-Disposition: inline
In-Reply-To: <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>


--jgYBn6OpsX/kWRIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 04:13:44PM +1300, Chris Packham wrote:
> The MDIO controller is part of the switch on the RTL9300 family of
> devices. Add a $ref to the mfd binding for these devices.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>=20
> Notes:
>     Changes in v2:
>     - None
>=20
>  .../bindings/mfd/realtek,rtl9301-switch.yaml      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch=
=2Eyaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> index f053303ab1e6..eeb08e7435fa 100644
> --- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> @@ -41,6 +41,9 @@ patternProperties:
>    'i2c@[0-9a-f]+$':
>      $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
> =20
> +  'mdio@[0-9a-f]+$':
> +    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
> +
>  required:
>    - compatible
>    - reg
> @@ -110,5 +113,17 @@ examples:
>            };
>          };
>        };
> +
> +      mdio0: mdio@ca00 {

Label here is unused, but that alone isn't worth a respin.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +        compatible =3D "realtek,rtl9301-mdio";
> +        reg =3D <0xca00 0x200>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet-phy@0 {
> +          reg =3D <0>;
> +          realtek,smi-address =3D <0 1>;
> +        };
> +      };
>      };
> =20
> --=20
> 2.47.1
>=20

--jgYBn6OpsX/kWRIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2B3OAAKCRB4tDGHoIJi
0tNPAP9kLXGhnp5Mms+dsDfuxqUIandWEUoKt4Ixh5bi+dYrSwEA1ue1MsPeWWjB
34QeWYTeZ9kMn6H8lNlm5SrnR34bNw4=
=19cX
-----END PGP SIGNATURE-----

--jgYBn6OpsX/kWRIj--

