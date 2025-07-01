Return-Path: <linux-mips+bounces-9583-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9CAEF0AA
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 10:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682351BC50B6
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 08:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748982620F5;
	Tue,  1 Jul 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhASyXBS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B442AA9;
	Tue,  1 Jul 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357780; cv=none; b=K49e0Yl3CriMLNcQsxO7ltPeh+jodTfi+Q8Os7gskZl0o0NmMbxoaYQdqdptUkEQm0AekJ9Sec0VcJy0DQbIcqBu4yLYKQeiOiFQsjoCpOfecrZczmsUufNfn1YB4hkJP5pRvDkrLxc7M3p1Cm3UA002J9m1eOng1FdZThx1a6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357780; c=relaxed/simple;
	bh=lkyQWlDYZofRSdo3cjmJVwtr+h8AbrUJVHwsg1OHwAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPhvJhalDD93lc8Xs4djyqejIiVo6xV3mc1j3mQXjZWHZl+Py8LKtL618rKasKcENYxy0ejc5+AmOe9tIIvTMZgQKA/UJtYNmYyfV+D9mIAF/9aS5YP9VWoht0CsaUDEzRgZ6wHci7lTi5VoPFMWfXtmJAxjmJENYJoa1cJlJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhASyXBS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10349C4CEEB;
	Tue,  1 Jul 2025 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357778;
	bh=lkyQWlDYZofRSdo3cjmJVwtr+h8AbrUJVHwsg1OHwAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhASyXBSp1TfbTVVt9FzAonfgB5IzVQg25SEFAEiWqtr24f8TCOMdbHdPDore/c+c
	 BSlhDV0j1Y+DuRr7e2rDUhv7NRmdZd4awvExo6UVAZyZkEQuLQCPdRfdSqaRbM/cnB
	 MeE/FK/cZvXYRUM9m4u3qZ/lxDySrM3wdS97caPomlAmmWg+kotBptY9W7OTj4h6bQ
	 m1wTjrml48N/8bJh++SLxzDCsKrJ9V+9aVTs8LLJEe3iQa6Ejb8M0x3i1GHuDr8bLq
	 Y/gOPtkpaC49ptHNe9wriifPqwopfTYVKozbsI6M6c3CjOca7exr0plX8bzyCasItT
	 6cRwoOS8EvGHQ==
Date: Tue, 1 Jul 2025 10:16:15 +0200
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
Subject: Re: [PATCH net-next v2 01/18] dt-bindings: net: cdns,macb: sort
 compatibles
Message-ID: <20250701-archetypal-teal-of-virtuosity-9a9e9b@krzk-bin>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-1-ff8207d0bb77@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250627-macb-v2-1-ff8207d0bb77@bootlin.com>

On Fri, Jun 27, 2025 at 11:08:47AM +0200, Th=C3=A9o Lebrun wrote:
> Compatibles inside this enum are sorted-ish. Make it sorted.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


