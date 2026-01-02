Return-Path: <linux-mips+bounces-12718-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B7CEF6E0
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 23:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94270301174F
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 22:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F5022F772;
	Fri,  2 Jan 2026 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="gPi+yOgI"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E894224FA;
	Fri,  2 Jan 2026 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767393086; cv=none; b=nMy5w/oOhFwLIzsGqP6SU9DzFI8SKTts3VSjTSAJZE6JaPB8lwnqIaGlTrcuBwWXQJAjzBguf7LNG+vG/7zunJOVwX8S7Cc0cBvSBV4mz665DVdOBbnvBD/CofFu4ntTGza5T3NYdvwlre0/RMipcD1+ii9MJxRlM7j4Tl0OLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767393086; c=relaxed/simple;
	bh=Ayzy4d12cCBIDnDvxTp6pffsaMCVkd33OsiCXsJGxJc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UMWePh7hPmppI4xXrfHebUDnfkRMMIuHjghWMHxAsM4U6A4hX/fSTHA4mvW1h4dWSEc0h0v/iOSdzZRI3PDq4USQ7Zh33ctTEmV6xzRQnsYejm+mKpgBwl9iBRVoT+gpNRizIqfgY0SfFMshbF6WPwlgvvC3KHDK4M0za3DlE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=gPi+yOgI; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1767392595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=61H6RqsGuCa4a5uaIvZ0gNRDCPUVUQgGp5iWxLp0eXQ=;
	b=gPi+yOgIHaXxLndZNYkjdzjFO/QcOh/jMHayuu23Slzgml8v5JJMwuqOPjlcwB2noz0hn+
	ufbyGL8LfP4mlYZyYQWhThU0cBtTESAvYHK2/TUIL/P8P9tQG5fJ6/10eWfHi134RLMUPE
	TWgRuO4+cEfKFN9diizuZMUOvfPqzlg=
Message-ID: <5f4f0697622ee26db9c3e09b1a8b64157666eb0b.camel@crapouillou.net>
Subject: Re: [PATCH 3/7] mtd: rawnand: ingenic: Simplify with scoped for
 each OF child loop
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Brian Norris
	 <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Miquel Raynal	
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Manivannan Sadhasivam	 <mani@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Tudor Ambarus	 <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle	 <mwalle@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Date: Fri, 02 Jan 2026 23:22:12 +0100
In-Reply-To: <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
	 <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Le vendredi 02 janvier 2026 =C3=A0 13:49 +0100, Krzysztof Kozlowski a
=C3=A9crit=C2=A0:
> Use scoped for-each loop when iterating over device nodes to make
> code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index 47dc3efcee92..f1e2c82936b3 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -438,7 +438,6 @@ static int ingenic_nand_init_chips(struct
> ingenic_nfc *nfc,
> =C2=A0				=C2=A0=C2=A0 struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct device *dev =3D &pdev->dev;
> -	struct device_node *np;
> =C2=A0	int i =3D 0;
> =C2=A0	int ret;
> =C2=A0	int num_chips =3D of_get_child_count(dev->of_node);
> @@ -449,11 +448,10 @@ static int ingenic_nand_init_chips(struct
> ingenic_nfc *nfc,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	for_each_child_of_node(dev->of_node, np) {
> +	for_each_child_of_node_scoped(dev->of_node, np) {
> =C2=A0		ret =3D ingenic_nand_init_chip(pdev, nfc, np, i);
> =C2=A0		if (ret) {
> =C2=A0			ingenic_nand_cleanup_chips(nfc);
> -			of_node_put(np);
> =C2=A0			return ret;
> =C2=A0		}
> =C2=A0

