Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6555D17637F
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 20:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgCBTLO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 14:11:14 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:55302 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgCBTLO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 14:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583176271; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qUmHkSVvfOQ5Yez5YuN7iPqIHHCEuQ8Hl+LgCyysZ2Q=;
        b=BlykB7esCbADKOpKOWvsF8w+P1xUQvIHP69KiK3i5TAjC1e4cmyehG9seXh2uM72hjU4De
        LtpjoJdkiGjMLoK0e+x7J84RRbY1IzMR9cjbk3AOrS3l8cG+mJW+1Xwshp3b0nLOIOXNcn
        QvgAPyYOMfmzPgqGwwPfBotzZ92pzYc=
Date:   Mon, 02 Mar 2020 16:10:47 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
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
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, Sam Ravnborg <sam@ravnborg.org>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        Rob Herring <robh@kernel.org>
Message-Id: <1583176247.3.2@crapouillou.net>
In-Reply-To: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
        <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel

If you mean Documentation/devicetree/bindings/display/ingenic,lcd.txt=20
then it was written by me.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-lcd.yaml  | 78=20
> +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml=20
> b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> new file mode 100644
> index 000000000000..c71415a3a342
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
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

I'm the author of the driver, please put me here; and remove Zubair,=20
which 1. didn't touch the DRM driver at all, and 2. isn't working at=20
ImgTec anymore. Also, no need to put yourself here, unless you maintain=20
the Ingenic DRM/KMS driver.

> +
> +description: |
> +  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
> +
> +properties:

You should add a '$nodename' property.

> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-lcd

The .txt lists more compatible strings. Please add them all.

> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers

Drop the description here,

> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent

and here.

> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for the JZ4780_CLK_TVE=20
> JZ4780_CLK_LCD0PIXCLK

Add one 'description:' per item.

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

The node name does not comply with the DT spec, it should be=20
'lcd-controller'.

Cheers,
-Paul

> +        compatible =3D "ingenic,jz4780-lcd";
> +        reg =3D <0x13050000 0x1800>;
> +
> +        clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
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
> --
> 2.23.0
>=20

=

