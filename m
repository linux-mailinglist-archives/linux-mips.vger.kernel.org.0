Return-Path: <linux-mips+bounces-3627-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C089058F0
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 18:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7091F22682
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 16:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578B0181316;
	Wed, 12 Jun 2024 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cP86KL6/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279EE16F295;
	Wed, 12 Jun 2024 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718210383; cv=none; b=QZU4my04yhKxZPsBEiCpqYOcOM4Dnp88+IFFCglaMrL/gfAUsc7B5pE1groyHIWFY6PcHOHyulQEO4IgDYi7n3eB7YqNgovGsCxGqQMDPi/cN2RObpLhDMoUCq3NTjXIkv8K9yOkd5UPlNn2HZ/gPpTodnZtrg2ybxMoiAtUJn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718210383; c=relaxed/simple;
	bh=qWfaM8yBCnaXRjLozlXKM6nnSg3HisKZxvVZuwsMHck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0+v1JFSxDyPmq4Fg3E80PGPnBbJn3KlsbB3RZ2Dm/6vmaBtUGxnhJqrMrfCgruYsky8oUjcPBqtoO9CNa/O676eG95birlcNjQYaRvQxw9ZE1459PnemN+ltGolbnMTrAxac4j0WwWoAUIWftrgK6zadnbzlwj31rQh17oK6Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cP86KL6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9893FC116B1;
	Wed, 12 Jun 2024 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718210382;
	bh=qWfaM8yBCnaXRjLozlXKM6nnSg3HisKZxvVZuwsMHck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cP86KL6/vPpMWG3QlQcjDRM+ZP9GPP8idlMEnfA8qC4BWFnP2NpEXti31lZoVXxR+
	 gCP9TQRBe1mWQqGA1CJtjZO1zcY5DwYlzCMnLImLI1q3o4XOlOOxZsOG6TldwkYLIG
	 ELPb8QwfwhQQJVugaIFMV5kpBvu1/+5gyJ2GQSUnhIKPRavvHPF3q88Dg24IaaizMp
	 6CPeBgLOUW6TOxuLeKLGA22cyntWFXbWuDluvDKIsOF2m5qKf8I7ittym+gKougTt1
	 wG9Na7MSuwLYU8Bp0gbXpHI+2Qu+mmcmYwT016tn8/C0MhTLuiuCgE+deHvlkg7282
	 uG2Hs6UPB+bgQ==
Date: Wed, 12 Jun 2024 17:39:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Message-ID: <20240612-unstuffed-figure-966c90af52bc@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uzygx27IuBHEOyit"
Content-Disposition: inline
In-Reply-To: <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>


--Uzygx27IuBHEOyit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
> This compatible is used by boston.dts.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> note: This is a wildcard compatible for all MIPS CPUs,
>       I think we should use something like "riscv" for riscv.

riscv systems, other than simulators etc are not meant to use the
"riscv" compatible. All of the real CPUs use "vendor,cpu", "riscv".
I'd suggest you add specific compatibles for your CPUs.

Thanks
Conor.

>       Should I add something like "mips" or "mips,cpu"?
> ---
>  Documentation/devicetree/bindings/mips/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documenta=
tion/devicetree/bindings/mips/cpus.yaml
> index a85137add668..7f9513f2a540 100644
> --- a/Documentation/devicetree/bindings/mips/cpus.yaml
> +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
> @@ -24,6 +24,7 @@ properties:
>        - brcm,bmips5000
>        - brcm,bmips5200
>        - img,i6500
> +      - img,mips
>        - ingenic,xburst-fpu1.0-mxu1.1
>        - ingenic,xburst-fpu2.0-mxu2.0
>        - ingenic,xburst-mxu1.0
>=20
> --=20
> 2.43.0
>=20

--Uzygx27IuBHEOyit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnPSgAKCRB4tDGHoIJi
0j20AQDghTkOZXHuXRQWhIaFIKM8iIshGhfUbdJ7KYcR5ar2TgEAtMqqgq6HHUMm
ex7eDr9HFacz6fzTAMgXYlg/V8CHIw0=
=6pi5
-----END PGP SIGNATURE-----

--Uzygx27IuBHEOyit--

