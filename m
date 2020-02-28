Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3540E173A10
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgB1OlD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:41:03 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:43576 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgB1OlD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582900859; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVBICVTonYAb4LLd3t5iiG7odOUu1CunmFhCqjBBfuY=;
        b=X7Fb7+RYlcThpjdvM7Uo6AHq1dU2RzV6TKtEIeBZqg1st+3vkkTq5+WiqCymAKYR0KDu6F
        YVUy1+hGjDwqMix9+9HT1AbHkjbhgD9D5SaTb8JJbvSUHpiWGckAeqY/O7pOJ7VmMeNGuf
        omqAZNSnE9AY4iu/GQP5bps98myZZ9g=
Date:   Fri, 28 Feb 2020 11:40:37 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 3/7] Bindings: nvmem: add bindings for JZ4780 efuse
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
Message-Id: <1582900837.3.3@crapouillou.net>
In-Reply-To: <ebd523e39aac31b087affcfa984738204fa8b542.1582898302.git.hns@goldelico.com>
References: <cover.1582898302.git.hns@goldelico.com>
        <ebd523e39aac31b087affcfa984738204fa8b542.1582898302.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 14:58, H. Nikolaus Schaller=20
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
>  .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 49=20
> +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml=20
> b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> new file mode 100644
> index 000000000000..ce6690c50a34
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> @@ -0,0 +1,49 @@
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

You still have clock-names here. You can remove it completely.

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
> +    };
> +
> +...
> --
> 2.23.0
>=20

=

