Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5B31CFB1E
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 18:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgELQmg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 12:42:36 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34162 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgELQmf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 12:42:35 -0400
Received: by mail-oi1-f194.google.com with SMTP id c12so17791388oic.1;
        Tue, 12 May 2020 09:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t/zxT6QcAzvwsaSRHiVgR4FzAsz6oEzW+dxiDwnz3LY=;
        b=V8oZ6EO7dn95giiU8SaXZLlPOdN2ZX1jm4pV1xsaV1+MnJelhdrjHP2gxhLeTokRON
         u/fzuxCCUNMXj2UztB10MLvBDj/lKSD0HMD2zbcBFvmnDYv8O2oesHJc6nJihuAxuiZY
         vpBAqjmG1+HKkH9Z65OzwsM8CU/RXroBD+5ntLIGZf8EJjQtHlOKn2+tWKcRIsOI3NnR
         xc0L1HvZSS9mwvNTiNeaqWwAEGZBuDLPlPImS6AjMnJ2LJUczIS8ozna4DaGXhjMsRsh
         LnvT8pZoYD9Uym9/mr5cJ8l34mdce9d4udub+dSImYCzmeqFYEOrbw/OGtNSgRasT95i
         SZWg==
X-Gm-Message-State: AGi0PuYBR0q2b+Ac+zjoHGWyqSs3nrT6QN8qwjABD9lEudSkxNFTPavx
        SWclyFy3j0jWadIhrhUPSQ==
X-Google-Smtp-Source: APiQypKnl8Q8RS5Ndc4MZqjXTedwdk2Q2Fe9QuS5IhFBnwb7YWQd+ESdSPYpBtyFypUbRpSr8flg2g==
X-Received: by 2002:aca:ba05:: with SMTP id k5mr23382003oif.35.1589301754747;
        Tue, 12 May 2020 09:42:34 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c25sm3536777otp.50.2020.05.12.09.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 09:42:34 -0700 (PDT)
Received: (nullmailer pid 18148 invoked by uid 1000);
        Tue, 12 May 2020 16:42:33 -0000
Date:   Tue, 12 May 2020 11:42:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     maz@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: interrupt-controller: Add Loongson
 HTVEC
Message-ID: <20200512164233.GB12151@bogus>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
 <20200501092139.2988670-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501092139.2988670-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 01, 2020 at 05:21:33PM +0800, Jiaxun Yang wrote:
> Add binding for Loongson-3 HyperTransport Interrupt Vector Controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../interrupt-controller/loongson,htvec.yaml  | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> new file mode 100644
> index 000000000000..547a80c89eba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,htvec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson-3 HyperTransport Interrupt Vector Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Don't need this. It's already applied to any node named 
'interrupt-controller'.

> +
> +description: |

Can drop '|' if you don't need formatting.

> +  This interrupt controller is found in the Loongson-3 family of chips for
> +  receiving vectorized interrupts from PCH's interrupt controller.
> +
> +properties:
> +  compatible:
> +    const: loongson,htvec-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    description: |
> +      Four parent interrupts that receive chained interrupts.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    htvec: interrupt-controller@1fb000080 {

Unit-address doesn't match reg.

> +      compatible = "loongson,htvec-1.0";
> +      reg = <0xfb000080 0x40>;
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +
> +      interrupt-parent = <&liointc>;
> +      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +                    <25 IRQ_TYPE_LEVEL_HIGH>,
> +                    <26 IRQ_TYPE_LEVEL_HIGH>,
> +                    <27 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
> -- 
> 2.26.0.rc2
> 
