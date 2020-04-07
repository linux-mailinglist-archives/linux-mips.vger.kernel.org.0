Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C61A07DE
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 09:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgDGHBJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 03:01:09 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:29276 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgDGHBJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 03:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586242863;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VFXj4dpUOu/S9rLbC7KR7sOUmE95my22jH+cpwFuU5I=;
        b=ZQ6w+gANoSqD84cMlvcLWaiwH6n2ejlVMHdONC1eZTotMABvfWVoxn+n6pxOg770pB
        1uUrUh5Jts5VaPYbKgkC9y5YigBBA7LZbdUqyiyc8CaMKo5ipY/smFyA72bEoogoZgeF
        Pcx3iNzjdTZxP6c1ePs7Gvc+wMUN9/xvOQJAp796nfnGTTs4DjrlDDweLyDdSfFxI1bw
        JGEYVQChCYywWo5iAP1qA6sH+2xOXP/mJnvlBEakxXA6Hsob3l9fFJSNPpdo61ZpdwPD
        7tWOi4mQu3Pmm+KDlepCF/VLXfEoH3JAPzwRa+SAv36DVZBm13cgf9Blg5W3YPqmuUZL
        v49A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCzzVWjZMpPLf7DqeEVaZMNMnOlXq6WvfU0ov11g"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26f1:6300:3c47:ec38:42c4:72c6]
        by smtp.strato.de (RZmta 46.2.1 AUTH)
        with ESMTPSA id m02241w3770kj69
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 7 Apr 2020 09:00:46 +0200 (CEST)
Subject: Re: [PATCH v5 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <000359713a45bb1a1adc0b609e4e659aedf99e6c.1585503505.git.hns@goldelico.com>
Date:   Tue, 7 Apr 2020 09:00:48 +0200
Cc:     Philipp Rossak <embed3d@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E273453-861D-45A2-8FA4-D5EC4B78F490@goldelico.com>
References: <cover.1585503505.git.hns@goldelico.com> <000359713a45bb1a1adc0b609e4e659aedf99e6c.1585503505.git.hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 29.03.2020 um 19:38 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
>=20
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers, interrupt etc.).
>=20
> In most cases, Clock, Reset and power management is handled
> by a parent node or elsewhere (e.g. code in the driver).
>=20
> Tested by make dt_binding_check dtbs_check
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 109 ++++++++++++++++++
> 1 file changed, 109 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml =
b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> new file mode 100644
> index 000000000000..aadfb2d9b012
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> @@ -0,0 +1,109 @@
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
> +  register area.
> +
> +properties:
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
> +            - ingenic,jz4780-sgx540-120 # CI20
> +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and =
similar
> +          - const: img,sgx540-120
> +          - const: img,sgx540
> +
> +      - description: SGX544-112 based SoC
> +        items:
> +          - const: ti,omap4-sgx544-112
> +          - const: img,sgx544-112
> +          - const: img,sgx544
> +
> +      - description: SGX544-116 based SoC
> +        items:
> +          - enum:
> +            - allwinner,sun8i-a83t-sgx544-116 # Banana-Pi-M3 =
(Allwinner A83T) and similar

Philipp Rossak reported on a different list [1] that the a83t tells to =
have a sgx544-115 inside.

So it needs a separate entry.

[1]: =
http://lists.goldelico.com/pipermail/openpvrsgx-devgroup/2020-April/000263=
.html

> +            - ti,dra7-sgx544-116 # DRA7
> +            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and =
similar
> +          - const: img,sgx544-116
> +          - const: img,sgx544
> +
> +      - description: SGX545-116 based SoC
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

