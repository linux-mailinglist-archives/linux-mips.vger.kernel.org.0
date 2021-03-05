Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E9D32F615
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 23:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhCEWsM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 17:48:12 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:36585 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhCEWr6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 17:47:58 -0500
Received: by mail-oi1-f177.google.com with SMTP id j1so4289751oiw.3;
        Fri, 05 Mar 2021 14:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3PmDH/3Q7mXi/NObz8TJWT61R8BEoKRpXo3ei3eRvmA=;
        b=ClHwpWS2y3XmZ0lh5LDvBreh5FT6dE8zzO/2vOxKU4gpyyServR7s08VKQ3flFAkR5
         i8DV0f5u5HuFEBjD4+eqyaBGhfmrxrOzO8MhX2S4iT7zVfscjBV5dCoU9SvI6qF5ZYUP
         p+hZNnl6EI9GHpD9D8OsfhiySz5gtP7DhjIC0RqOxRpe7OhggONnI/x0g61Uv9kB54+y
         o5zqLdGlDhmUTTO5oUbt/wS8s1E6Cd9KFUavJ0r5LTO3tPDrFndRemgZwrnIr87QSYCD
         UyB3txAHwo4Szh7g8odE0qbt6tbHD8jy5tF5WTK25+s3fC8CehLYLi1Llr+hSPqIe+/Z
         Kqjw==
X-Gm-Message-State: AOAM53377WzXryj7b1eBc0xbxbThfZa6CheoKeurzqS3568jVQlM20rF
        vQEMb/QrdOEqCnpt5A5tgQ==
X-Google-Smtp-Source: ABdhPJzomuI9sDgyHbhIt5jV1MXkZ7U7EFJoQTpae3ngwH/RvlkfOIyLVNgz7qXsVpfAgk13hlzUBg==
X-Received: by 2002:aca:4d55:: with SMTP id a82mr8749226oib.23.1614984478279;
        Fri, 05 Mar 2021 14:47:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t145sm842835oie.10.2021.03.05.14.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 14:47:57 -0800 (PST)
Received: (nullmailer pid 784017 invoked by uid 1000);
        Fri, 05 Mar 2021 22:47:56 -0000
Date:   Fri, 5 Mar 2021 16:47:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     sboyd@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] dt: bindings: add mt7621-clk device tree binding
 documentation
Message-ID: <20210305224756.GA777984@robh.at.kernel.org>
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
 <20210218070709.11932-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218070709.11932-3-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 18, 2021 at 08:07:05AM +0100, Sergio Paracuellos wrote:
> Adds device tree binding documentation for clocks in the
> MT7621 SOC.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-clk.yaml   | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> new file mode 100644
> index 000000000000..842a0f2c9d40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT7621 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description: |
> +  The MT7621 has a PLL controller from where the cpu clock is provided
> +  as well as derived clocks for the bus and the peripherals. It also
> +  can gate SoC device clocks.
> +
> +  Each clock is assigned an identifier and client nodes use this identifier
> +  to specify the clock which they consume.
> +
> +  All these identifiers could be found in:
> +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7621-clk
> +
> +  "#clock-cells":
> +    description:
> +      The first cell indicates the clock number, see [1] for available
> +      clocks.
> +    const: 1
> +
> +  ralink,sysctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of syscon used to control system registers
> +
> +  ralink,memctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of syscon used to control memory registers

I assume one of these phandles are the main registers for the clocks? 
Make this a child node and drop that phandle.

> +
> +  clock-output-names:
> +    maxItems: 8
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - ralink,sysctl
> +  - ralink,memctl
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt7621-clk.h>
> +
> +    pll {
> +      compatible = "mediatek,mt7621-clk";
> +      #clock-cells = <1>;
> +      ralink,sysctl = <&sysc>;
> +      ralink,memctl = <&memc>;
> +      clock-output-names = "xtal", "cpu", "bus",
> +                           "50m", "125m", "150m",
> +                           "250m", "270m";
> +    };
> -- 
> 2.25.1
> 
