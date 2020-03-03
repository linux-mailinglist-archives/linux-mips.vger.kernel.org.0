Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D315176FF2
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2020 08:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgCCHWI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Mar 2020 02:22:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:8795 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbgCCHWI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Mar 2020 02:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583220123;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/FFJp29E0bM3pvHTu+JTqNaYJ7aZHkmiAWb7IBx82t4=;
        b=tDly5Q0rgQXnp5SE2SQtiMZKkTKELlzQ1ExyaOKdk/JoMKZ/DZBhDg8xmu35Lg87dN
        5fydczeSnZWO1+K96MiJpNJLQIA7Ma8+/D886QNuh4IdNw/wnXVn4c5QRGBd9ifyDbI/
        FmEUAbpBOnJ9LHcARrsiVTZUln+0+vbyDmsWwzHQD0oOy+UVQIjNje/dFijBC82/IgmJ
        nfn9UYWGMbclQEkRtvmxwC0/9cbFBuEtimt/3AAKpAMPMgCA0Ry1wfYKaFP7yrJqMwm/
        Bn4G6zAmNzctHUlbgIf+pa5zmExYU5U+wW5r9ry+YcTxMHFRAhAPp3rImrxp3zPELszD
        N50Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw237LkFyR
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 3 Mar 2020 08:21:46 +0100 (CET)
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT Schema
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1583176247.3.2@crapouillou.net>
Date:   Tue, 3 Mar 2020 08:21:37 +0100
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Sam Ravnborg <sam@ravnborg.org>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        Rob Herring <robh@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <12E78333-0940-4F20-863E-91272C477B58@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com> <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com> <1583176247.3.2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 02.03.2020 um 20:10 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> From: Sam Ravnborg <sam@ravnborg.org>
>> Add DT bindings for the LCD controller on the jz4780 SoC
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>=20
> If you mean Documentation/devicetree/bindings/display/ingenic,lcd.txt =
then it was written by me.

Ah, ok. We didn't recognise this before. 6 eyes see more than 4...

I just did cherry-pick this old 4.0 patch from 2015 by Zubair
and it created a ingenic-jz4780-lcd.txt:

https://lore.kernel.org/patchwork/patch/547872/

and Sam was so kind to convert it to yaml.

>=20
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 =
+++++++++++++++++++
>> 1 file changed, 78 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>> diff --git =
a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>> new file mode 100644
>> index 000000000000..c71415a3a342
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-lcd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic JZ4780 LCD Controller
>> +
>> +maintainers:
>> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
>=20
> I'm the author of the driver, please put me here; and remove Zubair, =
which 1. didn't touch the DRM driver at all, and 2. isn't working at =
ImgTec anymore.

Yes that is true.

> Also, no need to put yourself here, unless you maintain the Ingenic =
DRM/KMS driver.

Agreed. That was suggested by Sam.

>=20
>> +
>> +description: |
>> +  LCD Controller is the Display Controller for the Ingenic JZ4780 =
SoC
>> +
>> +properties:
>=20
> You should add a '$nodename' property.
>=20
>> +  compatible:
>> +    items:
>> +      - const: ingenic,jz4780-lcd
>=20
> The .txt lists more compatible strings. Please add them all.
>=20
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: the address & size of the LCD controller registers
>=20
> Drop the description here,
>=20
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Specifies the interrupt provided by parent
>=20
> and here.
>=20
>> +
>> +  clocks:
>> +    maxItems: 2
>> +    description: Clock specifiers for the JZ4780_CLK_TVE =
JZ4780_CLK_LCD0PIXCLK
>=20
> Add one 'description:' per item.
>=20
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lcd_clk
>> +      - const: lcd_pixclk
>> +
>> +  port:
>> +    type: object
>> +    description: |
>> +      A port node with endpoint definitions as defined in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +required:
>> +    - compatible
>> +    - reg
>> +    - interrupts
>> +    - clocks
>> +    - clock-names
>> +    - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>> +    lcd: jz4780-lcdk@0x13050000 {
>=20
> The node name does not comply with the DT spec, it should be =
'lcd-controller'.

Ok, I think I'll review all so that it does match/replace
Documentation/devicetree/bindings/display/ingenic,lcd.txt
and no information is lost.
=20
>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus

