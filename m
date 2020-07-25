Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D03522D78F
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 14:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgGYMko (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 08:40:44 -0400
Received: from crapouillou.net ([89.234.176.41]:43986 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbgGYMko (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Jul 2020 08:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595680842; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TSqCu54P76Pf8omFHiednQkv0plQDhhPIfzS3rmPvYA=;
        b=RfE7cy+8GwZCNQD4Vy27gamIlVKhQGqzSrVyXgQfSDqQHV8tJfLfQsNEPKXrMOdrCNlcv6
        E3iwFGJMdJ8n3HlHc4WBy772Blq+rAU/kkherEtxm6brq2HwuM67UXLGyuzNzJycApLEJ3
        hSer8kJK171OU5JL0GTBHfX4Qi8JyOs=
Date:   Sat, 25 Jul 2020 14:40:32 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH RESEND] memory: jz4780_nemc: Only request IO memory the
 driver will use
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <K7Z0EQ.R0J26UF6HDOR@crapouillou.net>
In-Reply-To: <20200723090414.5824-1-paul@crapouillou.net>
References: <20200723090414.5824-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas, Greg,

Nevermind the previous note, it turns out a new maintainer (Krzysztof)=20
just appeared for drivers/memory/, I will upstream this patch through=20
him.

Cheers,
-Paul


Le jeu. 23 juil. 2020 =E0 11:04, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> The driver only uses the registers up to offset 0x54. Since the EFUSE
> registers are in the middle of the NEMC registers, we only request
> the registers we will use for now - that way the EFUSE driver can
> probe too.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>     Thomas:
>=20
>     drivers/memory/ has no dedicated maintainer, so sending this
>     patch upstream is like sending a bottle to the sea. Since it
>     touches a driver for a Ingenic SoC, if Greg doesn't take it
>     (I don't blame him - he's a busy man), could you take it in
>     your tree?
>=20
>     Thanks,
>     -Paul
>=20
>  drivers/memory/jz4780-nemc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/memory/jz4780-nemc.c=20
> b/drivers/memory/jz4780-nemc.c
> index b232ed279fc3..647267ea8c63 100644
> --- a/drivers/memory/jz4780-nemc.c
> +++ b/drivers/memory/jz4780-nemc.c
> @@ -8,6 +8,7 @@
>=20
>  #include <linux/clk.h>
>  #include <linux/init.h>
> +#include <linux/io.h>
>  #include <linux/math64.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -288,7 +289,19 @@ static int jz4780_nemc_probe(struct=20
> platform_device *pdev)
>  	nemc->dev =3D dev;
>=20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nemc->base =3D devm_ioremap_resource(dev, res);
> +
> +	/*
> +	 * The driver only uses the registers up to offset 0x54. Since the=20
> EFUSE
> +	 * registers are in the middle of the NEMC registers, we only=20
> request
> +	 * the registers we will use for now - that way the EFUSE driver can
> +	 * probe too.
> +	 */
> +	if (!devm_request_mem_region(dev, res->start, 0x54, dev_name(dev)))=20
> {
> +		dev_err(dev, "unable to request I/O memory region\n");
> +		return -EBUSY;
> +	}
> +
> +	nemc->base =3D devm_ioremap(dev, res->start, resource_size(res));
>  	if (IS_ERR(nemc->base)) {
>  		dev_err(dev, "failed to get I/O memory\n");
>  		return PTR_ERR(nemc->base);
> --
> 2.27.0
>=20


