Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B5F2BBF2D
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 14:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgKUNYn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Nov 2020 08:24:43 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37136 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgKUNYm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Nov 2020 08:24:42 -0500
Received: by mail-ot1-f66.google.com with SMTP id l36so11535569ota.4;
        Sat, 21 Nov 2020 05:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lA+VkLCthusFhFWjDQ5BirTUILmKOuh6PNZSujCkOmY=;
        b=n5DqUCFiiEoqiMzi6kHVpJ96qHSZW7TGOALTGC/NUKxc+A3zytP6M7aVI40XvliovH
         CTt//0TmRiNN1lqsKZvOtAOWB4c5kmT9ZDNkahUaDEHHNA6LxjOM6Jb/iggKLKOdXlr5
         NSSLOU4l0QwAEWCDa/Yazjt7pckN9uQHqsTP0Xvne3ysHQAWqTFwjx1Ol5pgLhevuxPJ
         ihuNu+z1PB2UJeSsqQU/yTvj0U7Y9GacIBP5cTjMjxOaE2qo8aTqVDPCQkDoHOQhTnfG
         ayvnl6v2TE0Vji2Lvq8VHh6feF4yPdONnXUD7bieNCAknWmHgcDeziqMIewq7jOV8mSQ
         UoHw==
X-Gm-Message-State: AOAM530TxqhE8a9CLWqJv33ldxlvYFXRZOlN/tQpkRshot9jdU1kchMu
        BW+9EPe2eIZ70l7/woTxXA==
X-Google-Smtp-Source: ABdhPJx7N2tFfpr5Ifzwv4+/9ysNTB7cEhXmpubqeh1NpSew9zQbZXpg4GhBskpYuYaMGi5Pcma9gQ==
X-Received: by 2002:a9d:3408:: with SMTP id v8mr17672156otb.335.1605965081599;
        Sat, 21 Nov 2020 05:24:41 -0800 (PST)
Received: from xps15 ([172.58.99.237])
        by smtp.gmail.com with ESMTPSA id a1sm2975218oti.56.2020.11.21.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 05:24:40 -0800 (PST)
Received: (nullmailer pid 2121181 invoked by uid 1000);
        Sat, 21 Nov 2020 13:24:37 -0000
Date:   Sat, 21 Nov 2020 07:24:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH] dt-bindings: pinctrl: ocelot: convert pinctrl bindings
 to json-schema
Message-ID: <20201121132437.GA2114939@robh.at.kernel.org>
References: <20201113121252.1433354-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113121252.1433354-1-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 13, 2020 at 01:12:46PM +0100, Gregory CLEMENT wrote:
> Convert device tree bindings for Microsemi SoC (Ocelot, Luton, Serval,
> Jguar2, Sarx5) Pin Controller to YAML format
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../bindings/pinctrl/mscc,ocelot-pinctrl.txt  | 41 ------------
>  .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml | 64 +++++++++++++++++++
>  2 files changed, 64 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml

Please resend Cc'ing Linus.


> diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
> new file mode 100644
> index 000000000000..b774b92becc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mscc,ocelot-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microsemi Ocelot pin controller Device Tree Bindings
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,sparx5-pinctrl
> +      - mscc,jaguar2-pinctrl
> +      - mscc,luton-pinctrl
> +      - mscc,ocelot-pinctrl
> +      - mscc,serval-pinctrl
> +
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      The first cell is the pin number and the second cell specifies
> +      GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +required:
> +  - "#gpio-cells"
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio: pinctrl@71070034 {
> +        compatible = "mscc,ocelot-pinctrl";
> +        reg = <0x71070034 0x28>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +                gpio-ranges = <&gpio 0 0 22>;
> +
> +        uart_pins: uart-pins {

You need to define '-pins$' under patternProperties. Without it, this 
doesn't pass validation.

> +        		pins = "GPIO_6", "GPIO_7";
> +        		function = "uart";

mixed tabs and spaces. YAML wants spaces.

> +        };
> +
> +        uart2_pins: uart2-pins {
> +        		pins = "GPIO_12", "GPIO_13";
> +        		function = "uart2";
> +        };
> +    };
> +
> +...
> \ No newline at end of file

Fix this.
