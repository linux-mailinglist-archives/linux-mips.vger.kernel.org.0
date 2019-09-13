Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51AEBB221A
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 16:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbfIMOgJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 10:36:09 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35004 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfIMOgJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 10:36:09 -0400
Received: by mail-ot1-f66.google.com with SMTP id t6so16445799otp.2;
        Fri, 13 Sep 2019 07:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=EhVYjm/YBm0igQafg8TH8nGG75SYappzyaYQWt33XPA=;
        b=g6f4AWIbnXROw0N9q2CL4QeEc/7hW/RSjc/Y9BNQeNMy9mPVmxsEKomrsrb94QFDSg
         NRWUwM8TCt46Hk5hMaP41+0fklHgBeekr6tc9QX8QcYmCpqrwc93PpJW2pK5JG4B/CHn
         0LrPwv46chPV8prMnJKomUdNqD0TbUGyUAhddiXr9qnM0wNbXcw1usvOrXkmmlhYyEPo
         KNGMhCc+m3biHbifCfLkpat/z26kUO9qbPoKVqh5saNi8YZ3rZb2JQGCZlWkeBX0UbIl
         qU70/4y1llvhMVJrIWyHz9UKJ0A3YECN3RrdvPaKsIrTCL4dfqR+ucSXS5E5wJGz9n03
         rgdg==
X-Gm-Message-State: APjAAAXZPoQoOx8bhzY8WfiW2JYEInBqnKrsxP7EVpjiLASYLEBFM/8Q
        sGHrliIqSh1OAgUfi0KDOiIlNlA=
X-Google-Smtp-Source: APXvYqxFXbXgcv9cvlYNEsqbSyTU5GT2myXwn5HRX+RIDFQZX6Of/xSC0KyE0TaktDfaACiCpcljCA==
X-Received: by 2002:a05:6830:1103:: with SMTP id w3mr7219205otq.147.1568385367903;
        Fri, 13 Sep 2019 07:36:07 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 36sm10597332ott.66.2019.09.13.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:36:07 -0700 (PDT)
Message-ID: <5d7ba957.1c69fb81.a8a33.834a@mx.google.com>
Date:   Fri, 13 Sep 2019 15:36:06 +0100
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 12/18] dt-bindings: mips: Add loongson cpus & boards
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
 <20190830043232.20191-7-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830043232.20191-7-jiaxun.yang@flygoat.com>
X-Mutt-References: <20190830043232.20191-7-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 30, 2019 at 12:32:26PM +0800, Jiaxun Yang wrote:
> Prepare for later dts.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/mips/loongson/cpus.yaml          | 38 +++++++++++
>  .../bindings/mips/loongson/devices.yaml       | 64 +++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/cpus.yaml b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> new file mode 100644
> index 000000000000..dc6dd5114d5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson CPUs bindings
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |+
> +  The device tree allows to describe the layout of CPUs in a system through
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> +  defining properties for every cpu.
> +
> +  Bindings for CPU nodes follow the Devicetree Specification, available from:
> +
> +  https://www.devicetree.org/specifications/
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Physical ID of a CPU, Can be read from CP0 EBase.CPUNum.
> +
> +  compatible:
> +    enum:
> +      - loongson,gs464
> +      - loongson,gs464e
> +      - loongson,gs264
> +      - loongson,gs464v
> +
> +required:
> +  - device_type
> +  - reg
> +  - compatible
> +...
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> new file mode 100644
> index 000000000000..aa6c42013d2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson based Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>

Add a blank line here.

> +description: |
> +  Devices with a Loongson CPU shall have the following properties.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Loongson 3A1000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a1000-780e-1way

This is a board or a chip? Normally we have a board compatible followed 
by a SoC compatible.

What's the difference between 1-way, 2-way, 4-way? Maybe there's another 
way to describe that. 

> +
> +      - description: Loongson 3A1000 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3a1000-780e-2way
> +
> +      - description: Loongson 3A1000 + RS780E 4Way
> +        items:
> +          - const: loongson,ls3a1000-780e-4way
> +
> +      - description: Loongson 3B1000/1500 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3b-780e-1way
> +
> +      - description: Loongson 3B1000/1500 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3b-780e-2way
> +
> +      - description: Loongson 3A2000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a2000-780e-1way
> +
> +      - description: Loongson 3A2000 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3a2000-780e-2way
> +
> +      - description: Loongson 3A2000 + RS780E 4Way
> +        items:
> +          - const: loongson,ls3a2000-780e-4way
> +
> +      - description: Loongson 3A3000 + RS780E 1Way
> +        items:
> +          - const: loongson,ls3a3000-780e-1way
> +
> +      - description: Loongson 3A3000 + RS780E 2Way
> +        items:
> +          - const: loongson,ls3a3000-780e-2way
> +
> +      - description: Loongson 3A3000 + RS780E 4Way
> +        items:
> +          - const: loongson,ls3a3000-780e-4way
> +
> +...
> -- 
> 2.22.0
> 

