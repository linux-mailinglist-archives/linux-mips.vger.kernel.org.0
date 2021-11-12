Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C714344EF7A
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhKLWma (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:42:30 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:40552 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235934AbhKLWma (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:42:30 -0500
Received: by mail-ot1-f47.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so8046872otj.7;
        Fri, 12 Nov 2021 14:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Pp4AsuPAYtg5uX1v5WR/AYBQP+Y/ORHHqhynVuMettg=;
        b=qyRPHHfFs0F/TL5ZrL/lDWyM/eA50U4k9mMjvegTa/wpZd6PzZfJCT6tJYkxZ2ZY4O
         6SBaKyq46f5Z9aJdc8ffoz44cseysgT43Onjqz+dv255z+K2OzDDg6B2aYnuGbxPlSEj
         rDOSmFPD/7Swub52tPe+ioTCJUluFUdmCgp4hj4ZkgRF9gNNylNIvYYS9ft/n9uG6eHQ
         pB9Ot17TDYdLI1ZFC2nilkf+IzBsgZ78GhrFksmGC4YTk9nG9xJVpysTHO/bpBbqtDnp
         Dt+UVH5M3tO4m00gzD2dB4dUvO+3wiaAIJDQFe/KDeACZUScAx1U+sTeIb/AQVBqEEU/
         dLdg==
X-Gm-Message-State: AOAM5336gtRUDfYmcosh8ufv8pm/oiOh/9L7jJLA8v16EBw/SesnDYwz
        2ja9Grfpiw+y+R8DPvdXj5eXF5xa3A==
X-Google-Smtp-Source: ABdhPJx1/2J/FeFGHHqaK6a93vXwda9JFznGC2+lIK7k4fiWYKFFg/zVMxEQbAVBtzJzTbk5QrK9Tw==
X-Received: by 2002:a9d:6ac7:: with SMTP id m7mr15447277otq.306.1636756778649;
        Fri, 12 Nov 2021 14:39:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f7sm1320551ooo.38.2021.11.12.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:39:38 -0800 (PST)
Received: (nullmailer pid 3505912 invoked by uid 1000);
        Fri, 12 Nov 2021 22:39:37 -0000
Date:   Fri, 12 Nov 2021 16:39:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "maintainer:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Justin Chen <justinpopo6@gmail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: watchdog: convert Broadcom's WDT to
 the json-schema
Message-ID: <YY7tKTahlApmGqQ+@robh.at.kernel.org>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
 <20211105154208.614260-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211105154208.614260-2-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 05, 2021 at 08:42:02AM -0700, Florian Fainelli wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ---------
>  .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> deleted file mode 100644
> index 84122270be8f..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -BCM7038 Watchdog timer
> -
> -Required properties:
> -
> -- compatible : should be "brcm,bcm7038-wdt"
> -- reg : Specifies base physical address and size of the registers.
> -
> -Optional properties:
> -
> -- clocks: The clock running the watchdog. If no clock is found the
> -	  driver will default to 27000000 Hz.
> -
> -Example:
> -
> -watchdog@f040a7e8 {
> -	compatible = "brcm,bcm7038-wdt";
> -	clocks = <&upg_fixed>;
> -	reg = <0xf040a7e8 0x16>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> new file mode 100644
> index 000000000000..53a3245a6193
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BCM7038 watchdog timer
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Justin Chen <justinpopo6@gmail.com>
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm7038-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: >
> +      The clock running the watchdog. If no clock is found the driver will
> +      default to 27000000 Hz.

maxItems: 1

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +unevaluatedProperties: false
> +
> +required:
> +  - reg
> +
> +examples:
> +  - |
> +    watchdog@f040a7e8 {
> +      compatible = "brcm,bcm7038-wdt";
> +      reg = <0xf040a7e8 0x16>;
> +      clocks = <&upg_fixed>;
> +    };
> -- 
> 2.25.1
> 
> 
