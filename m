Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D7520F239
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 12:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732255AbgF3KIs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jun 2020 06:08:48 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:34368 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732188AbgF3KIr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jun 2020 06:08:47 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id EF6C280554;
        Tue, 30 Jun 2020 12:08:42 +0200 (CEST)
Date:   Tue, 30 Jun 2020 12:08:41 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v2 02/10] dt-bindings: display: Add ingenic,ipu.yaml
Message-ID: <20200630100841.GA553950@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-2-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
        a=e5mUnYsNAAAA:8 a=zaYY7jrkgZO2RDDRebYA:9 a=CjuIK1q_8ugA:10
        a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 30, 2020 at 01:52:02AM +0200, Paul Cercueil wrote:
> Add documentation of the Device Tree bindings for the Image Processing
> Unit (IPU) found in most Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Do not know the IPU but looks correct.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Notes:
>     v2: Add missing 'const' in items list
> 
>  .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,ipu.yaml b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> new file mode 100644
> index 000000000000..5bfc33eb32c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,ipu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs Image Processing Unit (IPU) devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4725b-ipu
> +        - ingenic,jz4760-ipu
> +      - items:
> +        - const: ingenic,jz4770-ipu
> +        - const: ingenic,jz4760-ipu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ipu
> +
> +patternProperties:
> +  "^ports?$":
> +    description: OF graph bindings (specified in bindings/graph.txt).
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4770-cgu.h>
> +    ipu@13080000 {
> +      compatible = "ingenic,jz4770-ipu", "ingenic,jz4760-ipu";
> +      reg = <0x13080000 0x800>;
> +
> +      interrupt-parent = <&intc>;
> +      interrupts = <29>;
> +
> +      clocks = <&cgu JZ4770_CLK_IPU>;
> +      clock-names = "ipu";
> +
> +      port {
> +        ipu_ep: endpoint {
> +          remote-endpoint = <&lcdc_ep>;
> +        };
> +      };
> +    };
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
