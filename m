Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9B94547BA
	for <lists+linux-mips@lfdr.de>; Wed, 17 Nov 2021 14:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhKQNvU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Nov 2021 08:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbhKQNvT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Nov 2021 08:51:19 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18D3C061570;
        Wed, 17 Nov 2021 05:48:20 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id u74so6486362oie.8;
        Wed, 17 Nov 2021 05:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3mebJzVN9HcHpEGD2QX+VgGKB5YKEkPOK0FE0bHbIP4=;
        b=ci5T3FUt/5hepMHdWVA9TlN0kHsoEBg9Vuu4c4np1oHUeGbDY6oLySQ0wPwudmQSpg
         TcAtZSgCt3/rrd3PgXWAr53eBVmr8KS+4STKC5xKEwXOAB0wmn28SNrE0/wKsSMhyHyK
         xQb9pzBK5rfACmZwLjseiNpNPTdOV34we6Wf+c+yXndonV/S3uG6qlQi6Bvt0VsEfZHp
         gdhXweRSP/v8XcJOzlbI0IsSM1IQRXzHKBEYq8WEHM1+HCl04MVvlOeyiPVENiPs5jnz
         B+0sJku2BNgCOs0GUl3R/OrcP+wb8vvu9HSaVLyI7BGEYxCVN4dx9K93V7CCCl7Mrim7
         rnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3mebJzVN9HcHpEGD2QX+VgGKB5YKEkPOK0FE0bHbIP4=;
        b=6Tr3RwE94H6UsvnBrHZcX7Qhz2UkuFk9hePPCHunnWtx0u1XlpPX5xtNMWzhPefKEl
         NzaoZco9p3tSQipIfSqbF4SWmcsWuz/kyK8/8lwjVjXWSI8+b5srH857GnifbG6VNj4t
         LcvtdUmXPIcCSEzMnCB7EyDgrmvqpU++SjMqVrz8T8UUh6n+8Sdv2ZIc3hhWvrNKPaQC
         xPNflEG0wD5x1NZw+VjvB0QUaNgB404C8C0TlUFVXLHw0It522iOlqul1TBO4Un8JF18
         /geGWOmCjd+uOWjvtIYP2TTtm7puXaICNuGrea6n/CS5qgZIIj3EQjbGw6l40SHeVkM0
         il8A==
X-Gm-Message-State: AOAM532jBbU4IlxPrkxW1Pg3tPBmBSepLCVpNT2gZjVVsaoBx0AfFMSH
        FPyGc6bcI3wRWaawAWA9Be0=
X-Google-Smtp-Source: ABdhPJwWNtGrgxl6HdtyBfu5X9p0ZKyR8nj0IVJIWojeaK1jDLmxky4nGpBSFHz5fJKRASzIoYqilw==
X-Received: by 2002:aca:2412:: with SMTP id n18mr14113342oic.119.1637156900323;
        Wed, 17 Nov 2021 05:48:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w71sm4550911oiw.6.2021.11.17.05.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:48:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:48:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v5 2/7] dt-bindings: watchdog: Add BCM6345 compatible to
 BCM7038 binding
Message-ID: <20211117134818.GA2724345@roeck-us.net>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
 <20211112224636.395101-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112224636.395101-3-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 12, 2021 at 02:46:31PM -0800, Florian Fainelli wrote:
> The BCM7038 watchdog binding is updated to include a "brcm,bcm6345-wdt"
> compatible string which is the first instance of a DSL (BCM63xx) SoC
> seeing the integration of such a watchdog timer block.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> index ed6210666ead..a926809352b8 100644
> --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: BCM7038 watchdog timer
> +title: BCM63xx and BCM7038 watchdog timer
>  
>  allOf:
>    - $ref: "watchdog.yaml#"
> @@ -16,7 +16,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: brcm,bcm7038-wdt
> +    enum:
> +      - brcm,bcm6345-wdt
> +      - brcm,bcm7038-wdt
>  
>    reg:
>      maxItems: 1
