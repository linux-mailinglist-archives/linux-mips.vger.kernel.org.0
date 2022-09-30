Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0885F109E
	for <lists+linux-mips@lfdr.de>; Fri, 30 Sep 2022 19:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbiI3RQl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Sep 2022 13:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiI3RQk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Sep 2022 13:16:40 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48071C297D;
        Fri, 30 Sep 2022 10:16:39 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-12c8312131fso6206127fac.4;
        Fri, 30 Sep 2022 10:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0AYI4uAqVsxIxzVEevo9sZ9Sa1U4EAjBrth254rR/20=;
        b=UTHfoxBijX+MceBIvO3a+jjcWhPFsYRx0bnWnEJ2R2XRkHRD+2OCUS98PM4ZYdk3gJ
         M25zjO0USuq9gj7di4k6koRB8AwOwkKRZECu8F1EM4SFjf1DteLSWdIcbF9YmCzXROTU
         3xY84xySIBjak1eAC/jNMOA5FrLMPpoPmB528maQZ8LYwMOa/Ej9O+quTc2irnNhrFdG
         BK1qsVGjiie5376wYyH8efwecmcZmeiM5ZXutC/rRqL9Bu2/3lbaOK7UmeED5rYbTj71
         BiklObpIsNY+qtVX0qsr0XjPSkPPZbqN5GWC1riQtoR0xAKTp2PKPs5xYBQJlF1MeO9k
         YbsA==
X-Gm-Message-State: ACrzQf1d9ZFAqvgSJYN9P59RGBf+OXpqGqn/h3pMJhIhSYf8y4k92M14
        uQYqSGHDCrUv4YleJ2GH4A==
X-Google-Smtp-Source: AMsMyM4XIXAufjfowWF1ukB8at4z8KYtyLsi+DSTT6oj9jEB9/uh1duod3CVjPbvnjpFPMcuBzxiYw==
X-Received: by 2002:a05:6870:608e:b0:12b:c0de:bc9d with SMTP id t14-20020a056870608e00b0012bc0debc9dmr5399346oae.52.1664558198880;
        Fri, 30 Sep 2022 10:16:38 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y5-20020a0568301d8500b0065c0f4552besm682734oti.33.2022.09.30.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:16:38 -0700 (PDT)
Received: (nullmailer pid 536421 invoked by uid 1000);
        Fri, 30 Sep 2022 17:16:37 -0000
Date:   Fri, 30 Sep 2022 12:16:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mips: add CPU bindings for MIPS
 architecture
Message-ID: <20220930171637.GA526500-robh@kernel.org>
References: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
 <20220929072004.874795-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929072004.874795-2-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 29, 2022 at 09:20:02AM +0200, Sergio Paracuellos wrote:
> Add the yaml binding for available CPUs in MIPS architecture.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../devicetree/bindings/mips/cpus.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
> new file mode 100644
> index 000000000000..4f8891f0755b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS CPUs bindings
> +
> +maintainers:
> +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> +
> +description: |
> +  The device tree allows to describe the layout of CPUs in a system through
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> +  defining properties for every CPU.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bmips3300
> +      - brcm,bmips4350
> +      - brcm,bmips4380
> +      - brcm,bmips5000
> +      - brcm,bmips5200

Need to remove 
Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt.

> +      - ingenic,xburst-mxu1.0
> +      - ingenic,xburst-fpu1.0-mxu1.1
> +      - ingenic,xburst-fpu2.0-mxu2.0

So we should remove 
Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml?

> +      - loongson,gs264
> +      - mips,m14Kc
> +      - mips,mips4Kc
> +      - mips,mips4KEc
> +      - mips,mips24Kc
> +      - mips,mips24KEc
> +      - mips,mips74Kc
> +      - mips,mips1004Kc
> +      - mti,interaptiv
> +      - mti,mips24KEc
> +      - mti,mips14KEc
> +      - mti,mips14Kc
> +
> +  reg:
> +    maxItems: 1

Does the numbering have some basis in the h/w?

> +
> +required:
> +  - compatible
> +
> +additionalProperties: true

Do you need this to be true? What's missing besides 'device_type'?

We've got the same issue for Arm cpu schema, so fine for now if there's 
not an easy fix.

Rob
