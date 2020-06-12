Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD1A1F7E94
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2020 23:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgFLV5A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Jun 2020 17:57:00 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:41088 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgFLV47 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Jun 2020 17:56:59 -0400
Received: by mail-il1-f193.google.com with SMTP id c75so10136007ila.8;
        Fri, 12 Jun 2020 14:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+ERj0Rs2fBV1qZjih5Ki74R7VK7giFh3Euk5Qsf66JA=;
        b=dUm6KGJ+8qgpMY4iUKd/KFKd+pb9WFZLtc8GzvWoZn1ftqWzFZ8LTRVIWUqFLCOko7
         g+ILx9grd4aAJ9VOybyZcBkcHaMJIN4tf52Tkyn28ZmN4++n/QVNzfEdjxNuf5QC1ah0
         CM+bMozBhxaYDR649m9b8d/XfNH19eovaLX+i79vOIO62lCRENBwRNmXlpqUfLIJbGox
         Oc40ziPrEKdNFL+IR20A+mGn7XfkFFhcK2ty1tW0trG0/v7mk6PKAHrbqTJ4aZmew9OM
         1Kln/4ytKdIpF8tfCNgV/zD6y+05AmbVwxC+8883c6rJu0wJBHhu/PKNLFFuXeYRi2/2
         H20A==
X-Gm-Message-State: AOAM532qW2+nwznnP+cOWZE7lwxJfa5JX40ty86Ym20BYtvVOhy6sKbj
        2jKN2ZGy4GnJV9lWLzv8SbVZAq0=
X-Google-Smtp-Source: ABdhPJxl0sSVvAJJyMg0adHj0Sf5cuUGj9Wcok8qKjC3vDCQNiH7E/L2mz9vX5+UwoQgJheAsUTMQg==
X-Received: by 2002:a92:c78b:: with SMTP id c11mr14999885ilk.56.1591999018567;
        Fri, 12 Jun 2020 14:56:58 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y2sm3652530ilg.69.2020.06.12.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 14:56:58 -0700 (PDT)
Received: (nullmailer pid 3884138 invoked by uid 1000);
        Fri, 12 Jun 2020 21:56:56 -0000
Date:   Fri, 12 Jun 2020 15:56:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/9] dt-bindings: soc: brcm: add BCM63xx power domain
 binding
Message-ID: <20200612215656.GB3881384@bogus>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
 <20200610171630.465579-2-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610171630.465579-2-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 10, 2020 at 07:16:22PM +0200, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v3: fix reg maxItems and quote #power-domain-cells.
>  v2: Add separate YAML file.
> 
>  .../bindings/soc/bcm/brcm,bcm63xx-power.yaml  | 44 +++++++++++++++++++

Goes in bindings/power/

>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
> new file mode 100644
> index 000000000000..fd4204d9aaf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later

Okay with GPLv9? Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/brcm/brcm,bcm63xx-power.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: BCM63xx power domain driver
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
> +
> +description: |
> +  BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> +  to enable/disable certain components in order to save power.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - brcm,bcm6318-power-controller
> +          - brcm,bcm6328-power-controller
> +          - brcm,bcm6362-power-controller
> +          - brcm,bcm63268-power-controller
> +
> +  reg:
> +    maxItems: 2
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    periph_pwr: power-controller@10001848 {
> +        compatible = "brcm,bcm6328-power-controller";
> +        reg = <0x10001848 0x4>;
> +        #power-domain-cells = <1>;
> +    };
> -- 
> 2.26.2
> 
