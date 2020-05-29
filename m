Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BD21E8B8D
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 00:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgE2WxQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 18:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgE2WxP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 18:53:15 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D67BC03E969;
        Fri, 29 May 2020 15:53:15 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y11so1788156plt.12;
        Fri, 29 May 2020 15:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bNLrrxo1Uv+WaIxs+AFM/gdNkV6HHDo5MG+X35EgrgE=;
        b=SZvIjKRteGXhrlen2h3vdVtriGWYfOqFqEeeo8LCO02QZt7bEWkL/9TWg9mBQTycBR
         cKEIhCZRJKmEiOHOQb5byTAvubd2JI46fac3b5fXJL07zrgPWRjEzDuX8jyzIitgb4wV
         P/NCNqAXbPrLzvUUGv1zl11JjsmMMSnxwFkGkAzy1AokUc9KvCC89KPVtMHquvVPwkFs
         K7FzkOhQyet/0P6dL4+fkKOrbmFaiucBabs3s38RI0uWwt1yq/rkXTqWpl4Fb3OlDUMo
         84piIGoD+hXDMFsT4ISGLaamnax5QGxuuTGAc0Z4kF6KJ7cfQYw3PQMmd+szf9El2iqx
         wPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=bNLrrxo1Uv+WaIxs+AFM/gdNkV6HHDo5MG+X35EgrgE=;
        b=h/YVi4Gw21kkmzPBaJr9nJ/CTuv/rzsaQbf+etytTKH5DT87ESh2evkgryxdVOmpj/
         TNAki4jP4d+Uoe6lCTcqdEAybLTTT/CiQ6xhRE5RaUSz/rkRcftzKn7VCdShHB3jcNxA
         KVWIQ+Lnw9CpTsYnjD64+dsDymZh9T3WpU10SH0NGU44ycrIwq7lioF1hkNch566FrIH
         SsK2NucJuBcG2OAwtvZA0jTcDM0cZuHcEqwIhHgCYTCRFqTUsBxzvh0Sf2cMeUQB0as/
         S1Y/tTgHuXa/lqKLsQoz1gvnAh8Reh08VTAbpSis4MzNuH6XKaOtOWNyQy8ZF4BQHATF
         6q7A==
X-Gm-Message-State: AOAM533YokzNAR6TrUOzeUPhaAuIC8OV2wSQDceSLEf9CIkohIYFOEnu
        /xTknW+u1J+niXOWoRO72LE=
X-Google-Smtp-Source: ABdhPJxz1UD6M5YFYmbQq5Ws63qYgZz84NfQ+h23wBq34Tj1HmhCR2PkI30MAAYeUuyDJXpcns2GzQ==
X-Received: by 2002:a17:90a:ad87:: with SMTP id s7mr6071965pjq.225.1590792795236;
        Fri, 29 May 2020 15:53:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f66sm8424208pfg.174.2020.05.29.15.53.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 15:53:14 -0700 (PDT)
Date:   Fri, 29 May 2020 15:53:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: watchdog: Convert DW WDT binding to
 DT schema
Message-ID: <20200529225313.GA193990@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:17PM +0300, Serge Semin wrote:
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with dt-schema. This commit replaces the DW Watchdog
> legacy bare text bindings with YAML file. As before the binding states
> that the corresponding dts node is supposed to have a registers
> range, a watchdog timer references clock source, optional reset line and
> pre-timeout interrupt.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changelog v2:
> - Rearrange SoBs.
> - Discard BE copyright header.
> - Replace "additionalProperties: false" with "unevaluatedProperties: false"
>   property.
> - Discard interrupts property from the required properties list.
> - Remove a label definition from the binding example.
> - Move the asynchronous APB3 clock support into a dedicated patch.
> ---
>  .../devicetree/bindings/watchdog/dw_wdt.txt   | 24 ---------
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> deleted file mode 100644
> index eb0914420c7c..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Synopsys Designware Watchdog Timer
> -
> -Required Properties:
> -
> -- compatible	: Should contain "snps,dw-wdt"
> -- reg		: Base address and size of the watchdog timer registers.
> -- clocks	: phandle + clock-specifier for the clock that drives the
> -		watchdog timer.
> -
> -Optional Properties:
> -
> -- interrupts	: The interrupt used for the watchdog timeout warning.
> -- resets	: phandle pointing to the system reset controller with
> -		line index for the watchdog.
> -
> -Example:
> -
> -	watchdog0: wd@ffd02000 {
> -		compatible = "snps,dw-wdt";
> -		reg = <0xffd02000 0x1000>;
> -		interrupts = <0 171 4>;
> -		clocks = <&per_base_clk>;
> -		resets = <&rst WDT0_RESET>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> new file mode 100644
> index 000000000000..4f6944756ab4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys Designware Watchdog Timer
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Jamie Iles <jamie@jamieiles.com>
> +
> +properties:
> +  compatible:
> +    const: snps,dw-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: DW Watchdog pre-timeout interrupt
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Watchdog timer reference clock
> +
> +  resets:
> +    description: Phandle to the DW Watchdog reset lane
> +    maxItems: 1
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    watchdog@ffd02000 {
> +      compatible = "snps,dw-wdt";
> +      reg = <0xffd02000 0x1000>;
> +      interrupts = <0 171 4>;
> +      clocks = <&per_base_clk>;
> +      resets = <&wdt_rst>;
> +    };
> +...
