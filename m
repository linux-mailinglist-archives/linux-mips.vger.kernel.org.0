Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1675F1D9642
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 14:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgESM14 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 08:27:56 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53504 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgESM14 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 08:27:56 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 37E66803088B;
        Tue, 19 May 2020 12:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hcU-OTdDdPtT; Tue, 19 May 2020 15:27:50 +0300 (MSK)
Date:   Tue, 19 May 2020 15:27:48 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Olof Johansson <olof@lixom.net>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        <linux-mips@vger.kernel.org>, <soc@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: Add Baikal-T1 L2-cache
 Control Block binding
Message-ID: <20200519122748.infu5jvw5q6ifm4s@mobilestation>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
 <20200507230705.6468-1-Sergey.Semin@baikalelectronics.ru>
 <20200507230705.6468-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200507230705.6468-2-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rob,

Could you take a look at this patch?
Since you've accepted and merged in the patch:
https://lore.kernel.org/linux-devicetree/20200506174238.15385-4-Sergey.Semin@baikalelectronics.ru/

It's safe to perform the dt_binding_check of this one.

-Sergey 

On Fri, May 08, 2020 at 02:07:03AM +0300, Serge Semin wrote:
> There is a single register provided by the SoC system controller,
> which can be used to tune the L2-cache RAM up. It only provides a way
> to change the L2-RAM access latencies. So aside from "be,bt1-l2-ctl"
> compatible string the device node can be optionally equipped with the
> properties of Tag/Data/WS latencies.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-mips@vger.kernel.org
> Cc: soc@kernel.org
> 
> ---
> 
> Changelog v2:
> - Move driver to the memory subsystem.
> - Use dual GPL/BSD license.
> - Use single lined copyright header.
> - Move "allOf" restrictions to the root level of the properties.
> - Discard syscon compatible string and reg property.
> - The DT node is supposed to be a child of the Baikal-T1 system controller
>   node.
> ---
>  .../memory-controllers/baikal,bt1-l2-ctl.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml b/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> new file mode 100644
> index 000000000000..263f0cdab4e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/baikal,bt1-l2-ctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Baikal-T1 L2-cache Control Block
> +
> +maintainers:
> +  - Serge Semin <fancer.lancer@gmail.com>
> +
> +description: |
> +  By means of the System Controller Baikal-T1 SoC exposes a few settings to
> +  tune the MIPS P5600 CM2 L2 cache performance up. In particular it's possible
> +  to change the Tag, Data and Way-select RAM access latencies. Baikal-T1
> +  L2-cache controller block is responsible for the tuning. Its DT node is
> +  supposed to be a child of the system controller.
> +
> +properties:
> +  compatible:
> +    const: baikal,bt1-l2-ctl
> +
> +  baikal,l2-ws-latency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Cycles of latency for Way-select RAM accesses
> +    default: 0
> +    minimum: 0
> +    maximum: 3
> +
> +  baikal,l2-tag-latency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Cycles of latency for Tag RAM accesses
> +    default: 0
> +    minimum: 0
> +    maximum: 3
> +
> +  baikal,l2-data-latency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Cycles of latency for Data RAM accesses
> +    default: 1
> +    minimum: 0
> +    maximum: 3
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    l2_ctl {
> +      compatible = "baikal,bt1-l2-ctl";
> +
> +      baikal,l2-ws-latency = <0>;
> +      baikal,l2-tag-latency = <0>;
> +      baikal,l2-data-latency = <1>;
> +    };
> +...
> -- 
> 2.25.1
> 
