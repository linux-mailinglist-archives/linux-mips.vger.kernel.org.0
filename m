Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065B31C2839
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 22:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgEBU1V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 16:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728484AbgEBU1U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 16:27:20 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4C7C061A0C;
        Sat,  2 May 2020 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588451233;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=aFutSXBhxdQGsI0cADyst3RpMgduPhgX/DjMd6AXC1k=;
        b=H5jdrky2qJyx1+QkrkqmAYLfbnfO4X7xCtXRG+96UKYprfyHW/oN+Ce1+B1el09HlI
        +BgBPgJLxtM3It1i0NhSnVDjdIhdIk5DujTxyFjCmYLAdkcbz/3DsK5XO7tt3thFq+oM
        s6TLrV7KNzmVfJmW+UGAWAcTSzuMcx+d7MI1nWygLxGlj640fIEstSd/PSUw2iEnsdw/
        OE7fMzoyELYzzBdYKO9IkYhxXt7Q03Des0KId3XjZig+9zmPuKq1hVL+2IE6ztBB1zVA
        OHj316zd5s8zmmM9lVU9mxZ5QpBceec2nYOPwZYCCoCXuNZ7E/leIG6i65SgYghhfWOk
        320Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXA4OCWU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw42KQTesh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 2 May 2020 22:26:29 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
Date:   Sat, 2 May 2020 22:26:29 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 26.04.2020 um 15:11 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>> Allwinner A83 and others.
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers and interrupt).
>> The interface also consists of clocks, reset, power but
>> information from data sheets is vague and some SoC integrators
>> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
>> all clock, reset and power-management through registers
>> outside of the sgx register block.
>> Therefore all these properties are optional.
>> Tested by make dt_binding_check
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 =
++++++++++++++++++
>> 1 file changed, 150 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml =
b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> new file mode 100644
>> index 000000000000..33a9c4c6e784
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> @@ -0,0 +1,150 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Imagination PVR/SGX GPU
>> +
>> +maintainers:
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
>> +
>> +description: |+
>> +  This binding describes the Imagination SGX5 series of 3D =
accelerators which
>> +  are found in several different SoC like TI OMAP, Sitara, Ingenic =
JZ4780,
>> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
>> +
>> +  For an extensive list see: =
https://en.wikipedia.org/wiki/PowerVR#Implementations
>> +
>> +  The SGX node is usually a child node of some DT node belonging to =
the SoC
>> +  which handles clocks, reset and general address space mapping of =
the SGX
>> +  register area. If not, an optional clock can be specified here.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: '^gpu@[a-f0-9]+$'
>> +  compatible:
>> +    oneOf:
>> +      - description: SGX530-121 based SoC
>> +        items:
>> +          - enum:
>> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora =
600MHz and similar
>> +          - const: img,sgx530-121
>> +          - const: img,sgx530
>> +
>> +      - description: SGX530-125 based SoC
>> +        items:
>> +          - enum:
>> +            - ti,am3352-sgx530-125 # BeagleBone Black
>> +            - ti,am3517-sgx530-125
>> +            - ti,am4-sgx530-125
>> +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, =
OpenPandora 1GHz and similar
>> +            - ti,ti81xx-sgx530-125
>> +          - const: ti,omap3-sgx530-125
>> +          - const: img,sgx530-125
>> +          - const: img,sgx530
>> +
>> +      - description: SGX535-116 based SoC
>> +        items:
>> +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
>> +          - const: img,sgx535-116
>> +          - const: img,sgx535
>> +
>> +      - description: SGX540-116 based SoC
>> +        items:
>> +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
>> +          - const: img,sgx540-116
>> +          - const: img,sgx540
>> +
>> +      - description: SGX540-120 based SoC
>> +        items:
>> +          - enum:
>> +            - samsung,s5pv210-sgx540-120
>> +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and =
similar
>> +          - const: img,sgx540-120
>> +          - const: img,sgx540
>> +
>> +      - description: SGX540-130 based SoC
>> +        items:
>> +          - enum:
>> +            - ingenic,jz4780-sgx540-130 # CI20
>> +          - const: img,sgx540-130
>> +          - const: img,sgx540
>> +
>> +      - description: SGX544-112 based SoC
>> +        items:
>> +          - const: ti,omap4470-sgx544-112
>> +          - const: img,sgx544-112
>> +          - const: img,sgx544
>> +
>> +      - description: SGX544-115 based SoC
>> +        items:
>> +          - enum:
>> +            - allwinner,sun8i-a31-sgx544-115
>> +            - allwinner,sun8i-a31s-sgx544-115
>> +            - allwinner,sun8i-a83t-sgx544-115 # Banana-Pi-M3 =
(Allwinner A83T) and similar
>> +          - const: img,sgx544-115
>> +          - const: img,sgx544
>> +
>> +      - description: SGX544-116 based SoC
>> +        items:
>> +          - enum:
>> +            - ti,dra7-sgx544-116 # DRA7
>> +            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and =
similar
>> +          - const: img,sgx544-116
>> +          - const: img,sgx544
>> +
>> +      - description: SGX545 based SoC
>> +        items:
>> +          - const: intel,cedarview-gma3600-sgx545 # Atom N2600, =
D2500
>> +          - const: img,sgx545-116
>> +          - const: img,sgx545
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    maxItems: 1
>> +    items:
>> +      - const: sgx
>> +
>> +  clocks:
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    maxItems: 4
>> +    items:
>> +      - const: core
>> +      - const: sys
>> +      - const: mem
>> +      - const: hyd
>> +
>> +  sgx-supply: true
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>=20
> By not making 'clocks' required you make it possible to create broken =
bindings; according to your schema, a GPU node without a 'clocks' for =
the JZ4780 would be perfectly valid.

Yes. But it will never pass a test with real hardware. So it can't be =
omitted anyways.

On a more general thought, this argument holds for any optional =
property. So it is not specific to clocks. Since the reg address values =
are also never specified you can still create broken bindings. Or by =
connecting the wrong clock. So the ways to create broken bindings are =
numerous.

I also assume that SGX integrators are not beginners and do you think =
they need to find out through a make dt_binding_check dtbs_check that =
they should define a clock? based on *assumptions* we do without having =
access to all systems?

IMHO the bindings documentation is a documentation. So it needs to be =
helpful but not perfect. Formalizing all corner cases in a bindings =
document (just because we can since .yaml was introduced) is IMHO =
overkill.

In times before the introduction of more formal .yaml I think we would =
not even have considered this for a comment in the bindings.txt.

> It's possible to forbid the presence of the 'clocks' property on some =
implementations, and require it on others.

To be precise we have to specify the exact number of clocks (between 0 =
and 4) for every architecture.

This also contradicts my dream to get rid of the architecture specific =
components in the long run. My dream (because I can't tell how it can be =
done) is that we can one day develop something which just needs =
compatible =3D img,530 or imp,540 or img,544. Then we can't make the =
number clocks depend on the implementation any more.

> See how it's done for instance on =
Documentation/devicetree/bindings/serial/samsung_uart.yaml.

Yes I know the design pattern, but I wonder if such a move makes the =
whole thing even less maintainable.

Assume we have finished DTS for some SoC. Then these DTS have been =
tested on real hardware and are working. Clocks are there where needed =
and missing where not. We may now forbid or not forbid them for some =
implementations in the bindings.yaml but the result of dtbs_check won't =
change! Because they are tested and working and the bindings.yaml has =
been adapted to the result. So we have just duplicated something for no =
practical benefit.

Next, assume there is coming support for more and more new SoC. Then, =
developers not only have to figure out which clocks they need in the DTS =
but they also have to add a patch to the implementation specific part of =
the bindings.yaml to clearly define exactly the same what they already =
have written into their .dts (the clocks are either there for the =
of_node or they are not). So again the rules are for no benefit, since a =
new SoC is introduced exactly once. And tested if it works. And if it is =
there, it will stay as it is. It is just work for maintainers to review =
that patch as well.

It boils down to the question if we need to formalize the rule how a =
working DTS was derived. Or just have a working DTS and not formalize =
everything.

So IMHO carrying along such a detail (forbid clocks on some =
architectures) is nice to have (and fun to learn the .yaml thing) but =
not of benefit for anyone. Not for the DTS developer nor for the =
maintainers nor for the users of a Linux kernel. "Keep it simple" is =
always a good rule for maintainability.

In summary I don't see a good reason to follow this in v8. But you could =
add it by a separate patch later if the DTS have been reviewed and =
agreed.

BR and thanks,
Nikolaus

