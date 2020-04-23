Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07111B545E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 07:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgDWFsP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 01:48:15 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43761 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWFsO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 01:48:14 -0400
Received: by mail-il1-f194.google.com with SMTP id z12so4395497ilb.10;
        Wed, 22 Apr 2020 22:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6HrsKtvMTC16RLyr5yi4ukjSOjzkdtId/c6u00zB+A4=;
        b=dFd4Gl07JfkJNt9+0Fk2KwkhaqFVUtlOZWclD01mfKsqcnj0vmLTbufyszCNChAf10
         v9ti7IN/aYskpaEixM2qA5PNrBCT30JUJKgSOuDi3dcj5PSylOgBUvu9AZCfZbo+731e
         kNFVNZPqqLv1B3wlChhaZe2SE+IfP/7aE7O1Vgc8Gb1aH6THo+2HbfqVwaN5qyB4T75e
         hSYEy4Dc7RSkOL61wruN6P734hL+1s2bBcBQ7mwkh+8pnkCAhX3XFlUDLv7Vq8qcCplr
         x30OYsctyHco3kKSsAoZUhiDBmVo6MS3USmGbVYM4R9NtTqggD5o1eeyn8MWRqg57ml/
         Mp3Q==
X-Gm-Message-State: AGi0PuYZJXAgDuZBCerJAGfSmDBvByku5MyeM1w8l6L6GtppDMu7ToFP
        8R9zFKfSJekwcBMS9YSVJD0zfmWpXKCVyGzyZeM=
X-Google-Smtp-Source: APiQypJzmY6DGwFra6DRqjeo4SVdHaVeq/02YpfpS06tZ4ixxj1TSskkWJwJStK1muEW3Ml/ZWRJGBO+hkMyIs7Acrw=
X-Received: by 2002:a92:dc0d:: with SMTP id t13mr1859821iln.287.1587620893725;
 Wed, 22 Apr 2020 22:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200422142428.1249684-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20200422142428.1249684-7-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 23 Apr 2020 13:55:36 +0800
Message-ID: <CAAhV-H43ds5YnW+h3zpbwedT0Lksz_o5d=Sz0Uqn+--uuDHN1A@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: Add Loongson PCH MSI
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

On Wed, Apr 22, 2020 at 10:28 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Add binding for Loongson PCH MSI controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,pch-msi.yaml                     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> new file mode 100644
> index 000000000000..dfb9cecacba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-msi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson PCH MSI Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |
> +  This interrupt controller is found in the Loongson-7A family of PCH for
Please use "Loongson's LS7A family" here.

> +  transforming interrupts from PCIe MSI into HyperTransport vectorized
> +  interrupts.
> +
> +properties:
> +  compatible:
> +    const: loongson,pch-msi-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  loongson,msi-base-vec:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: |
> +      u32 value of the base of parent HyperTransport vector allocated
> +      to PCH MSI.
> +
> +  loongson,msi-num-vecs:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: |
> +      u32 value of the number of parent HyperTransport vectors allocated
> +      to PCH MSI.
> +
> +  msi-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - msi-controller
> +  - loongson,msi-base-vec
> +  - loongson,msi-num-vecs
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    msi: msi-controller@2ff00000 {
> +      compatible = "loongson,pch-msi-1.0";
> +      reg = <0x2ff00000 0x4>;
> +      msi-controller;
> +      loongson,msi-base-vec = <64>;
> +      loongson,msi-num-vecs = <64>;
> +      interrupt-parent = <&htvec>;
> +    };
> +...
> --
> 2.26.0.rc2
>
