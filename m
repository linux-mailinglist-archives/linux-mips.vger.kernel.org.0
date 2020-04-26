Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF3A1B905E
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 15:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgDZNL2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 09:11:28 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:45354 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgDZNL2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 09:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587906685; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IFur6tajK4evwgOz4FV0teTEfHnn4a4S53gL4pRIx+U=;
        b=rEN2U32g4D6thtpQpuPow1CDCbmEFbpF31YB4DZy6fORR2TPLIw36Orji5bSif5fm2MrpK
        udDOBDl+Y+AfopNc9b4VD6Dw5fR0YGbvkw7ICPiK7OtKY4orL3vMMV1BBGF4NHP2hSM9qN
        GmHBhnKjl+9m1iS5TByvVx2BY/RnJl0=
Date:   Sun, 26 Apr 2020 15:11:11 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination
 GPUs
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Message-Id: <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
In-Reply-To: <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
>=20
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers and interrupt).
>=20
> The interface also consists of clocks, reset, power but
> information from data sheets is vague and some SoC integrators
> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
> all clock, reset and power-management through registers
> outside of the sgx register block.
>=20
> Therefore all these properties are optional.
>=20
> Tested by make dt_binding_check
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150=20
> ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml=20
> b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> new file mode 100644
> index 000000000000..33a9c4c6e784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination PVR/SGX GPU
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |+
> +  This binding describes the Imagination SGX5 series of 3D=20
> accelerators which
> +  are found in several different SoC like TI OMAP, Sitara, Ingenic=20
> JZ4780,
> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> +
> +  For an extensive list see:=20
> https://en.wikipedia.org/wiki/PowerVR#Implementations
> +
> +  The SGX node is usually a child node of some DT node belonging to=20
> the SoC
> +  which handles clocks, reset and general address space mapping of=20
> the SGX
> +  register area. If not, an optional clock can be specified here.
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +  compatible:
> +    oneOf:
> +      - description: SGX530-121 based SoC
> +        items:
> +          - enum:
> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora=20
> 600MHz and similar
> +          - const: img,sgx530-121
> +          - const: img,sgx530
> +
> +      - description: SGX530-125 based SoC
> +        items:
> +          - enum:
> +            - ti,am3352-sgx530-125 # BeagleBone Black
> +            - ti,am3517-sgx530-125
> +            - ti,am4-sgx530-125
> +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04,=20
> OpenPandora 1GHz and similar
> +            - ti,ti81xx-sgx530-125
> +          - const: ti,omap3-sgx530-125
> +          - const: img,sgx530-125
> +          - const: img,sgx530
> +
> +      - description: SGX535-116 based SoC
> +        items:
> +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
> +          - const: img,sgx535-116
> +          - const: img,sgx535
> +
> +      - description: SGX540-116 based SoC
> +        items:
> +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
> +          - const: img,sgx540-116
> +          - const: img,sgx540
> +
> +      - description: SGX540-120 based SoC
> +        items:
> +          - enum:
> +            - samsung,s5pv210-sgx540-120
> +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and=20
> similar
> +          - const: img,sgx540-120
> +          - const: img,sgx540
> +
> +      - description: SGX540-130 based SoC
> +        items:
> +          - enum:
> +            - ingenic,jz4780-sgx540-130 # CI20
> +          - const: img,sgx540-130
> +          - const: img,sgx540
> +
> +      - description: SGX544-112 based SoC
> +        items:
> +          - const: ti,omap4470-sgx544-112
> +          - const: img,sgx544-112
> +          - const: img,sgx544
> +
> +      - description: SGX544-115 based SoC
> +        items:
> +          - enum:
> +            - allwinner,sun8i-a31-sgx544-115
> +            - allwinner,sun8i-a31s-sgx544-115
> +            - allwinner,sun8i-a83t-sgx544-115 # Banana-Pi-M3=20
> (Allwinner A83T) and similar
> +          - const: img,sgx544-115
> +          - const: img,sgx544
> +
> +      - description: SGX544-116 based SoC
> +        items:
> +          - enum:
> +            - ti,dra7-sgx544-116 # DRA7
> +            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and=20
> similar
> +          - const: img,sgx544-116
> +          - const: img,sgx544
> +
> +      - description: SGX545 based SoC
> +        items:
> +          - const: intel,cedarview-gma3600-sgx545 # Atom N2600, D2500
> +          - const: img,sgx545-116
> +          - const: img,sgx545
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    maxItems: 1
> +    items:
> +      - const: sgx
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    maxItems: 4
> +    items:
> +      - const: core
> +      - const: sys
> +      - const: mem
> +      - const: hyd
> +
> +  sgx-supply: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

By not making 'clocks' required you make it possible to create broken=20
bindings; according to your schema, a GPU node without a 'clocks' for=20
the JZ4780 would be perfectly valid.

It's possible to forbid the presence of the 'clocks' property on some=20
implementations, and require it on others.
See how it's done for instance on=20
Documentation/devicetree/bindings/serial/samsung_uart.yaml.

-Paul

> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu: gpu@fe00 {
> +      compatible =3D "ti,omap5-sgx544-116", "img,sgx544-116",=20
> "img,sgx544";
> +      reg =3D <0xfe00 0x200>;
> +      interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> --
> 2.25.1
>=20


