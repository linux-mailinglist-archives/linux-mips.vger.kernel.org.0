Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36A01C2C82
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 14:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgECMwY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 08:52:24 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41080 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbgECMwY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 08:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588510339; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ko4Xwt96nyrG2ofYwcaiQ3kO8FQgN99Oau+oASza+Y=;
        b=vMLvvQ26mbkRB5ssq4TJnK7+m022JmcEKlGByK0qEt0wZ/cWuoZ2C+xRTochuMQahsnETO
        ABOQBnQJ2/HLIwG+CvdEP4jyvQxShAa+HOezOJtmovqAdOYegmCHPgKTS4wd0UiUZCwl/5
        56vda+SO7iF/CxZEL8qChIccueuMpcE=
Date:   Sun, 03 May 2020 14:52:05 +0200
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
Message-Id: <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
In-Reply-To: <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
        <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
        <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le sam. 2 mai 2020 =E0 22:26, H. Nikolaus Schaller <hns@goldelico.com> a=20
=E9crit :
> Hi Paul,
>=20
>>  Am 26.04.2020 um 15:11 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  The Imagination PVR/SGX GPU is part of several SoC from
>>>  multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>>>  Allwinner A83 and others.
>>>  With this binding, we describe how the SGX processor is
>>>  interfaced to the SoC (registers and interrupt).
>>>  The interface also consists of clocks, reset, power but
>>>  information from data sheets is vague and some SoC integrators
>>>  (TI) deciced to use a PRCM wrapper (ti,sysc) which does
>>>  all clock, reset and power-management through registers
>>>  outside of the sgx register block.
>>>  Therefore all these properties are optional.
>>>  Tested by make dt_binding_check
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150=20
>>> ++++++++++++++++++
>>>  1 file changed, 150 insertions(+)
>>>  create mode 100644=20
>>> Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>>>  diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml=20
>>> b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>>>  new file mode 100644
>>>  index 000000000000..33a9c4c6e784
>>>  --- /dev/null
>>>  +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>>>  @@ -0,0 +1,150 @@
>>>  +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>  +%YAML 1.2
>>>  +---
>>>  +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
>>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>  +
>>>  +title: Imagination PVR/SGX GPU
>>>  +
>>>  +maintainers:
>>>  +  - H. Nikolaus Schaller <hns@goldelico.com>
>>>  +
>>>  +description: |+
>>>  +  This binding describes the Imagination SGX5 series of 3D=20
>>> accelerators which
>>>  +  are found in several different SoC like TI OMAP, Sitara,=20
>>> Ingenic JZ4780,
>>>  +  Allwinner A83, and Intel Poulsbo and CedarView and more.
>>>  +
>>>  +  For an extensive list see:=20
>>> https://en.wikipedia.org/wiki/PowerVR#Implementations
>>>  +
>>>  +  The SGX node is usually a child node of some DT node belonging=20
>>> to the SoC
>>>  +  which handles clocks, reset and general address space mapping=20
>>> of the SGX
>>>  +  register area. If not, an optional clock can be specified here.
>>>  +
>>>  +properties:
>>>  +  $nodename:
>>>  +    pattern: '^gpu@[a-f0-9]+$'
>>>  +  compatible:
>>>  +    oneOf:
>>>  +      - description: SGX530-121 based SoC
>>>  +        items:
>>>  +          - enum:
>>>  +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C,=20
>>> OpenPandora 600MHz and similar
>>>  +          - const: img,sgx530-121
>>>  +          - const: img,sgx530
>>>  +
>>>  +      - description: SGX530-125 based SoC
>>>  +        items:
>>>  +          - enum:
>>>  +            - ti,am3352-sgx530-125 # BeagleBone Black
>>>  +            - ti,am3517-sgx530-125
>>>  +            - ti,am4-sgx530-125
>>>  +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04,=20
>>> OpenPandora 1GHz and similar
>>>  +            - ti,ti81xx-sgx530-125
>>>  +          - const: ti,omap3-sgx530-125
>>>  +          - const: img,sgx530-125
>>>  +          - const: img,sgx530
>>>  +
>>>  +      - description: SGX535-116 based SoC
>>>  +        items:
>>>  +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
>>>  +          - const: img,sgx535-116
>>>  +          - const: img,sgx535
>>>  +
>>>  +      - description: SGX540-116 based SoC
>>>  +        items:
>>>  +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
>>>  +          - const: img,sgx540-116
>>>  +          - const: img,sgx540
>>>  +
>>>  +      - description: SGX540-120 based SoC
>>>  +        items:
>>>  +          - enum:
>>>  +            - samsung,s5pv210-sgx540-120
>>>  +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and=20
>>> similar
>>>  +          - const: img,sgx540-120
>>>  +          - const: img,sgx540
>>>  +
>>>  +      - description: SGX540-130 based SoC
>>>  +        items:
>>>  +          - enum:
>>>  +            - ingenic,jz4780-sgx540-130 # CI20
>>>  +          - const: img,sgx540-130
>>>  +          - const: img,sgx540
>>>  +
>>>  +      - description: SGX544-112 based SoC
>>>  +        items:
>>>  +          - const: ti,omap4470-sgx544-112
>>>  +          - const: img,sgx544-112
>>>  +          - const: img,sgx544
>>>  +
>>>  +      - description: SGX544-115 based SoC
>>>  +        items:
>>>  +          - enum:
>>>  +            - allwinner,sun8i-a31-sgx544-115
>>>  +            - allwinner,sun8i-a31s-sgx544-115
>>>  +            - allwinner,sun8i-a83t-sgx544-115 # Banana-Pi-M3=20
>>> (Allwinner A83T) and similar
>>>  +          - const: img,sgx544-115
>>>  +          - const: img,sgx544
>>>  +
>>>  +      - description: SGX544-116 based SoC
>>>  +        items:
>>>  +          - enum:
>>>  +            - ti,dra7-sgx544-116 # DRA7
>>>  +            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and=20
>>> similar
>>>  +          - const: img,sgx544-116
>>>  +          - const: img,sgx544
>>>  +
>>>  +      - description: SGX545 based SoC
>>>  +        items:
>>>  +          - const: intel,cedarview-gma3600-sgx545 # Atom N2600,=20
>>> D2500
>>>  +          - const: img,sgx545-116
>>>  +          - const: img,sgx545
>>>  +
>>>  +  reg:
>>>  +    maxItems: 1
>>>  +
>>>  +  interrupts:
>>>  +    maxItems: 1
>>>  +
>>>  +  interrupt-names:
>>>  +    maxItems: 1
>>>  +    items:
>>>  +      - const: sgx
>>>  +
>>>  +  clocks:
>>>  +    maxItems: 4
>>>  +
>>>  +  clock-names:
>>>  +    maxItems: 4
>>>  +    items:
>>>  +      - const: core
>>>  +      - const: sys
>>>  +      - const: mem
>>>  +      - const: hyd
>>>  +
>>>  +  sgx-supply: true
>>>  +
>>>  +  power-domains:
>>>  +    maxItems: 1
>>>  +
>>>  +  resets:
>>>  +    maxItems: 1
>>>  +
>>>  +required:
>>>  +  - compatible
>>>  +  - reg
>>>  +  - interrupts
>>=20
>>  By not making 'clocks' required you make it possible to create=20
>> broken bindings; according to your schema, a GPU node without a=20
>> 'clocks' for the JZ4780 would be perfectly valid.
>=20
> Yes. But it will never pass a test with real hardware. So it can't be=20
> omitted anyways.
>=20
> On a more general thought, this argument holds for any optional=20
> property. So it is not specific to clocks. Since the reg address=20
> values are also never specified you can still create broken bindings.=20
> Or by connecting the wrong clock. So the ways to create broken=20
> bindings are numerous.
>=20
> I also assume that SGX integrators are not beginners and do you think=20
> they need to find out through a make dt_binding_check dtbs_check that=20
> they should define a clock? based on *assumptions* we do without=20
> having access to all systems?
>=20
> IMHO the bindings documentation is a documentation. So it needs to be=20
> helpful but not perfect. Formalizing all corner cases in a bindings=20
> document (just because we can since .yaml was introduced) is IMHO=20
> overkill.
>=20
> In times before the introduction of more formal .yaml I think we=20
> would not even have considered this for a comment in the bindings.txt.
>=20
>>  It's possible to forbid the presence of the 'clocks' property on=20
>> some implementations, and require it on others.
>=20
> To be precise we have to specify the exact number of clocks (between=20
> 0 and 4) for every architecture.
>=20
> This also contradicts my dream to get rid of the architecture=20
> specific components in the long run. My dream (because I can't tell=20
> how it can be done) is that we can one day develop something which=20
> just needs compatible =3D img,530 or imp,540 or img,544. Then we can't=20
> make the number clocks depend on the implementation any more.

As we said before, the number of clocks is a property of the GPU and=20
*not* its integration into the SoC.

So you would *not* have a number of clocks between 0 and 4. You get=20
either 0, or 4, depending on whether or not you have a wrapper.


>>  See how it's done for instance on=20
>> Documentation/devicetree/bindings/serial/samsung_uart.yaml.
>=20
> Yes I know the design pattern, but I wonder if such a move makes the=20
> whole thing even less maintainable.
>=20
> Assume we have finished DTS for some SoC. Then these DTS have been=20
> tested on real hardware and are working. Clocks are there where=20
> needed and missing where not. We may now forbid or not forbid them=20
> for some implementations in the bindings.yaml but the result of=20
> dtbs_check won't change! Because they are tested and working and the=20
> bindings.yaml has been adapted to the result. So we have just=20
> duplicated something for no practical benefit.
>=20
> Next, assume there is coming support for more and more new SoC. Then,=20
> developers not only have to figure out which clocks they need in the=20
> DTS but they also have to add a patch to the implementation specific=20
> part of the bindings.yaml to clearly define exactly the same what=20
> they already have written into their .dts (the clocks are either=20
> there for the of_node or they are not). So again the rules are for no=20
> benefit, since a new SoC is introduced exactly once. And tested if it=20
> works. And if it is there, it will stay as it is. It is just work for=20
> maintainers to review that patch as well.

If you add support for a new SoC, you'd still need to modify the=20
binding to add the compatible string. So the argument of "more work" is=20
moot.

-Paul

> It boils down to the question if we need to formalize the rule how a=20
> working DTS was derived. Or just have a working DTS and not formalize=20
> everything.
>=20
> So IMHO carrying along such a detail (forbid clocks on some=20
> architectures) is nice to have (and fun to learn the .yaml thing) but=20
> not of benefit for anyone. Not for the DTS developer nor for the=20
> maintainers nor for the users of a Linux kernel. "Keep it simple" is=20
> always a good rule for maintainability.
>=20
> In summary I don't see a good reason to follow this in v8. But you=20
> could add it by a separate patch later if the DTS have been reviewed=20
> and agreed.
>=20
> BR and thanks,
> Nikolaus
>=20


