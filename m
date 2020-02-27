Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2915C172462
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 18:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgB0RCt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 12:02:49 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:21812 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgB0RCt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 12:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582822966;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=yeUIqaAJ7VXFqwVruCWqy0jWCc6j1Qnr2zUWCdNbA7g=;
        b=E9YYRu+6ZOvtLW+QoUfpSQ6RwEnQVBPNstXKvZBzVUPGQeRPgwIJO9LY0SjZiJgY+z
        jy++uGJ+VdfJitrnBGIFrTGOiZaevL6i3a5PGQJthn0XzvdgQA7aQKZG8hvYdQsDboU/
        Y1ghwzUKZlbaJV8+WXbw5ChvCce+clM+mn+bUndtaZzvxEvK3TNDnxFHdrhpUMjtzcO7
        rwPJjgVPv4XUC3GFE8hi/XECfwcbWXC5qd6q8kWxXwFCnLTwvrfn7l8R7vy2ZqeEO6+V
        3AsZuWmZcR/Uzpac+ruz/m+WwtLKRauRhe05EKgYzFHth5MxpFqKkpML7wgKIqW+mj3w
        pHNg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCygV4+2OGxpoAD/iZZ4UvO7sJFY5u171hM7FV7f"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2655:a800:246e:381e:f646:1249]
        by smtp.strato.de (RZmta 46.1.12 AUTH)
        with ESMTPSA id U06217w1RH2bCKd
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 27 Feb 2020 18:02:37 +0100 (CET)
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200227165706.GA20296@ravnborg.org>
Date:   Thu, 27 Feb 2020 18:02:44 +0100
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pyra-handheld.com,
        letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <514B0D8F-E503-4643-BC4C-7EBAAB78213A@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com> <20200227122325.GA7587@ravnborg.org> <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com> <20200227165706.GA20296@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sam,
great. Thank you very much!

> Am 27.02.2020 um 17:57 schrieb Sam Ravnborg <sam@ravnborg.org>:
>=20
> Hi Nikolaus.
>=20
>>>> Zubair Lutfullah Kakakhel (2):
>>>> dt-bindings: video: Add jz4780-lcd binding
>>>> dt-bindings: video: Add jz4780-hdmi binding
>>>>=20
>>>> .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
>>>> .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
>>> New bindings in DT Schema format please...
>>> We want to have then in a formal launguage so we can use these
>>> to verify the DT files.
>>=20
>> Yes, I know. And I fully support the goal.
>>=20
>> But I personally do not have the time to learn the (IMHO =
brain-twisting)
>> way the Schema format is working. Especially, I am not interested
>> in becoming volunteer translator for .txt based schemas developed
>> by someone else.
>>=20
>> So I hope that someone from the community can and is willing to do
>> that.
>=20
> I went ahead and typed them - please review and use these if OK.
>=20
> 	Sam
>=20
> =46rom 6fee276807dfe4a502ff760e7c7840480d275052 Mon Sep 17 00:00:00 =
2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Thu, 27 Feb 2020 17:18:29 +0100
> Subject: [PATCH 1/2] dt-bindings: display: add ingenic-jz4780-lcd DT =
Schema
>=20
> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
> 1 file changed, 78 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> new file mode 100644
> index 000000000000..c71415a3a342
> --- /dev/null
> +++ =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 LCD Controller
> +
> +maintainers:
> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-lcd
> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent
> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for the JZ4780_CLK_TVE =
JZ4780_CLK_LCD0PIXCLK
> +
> +  clock-names:
> +    items:
> +      - const: lcd_clk
> +      - const: lcd_pixclk
> +
> +  port:
> +    type: object
> +    description: |
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +required:
> +    - compatible
> +    - reg
> +    - interrupts
> +    - clocks
> +    - clock-names
> +    - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +    lcd: jz4780-lcdk@0x13050000 {
> +        compatible =3D "ingenic,jz4780-lcd";
> +        reg =3D <0x13050000 0x1800>;
> +
> +        clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu =
JZ4780_CLK_LCD0PIXCLK>;
> +        clock-names =3D "lcd_clk", "lcd_pixclk";
> +
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <31>;
> +
> +        jz4780_lcd_out: port {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            jz4780_out_hdmi: endpoint@0 {
> +                reg =3D <0>;
> +                remote-endpoint =3D <&hdmi_in_lcd>;
> +            };
> +        };
> +    };
> +
> +...
> --=20
> 2.20.1
>=20
> =46rom f4d01a657e07d468eb0bc811ed8edae0b58d66d7 Mon Sep 17 00:00:00 =
2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Thu, 27 Feb 2020 17:52:34 +0100
> Subject: [PATCH 2/2] dt-bindings: display: add ingenic-jz4780-ihdmi DT =
Schema
>=20
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> .../bindings/display/ingenic-jz4780-hdmi.yaml | 83 +++++++++++++++++++
> 1 file changed, 83 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> new file mode 100644
> index 000000000000..9b71c427bd69
> --- /dev/null
> +++ =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare =
HDMI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-hdmi
> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers
> +
> +  reg-io-width:
> +    const: 4
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent
> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for isrf and iahb clocks
> +
> +  clock-names:
> +    items:
> +      - const: isfr
> +      - const: iahb
> +
> +  ddc-i2c-bus: true
> +  ports: true
> +
> +required:
> +    - compatible
> +    - clocks
> +    - clock-names
> +    - ports
> +    - reg-io-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    hdmi: hdmi@10180000 {
> +        compatible =3D "ingenic,jz4780-hdmi";
> +        reg =3D <0x10180000 0x8000>;
> +        reg-io-width =3D <4>;
> +        ddc-i2c-bus =3D <&i2c4>;
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <3>;
> +        clocks =3D <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +        clock-names =3D "isfr", "iahb";
> +
> +        ports {
> +            hdmi_in: port {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                hdmi_in_lcd: endpoint@0 {
> +                    reg =3D <0>;
> +                    remote-endpoint =3D <&jz4780_out_hdmi>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> --=20
> 2.20.1
>=20


I'll integrate into v2.

Now we need to make the HDMI output show something...

BR,
Nikolaus

