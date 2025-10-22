Return-Path: <linux-mips+bounces-11861-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20678BFDB94
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 19:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED74188822E
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 17:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6122E1C7C;
	Wed, 22 Oct 2025 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKpquUQO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1D2DAFDE;
	Wed, 22 Oct 2025 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155724; cv=none; b=hNDGEfJbCLWJVt5xsrLjTBUplSZGrAJN1WmqMeB8PeN9WmExvrlfREFO0ZYBsUanAa6ci3e6hePgYM5Tpc/0EuIeegfX2HOgaWZOnDUqU0xqMgJ6iK54FmIlJGnMyRrYgJ5zreXD4z0bGpeCgVAl1Q/VIPM7t98OtY0+rx1WP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155724; c=relaxed/simple;
	bh=cUY8ixQPrzQuIjFkkA9Tc0PQzAYbO569D26Xok769Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMZ/O0/YOHalmj5RqCnzL89T5iF1nWFpIWQkKbGHHf8a43dCxysjm+o2J7W6ZrjRl2Z9xrVwyqhb82DU4Yv5FxA0NZGsBb62LdSK/phxgR9b6zi4b6ofFCna9wmJZvxmHRkkLlTp3lXOx/DHmlwkvmpID6X4GTlm2cjAtummF14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKpquUQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC358C4CEE7;
	Wed, 22 Oct 2025 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155723;
	bh=cUY8ixQPrzQuIjFkkA9Tc0PQzAYbO569D26Xok769Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKpquUQO8FVraQ/ev144KQ2j9NcIMzPxRY4ZPDrJQnIwdq/JoHa68apGYatwdYOeg
	 16nQDf9aPiQeEYhYuXnLqNLRw2vsjl4bUPWbx7vjUo3Xwqqxrt8LDmhiU2zvNanqZh
	 ulfrek87XtRNnxcIevyLVl0PCKS3WcDpCmYMu2uxgKfIvg8vpHya0zPyPgsInUFEfI
	 7AZWHIxgDzl3wqHTMHIntUFrOFnJqTVytJDnkhrXIeLmT5JKo6Ws7a/ULAnx5UZLGp
	 IHwuI/Vr74+5WqmXmrfeVbooAvLzohwSUB6q0vvuCNWr0y9OR5J/CnBBLab7g9FnSD
	 0tHNcVBqtFncw==
Date: Wed, 22 Oct 2025 18:55:17 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY
 provider on EyeQ5
Message-ID: <20251022-patchwork-plunging-67232b409322@spud>
References: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
 <20251022-macb-phy-v1-1-f29f28fae721@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jjc5Mh3+CKARWUf/"
Content-Disposition: inline
In-Reply-To: <20251022-macb-phy-v1-1-f29f28fae721@bootlin.com>


--Jjc5Mh3+CKARWUf/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 05:39:03PM +0200, Th=E9o Lebrun wrote:
> OLB on EyeQ5 ("mobileye,eyeq5-olb" compatible) is now declared as a
> generic PHY provider. Under the hood, it provides Ethernet RGMII/SGMII
> PHY support for both MAC instances.
>=20
> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: not-applicable

--Jjc5Mh3+CKARWUf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkahQAKCRB4tDGHoIJi
0jnPAP92K/a04IoaqEzduGVMzofF3MGpr5b00WTiq05i+6Hp4QEAooMhYLXairhe
IkapkJAWV3a5p89HjXfu2eN6G5+0mQc=
=9d0M
-----END PGP SIGNATURE-----

--Jjc5Mh3+CKARWUf/--

