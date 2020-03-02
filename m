Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6701763B7
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 20:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgCBTUQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 14:20:16 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:35682 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727526AbgCBTUQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 14:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583176813; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9b0Z/Qba7LUP/RrSMDKMHs9SQ88poHoZJgYnVCQFASA=;
        b=d0MKOFwQvBM6ClQa3yJHcMLwqnFovSbXy6cAQd+XKMeESguGlK4NDxP3myaRBaTVDvLJpD
        mPGCFhxHF+bJlFt69p4zpUGcDFAXl7UCG36KcDmYg19DagklpthXmJ9fWu8kzJMlrsTQJJ
        2yrP7XgiI383KknSTRt8OErBlYnXfLg=
Date:   Mon, 02 Mar 2020 16:19:47 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 2/8] dt-bindings: display: add ingenic-jz4780-hdmi DT
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
Message-Id: <1583176788.3.3@crapouillou.net>
In-Reply-To: <0fb2f39437ea04fb4de889aac001b44f4b0a77e8.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
        <0fb2f39437ea04fb4de889aac001b44f4b0a77e8.1582913973.git.hns@goldelico.com>
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
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 83=20
> +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml=20
> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> new file mode 100644
> index 000000000000..9b71c427bd69
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
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

Did Zubair write this glue driver? He's been MIA for a while, doesn't=20
work at ImgTec anymore, and this email doesn't work.

> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys=20
> DesignWare HDMI 1.4
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

Remove the description here,

> +
> +  reg-io-width:
> +    const: 4
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent

and here.

The rule is that if there is only one "reg", "interrupts" or "clocks"=20
entry then a description is not needed as it's pretty obvious what it's=20
for.

> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for isrf and iahb clocks

You need two 'description:' like this:

clocks:
  items:
    - description: ISRF clock
    - description: IAHB clock

Cheers,
-Paul

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
> --
> 2.23.0
>=20

=

