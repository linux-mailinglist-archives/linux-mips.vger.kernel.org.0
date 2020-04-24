Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6311B810C
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 22:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgDXUoE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 16:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgDXUoD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 16:44:03 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FE1C09B048;
        Fri, 24 Apr 2020 13:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587761040;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vhudvGlAsCcgRL2OjoDTyBEhyn7ZxJt8dndzIv56d3M=;
        b=LTjLD61Hz6mC0iT06yfJzknWfMi0JLkCtjfhHYqfJZEO/nil8rMZVcPebZ1DOB/+nK
        DEF6cTz4VqNYNLnpZyZD/qi0fulivHaOVDpgDK8QsgSZVGQr+OQfZsWByzLYSl3cg1tj
        zPmb2wDYjR6ITSGR++t9IWy5IHKdepmlueXHrVmpiEUsqFJzJSrNVKdnfm47N2AmD6fR
        z8mEugD98dN8DqMJtDsHwkSyIR0+wx3N1MTPF382Rl2/wMT+YCBgxjwV5DPhh7ZkrxKn
        wT0bU8mHxVcPtZv2Xftzay2W6kFOqxZLOk1JQrr0gufCXrNQM9NSzOX72l1LSjPYXvQm
        jIXA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlabXA0JT7U="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3OKhXEVq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 24 Apr 2020 22:43:33 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
Date:   Fri, 24 Apr 2020 22:43:30 +0200
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <47E9ACFA-A5DE-4918-9C79-0C50FAA6E988@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
To:     Nikolaus Schaller <hns@goldelico.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 24.04.2020 um 22:34 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
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

s/deciced/decided/

> all clock, reset and power-management through registers
> outside of the sgx register block.
>=20
> Therefore all these properties are optional.
>=20
> Tested by make dt_binding_check
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 ++++++++++++++++++
> 1 file changed, 150 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml =
b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
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
> +  This binding describes the Imagination SGX5 series of 3D =
accelerators which
> +  are found in several different SoC like TI OMAP, Sitara, Ingenic =
JZ4780,
> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> +
> +  For an extensive list see: =
https://en.wikipedia.org/wiki/PowerVR#Implementations
> +
> +  The SGX node is usually a child node of some DT node belonging to =
the SoC
> +  which handles clocks, reset and general address space mapping of =
the SGX
> +  register area. If not, an optional clock can be specified here.

     ^^^ this is no longer that way. now clocks, reset etc. are part of =
this
         node but can be omitted if done by the parent node.

     =3D> either remove this sentence or rewrite.

> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +  compatible:
> +    oneOf:
> +      - description: SGX530-121 based SoC
> +        items:
> +          - enum:
> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora =
600MHz and similar
> +          - const: img,sgx530-121
> +          - const: img,sgx530
> +
> +      - description: SGX530-125 based SoC
> +        items:
> +          - enum:
> +            - ti,am3352-sgx530-125 # BeagleBone Black
> +            - ti,am3517-sgx530-125
> +            - ti,am4-sgx530-125
> +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, =
OpenPandora 1GHz and similar
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
> +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and =
similar
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
> +            - allwinner,sun8i-a83t-sgx544-115 # Banana-Pi-M3 =
(Allwinner A83T) and similar
> +          - const: img,sgx544-115
> +          - const: img,sgx544
> +
> +      - description: SGX544-116 based SoC
> +        items:
> +          - enum:
> +            - ti,dra7-sgx544-116 # DRA7
> +            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and =
similar
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu: gpu@fe00 {
> +      compatible =3D "ti,omap5-sgx544-116", "img,sgx544-116", =
"img,sgx544";
> +      reg =3D <0xfe00 0x200>;
> +      interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> --=20
> 2.25.1
>=20

