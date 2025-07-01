Return-Path: <linux-mips+bounces-9585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F305CAEF0C7
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 10:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0671BC3977
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 08:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D80C26A0DB;
	Tue,  1 Jul 2025 08:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xa+mrao6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDFC202995;
	Tue,  1 Jul 2025 08:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357987; cv=none; b=OlVgKB2vndmcq7y2KDtB/9zGDUM5S0P/0iCAz1v2MLXUZl74KgHlGetCWQWBBiQJTuAuQQdi3LpvHx0MmISe5695lXdz4Qaz6lSJqLWTdl6DO4j6Rp20hSgah4MdBfeUg/U+VWavH3PMJTiGtClLveHRwzlCdRTFHF3PLMe06TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357987; c=relaxed/simple;
	bh=noDPpUqNBlR3C1l21VfaQdGGoXDiw11U2/HL+tU819c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnMvziQkhejnj7S+frqb/pbS/1w1davMf6w3NkVMuEoVBLFTQQazSvAPE4yZrRkZC8KDiWrSZXrSaePwplGIz5qWhoJsqNosiYbawNYNSUNmI3j1avmpiTwxnwccSscE1Qy/g0Ue+iet3s4dPVQiN8P6PdT3jPwZVVpgLTXyBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xa+mrao6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F7DC4CEEB;
	Tue,  1 Jul 2025 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357987;
	bh=noDPpUqNBlR3C1l21VfaQdGGoXDiw11U2/HL+tU819c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xa+mrao6L0WNrIkAf7cSiPnL+A0XZrn96x1cTOaBOzHD5akO255zfXAJYH/HCP5nW
	 4tX+mCvc/HL9m/CfiK9p0ZcqpP6wLKg/MgvLFEdZmcfxizOLmLNJK3OKM1klOZ+/11
	 p7/yYB3jnApoK8yp2NoEa2jrQ8bREGd9n/E4z+kPVH4FtIZZvCVtBbz2YqlQlmkTPq
	 R3G+UXVUUECJI/tyNQgmCBgoMa17+Esa/eZnTLS0uWQi4XuvvvlwA/JHKc2Goa/Gk8
	 Fyar7I34ltkPlyO6CjGZiVT0fvKw50OBTPq1GFIVFkPE8IuB1w7aSRWu5uo6l7oO0A
	 3YLh26PiUW5IQ==
Date: Tue, 1 Jul 2025 10:19:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, Harini Katakam <harini.katakam@xilinx.com>, 
	Rafal Ozieblo <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, 
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 03/18] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
Message-ID: <20250701-spotted-crimson-puffin-dffabd@krzk-bin>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-3-ff8207d0bb77@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250627-macb-v2-3-ff8207d0bb77@bootlin.com>

On Fri, Jun 27, 2025 at 11:08:49AM +0200, Th=C3=A9o Lebrun wrote:
> Allow providing tsu_clk without a tx_clk as both are optional.
>=20
> This is about relaxing unneeded constraints. It so happened that in the
> past HW that needed a tsu_clk always needed a tx_clk.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


