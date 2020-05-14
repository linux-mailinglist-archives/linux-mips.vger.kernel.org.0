Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BDA1D3092
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 15:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgENND0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 09:03:26 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:32791 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENND0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 09:03:26 -0400
Received: by mail-ot1-f68.google.com with SMTP id v17so2281155ote.0;
        Thu, 14 May 2020 06:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PAAq3M4gzQu8HSRZbaaHX+1SesRsxaYoIJArKgrswws=;
        b=Yfe0/3is/dHKayOCHp7iYgLjtCjQhBpv/lsLMOALJW0MqY8FybHkesUjTP3KYlkYR7
         lFq/YesSZtNLvn73W+r83GK2NqI/oWm4bKwaAvBkHuKNqldOkOv94Mx8aR6n0bOvlDwT
         pua6xjDxzCCXUYZmYou5QHvChfdfyi2vwoYF+bTbT88DLtj4uFyIKnNFKKIzNMmLvaxD
         bPZnP4/84rCDodtUJWq4PosUQjwn1vdXdYWETRhxHojEP51mllMIDcfzfUWHAgRzsOp2
         2mfHcTrDBqtbbEpIcy/gS0aL3F3iWEwfXaFCrB/NIz3dYBsqL+r23/1vDeNBC3oHsyv6
         MNpg==
X-Gm-Message-State: AOAM532CK8GeOHPH4KRkmk8vjCL5HHd/dHmUvgb7eCgAlWZruPrtXFb/
        xu0NG/JbduVeGMIRGfZ6+w==
X-Google-Smtp-Source: ABdhPJxcpuhv/1AydK5IH3eeNpW2zbl+DpIvij7siBl4sEeht7w7E4i0Oo7cKTz9Uzccd2FBgUw8Gw==
X-Received: by 2002:a9d:7343:: with SMTP id l3mr3144827otk.276.1589461403791;
        Thu, 14 May 2020 06:03:23 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i10sm765855oos.28.2020.05.14.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 06:03:23 -0700 (PDT)
Received: (nullmailer pid 17389 invoked by uid 1000);
        Thu, 14 May 2020 13:03:21 -0000
Date:   Thu, 14 May 2020 08:03:21 -0500
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
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200514130321.GB8436@bogus>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 06:46:14PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> new file mode 100644
> index 000000000000..d9e0df8553fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

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
> +
> +  reg:
> +    maxItems: 1

Looks like you have 4 or 6 entries, not 1. Need to define what each one 
is.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    enum:
> +      - rx
> +      - tx

This defines a single entry. I believe you want:

items:
  - const: tx
  - const: rx

> +
> +  pinctrl-names: true

No need for this. Tools add pinctrl properties.

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
> +  - dmas
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@e0f00000 {
> +      compatible = "intel,nand-controller";

Doesn't match the schema.

> +      reg = <0xe0f00000 0x100>,
> +            <0xe1000000 0x300>,
> +            <0xe1400000 0x8000>,
> +            <0xe1c00000 0x1000>;

Is it 4 or 6 entries?

> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
> +        "addr_sel0","addr_sel1";

Not documented.

> +      clocks = <&cgu0 125>;
> +      dma-names = "tx", "rx";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #clock-cells = <1>;

This is a clock provider too?

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
