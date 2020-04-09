Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21FB01A33F8
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 14:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDIMVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 08:21:08 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:56972 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 08:21:08 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id DA56180539;
        Thu,  9 Apr 2020 14:21:00 +0200 (CEST)
Date:   Thu, 9 Apr 2020 14:20:54 +0200
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
Message-ID: <20200409122054.GA5683@ravnborg.org>
References: <cover.1585503354.git.hns@goldelico.com>
 <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
 <20200409072559.GB12367@ravnborg.org>
 <F4F5D267-A538-444B-9DCA-EA87AC798FB3@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F4F5D267-A538-444B-9DCA-EA87AC798FB3@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=Cwf29u2qlR-08nbE3pUA:9 a=CjuIK1q_8ugA:10
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus.

> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/jz4725b-cgu.h>
> >> +
> >> +    panel {
> >> +      compatible = "sharp,ls020b1dd01d";
> >> +
> >> +      backlight = <&backlight>;
> >> +      power-supply = <&vcc>;
> >> +
> >> +      port {
> >> +        panel_input: endpoint {
> >> +          remote-endpoint = <&panel_output>;
> >> +          };
> >> +        };
> >> +      };
> > The panel part is not needed - better to drop it.
> 
> Well, it is needed to fulfill the remote-endpoint below.

Examples may have phandle that are not defined.
So the example will work fine without it.
See other similar examples.

> 
> > 
> > 
> >> +
> >> +    lcd: lcd-controller@13050000 {
> >> +      compatible = "ingenic,jz4725b-lcd";
> >> +      reg = <0x13050000 0x1000>;
> >> +
> >> +      interrupt-parent = <&intc>;
> >> +      interrupts = <31>;
> >> +
> >> +      clocks = <&cgu JZ4725B_CLK_LCD>;
> >> +      clock-names = "lcd", "lcd_pclk";
> >> +
> >> +      port {
> >> +        panel_output: endpoint {
> >> +          remote-endpoint = <&panel_input>;
> >> +          };
> >> +        };
> >> +      };
> > We know this example will not pass the check, as there is only
> > one clock specified.
> > I suggest to drop this example.
> > If it later turns out that jz4725b only have one clock,
> 
> Paul already reported that it only wants to see one clock.
> 
> > then the binding
> > needs to be updated.
> 
> Yes, I have that on my to-do list to update the binding to reflect
> this minItems/maxItems thing but I am not yet sure about how
> to handle the clock-names in that case. I.e. make "lcd" optional
> and enforce "lcd_pclk" only.
Look forward to next version.

> 
> > But the best guess is that the example is wrong.
> > 
> > The example below for jz4780-lcd cover all relevant parts - so
> > just keep it as the only example.
> > 
> >> +
> >> +  - |
> >> +    #include <dt-bindings/clock/jz4780-cgu.h>
> >> +
> >> +    lcdc0: lcdc0@13050000 {
> > Name this lcdc
> > And drop "lcdc0@13050000" as this is not relevant for this example.
> > 
> > Remember - the examples exist to explain the binding. They are
> > just examples.
> > 
> >> +        compatible = "ingenic,jz4780-lcd";
> >> +        reg = <0x13050000 0x1800>;
> >> +
> >> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> >> +        clock-names = "lcd", "lcd_pclk";
> >> +
> >> +        interrupt-parent = <&intc>;
> >> +        interrupts = <31>;
> >> +
> >> +        jz4780_lcd_out: port {
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +
> >> +            jz4780_out_hdmi: endpoint@0 {
> >> +                reg = <0>;
> >> +                remote-endpoint = <&hdmi_in_lcd>;
> >> +            };
> >> +        };
> >> +    };
> >> +
> > 
> > And drop this as it does not add anything extra.
> 
> Well, it demonstrates how to add a second lcdc which is disabled.
The purpose of the example is to show an example of the
binding specified in this file.
Adding a second disabled lcdc is a general thing, and not
something we want in all the individual examples.

Also the actual content, for example register values can be
random as they are not part of the binding.
This is not a documentation of the HW but a binding example.

	Sam

> 
> Showing that it is possible to do so is IMHO the most important
> part of the example because it is not at all obvious.
> 
> I have also added both SoC to show how differently they can
> and should be.
> 
> >> +    lcdc1: lcdc1@130a0000 {
> >> +        compatible = "ingenic,jz4780-lcd";
> >> +        reg = <0x130a0000 0x1800>;
> >> +
> >> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
> >> +        clock-names = "lcd", "lcd_pclk";
> >> +
> >> +        interrupt-parent = <&intc>;
> >> +        interrupts = <31>;
> >> +
> >> +        status = "disabled";
> >> +    };
> > 
> > 	Sam
> 
> BR and thanks,
> Nikolaus
> 
