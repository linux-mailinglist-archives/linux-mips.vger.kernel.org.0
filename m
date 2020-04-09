Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFDF1A3046
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 09:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgDIHgS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 03:36:18 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:8476 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgDIHgR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 03:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586417772;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=p/fJO+m4yZtXR50Z5fB9MrtpHpTRjAxw4Da1env8x/c=;
        b=Vz6JDLynP82xWBRafTHj1vIihXER/Lo73gUejjg75UfQahOcoMKtGw5kL3OUZ6JlEP
        OzFy2CLXUCnsC5z2rbh3bmt3FrXlnl51sbszLajr7snNZ0gW9W/9F9YDpWxykJ2ODcnG
        l8b4GHmbYEBLVHTpf6ZJszThyZco8fq1Q4X0Q78KFj7zsDSq60aX+QVpL5SVuU4mit46
        NuT7E7pys3mIRGbXmUZPpjk6LMGTaTMEyzX5nlMwADbH5hGU7kyOqQe3DizzQnh4RtDD
        9aPB0NsrnciWsKfy+f3gSODO2w9sDMUZ6UHWMV65KHz6gfXBGSBymnjToNOPwDdcDo/Z
        x6hQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zvwDCoFnA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w397ZrtOR
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 9 Apr 2020 09:35:53 +0200 (CEST)
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic, lcd.txt to ingenic, lcd.yaml
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200409072559.GB12367@ravnborg.org>
Date:   Thu, 9 Apr 2020 09:35:53 +0200
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
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
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        mips-creator-ci20-dev@googlegroups.com,
        letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4F5D267-A538-444B-9DCA-EA87AC798FB3@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com> <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com> <20200409072559.GB12367@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sam,

> Am 09.04.2020 um 09:25 schrieb Sam Ravnborg <sam@ravnborg.org>:
>=20
> Hi Nikolaus
>=20
>=20
> Some comments below that will result in a simplee binding that passes
> the checks.
> Thanks for pushing this.
>=20
> 	Sam
>=20
> On Sun, Mar 29, 2020 at 07:35:47PM +0200, H. Nikolaus Schaller wrote:
>> and add compatible: jz4780-lcd, including an example how to
>> configure both lcd controllers.
>>=20
>> Also fix the clock names and examples.
>>=20
>> Based on work by Paul Cercueil <paul@crapouillou.net> and
>> Sam Ravnborg <sam@ravnborg.org>
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic,lcd.txt          |  45 ------
>> .../bindings/display/ingenic,lcd.yaml         | 128 =
++++++++++++++++++
>> 2 files changed, 128 insertions(+), 45 deletions(-)
>> delete mode 100644 =
Documentation/devicetree/bindings/display/ingenic,lcd.txt
>> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/display/ingenic,lcd.txt =
b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
>> deleted file mode 100644
>> index 01e3261defb6..000000000000
>> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -Ingenic JZ47xx LCD driver
>> -
>> -Required properties:
>> -- compatible: one of:
>> -  * ingenic,jz4740-lcd
>> -  * ingenic,jz4725b-lcd
>> -  * ingenic,jz4770-lcd
>> -- reg: LCD registers location and length
>> -- clocks: LCD pixclock and device clock specifiers.
>> -	   The device clock is only required on the JZ4740.
>> -- clock-names: "lcd_pclk" and "lcd"
>> -- interrupts: Specifies the interrupt line the LCD controller is =
connected to.
>> -
>> -Example:
>> -
>> -panel {
>> -	compatible =3D "sharp,ls020b1dd01d";
>> -
>> -	backlight =3D <&backlight>;
>> -	power-supply =3D <&vcc>;
>> -
>> -	port {
>> -		panel_input: endpoint {
>> -			remote-endpoint =3D <&panel_output>;
>> -		};
>> -	};
>> -};
>> -
>> -
>> -lcd: lcd-controller@13050000 {
>> -	compatible =3D "ingenic,jz4725b-lcd";
>> -	reg =3D <0x13050000 0x1000>;
>> -
>> -	interrupt-parent =3D <&intc>;
>> -	interrupts =3D <31>;
>> -
>> -	clocks =3D <&cgu JZ4725B_CLK_LCD>;
>> -	clock-names =3D "lcd";
>> -
>> -	port {
>> -		panel_output: endpoint {
>> -			remote-endpoint =3D <&panel_input>;
>> -		};
>> -	};
>> -};
>> diff --git =
a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml =
b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>> new file mode 100644
>> index 000000000000..8b6467cfc191
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic JZ4780 LCD Controller
>> +
>> +maintainers:
>> +  - Paul Cercueil <paul@crapouillou.net>
>> +
>> +description: |
>> +  LCD Controller is the Display Controller for the Ingenic JZ47xx =
SoC
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +     - const: ingenic,jz4725b-lcd
>> +     - const: ingenic,jz4740-lcd
>> +     - const: ingenic,jz4770-lcd
>> +     - const: ingenic,jz4780-lcd
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: LCD registers location and length
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Specifies the interrupt provided by parent
>> +
>> +  clocks:
>> +    maxItems: 2
>> +    description: Clock specifiers for LCD pixclock and device clock.
>> +      The device clock is only required on the JZ4740 and JZ4780
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lcd
>> +      - const: lcd_pclk
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
>> +    #include <dt-bindings/clock/jz4725b-cgu.h>
>> +
>> +    panel {
>> +      compatible =3D "sharp,ls020b1dd01d";
>> +
>> +      backlight =3D <&backlight>;
>> +      power-supply =3D <&vcc>;
>> +
>> +      port {
>> +        panel_input: endpoint {
>> +          remote-endpoint =3D <&panel_output>;
>> +          };
>> +        };
>> +      };
> The panel part is not needed - better to drop it.

Well, it is needed to fulfill the remote-endpoint below.

>=20
>=20
>> +
>> +    lcd: lcd-controller@13050000 {
>> +      compatible =3D "ingenic,jz4725b-lcd";
>> +      reg =3D <0x13050000 0x1000>;
>> +
>> +      interrupt-parent =3D <&intc>;
>> +      interrupts =3D <31>;
>> +
>> +      clocks =3D <&cgu JZ4725B_CLK_LCD>;
>> +      clock-names =3D "lcd", "lcd_pclk";
>> +
>> +      port {
>> +        panel_output: endpoint {
>> +          remote-endpoint =3D <&panel_input>;
>> +          };
>> +        };
>> +      };
> We know this example will not pass the check, as there is only
> one clock specified.
> I suggest to drop this example.
> If it later turns out that jz4725b only have one clock,

Paul already reported that it only wants to see one clock.

> then the binding
> needs to be updated.

Yes, I have that on my to-do list to update the binding to reflect
this minItems/maxItems thing but I am not yet sure about how
to handle the clock-names in that case. I.e. make "lcd" optional
and enforce "lcd_pclk" only.

> But the best guess is that the example is wrong.
>=20
> The example below for jz4780-lcd cover all relevant parts - so
> just keep it as the only example.
>=20
>> +
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>> +
>> +    lcdc0: lcdc0@13050000 {
> Name this lcdc
> And drop "lcdc0@13050000" as this is not relevant for this example.
>=20
> Remember - the examples exist to explain the binding. They are
> just examples.
>=20
>> +        compatible =3D "ingenic,jz4780-lcd";
>> +        reg =3D <0x13050000 0x1800>;
>> +
>> +        clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu =
JZ4780_CLK_LCD0PIXCLK>;
>> +        clock-names =3D "lcd", "lcd_pclk";
>> +
>> +        interrupt-parent =3D <&intc>;
>> +        interrupts =3D <31>;
>> +
>> +        jz4780_lcd_out: port {
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <0>;
>> +
>> +            jz4780_out_hdmi: endpoint@0 {
>> +                reg =3D <0>;
>> +                remote-endpoint =3D <&hdmi_in_lcd>;
>> +            };
>> +        };
>> +    };
>> +
>=20
> And drop this as it does not add anything extra.

Well, it demonstrates how to add a second lcdc which is disabled.

Showing that it is possible to do so is IMHO the most important
part of the example because it is not at all obvious.

I have also added both SoC to show how differently they can
and should be.

>> +    lcdc1: lcdc1@130a0000 {
>> +        compatible =3D "ingenic,jz4780-lcd";
>> +        reg =3D <0x130a0000 0x1800>;
>> +
>> +        clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu =
JZ4780_CLK_LCD1PIXCLK>;
>> +        clock-names =3D "lcd", "lcd_pclk";
>> +
>> +        interrupt-parent =3D <&intc>;
>> +        interrupts =3D <31>;
>> +
>> +        status =3D "disabled";
>> +    };
>=20
> 	Sam

BR and thanks,
Nikolaus


