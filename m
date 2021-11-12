Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695D244ED62
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 20:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhKLTlr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 14:41:47 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:46910 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKLTlq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 14:41:46 -0500
Received: by mail-oi1-f176.google.com with SMTP id s139so19714934oie.13;
        Fri, 12 Nov 2021 11:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qAZHfyWnmCfvgr8D21qxD2guTWMUKbQ6N/3+eAIuaOs=;
        b=728Yq4T9xyYY5jlbzwoLctix/Nw5lPn+Lm4qFzMGHMaXVnGks0q3btWI3j9iOCCk/8
         GVrTh40T3WwQpQBtaxZQBTm2568loEVX2gFswf7wbPKyybYJmJM/tL5BQXlnZxXpP8MH
         Us/YPysX3cX3IAneGDIjpHxtlKcyJ56re1sCGrQGdQVlLwfprvfFvXy7o/Q//xyTurC6
         pQzl8k8b56HZbx22pKhg4nHAor/tI8HYXr9YqBXvFOMou8TrmCf5Y18mYlI8XZXczROr
         7EJX1QDJmXb96QwFjnejFaiANz06pSuh+wn5GTVI6OgX0nBa/UvvoHVR8ygiAq3nQbGF
         Oo/w==
X-Gm-Message-State: AOAM533pNXl90dN2bU+pjjs0nu4m9w7bIirta0h32SzwnnmdjBtNICgy
        Qe0j0wyLsR1wAHQKDwAUVA==
X-Google-Smtp-Source: ABdhPJwaYFhUy+7cFhoLxnliRVH2YXrCxGg4o8dXc1XtfE0fFoDJbIfDC41E6PUkLRkqvnn2hdql/A==
X-Received: by 2002:a05:6808:120e:: with SMTP id a14mr15682125oil.63.1636745935365;
        Fri, 12 Nov 2021 11:38:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e28sm1559665oiy.10.2021.11.12.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:38:54 -0800 (PST)
Received: (nullmailer pid 3239457 invoked by uid 1000);
        Fri, 12 Nov 2021 19:38:53 -0000
Date:   Fri, 12 Nov 2021 13:38:53 -0600
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
Subject: Re: [PATCH V2 2/2] dt-bindings: mfd: add Broadcom's Timer-Watchdog
 block
Message-ID: <YY7CzWtWATAZH5As@robh.at.kernel.org>
References: <20211102160615.14672-1-zajec5@gmail.com>
 <20211102160615.14672-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102160615.14672-2-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 02, 2021 at 05:06:15PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a block implementing few time related functions depending on a
> (SoC specific) variant. At this point there is ready binding for a
> watchdog only. Work on remaining subblocks (e.g. "reg" based reboot) is
> in progress.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Update $id, description, compatible, example & commit message
> ---
>  .../devicetree/bindings/mfd/brcm,twd.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> new file mode 100644
> index 000000000000..ed167055be06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,twd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom's Timer-Watchdog (aka TWD)
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +description: |
> +  Broadcom has a Timer-Watchdog block used in multiple SoCs (e.g., BCM4908,
> +  BCM63xx, BCM7038). There are few variants available (they differ slightly in
> +  registers layout). This block consists of: timers, watchdog and optionally a
> +  software reset handler.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - brcm,bcm4908-twd
> +        - brcm,bcm7038-twd
> +      - const: brcm,twd

I don't think you need this given you don't expect to have a driver for 
this other than syscon driver.

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
> +    $ref: /schemas/watchdog/brcm,bcm7038-wdt.yaml
> +
> +additionalProperties: false
> +
> +required:
> +  - reg
> +
> +examples:
> +  - |
> +    timer-mfd@ff800400 {
> +        compatible = "brcm,bcm4908-twd", "brcm,twd", "simple-mfd", "syscon";
> +        reg = <0xff800400 0x4c>;
> +        ranges = <0x00000000 0xff800400 0x4c>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        watchdog@28 {
> +            compatible = "brcm,bcm7038-wdt";
> +            reg = <0x28 0x8>;
> +        };
> +    };
> -- 
> 2.31.1
> 
> 
