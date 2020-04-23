Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17FE1B5459
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 07:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDWFrO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 01:47:14 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33850 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgDWFrO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 01:47:14 -0400
Received: by mail-io1-f68.google.com with SMTP id f3so5172373ioj.1;
        Wed, 22 Apr 2020 22:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YIA9n3BbOJBvQz8fK79Sx7YPP5FbY1KMzzgVdpfzCAM=;
        b=hUNtbqGOUAmOkRrK3+Wa1+zVt6vAY1gVwYl0jU3N5LVDFvbJoBpb0RZ35x59pLliWs
         Y/RhP2K/nGv4loeOmJS9aWNxySskEwAvkFYpd4ylMVA7K+s5NKRLGvNJr5979m3sONZp
         cn+pLIo/2tLxsuGcdEqoqBwg2ooBj+m2MAKRX+sxN5h31R1gu88S6Qk938TKxoK2JPYz
         FiDTMxWOLfEF649lY7xFTKbDAIMz0ZCblp824aEG4o+jZUb8MMyq0UN6HX5qhh3J/YMk
         YOfKfcA0DH4v2jihCZp0Jj3IY1I6AyahKFTw1TxlM9uJ0luEBEPWcGI/E/MTZzTBjGrF
         Vi6w==
X-Gm-Message-State: AGi0PubAc/4CoGqmp/r6mrRjZyZzw4IUk/L4o8xqkrpkaXHc+2cIEqCE
        MvT+Je5UbylRSspE/Vttum97nkNfM5RLpXrwn5M=
X-Google-Smtp-Source: APiQypLQb8z2G7X3Zawb3QxUz7bMW61nzP1Kp41ANKFUZ7n0a1V1lV7qJujlq4JOVLy8fduXFoXC3ymul/IReVhOi7k=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr2185787ioh.72.1587620833499;
 Wed, 22 Apr 2020 22:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200422142428.1249684-5-jiaxun.yang@flygoat.com>
In-Reply-To: <20200422142428.1249684-5-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 23 Apr 2020 13:54:32 +0800
Message-ID: <CAAhV-H5u9Y23SqJTUHZtdjiOU=-FzZm6U=yonyveJFa2mACFzQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: Add Loongson PCH PIC
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Wed, Apr 22, 2020 at 10:27 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Add binding for Loongson PCH PIC Controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,pch-pic.yaml                     | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> new file mode 100644
> index 000000000000..afc0c924e477
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson PCH PIC Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +description: |
> +  This interrupt controller is found in the Loongson-7A family of PCH for
Please use "Loongson's LS7A family" here.

> +  transforming interrupts from on-chip devices into HyperTransport vectorized
> +  interrupts.
> +
> +properties:
> +  compatible:
> +    const: loongson,pch-pic-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  loongson,pic-base-vec:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: |
> +      u32 value of the base of parent HyperTransport vector allocated
> +      to PCH PIC.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pic: interrupt-controller@10000000 {
> +      compatible = "loongson,pch-pic-1.0";
> +      reg = <0x10000000 0x400>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      loongson,pic-base-vec = <64>;
> +      interrupt-parent = <&htvec>;
> +    };
> +...
> --
> 2.26.0.rc2
>
