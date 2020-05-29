Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18701E8B93
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 00:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgE2WyV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 18:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgE2WyU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 18:54:20 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E489C03E969;
        Fri, 29 May 2020 15:54:20 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y11so1788876plt.12;
        Fri, 29 May 2020 15:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ifXv1MWq0pnldCklAzeE2OICw/eIb7ZTvTQ6wbsz1Bs=;
        b=hvl0lgcNdumOEKXEfkdOt6hAmbikBCCPaeSbokSG2E+xX+TVisqq+9gUB5hzJANNx3
         ZTgIAi+4Or8PvcH0kvfTcEotvwv2z4eCGzkDPF8nv2eODLu7osGWMBpc3njjurjamwA4
         WY5G4D52yrYCzpu0ZDXc066fo62yJyHuDT0iX7hHDeig3/2XjwkXGPw1yALW+GRNpiz/
         LWcS1O67xldLAbIGcsUvlG+xL1MKst0eZR13LZxze7ujC9k2egTwWbboQAdoM1ek85KF
         /X3Y6yfhk60mTpZMPk5lFEaCKxxWi9uAMi17uNxpQTj+2mDArQBSJ7AQaStI/myyWH0N
         SQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ifXv1MWq0pnldCklAzeE2OICw/eIb7ZTvTQ6wbsz1Bs=;
        b=UkwxpKbZEVMyq/ZzQPQ51Kvba9WHa0WXucEvp+W3nG9JmsKMI9GZ1c1N63Qj5weDai
         Tf/5xdpMFsU6aCIfqwMPZbrnRq0Vg6LXpEm9n34okebx5uL+GlCyl+REZTeR99EDk/w9
         IOiIZ4hEUSN7I3Iy25yXPWCFASQzwH6sDqBMZ/O8l+A7QexMH9KN4MrKCzchnv3M8JZI
         05VelHf4dJ8ZtFbBBLmFdDjpWTS5U5JSgk95SIeON+j0wH8qNydCcKH8vEHdWxIzWaG4
         ajprk0EJ9TFf84qHf47ZgHHRnJnGrLnEiB7FU9gTnx8oAdSAnim+C+jjIhm7IT2guPNT
         sgqg==
X-Gm-Message-State: AOAM532D0LIwErCAQ5MIMq3c8uC3iXLuAK187q1X9J3343B5zOrOBkAF
        Xcp77IoWS4bzgfbpJsqAdRw=
X-Google-Smtp-Source: ABdhPJxcpO6RvSJn8fCrKgbwmeYzhaMXAE9Fy7D388H3g/NTqo4jEt5hFcUd5ZmIB7vvBdMNQYXwPQ==
X-Received: by 2002:a17:90a:f004:: with SMTP id bt4mr11830951pjb.128.1590792860041;
        Fri, 29 May 2020 15:54:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 124sm8145430pfb.15.2020.05.29.15.54.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 15:54:19 -0700 (PDT)
Date:   Fri, 29 May 2020 15:54:18 -0700
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
Subject: Re: [PATCH v3 3/7] dt-bindings: watchdog: dw-wdt: Add watchdog TOPs
 array property
Message-ID: <20200529225418.GA194211@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:19PM +0300, Serge Semin wrote:
> In case if DW Watchdog IP core is built with WDT_USE_FIX_TOP == false,
> a custom timeout periods are used to preset the timer counter. In
> this case that periods should be specified in a new "snps,watchdog-tops"
> property of the DW watchdog dts node.
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
> - Move $ref to the root level of the "snps,watchdog-tops" property
>   so does the constraints.
> - Add default TOP values array.
> - Discard the label definition from the new bindings example.
> 
> Changelog v3:
> - Remove items property and move the minItems and maxItems constraints to
>   the root level of the snps,watchdog-tops property.
> ---
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 5bf6dc6377f3..d9fc7bb851b1 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -39,6 +39,23 @@ properties:
>      description: Phandle to the DW Watchdog reset lane
>      maxItems: 1
>  
> +  snps,watchdog-tops:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      DW APB Watchdog custom timer intervals - Timeout Period ranges (TOPs).
> +      Each TOP is a number loaded into the watchdog counter at the moment of
> +      the timer restart. The counter decrementing happens each tick of the
> +      reference clock. Therefore the TOPs array is equivalent to an array of
> +      the timer expiration intervals supported by the DW APB Watchdog. Note
> +      DW APB Watchdog IP-core might be synthesized with fixed TOP values,
> +      in which case this property is unnecessary with default TOPs utilized.
> +    default: [0x0001000 0x0002000 0x0004000 0x0008000
> +      0x0010000 0x0020000 0x0040000 0x0080000
> +      0x0100000 0x0200000 0x0400000 0x0800000
> +      0x1000000 0x2000000 0x4000000 0x8000000]
> +    minItems: 16
> +    maxItems: 16
> +
>  unevaluatedProperties: false
>  
>  required:
> @@ -55,4 +72,19 @@ examples:
>        clocks = <&per_base_clk>;
>        resets = <&wdt_rst>;
>      };
> +
> +  - |
> +    watchdog@ffd02000 {
> +      compatible = "snps,dw-wdt";
> +      reg = <0xffd02000 0x1000>;
> +      interrupts = <0 171 4>;
> +      clocks = <&per_base_clk>;
> +      clock-names = "tclk";
> +      snps,watchdog-tops = <0x000000FF 0x000001FF 0x000003FF
> +                            0x000007FF 0x0000FFFF 0x0001FFFF
> +                            0x0003FFFF 0x0007FFFF 0x000FFFFF
> +                            0x001FFFFF 0x003FFFFF 0x007FFFFF
> +                            0x00FFFFFF 0x01FFFFFF 0x03FFFFFF
> +                            0x07FFFFFF>;
> +    };
>  ...
