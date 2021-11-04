Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7376B4459DE
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 19:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhKDSmc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Nov 2021 14:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhKDSmc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Nov 2021 14:42:32 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0E4C061714;
        Thu,  4 Nov 2021 11:39:54 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id d12so7301953oij.5;
        Thu, 04 Nov 2021 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y9Efx+J0DfgYNexjEZQcHJbnOqe+k5YWBbpHhhOQDTM=;
        b=Wl/7qGL5cCeNtI9eWKQHiX0Kk+ZiVRNexsoF4RQfzyDvYZ0X4ZHLrjr0b44PrVRUk7
         Tx0SYoWTFmUI7ikv0DAp83GyL8EA2oqKUzTdGeVi4po5bDZrqD3/jBepQaAs6cHHHiND
         T0YQ2Yz/3NpNP4vxVqstDLBKAFTSdJ57bZ0/etr9bThL01tqX2IoYkOROYnvt0n2J7IY
         COl1wxoVfcTDf528Nc49NPQYbko89GuAF/2ZvNUJwl9F96Wx0aVRnuygPUKlmgZq+5x5
         tp+fXHA85KmecOZY8UPO8zyTrhUSwsX67NCgvaXCxWDea6lm17k3n16IKCShlKNogqyl
         9CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y9Efx+J0DfgYNexjEZQcHJbnOqe+k5YWBbpHhhOQDTM=;
        b=iAhaqLGBrdFjC4eREoKgJgTXOeVMdnP2l3cmJ2B7CcIodK5xKvH4AewevRXG94Z2UU
         KqrIb5bgNgxataNSaY27J6VKpLgGZIWvmZQyWrpilapIsSRJs+trGNtxD0dRg9wC9gWN
         5Vz6joadqLF+7T95xVvba/PfI5C6TYvCN74XmDcRiT3IBUYfljAD1cTmjAhlDz9jIeEY
         1upQ1MVXtlisPQqQ6jS2OlB0gS7dYRfBxBuZUPebAzEIEnsYtWQRRH6dakZ2V328/bcx
         wfXP6lsgJ+/AS8H6dizAw70Zslmfl9Vfn0CPPnb6GrispSsh93ggJlIYVMyVX8jcum1r
         eN/A==
X-Gm-Message-State: AOAM533xJyCgSzbVWzcIuNSzhrjgTwEDs3N/8PvIaGueDXqiBy12Ikpv
        bh+L5NLR6W27AoQeGqNsGY0=
X-Google-Smtp-Source: ABdhPJwVqQdcn5Wa5xbrJ8uTj6JC2mtBJeHifXkXNvXMry28cLMDi8b2qbKQiF+berR532peOHZ/Qw==
X-Received: by 2002:aca:4405:: with SMTP id r5mr17698488oia.4.1636051192751;
        Thu, 04 Nov 2021 11:39:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t12sm1807386oiw.39.2021.11.04.11.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 11:39:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: watchdog: convert Broadcom's WDT to
 the json-schema
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
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
References: <20211103231327.385186-1-f.fainelli@gmail.com>
 <20211103231327.385186-2-f.fainelli@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <22e6f9b0-8d2e-14ee-12f1-0f911a72a467@roeck-us.net>
Date:   Thu, 4 Nov 2021 11:39:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103231327.385186-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/3/21 4:13 PM, Florian Fainelli wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ---------
>   .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 40 +++++++++++++++++++
>   2 files changed, 40 insertions(+), 19 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
>   create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
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
> index 000000000000..69e5a1ef6a1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#

Looks like this requires

s/63xx/7038/

Guenter

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
> 

