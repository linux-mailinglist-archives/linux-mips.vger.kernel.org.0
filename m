Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EE21E87DC
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 21:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgE2Tbe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 15:31:34 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41743 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgE2Tbd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 15:31:33 -0400
Received: by mail-io1-f65.google.com with SMTP id o5so545089iow.8;
        Fri, 29 May 2020 12:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=snjj37/YdMHAZOpkk9/RRV5o12QUCoSQOMCE8M28IQg=;
        b=irIPjdrjZeoDOP300tM9f1inJxjL0CvxNEughDC/O94ehQtbKk3m6nAGBS/9ctSDlg
         VwteBEUT1O5yOh3bgzk6WaB3eYJ1IoNM6RXxmqhuS9da0LBlFnsCvZ+aNUar5jcuPNQ9
         /aMuLKBfXSZV1OoScC/v8JRbO7rRJVmhu1TA3QsNwEb4F3JBXsPLUKnjaXQJv4Kikav0
         1qnBfMOF8e5jDoDbK2QHvVYjSiuDWNzl1DSn5rHedVb4yqHEN9g2lHbJAwBN2OVygDv9
         XW+4rbWCMurxldZm9TyEQfEbImH4UQrhDQQD409FZM0F3YLlhRduvflJMnictS6m6Wa4
         L6Kw==
X-Gm-Message-State: AOAM5305V6XC0B3RfffMR3l2TOEfU384bPt8Zzo5fWZccfTbs8Pcni+p
        pEBFdA2HV8oop45h/JMwxQ==
X-Google-Smtp-Source: ABdhPJzwB9AW1q+9HkoCpzsKv8lCmKg8zrgaxgbznjc6r+aKG0ZlZeZpl3AdnKYyasYzPUNG7F9l8w==
X-Received: by 2002:a02:c802:: with SMTP id p2mr8840537jao.111.1590780692506;
        Fri, 29 May 2020 12:31:32 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id x22sm5300039ill.9.2020.05.29.12.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:31:31 -0700 (PDT)
Received: (nullmailer pid 2806583 invoked by uid 1000);
        Fri, 29 May 2020 19:31:30 -0000
Date:   Fri, 29 May 2020 13:31:30 -0600
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
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200529193130.GA2805164@bogus>
References: <20200528153929.46859-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528153929.46859-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528153929.46859-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 11:39:28PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> new file mode 100644
> index 000000000000..afecc9920e04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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

Doesn't match the example.

> +
> +  reg:
> +    maxItems: 6
> +
> +  reg-names:
> +    items:
> +       - const: ebunand
> +       - const: hsnand
> +       - const: nand_cs0
> +       - const: nand_cs1
> +       - const: addr_sel0
> +       - const: addr_sel1
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
> +  - reg-names
> +  - clocks
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
> +        "addr_sel0", "addr_sel1";
> +      clocks = <&cgu0 125>;
> +      dmas = <&dma0 8>, <&dma0 9>;
> +      dma-names = "tx", "rx";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
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
