Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F0832FD0B
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 21:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhCFUOi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 15:14:38 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:40882 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhCFUOK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 15:14:10 -0500
Received: by mail-pl1-f169.google.com with SMTP id z7so3053162plk.7;
        Sat, 06 Mar 2021 12:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=63bS9NCBSPODnoPLavyLYKnkSngsQx2dl5gST6Os0xY=;
        b=p7BNOfbj5i1QpFN1NxJ1/0m7UzDfMIlgTxtqbD9pzt4yV5aLDTMzujzGafaYu9AUuY
         hs3Cj8P0m6LcjsWjaOofzXrvhyqC9/Hd1s5MxJfWbaAMZTwjAXUyfLMIgWRerb4tAqvx
         IH/WqCKAd2tD8xwQqQktK2xmWiOlbrBm6fTGDg5SWicY5tenKt1Hus37NzHkqPlZUs0s
         WBMDoljkgF0mVJVxq9SC1/GDFOrBp0jKkQSjSxQ0eP/TEhzIjdPeDv6W2xeIa75Q0aWB
         u/VTzLr7442JQBtZenqLgX4qGB34utp8E0gfxmWSWoAvpH6rWLzV3BRADNZUo7fTQ+kp
         Wchg==
X-Gm-Message-State: AOAM531tPj1DN7lbs6OS3dwb/gU0H3mfsaZi3Pi6vA1LIAlhwKdBGukT
        bYMMaoP5pw7LB6IBlFxapQ==
X-Google-Smtp-Source: ABdhPJwm2M0/WXN4j/8uIR1hAhCxaVN1319yvM4A2C+PUbZjZU2cr2izY4gYLduTb7o6BfoNwZK+Yg==
X-Received: by 2002:a17:902:fe09:b029:e4:951e:2d2e with SMTP id g9-20020a170902fe09b02900e4951e2d2emr14454398plj.22.1615061650315;
        Sat, 06 Mar 2021 12:14:10 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id c29sm5796592pgb.58.2021.03.06.12.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:14:09 -0800 (PST)
Received: (nullmailer pid 1143188 invoked by uid 1000);
        Sat, 06 Mar 2021 20:14:04 -0000
Date:   Sat, 6 Mar 2021 13:14:04 -0700
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: document
 BCM6345 external interrupt controller
Message-ID: <20210306201404.GB1137882@robh.at.kernel.org>
References: <20210223204340.312-1-noltari@gmail.com>
 <20210224075640.20465-1-noltari@gmail.com>
 <20210224075640.20465-2-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210224075640.20465-2-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 24, 2021 at 08:56:39AM +0100, Álvaro Fernández Rojas wrote:
> Document the binding for the BCM6345 external interrupt controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v3: pass dt_binding_check.
>  v2: fix title typo.
> 
>  .../brcm,bcm6345-ext-intc.yaml                | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
> new file mode 100644
> index 000000000000..a691510e78b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm6345-ext-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6345 external interrupt controller
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm6318-ext-intc
> +      - brcm,bcm6345-ext-intc
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    description: Specifies the interrupt line(s) in the interrupt-parent
> +      controller node. Valid values depend on the type of parent interrupt
> +      controller.
> +    maxItems: 4
> +
> +  brcm,field-width:
> +    description: Interrupt controller field width (the default is 4).

default: 4

> +    maxItems: 1

All uint32's are 1 item.

What's the set or range of values?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - "#address-cells"
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@10000018 {
> +      #address-cells = <0>;
> +      compatible = "brcm,bcm6345-ext-intc";
> +      reg = <0x10000018 0x4>;
> +
> +      interrupt-parent = <&periph_intc>;
> +      #interrupt-cells = <2>;
> +
> +      interrupt-controller;
> +      interrupts = <24>, <25>, <26>, <27>;
> +    };
> +
> +  - |
> +    interrupt-controller@fffe0014 {
> +      #address-cells = <0>;
> +      compatible = "brcm,bcm6345-ext-intc";
> +      reg = <0xfffe0014 0x4>;
> +
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +
> +      interrupt-parent = <&cpu_intc>;
> +      interrupts = <3>, <4>, <5>, <6>;
> +
> +      brcm,field-width = <5>;
> +    };
> -- 
> 2.20.1
> 
