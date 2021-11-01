Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5814C44209A
	for <lists+linux-mips@lfdr.de>; Mon,  1 Nov 2021 20:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhKATSJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Nov 2021 15:18:09 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:46977 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhKATSD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Nov 2021 15:18:03 -0400
Received: by mail-oi1-f171.google.com with SMTP id bd30so6660918oib.13;
        Mon, 01 Nov 2021 12:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DqIH/19WB5yGkWAd62vmxTju2mfY4URIJiT2axl3O5E=;
        b=3TP0cNw3sTZt2H/Q0y8HwQHcoW7EdfI5CrHNb4FIIta7RBr1Twg5Z6xH7NGY/FKfUk
         egoi4UQs2P9L9J91E5pK/Z7F/lFy81Um8JD9EVgSbgLm4S18YFLcCsjO6n/6iNIcwajE
         HmijlSntdk7Fu3CdkiLxN1mpM7IH0v9PKTP6KNgM9AFNfI1E+MG9+d/J6nWDQuXoiw++
         GkPxE4/zNH97DrRnGBWjK+CYB3Gse5icNq5Qv408grkqut6ZCRjZscN457fJbV0cxLuQ
         GV6Ajnn2ESr3TQJ9p1QqaFhi0WQvqDv5pgf+v5PoWpPX0Z/XVpLXNwKENl7foYIuTPlP
         afCQ==
X-Gm-Message-State: AOAM531kW9W9efRBOjPyaIP8Sp6kU+XOW1HMntd6DXK2CpdTqd4a0IZX
        UpBYqf5ErWMUnNFW0EM2nA==
X-Google-Smtp-Source: ABdhPJz5r3kgiovu/5/K6XyflpoY5iiU6kz8sgO3oNNlaG86JQ8NQI5dQhARDgQzYudNxb2Il1LJmQ==
X-Received: by 2002:a54:4e98:: with SMTP id c24mr798395oiy.144.1635794129865;
        Mon, 01 Nov 2021 12:15:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a13sm4317605oiy.9.2021.11.01.12.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:15:29 -0700 (PDT)
Received: (nullmailer pid 858303 invoked by uid 1000);
        Mon, 01 Nov 2021 19:15:28 -0000
Date:   Mon, 1 Nov 2021 14:15:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: add Broadcom's timer MFD block
Message-ID: <YYA80E2/JUm01fGw@robh.at.kernel.org>
References: <20211029202505.7106-1-zajec5@gmail.com>
 <20211029202505.7106-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211029202505.7106-2-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 29, 2021 at 10:25:05PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This block is called timer in documentation but it actually behaves like
> a MFD.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/mfd/brcm,timer-mfd.yaml          | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
> new file mode 100644
> index 000000000000..0060b6c443a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,timer-mfd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom's timer MFD
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +description: |
> +  Broadcom's timer is a block used in multiple SoCs (e.g., BCM4908, BCM63xx,
> +  BCM7038). Despite its name it's not strictly a timer device. It consists of:
> +  timers, watchdog and software reset handler.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: brcm,timer-mfd

'mfd' is a Linuxism. Name it what Broadcom calls the block. There should 
be at least as many compatibles as there are variations of register 
layouts.

> +      - const: simple-mfd
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  '^watchdog@[a-f0-9]+$':
> +    $ref: ../watchdog/brcm,bcm7038-wdt.yaml

/schema/watchdog/...

> +
> +additionalProperties: false
> +
> +required:
> +  - reg
> +
> +examples:
> +  - |
> +    timer_mfd: timer-mfd@ff800400 {
> +        compatible = "brcm,timer-mfd", "simple-mfd", "syscon";
> +        reg = <0xff800400 0x4c>;
> +        ranges = <0x0 0xff800400 0x4c>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        watchdog@28 {
> +            compatible = "brcm,bcm7038-wdt";
> +            reg = <0x28 0x8>;
> +        };

Don't you need a timer node? Make the binding complete.

> +    };
> +
> +    reboot {
> +        compatible = "syscon-reboot";
> +        regmap = <&timer_mfd>;

Make this a child node of the timer.

> +        offset = <0x34>;

Use 'reg'. If "syscon-reboot" doesn't allow that, add it.

> +        mask = <1>;


> +    };
> -- 
> 2.31.1
> 
> 
