Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0641E302E
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 22:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391347AbgEZUnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 16:43:10 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:33808 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391281AbgEZUnK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 16:43:10 -0400
Received: by mail-io1-f41.google.com with SMTP id f3so23617541ioj.1;
        Tue, 26 May 2020 13:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=05fRtb3l7CU2Nk1q80iQghWcohiFEtAdOdLPDPtrgQM=;
        b=qe5a6g64rKfhWzhUtZ/h+lzbK8r9y3y3cBCFres0n/N1k7FyMRcF+FKbxM9LB4T6Kf
         7wgFzFvRv/gKdoHMGt5vfmNHiTB7kFJCjFJI7Vh/rstyXiFk1tu4wpr0FVIjv6N6nKRr
         vg6lUkjQhBkP+RkOKZ+3sx6xjREhXnMkfEkIUetq+DROT4VeORggbbo2AChJimxgspmm
         3yprItnoz62s4oroPQyd/aJpHnEeG+3vMSPVCy5GZJ8XU/J1tR0v9PljTUU1qzODkK+U
         gDjk+rE3rVw7fHc0vtFWvfER3IBUMjbh1/PioDjOsjxzOQcBRCo12qdeP/v6E/4nQ/+/
         0XRw==
X-Gm-Message-State: AOAM533GjFSQ0IemsEEnvTPEJ8IeU29gymzte6sGKD9fAF96ovSAdb/e
        0cgw0uFxqLt2u/gpx8Cc2g==
X-Google-Smtp-Source: ABdhPJxxQMajEHw93bHjLSQCqQRRc4712FyKVp3vy1T0XvKvvTb5ijKU9eVHfPZ2tLAlUqaZQiKdzg==
X-Received: by 2002:a02:c4c8:: with SMTP id h8mr2848837jaj.64.1590525789124;
        Tue, 26 May 2020 13:43:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w70sm531218ili.78.2020.05.26.13.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 13:43:08 -0700 (PDT)
Received: (nullmailer pid 335891 invoked by uid 1000);
        Tue, 26 May 2020 20:43:06 -0000
Date:   Tue, 26 May 2020 14:43:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [RESENDPATCH v8 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200526204306.GA224630@bogus>
References: <20200520000621.49152-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200520000621.49152-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520000621.49152-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 20, 2020 at 08:06:20AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> new file mode 100644
> index 000000000000..cd4e983a449e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0

Still not dual licensed.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel LGM SoC NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-nand-controller

Still doesn't match the example. And the example will fail when it does.

> +
> +  reg:
> +    items:
> +       - description: ebunand registers
> +       - description: hsnand registers
> +       - description: nand_cs0 external flash access
> +       - description: nand_cs1 external flash access
> +       - description: addr_sel0 memory region enable and access
> +       - description: addr_sel1 memory region enable and access

reg-names?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +patternProperties:
> +  "^nand@[a-f0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +      nand-ecc-mode: true
> +
> +      nand-ecc-algo:
> +        const: hw
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Not documented or should be dropped.

> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@e0f00000 {
> +      compatible = "intel,lgm-nand";
> +      reg = <0xe0f00000 0x100>,
> +            <0xe1000000 0x300>,
> +            <0xe1400000 0x8000>,
> +            <0xe1c00000 0x1000>,
> +            <0x17400000 0x4>,
> +            <0x17c00000 0x4>;
> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
> +        "addr_sel0","addr_sel1";

Not documented. And needs a space after the ','.

> +      clocks = <&cgu0 125>;
> +      dmas = <&dma0 8>, <&dma0 9>;
> +      dma-names = "tx", "rx";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #clock-cells = <1>;

Should be removed?

> +
> +      nand@0 {
> +        reg = <0>;
> +        nand-on-flash-bbt;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +      };
> +    };
> +
> +...
> -- 
> 2.11.0
> 
