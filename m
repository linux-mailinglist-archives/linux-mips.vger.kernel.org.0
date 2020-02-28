Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C73F173FD4
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgB1Smz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:42:55 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:44760 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1Smz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:42:55 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 2EED82004C;
        Fri, 28 Feb 2020 19:42:44 +0100 (CET)
Date:   Fri, 28 Feb 2020 19:42:42 +0100
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
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
Message-ID: <20200228184242.GA20089@ravnborg.org>
References: <cover.1582913973.git.hns@goldelico.com>
 <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=r_1tXGB3AAAA:8 a=ztCEdXhiAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
        a=pSfg_kgG_YkFMEKRir4A:9 a=qn4TxXM_sh0ilUaX:21 a=kcv_VjDv9XC6Jkun:21
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=t8nPyN_e6usw4ciXM-Pk:22
        a=nCm3ceeH17rKjHWsMeRo:22 a=AjGcO6oz07-iQ99wixmX:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus.

On Fri, Feb 28, 2020 at 07:19:26PM +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org

As this patch was sent to you and you forward it you need to
testify that this is OK.
To do so follow the rules of the Developemnt Certificate of Origin
as can be found in SubmittingPatches.rst.

In other words - you need to add your Signed-off-by: xxx <mail>
to the patch.
In the end we want to be able to see the patch the patch has taken
reading the Signed-off-by: lines from top to bottom.

Please check other patches in this series for the same issue.

	Sam

> ---
>  .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> new file mode 100644
> index 000000000000..c71415a3a342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
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
> +    description: Clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK
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
> +        compatible = "ingenic,jz4780-lcd";
> +        reg = <0x13050000 0x1800>;
> +
> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +        clock-names = "lcd_clk", "lcd_pixclk";
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
> +...
> -- 
> 2.23.0
