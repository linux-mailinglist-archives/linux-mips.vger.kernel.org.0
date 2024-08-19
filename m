Return-Path: <linux-mips+bounces-4951-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA995718C
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 19:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35E0284C9A
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 17:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897A813B5AF;
	Mon, 19 Aug 2024 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGuiYdlZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491928BFC;
	Mon, 19 Aug 2024 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087317; cv=none; b=Akt6NJ+suW170dCO1pM+lIkyLuSCNwd3ycy+CD0O2xcq3eEhL9Kbphn58MR3tyjwQeSpYCkk0LDQsjZZzp/YembGple7fg2jZ4nrWp2cNKrrFn2Ia58wbxfG+z1eYNH0e3OmZhMYZ/WixODbYy6gUWDgjMMnjrJL3JA+Yo5QHj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087317; c=relaxed/simple;
	bh=E3wx3Yy8f4Z4HsNkio0m66ed4QzhHvCCsBlgSiuE7yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF2/+Ie3RivGU6TAiFr8sESiWgEtAcmuKNu4dumYzsP97RDU7d1yK+K2oAjoLMgJZTTmVzl+aELGot9nYq60Jyd++Qqqd/c25KM3+CRLRdSHIdBYQKoTes0qYKSAguAavRdpCTLyU6jI7sOpcGu6Dq3hlc2sDTRMGjzlQRF1G1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGuiYdlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351FDC32782;
	Mon, 19 Aug 2024 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087316;
	bh=E3wx3Yy8f4Z4HsNkio0m66ed4QzhHvCCsBlgSiuE7yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MGuiYdlZpf/fS6Lsr3MsXPxoJoBAsh4wRG0kt/2k3f5Xnkz+VKP0FYzfDv4mrqJZ+
	 Z6tHbi2sUCd6PKoznrsqe2PUuFTBxGqDkcI2z93joXi248VOOujU1LsBWID6N4sbTD
	 jUKLM+CUIRcM1r9vE3WlMGK39nDOTEZx8nIDcblJtK3+vRV+x8zyWPQqGvgNkCaL7i
	 ve/X3CgTr6mPe5hJ9+QAhRiZFQxT0GtgN6mxR2UtV7mKQ4qKywm30KZWXixt69UTUS
	 bq10T4HkhCPYL82xFoaW9UGv49fCBOtb2ECdItVxeL0GjKzo3Q25z5enR3DgN5tn77
	 jt2b1vOwB5sYQ==
Date: Mon, 19 Aug 2024 18:08:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 5/5] dt-bindings: clock: st,stm32mp1-rcc: add top-level
 constraints
Message-ID: <20240819-gatherer-sedan-154904ce49ba@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rQtkFboImljYNJPX"
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>


--rQtkFboImljYNJPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:14PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rQtkFboImljYNJPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8DQAKCRB4tDGHoIJi
0pVLAQDwyIKwfsPuyqXb02vbHEEbL8TGRHM/QQvfFPhvZCI9zAEA71idxnNe3Jq5
wxYq+g9QkUAnqtmBwUD3Hm7yuVfTDgs=
=1VCV
-----END PGP SIGNATURE-----

--rQtkFboImljYNJPX--

