Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE8B1AC0D1
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 14:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635121AbgDPMMk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 08:12:40 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40786 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635117AbgDPMMi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Apr 2020 08:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587039154; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=76j3ly/5QeUK0nU5At79+0K8FzkW6UhXLLI7ltlDc94=;
        b=mKKE9WpfheAjp4lEN7VFRI14wXWhly5wR90q1yqwBrVPc/ep5xXAZOtB7Ech97698uehCX
        9Vt72zd+0n3G2kwXRfb+IBJq9B00RXVNhPJd8BK822EspVWkylZPQuSczs9F0k33Yf6Txt
        fAxx7xVMZrqyEufR39itoEkItwbRd/o=
Date:   Thu, 16 Apr 2020 14:12:17 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 1/7] memory: jz4780_nemc: Only request IO memory the
 driver will use
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <H8RV8Q.GPAP9MLER1RC@crapouillou.net>
In-Reply-To: <551a8560261543c1decb1d4d1671ec4b7fa52fdb.1582905653.git.hns@goldelico.com>
References: <cover.1582905653.git.hns@goldelico.com>
        <551a8560261543c1decb1d4d1671ec4b7fa52fdb.1582905653.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greg:

Can you take this patch? Since there is no maintainer for=20
drivers/memory/. It still applies fine on top of 5.7-rc1.

Cheers,
-Paul


Le ven. 28 f=E9vr. 2020 =E0 17:00, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Cercueil <paul@crapouillou.net>
>=20
> The driver only uses the registers up to offset 0x54. Since the EFUSE
> registers are in the middle of the NEMC registers, we only request
> the registers we will use for now - that way the EFUSE driver can
> probe too.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
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
> 2.23.0
>=20


