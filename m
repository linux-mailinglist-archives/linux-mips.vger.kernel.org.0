Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5D25F1110
	for <lists+linux-mips@lfdr.de>; Fri, 30 Sep 2022 19:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiI3Rnn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Sep 2022 13:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiI3Rnm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Sep 2022 13:43:42 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FE62CE2D;
        Fri, 30 Sep 2022 10:43:42 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id o64so5411915oib.12;
        Fri, 30 Sep 2022 10:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JjEKLed2bS/39PSQcjvnHU6CF//pE8WpWB61kVnAezA=;
        b=mWM8sI6oAZtXf+YQ9VnupgSirEQkS0w9+h0zOpZU0er2nWavQ8oHbePUoeRvap3R5m
         XWG5xlUkd3IG9rtpi2On2YNNcbR7EXCOCO7f2j+xb33YL1o+5c/y8dgdM/wv/AE6lT0M
         fgeGiJGcVE2F+BJGMUn0crHvIkLG+Qok6OZL89cyIHA6PAtrdnC8YGgtWOle6uDNKK64
         Bt4qK5h31TzmJjSWFaw6BeY+u/nCoGh3gmG31sDdwbt0Djj/fg6tvKIr5HV5aUyJ335+
         UK5oMBErJjv9/k3XYXHdyy3PbY5inA/D9IMZFcfX30LG1ISx9LS1/XqQvGA8Owo4FTEn
         BJ4g==
X-Gm-Message-State: ACrzQf1t91jOQ0ucLLXGTtU68viHATMf8bMLJpDu/8w6vGpGYVhsJ63y
        ziBpSrBLzm0uwBq4oC1iD0ljWxDfdQ==
X-Google-Smtp-Source: AMsMyM7VDN6CTtOd11B7+OywO1gEAIKw2Yt+WDP5aDkJpc4Vd2MhUobkVwmzq+e6IuWqxMrUpHxE+Q==
X-Received: by 2002:a05:6808:201b:b0:350:87c:a8c6 with SMTP id q27-20020a056808201b00b00350087ca8c6mr4510263oiw.228.1664559821221;
        Fri, 30 Sep 2022 10:43:41 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w92-20020a9d3665000000b0061c9ccb051bsm688932otb.37.2022.09.30.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:43:40 -0700 (PDT)
Received: (nullmailer pid 565140 invoked by uid 1000);
        Fri, 30 Sep 2022 17:43:40 -0000
Date:   Fri, 30 Sep 2022 12:43:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com
Subject: Re: [PATCH v3 3/3] dt-bindings: mips: brcm: convert CPU bindings for
 BMIPS architecture
Message-ID: <20220930174340.GA536589-robh@kernel.org>
References: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
 <20220929072004.874795-4-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929072004.874795-4-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 29, 2022 at 09:20:04AM +0200, Sergio Paracuellos wrote:
> Convert the yaml binding for available CPUs in BMIPS architecture.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/mips/brcm/brcm,bmips-cpus.yaml   | 102 ++++++++++++++++++
>  .../bindings/mips/brcm/brcm,bmips.txt         |   8 --

Ah, here it is.

>  2 files changed, 102 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
> new file mode 100644
> index 000000000000..60aa7df9a543
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/brcm/brcm,bmips-cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS CPUs bindings
> +
> +maintainers:
> +  - Hauke Mehrtens <hauke@hauke-m.de>
> +  - Rafał Miłecki <zajec5@gmail.com>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  The device tree allows to describe the layout of BMIPS CPUs.
> +
> +patternProperties:
> +  "^/":
> +    type: object
> +    $ref: "/schemas/mips/brcm/soc.yaml#"

This is doesn't do anything.

Your schema is never applied either as 'select' defaults to false if 
there's not 'compaatible' or '$nodename' in the schema.

> +
> +properties:
> +  cpus:
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      mips-hpt-frequency:
> +        description: This is common to all CPUs in the system so it lives
> +          under the "cpus" node.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    patternProperties:
> +      "^cpu@[0-9]$":
> +        type: object
> +        $ref: "/schemas/mips/cpus.yaml#"
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  - "brcm,bcm3368"
> +                  - "brcm,bcm3384"
> +                  - "brcm,bcm33843"
> +                  - "brcm,bcm3384-viper"
> +                  - "brcm,bcm33843-viper"
> +                  - "brcm,bcm6328"
> +                  - "brcm,bcm6358"
> +                  - "brcm,bcm6362"
> +                  - "brcm,bcm6368"
> +                  - "brcm,bcm63168"
> +                  - "brcm,bcm63268"
> +                  - "brcm,bcm7125"
> +                  - "brcm,bcm7346"
> +                  - "brcm,bcm7358"
> +                  - "brcm,bcm7360"
> +                  - "brcm,bcm7362"
> +                  - "brcm,bcm7420"
> +                  - "brcm,bcm7425"
> +        then:
> +          required:
> +            - mips-hpt-frequency

Other than this property, the cpus.yaml schema in dtschema covers all 
this.

You allow mips-hpt-frequency on any platform including non-MIPS if this 
schema actually got applied. Is this intended for all MIPS platforms or 
just for Broadcom platforms? The former is hard to support as how do we 
express which platforms are MIPS in schemas. In the latter case, 
brcm/soc.yaml could have something like this:

properties:
  cpus:
    $ref: /schemas/cpus.yaml#
    unevaluatedProperties: false

    properties:
      mips-hpt-frequency:
        ...

    required:
      - mips-hpt-frequency

Rob
