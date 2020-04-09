Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A901A2FFC
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 09:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgDIH0h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 03:26:37 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:57112 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgDIH0h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 03:26:37 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 67894804E6;
        Thu,  9 Apr 2020 09:26:00 +0200 (CEST)
Date:   Thu, 9 Apr 2020 09:25:59 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
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
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic, lcd.txt to
 ingenic, lcd.yaml
Message-ID: <20200409072559.GB12367@ravnborg.org>
References: <cover.1585503354.git.hns@goldelico.com>
 <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
        a=7gkXJVJtAAAA:8 a=ztCEdXhiAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
        a=EOonHDGkKxT7KvGTIpcA:9 a=gAFmQjLz7WC3uhn-:21 a=lEZKnLxH932zqgqy:21
        a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=nCm3ceeH17rKjHWsMeRo:22 a=AjGcO6oz07-iQ99wixmX:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus


Some comments below that will result in a simplee binding that passes
the checks.
Thanks for pushing this.

	Sam

On Sun, Mar 29, 2020 at 07:35:47PM +0200, H. Nikolaus Schaller wrote:
> and add compatible: jz4780-lcd, including an example how to
> configure both lcd controllers.
> 
> Also fix the clock names and examples.
> 
> Based on work by Paul Cercueil <paul@crapouillou.net> and
> Sam Ravnborg <sam@ravnborg.org>
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic,lcd.txt          |  45 ------
>  .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> deleted file mode 100644
> index 01e3261defb6..000000000000
> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Ingenic JZ47xx LCD driver
> -
> -Required properties:
> -- compatible: one of:
> -  * ingenic,jz4740-lcd
> -  * ingenic,jz4725b-lcd
> -  * ingenic,jz4770-lcd
> -- reg: LCD registers location and length
> -- clocks: LCD pixclock and device clock specifiers.
> -	   The device clock is only required on the JZ4740.
> -- clock-names: "lcd_pclk" and "lcd"
> -- interrupts: Specifies the interrupt line the LCD controller is connected to.
> -
> -Example:
> -
> -panel {
> -	compatible = "sharp,ls020b1dd01d";
> -
> -	backlight = <&backlight>;
> -	power-supply = <&vcc>;
> -
> -	port {
> -		panel_input: endpoint {
> -			remote-endpoint = <&panel_output>;
> -		};
> -	};
> -};
> -
> -
> -lcd: lcd-controller@13050000 {
> -	compatible = "ingenic,jz4725b-lcd";
> -	reg = <0x13050000 0x1000>;
> -
> -	interrupt-parent = <&intc>;
> -	interrupts = <31>;
> -
> -	clocks = <&cgu JZ4725B_CLK_LCD>;
> -	clock-names = "lcd";
> -
> -	port {
> -		panel_output: endpoint {
> -			remote-endpoint = <&panel_input>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> new file mode 100644
> index 000000000000..8b6467cfc191
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 LCD Controller
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +description: |
> +  LCD Controller is the Display Controller for the Ingenic JZ47xx SoC
> +
> +properties:
> +  compatible:
> +    oneOf:
> +     - const: ingenic,jz4725b-lcd
> +     - const: ingenic,jz4740-lcd
> +     - const: ingenic,jz4770-lcd
> +     - const: ingenic,jz4780-lcd
> +
> +  reg:
> +    maxItems: 1
> +    description: LCD registers location and length
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent
> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for LCD pixclock and device clock.
> +      The device clock is only required on the JZ4740 and JZ4780
> +
> +  clock-names:
> +    items:
> +      - const: lcd
> +      - const: lcd_pclk
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
> +    #include <dt-bindings/clock/jz4725b-cgu.h>
> +
> +    panel {
> +      compatible = "sharp,ls020b1dd01d";
> +
> +      backlight = <&backlight>;
> +      power-supply = <&vcc>;
> +
> +      port {
> +        panel_input: endpoint {
> +          remote-endpoint = <&panel_output>;
> +          };
> +        };
> +      };
The panel part is not needed - better to drop it.


> +
> +    lcd: lcd-controller@13050000 {
> +      compatible = "ingenic,jz4725b-lcd";
> +      reg = <0x13050000 0x1000>;
> +
> +      interrupt-parent = <&intc>;
> +      interrupts = <31>;
> +
> +      clocks = <&cgu JZ4725B_CLK_LCD>;
> +      clock-names = "lcd", "lcd_pclk";
> +
> +      port {
> +        panel_output: endpoint {
> +          remote-endpoint = <&panel_input>;
> +          };
> +        };
> +      };
We know this example will not pass the check, as there is only
one clock specified.
I suggest to drop this example.
If it later turns out that jz4725b only have one clock, then the binding
needs to be updated. But the best guess is that the example is wrong.

The example below for jz4780-lcd cover all relevant parts - so
just keep it as the only example.

> +
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    lcdc0: lcdc0@13050000 {
Name this lcdc
And drop "lcdc0@13050000" as this is not relevant for this example.

Remember - the examples exist to explain the binding. They are
just examples.

> +        compatible = "ingenic,jz4780-lcd";
> +        reg = <0x13050000 0x1800>;
> +
> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +        clock-names = "lcd", "lcd_pclk";
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <31>;
> +
> +        jz4780_lcd_out: port {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            jz4780_out_hdmi: endpoint@0 {
> +                reg = <0>;
> +                remote-endpoint = <&hdmi_in_lcd>;
> +            };
> +        };
> +    };
> +

And drop this as it does not add anything extra.
> +    lcdc1: lcdc1@130a0000 {
> +        compatible = "ingenic,jz4780-lcd";
> +        reg = <0x130a0000 0x1800>;
> +
> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
> +        clock-names = "lcd", "lcd_pclk";
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <31>;
> +
> +        status = "disabled";
> +    };

	Sam
