Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B952E823B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 23:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgLaWj1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 17:39:27 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:35810 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgLaWj1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Dec 2020 17:39:27 -0500
Received: by mail-il1-f174.google.com with SMTP id t9so18384423ilf.2;
        Thu, 31 Dec 2020 14:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=An3yvvM30RFSSdQsTF6nqBc3O8X7QGJ6M/oMxqoqkDg=;
        b=EsT/hlN9FLmFod1GJiV9xLOX5lwxvaMe7HtkH4zyjNnc6wJBMN+DScfCFDc9SFgHPw
         wvJtoyUD4o67XSIq2Zbjm27n5kIsekqrcdbM0y2HYpXQy2aTG4f7e6rLZcxB2UT+F0c1
         9wgU2SlVfaxliye6UUOkYrmN++rscI2mPaAs2wIAaCZYAs+PRd2zJMNpjpqfcGyYYPep
         QOYEwslH903Ih7myFscx/0fkhtLeiQz+VkCYuAzg5QfJp76fvzvTcsUMc5zExYw02XGP
         6JaGXZmiCCRWRwZQKolbBsp+x0N4695nWT1Q2pebfBBsPaVdraJQgM/Got1dhrn8d4m3
         eDlw==
X-Gm-Message-State: AOAM5308WtRDubxNINBDv3rLTwBn7d0ZyvEmpWHlvA1Rmo4klmN6arGT
        ShPABfDN5MweO//i1AJ161Lw36Kx+w==
X-Google-Smtp-Source: ABdhPJwygH2C/u5I/SjE5VeC8cY1a79JkJGb77NCs+fguLBs7jezfjqi4R48w8/4D9Xk0nvHBtGSJQ==
X-Received: by 2002:a92:9510:: with SMTP id y16mr58767465ilh.26.1609454326373;
        Thu, 31 Dec 2020 14:38:46 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h2sm31671377ili.56.2020.12.31.14.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 14:38:45 -0800 (PST)
Received: (nullmailer pid 2505330 invoked by uid 1000);
        Thu, 31 Dec 2020 22:38:43 -0000
Date:   Thu, 31 Dec 2020 15:38:43 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     sboyd@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name
Subject: Re: [PATCH v5 2/6] dt: bindings: add mt7621-clk device tree binding
 documentation
Message-ID: <20201231223843.GA2494920@robh.at.kernel.org>
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
 <20201220093724.4906-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201220093724.4906-3-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 20, 2020 at 10:37:20AM +0100, Sergio Paracuellos wrote:
> Adds device tree binding documentation for clocks in the
> MT7621 SOC.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-clk.yaml   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> new file mode 100644
> index 000000000000..f58d01bdc82c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> @@ -0,0 +1,52 @@
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
> +  clock-output-names:
> +    maxItems: 8
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
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
> +      clock-output-names = "xtal", "cpu", "bus",
> +                           "50m", "125m", "150m",
> +                           "250m", "270m";

How do you access this h/w. There's nothing defined like 'reg' or 
a parent node or...

The suggestion on v4 was to get rid of the child node by merging it with 
the parent like this:

+    sysc: sysc@0 {
+      compatible = "mediatek,mt7621-sysc", "syscon";
+      reg = <0x0 0x100>;
+      #clock-cells = <1>;
+      clock-output-names = "xtal", "cpu", "bus",
+                             "50m", "125m", "150m",
+                             "250m", "270m";
+    };

Whether you need child nodes or not really depends on what all is in the 
'mt7621-sysc' h/w block.

Rob
