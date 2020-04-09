Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8651D1A3446
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 14:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgDIMl4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 08:41:56 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:14138 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgDIMl4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 08:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586436113;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=g+8YAAOECGkBiw9PMz3cy2P+hO33ZDQIC++aXuokovE=;
        b=RjNQBxxpg2em8nWJrJTy1qiWaT9wr8aCHzHNCRTWvE1e/1M0UkIB80uSfarb7/Sf1W
        AI4FCw0dVn1R9BMQoqih29pgi/ZAxgQIme++AIJYgqPZhEDt89r7gQLQ00hb0oW2VW1r
        G0y1HnTri+Qif1q59DqUEgAIX6vqOWhOANb2YG1Uki2ExNGVhxlSNyElu+4Kk0w2an3s
        ECOYPuL99TYqK649iiwVn6aWJXxXOYd6afeG9zPo6BpIUyz5hKhUdeS8bJSsDpkJY30t
        8zIwyo40G4LI8lsdjGdnbetg3G+/6E/UTDTdn8zYMGz0pzH32MPpTcG3Tm55d6Zzl3yM
        ZjOQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zvwDCoFnA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w39CffwVS
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 9 Apr 2020 14:41:41 +0200 (CEST)
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic, lcd.txt to ingenic, lcd.yaml
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200409122054.GA5683@ravnborg.org>
Date:   Thu, 9 Apr 2020 14:41:40 +0200
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
Content-Transfer-Encoding: 7bit
Message-Id: <C944CCDB-C1F5-4D6A-901A-B66D8B473E1B@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com> <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com> <20200409072559.GB12367@ravnborg.org> <F4F5D267-A538-444B-9DCA-EA87AC798FB3@goldelico.com> <20200409122054.GA5683@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sam,

> Am 09.04.2020 um 14:20 schrieb Sam Ravnborg <sam@ravnborg.org>:
> 
> Hi Nikolaus.
> 
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/jz4725b-cgu.h>
>>>> +
>>>> +    panel {
>>>> +      compatible = "sharp,ls020b1dd01d";
>>>> +
>>>> +      backlight = <&backlight>;
>>>> +      power-supply = <&vcc>;
>>>> +
>>>> +      port {
>>>> +        panel_input: endpoint {
>>>> +          remote-endpoint = <&panel_output>;
>>>> +          };
>>>> +        };
>>>> +      };
>>> The panel part is not needed - better to drop it.
>> 
>> Well, it is needed to fulfill the remote-endpoint below.
> 
> Examples may have phandle that are not defined.
> So the example will work fine without it.
> See other similar examples.

Ok.

> 
>> 
>>> 
>>> 
>>>> +
>>>> +    lcd: lcd-controller@13050000 {
>>>> +      compatible = "ingenic,jz4725b-lcd";
>>>> +      reg = <0x13050000 0x1000>;
>>>> +
>>>> +      interrupt-parent = <&intc>;
>>>> +      interrupts = <31>;
>>>> +
>>>> +      clocks = <&cgu JZ4725B_CLK_LCD>;
>>>> +      clock-names = "lcd", "lcd_pclk";
>>>> +
>>>> +      port {
>>>> +        panel_output: endpoint {
>>>> +          remote-endpoint = <&panel_input>;
>>>> +          };
>>>> +        };
>>>> +      };
>>> We know this example will not pass the check, as there is only
>>> one clock specified.
>>> I suggest to drop this example.
>>> If it later turns out that jz4725b only have one clock,
>> 
>> Paul already reported that it only wants to see one clock.
>> 
>>> then the binding
>>> needs to be updated.
>> 
>> Yes, I have that on my to-do list to update the binding to reflect
>> this minItems/maxItems thing but I am not yet sure about how
>> to handle the clock-names in that case. I.e. make "lcd" optional
>> and enforce "lcd_pclk" only.
> Look forward to next version.
> 
>> 
>>> But the best guess is that the example is wrong.
>>> 
>>> The example below for jz4780-lcd cover all relevant parts - so
>>> just keep it as the only example.
>>> 
>>>> +
>>>> +  - |
>>>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>>>> +
>>>> +    lcdc0: lcdc0@13050000 {
>>> Name this lcdc
>>> And drop "lcdc0@13050000" as this is not relevant for this example.
>>> 
>>> Remember - the examples exist to explain the binding. They are
>>> just examples.
>>> 
>>>> +        compatible = "ingenic,jz4780-lcd";
>>>> +        reg = <0x13050000 0x1800>;
>>>> +
>>>> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
>>>> +        clock-names = "lcd", "lcd_pclk";
>>>> +
>>>> +        interrupt-parent = <&intc>;
>>>> +        interrupts = <31>;
>>>> +
>>>> +        jz4780_lcd_out: port {
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            jz4780_out_hdmi: endpoint@0 {
>>>> +                reg = <0>;
>>>> +                remote-endpoint = <&hdmi_in_lcd>;
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +
>>> 
>>> And drop this as it does not add anything extra.
>> 
>> Well, it demonstrates how to add a second lcdc which is disabled.
> The purpose of the example is to show an example of the
> binding specified in this file.
> Adding a second disabled lcdc is a general thing, and not
> something we want in all the individual examples.

This is contrary to what I have expected. My assumption is
that the example is some piece of code that you (and me and
other readers of the bindings documentation) can easily
understand and even copy&paste into a DTS. Like an example
in a training book. This is how I always have used the
.txt bindings when writing new DTS. This ease of use is
lost if the examples are incomplete and show only part
of what is needed to get a working DTS. If not here, where
can one get the required information from?

Or do you see this as unit-test-cases for the formal bindings
definitions? Then, it should IMHO not be named "example".

> Also the actual content, for example register values can be
> random as they are not part of the binding.
> This is not a documentation of the HW but a binding example.

Here it is the bindings for a very specific SoC and the
register values are well defined and there is no choice at
all.

So I'll simplify it for v4 although I don't like the concept
behind.

BR and thanks,
Nikolaus


> 
> 	Sam
> 
>> 
>> Showing that it is possible to do so is IMHO the most important
>> part of the example because it is not at all obvious.
>> 
>> I have also added both SoC to show how differently they can
>> and should be.
>> 
>>>> +    lcdc1: lcdc1@130a0000 {
>>>> +        compatible = "ingenic,jz4780-lcd";
>>>> +        reg = <0x130a0000 0x1800>;
>>>> +
>>>> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
>>>> +        clock-names = "lcd", "lcd_pclk";
>>>> +
>>>> +        interrupt-parent = <&intc>;
>>>> +        interrupts = <31>;
>>>> +
>>>> +        status = "disabled";
>>>> +    };
>>> 
>>> 	Sam
>> 
>> BR and thanks,
>> Nikolaus
>> 

