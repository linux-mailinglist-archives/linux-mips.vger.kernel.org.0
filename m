Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55CF717218C
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 15:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbgB0Oto (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 09:49:44 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:35668 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbgB0Otn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 09:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582814980; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tLgwQgOa6r2cwTcDG0bb37UBVU1Q+pAZGWA4HImdZZQ=;
        b=JsB2xcdnyQ/+DcnFlBFwy/epanejNjvDGiC/OsJ5iqJrtMR6Gftlf3d6Aj9aqldUvta+QC
        CPmS2tWeUJeRzDy/jYIPBXFY6Y272TnhSolCJG4hzFocr43JyE4dReM4tdMX+NauoGSdj2
        tZ1LMCC1BXUu+oyf9FhXEq4lHp9uxJQ=
Date:   Thu, 27 Feb 2020 11:49:17 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1582814957.3.3@crapouillou.net>
In-Reply-To: <4b243cc120ca6f9a23e217d070e7f6a42f11f8b4.1582715761.git.hns@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
        <4b243cc120ca6f9a23e217d070e7f6a42f11f8b4.1582715761.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le mer., f=E9vr. 26, 2020 at 12:15, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>=20
> This patch brings support for the JZ4780 efuse. Currently it only=20
> exposes
> a read only access to the entire 8K bits efuse memory.
>=20
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> [converted to yaml]
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50=20
> +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml=20
> b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> new file mode 100644
> index 000000000000..b9c0ea09b335
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic JZ EFUSE driver bindings
> +
> +maintainers:
> +  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ingenic,jz4780-efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    # Handle for the ahb for the efuse.
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ahb2

Your driver does not actually require the clock to be 'ahb2', it will=20
take the first clock independently of its name. So 'clock-names' can be=20
dropped.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    efuse@134100d0 {
> +        compatible =3D "ingenic,jz4780-efuse";
> +        reg =3D <0x134100d0 0x2c>;
> +
> +        clocks =3D <&cgu JZ4780_CLK_AHB2>;
> +        clock-names =3D "ahb2";

Same here.

Cheers,
-Paul

> +    };
> +
> +...
> --
> 2.23.0
>=20

=

