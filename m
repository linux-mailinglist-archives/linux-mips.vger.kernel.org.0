Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F2F45B73E
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 10:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241449AbhKXJVP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 24 Nov 2021 04:21:15 -0500
Received: from aposti.net ([89.234.176.197]:45226 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229926AbhKXJVP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Nov 2021 04:21:15 -0500
Date:   Wed, 24 Nov 2021 09:17:50 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Message-Id: <QHK23R.B5XN10D1VV2O1@crapouillou.net>
In-Reply-To: <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
        <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le mar., nov. 23 2021 at 19:13:56 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 
> +++++++++++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> 
> diff --git 
> a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml 
> b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> new file mode 100644
> index 0000000000000..190ca4521b1d0
> --- /dev/null
> +++ 
> b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bridge/ingenic,jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys 
> DesignWare HDMI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: bridge/synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: ingenic,jz4780-dw-hdmi
> +
> +  reg-io-width:
> +    const: 4
> +
> +  clocks:
> +    maxItems: 2
> +
> +  hdmi-5v-supply:
> +    description: Optional regulator to provide +5V at the connector
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +required:
> +    - compatible
> +    - clocks
> +    - clock-names
> +    - ports
> +    - reg-io-width
> +
> +unevaluatedPropertes: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>

This include was moved in 5.16-rc1 to 
<dt-bindings/clock/ingenic,jz4780-cgu.h>.

Cheers,
-Paul

> +
> +    hdmi: hdmi@10180000 {
> +        compatible = "ingenic,jz4780-dw-hdmi";
> +        reg = <0x10180000 0x8000>;
> +        reg-io-width = <4>;
> +        ddc-i2c-bus = <&i2c4>;
> +        interrupt-parent = <&intc>;
> +        interrupts = <3>;
> +        clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
> +        clock-names = "iahb", "isfr";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            hdmi_in: port@0 {
> +                reg = <0>;
> +                dw_hdmi_in: endpoint {
> +                    remote-endpoint = <&jz4780_lcd_out>;
> +                };
> +            };
> +            hdmi_out: port@1 {
> +                reg = <1>;
> +                dw_hdmi_out: endpoint {
> +                    remote-endpoint = <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git 
> a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml 
> b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 9be44a682e67a..9cbeabaee0968 100644
> --- 
> a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ 
> b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -50,6 +50,9 @@ properties:
>    interrupts:
>      maxItems: 1
> 
> +  ddc-i2c-bus:
> +    description: An I2C interface if the internal DDC I2C driver is 
> not to be used
> +
>  additionalProperties: true
> 
>  ...
> --
> 2.33.0
> 


