Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C850FF3526
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 17:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbfKGQzr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 11:55:47 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:12580 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbfKGQzq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 11:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573145743;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6eRmOVOL1dtrZBZdnx7EAukovBmLX34tKDa/RotG/nY=;
        b=ZMD5AUVXqp8QFrvEYdnEXJzFLibGFaDEQDaUUogHvt/YsVYpO1SPtS5kBuBgGTPGmO
        4i+u5vT1KkAkDyOCiTtX/Ob8dMFohT69mlIPuWdG18j/eUXltUUNrmY+dLx+iG6A1rJU
        7H5YDR4cMX0xGp9P8TWw0EEG69gDmGJBc/xCnbz64xpKTmIVKM8RFCZcXYciSnlL3Aoz
        /Y8QktV0c6WWBJ5z8ulbPlBoemPsPp7GSJrRtmTGoSK1tKmezrlzvYbzM+4qCT6iW5jy
        L5FpdjIm7WLXNYQUcPseu9KseSzXnI59VTi9RS1Tzggpzbv6c88MowjQaKv+UoeuRD2h
        qYQg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PrwDCq1eY="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7GtWfwD
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 17:55:32 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 1/8] RFC: dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAL_Jsq+ri3AXb=qhedBzQ6WufLm4aPrSqNxXiHd3_=mH3vJ8xw@mail.gmail.com>
Date:   Thu, 7 Nov 2019 17:55:31 +0100
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <52549A4C-F49D-4FE9-9CD2-B331FB486BA9@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com> <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com> <CAL_Jsq+ri3AXb=qhedBzQ6WufLm4aPrSqNxXiHd3_=mH3vJ8xw@mail.gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 07.11.2019 um 15:35 schrieb Rob Herring <robh+dt@kernel.org>:
>=20
> On Thu, Nov 7, 2019 at 5:06 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
>> and others.
>>=20
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers, interrupt etc.).
>>=20
>> Clock, Reset and power management should be handled
>> by a parent node or elsewhere.
>=20
> That's probably TI specific...

Yes and no.

For example the img4780 seems to need a clock reference in the
gpu node. But it could maybe connected in a parent node like recent
TI SoC do with the target-module approach.

And our goal is to end up with a common driver for all SoC and =
architectures
in far future. Then, probably clock, reset and power management should
be handled in the same way.

>=20
>> ---
>>=20
>> I have used the doc2yaml script to get a first veryion
>> but I am still stuggling with the yaml thing. My impression
>> is that while it is human readable, it is not very human
>> writable... Unfortunately I haven't found a good tutorial
>> for Dummies (like me) for bindings in YAML.
>=20
> Did you read .../bindings/example-schema.yaml? It explains the common
> cases and what schema are doing.

Yes.

> I recently added to it, so look at
> the version in linux-next.

Ah, ok. I haven't read that one.

>=20
>> The big problem is not the YAML syntax but what the schema
>> should contain and how to correctly formulate ideas in this
>> new language.
>>=20
>> Specific questions for this RFC:
>>=20
>> * formatting: is space/tab indentation correct?
>=20
> YAML requires spaces.

Which is quite uncommon if you aren't a python programmer...

>> * are strings with "" correct or without?
>=20
> Generally only keys or values starting with '#' need quotes. There's
> other cases, but we simply don't hit them with DT. We tend to quote
> $ref values, but that's not strictly needed.

Ok. Good.

>=20
>> * how do I specify that there is a list of compatible strings =
required in a specific order?
>=20
> An 'items' list defines the order.

I see.

>=20
>> * but there are multiple such lists, and only one of them is to be =
chosen?
>=20
>                                                ^^^^^^
> 'oneOf' is the schema keyword you are looking for.

Ok.

>=20
>> * how can be described in the binding that there should be certain =
values in
>>  the parent node (ranges) to make it work?
>=20
> You can't. Schemas match on a node and work down from there. So you
> can do it, but it's more complicated. You'd need a custom 'select'
> select that matches on the parent node having the child node you are
> looking for (assuming the parent is something generic like
> 'simple-bus' which you can't match on). However, based on the example,
> I'd say checking 'ranges' is outside the scope of schema checks.
> 'ranges' doesn't have to be a certain value any more than every case
> of 'reg' (except maybe i2c devices with fixed addresses).

Ok.

> It's up to
> the .dts author how exactly to do address translation.

Well, my concern as a regular .dts author is that I usually treat
bindings as documentation and giving hints how to write a .dts and
what to take care of. If it is not complete, I get into big trouble.

> I would like to have more ranges/reg checks such as bounds checks and
> overlapping addresses, but I think we'd do those with code, not
> schema.
>=20
>> I was not able to run
>>=20
>>        make dt_binding_check dtbs_check
>>=20
>> due to some missing dependencies (which I did not want to
>> invest time to research them) on my build host, so I could
>> not get automated help from those.
>=20
> Dependencies are documented in =
Documentation/devicetree/writing-schema.rst.

One says it needs a libyaml but after installing one my HOSTCC didn't =
find
it. The other asks for another script which seems to be missing.


>=20
>> ---
>> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 128 =
++++++++++++++++++
>> 1 file changed, 128 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml =
b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> new file mode 100644
>> index 000000000000..b1b021601c47
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: None
>=20
> Obviously not valid.

:)

>=20
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/gpu/img,pvrsgx.yaml#
>=20
> This should have been correct with the script, but you need to drop =
'bindings'.

Ok.

>=20
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Imagination PVR/SGX GPU
>> +
>> +maintainers:
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
>> +description: |+
>> +  This binding describes the Imagination SGX5 series of 3D =
accelerators which
>> +  are found in several different SoC like TI OMAP, Sitara, Ingenic =
JZ4780,
>> +  Allwinner A83, and Intel Poulsbo and CedarView.
>> +
>> +  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently =
covered by
>> +  this binding.
>> +
>> +  The SGX node is usually a child node of some DT node belonging to =
the SoC
>> +  which handles clocks, reset and general address space mapping of =
the SGX
>> +  register area.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - item:
>=20
> 'item/items'


Ok, as you described above we need "items".

>=20
>> +        # BeagleBoard ABC, OpenPandora 600MHz
>> +        - const: "ti,omap3-sgx530-121", "img,sgx530-121", =
"img,sgx530", "img,sgx5"
>=20
> Not valid YAML nor json-schema. Each value needs to be list item with =
'const:'

Have to look up how that syntax is.

> Plenty of examples in bindings/arm/ with board/soc bindings.

Ok.

>=20
>> +        # BeagleBoard XM, GTA04, OpenPandora 1GHz
>> +        - const: "ti,omap3-sgx530-125", "img,sgx530-125", =
"img,sgx530", "img,sgx5"
>=20
> This needs to be a new 'items' list under 'oneOf'.

Ok!

>=20
>> +        # BeagleBone Black
>> +        - const: "ti,am335x-sgx530-125", "img,sgx530-125", =
"img,sgx530", "img,sgx5"
>> +        # Pandaboard (ES)
>> +        - const: "ti,omap4-sgx540-120", "img,sgx540-120", =
"img,sgx540", "img,sgx5"
>> +        - const "ti,omap4-sgx544-112", "img,sgx544-112", =
"img,sgx544", "img,sgx5"
>> +        # OMAP5 UEVM, Pyra Handheld
>> +        "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544", =
"img,sgx5"
>> +        "ti,dra7-sgx544-116", "img,sgx544-116", "img,sgx544", =
"img,sgx5"
>=20
> Just gave up on trying to write a schema here?

Yes...

You see into what issues a first time YAML/schema writer with 35 years C =
but no
YAML, Python or JSON experience runs into...

Writing bindings as .txt was easy :)

>=20
>> +        # CI20
>> +        "ingenic,jz4780-sgx540-120", "img,sgx540-120", "img,sgx540", =
"img,sgx5";
>> +
>> +  reg:
>> +    items:
>> +      - description: physical base address and length of the =
register area
>=20
> For single entries, just 'maxItems: 1' is enough. Unless you have
> something special about this device, you don't need a description
> here.

I am not sure if I understand that yet.

>=20
>> +
>> +  interrupts:
>> +     items:
>> +      - description: interrupt from SGX subsystem to core processor
>> +
>> +  clocks:
>> +     items:
>> +      - description: optional clocks
>> +
>> +  required:
>> +    - compatible
>> +    - reg
>> +    - interrupts
>> +
>> +examples: |
>> +  gpu@fe00 {
>> +       compatible =3D "ti,omap-omap5-sgx544-116", "img,sgx544-116", =
"img,sgx544", "img,sgx5";
>> +       reg =3D <0xfe00 0x200>;
>> +       interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +  };
>> +
>> +
>> +historical: |
>=20
> This should be dropped. It's just for reference as you write the =
schema.

Yes that is clear. I kept it for reference what I intended to translate =
from.

>=20
>> +  Imagination PVR/SGX GPU
>> +
>> +  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently =
covered by this binding.
>> +
>> +  Required properties:
>> +  - compatible:        Should be one of
>> +               "ti,omap3-sgx530-121", "img,sgx530-121", =
"img,sgx530", "img,sgx5"; - BeagleBoard ABC, OpenPandora 600MHz
>> +               "ti,omap3-sgx530-125", "img,sgx530-125", =
"img,sgx530", "img,sgx5"; - BeagleBoard XM, GTA04, OpenPandora 1GHz
>> +               "ti,am3517-sgx530-125", "img,sgx530-125", =
"img,sgx530", "img,sgx5";
>> +               "ti,am335x-sgx530-125", "img,sgx530-125", =
"img,sgx530", "img,sgx5"; - BeagleBone Black
>> +               "ti,omap4-sgx540-120", "img,sgx540-120", =
"img,sgx540", "img,sgx5"; - Pandaboard (ES)
>> +               "ti,omap4-sgx544-112", "img,sgx544-112", =
"img,sgx544", "img,sgx5";
>> +               "ti,omap5-sgx544-116", "img,sgx544-116", =
"img,sgx544", "img,sgx5"; - OMAP5 UEVM, Pyra Handheld
>> +               "ti,dra7-sgx544-116", "img,sgx544-116", "img,sgx544", =
"img,sgx5";
>> +               "ti,am3517-sgx530-?", "img,sgx530-?", "img,sgx530", =
"img,sgx5";
>> +               "ti,am43xx-sgx530-?", "img,sgx530-?", "img,sgx530", =
"img,sgx5";
>> +               "ti,ti81xx-sgx530-?", "img,sgx530-?", "img,sgx530", =
"img,sgx5";
>> +               "img,jz4780-sgx540-?", "img,sgx540-?", "img,sgx540", =
"img,sgx5"; - CI20
>> +               "allwinner,sun8i-a83t-sgx544-?", "img,sgx544-116", =
"img,sgx544", "img,sgx5"; - Banana-Pi-M3 (Allwinner A83T)
>> +               "intel,poulsbo-gma500-sgx535", "img,sgx535-116", =
"img,sgx535", "img,sgx5"; - Atom Z5xx
>> +               "intel,medfield-gma-sgx540", "img,sgx540-116", =
"img,sgx540", "img,sgx5"; - Atom Z24xx
>> +               "intel,cedarview-gma3600-sgx545", "img,sgx545-116", =
"img,sgx545", "img,sgx5"; - Atom N2600, D2500
>> +
>> +               The "ti,omap..." entries are needed temporarily to =
handle SoC
>> +               specific builds of the kernel module.
>> +
>> +               In the long run, only the "img,sgx..." entry should =
suffice
>> +               to match a generic driver for all architectures and =
driver
>> +               code can dynamically find out on which SoC it is =
running.
>> +
>> +
>> +  - reg:               Physical base address and length of the =
register area.
>> +  - interrupts:        The interrupt numbers.
>> +
>> +  / {
>> +       ocp {
>> +               sgx_module: target-module@56000000 {
>> +                       compatible =3D "ti,sysc-omap4", "ti,sysc";
>> +                       reg =3D <0x5600fe00 0x4>,
>> +                             <0x5600fe10 0x4>;
>> +                       reg-names =3D "rev", "sysc";
>> +                       ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
>> +                                       <SYSC_IDLE_NO>,
>> +                                       <SYSC_IDLE_SMART>;
>> +                       ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
>> +                                       <SYSC_IDLE_NO>,
>> +                                       <SYSC_IDLE_SMART>;
>> +                       clocks =3D <&gpu_clkctrl OMAP5_GPU_CLKCTRL =
0>;
>> +                       clock-names =3D "fck";
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <1>;
>> +                       ranges =3D <0 0x56000000 0x2000000>;
>> +
>> +                       gpu@fe00 {
>> +                               compatible =3D =
"ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
>> +                               reg =3D <0xfe00 0x200>;
>> +                               interrupts =3D <GIC_SPI 21 =
IRQ_TYPE_LEVEL_HIGH>;
>> +                       };
>> +               };
>> +       };
>> +  };
>> --
>> 2.23.0
>>=20

BR and thanks for the help towards a PATCH v3,
Nikolaus


