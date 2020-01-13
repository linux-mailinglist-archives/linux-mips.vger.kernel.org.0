Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03F11389CA
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 04:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733020AbgAMDjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 22:39:02 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:37813 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732961AbgAMDjB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 22:39:01 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so8323961ioc.4;
        Sun, 12 Jan 2020 19:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7i2vyPCdrHQxfSLezSv1jStCCXCabgABKufsVmDHp90=;
        b=qC1kdCIbGYhvHYaY8B4OM5vZ+equln+CCrlrEmQtaG6segiNo69Ate8Gi1qg9oyPMU
         xE6wISmVZYjdvg6cgCywzjagjkPWEOCAyc/8n4rHVGhrCQDGTrSngDGYUViU6rGNvaRt
         WhIUGqE4aHLeINmHDlrAHcuFCRB5vvTCpk77+aa4o5yLO1u9hq5SJarcWhK07fpxjmou
         CbpPYLeBBDjiHKaWeP0DYcnsKPQR6uspwMW2RgcLZH05PQbMdXAZ4VjznF5IuXbE2ClJ
         SBSzrypkZRXOlU3G9VVAT9OD4e77NfrtRUNAj9k0eOiBd01fvYyDsdIxrEIgz6BgEQpm
         9fcg==
X-Gm-Message-State: APjAAAVHMeTw7kQ11O35XEPXQT8V7g+bM4GTHtHSaguL4GD1rE3W82UJ
        16eNMUsv5SwYby8R+etZr6cGlbpXIgkhp3wBVxY=
X-Google-Smtp-Source: APXvYqykWpiExX1/HiH4dv1cQLTb37se3MfLCA21Lpm5wZFEXbq5L+29pBnPFiRx5swx7/6t2kzr16tpj5JyYCOc19s=
X-Received: by 2002:a5d:9d4a:: with SMTP id k10mr11534807iok.134.1578886741140;
 Sun, 12 Jan 2020 19:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com> <20200112081416.722218-4-jiaxun.yang@flygoat.com>
In-Reply-To: <20200112081416.722218-4-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 13 Jan 2020 11:44:10 +0800
Message-ID: <CAAhV-H5QpJcC-iwjmY0Xgdeugsf8FK+ZxgpU=TkcJttW30=mew@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: interrupt-controller: Add Loongson IOINTC
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Sun, Jan 12, 2020 at 4:21 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Document Loongson I/O Interrupt controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../interrupt-controller/loongson,iointc.yaml | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
> new file mode 100644
> index 000000000000..b0fe6c551362
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,iointc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson I/O Interrupt Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |
> +  This interrupt controller is found in the Loongson-3 family of chips as the primary
> +  package interrupt source which can route interrupt to interrupt line of cores.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: loongson,iointc-1.0
> +      - const: loongson,iointc-1.0a
As our early discussion, we should use liointc for the legacy Loongson
irq-controller ans use eiointc for the new irq-controller in
Loongson-3A4000. Moreover, could you please describe the difference
between 1.0 and 1.0a?

Huacai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    description:
> +      Interrupt source of the CPU interrupts.
> +    minItems: 1
> +    maxItems: 4
> +
> +  interrupt-names:
> +    description: List of names for the parent interrupts.
> +    oneOf:
> +      - items:
> +          - const: int0
> +          - const: int1
> +          - const: int2
> +          - const: int3
> +    minItems: 1
> +    maxItems: 4
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  'loongson,parent_int_map':
> +    description: |
> +      This property points the accept range of children interrupts
> +      that parents will recieve. Each cell refers to a parent interrupt line
> +      and each bit in the cell refers to a children interrupt. If a parent
> +      did not connected, than keep it's cell with zero.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - items:
> +          minItems: 4
> +          maxItems: 4
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - 'loongson,parent_int_map'
> +
> +
> +examples:
> +  - |
> +    iointc: interrupt-controller@3ff01400 {
> +      compatible = "loongson,iointc-1.0";
> +      reg = <0 0x3ff01400 0x64>;
> +
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +
> +      interrupt-parent = <&cpuintc>;
> +      interrupts = <2>, <3>;
> +      interrupt-names = "int0", "int1";
> +
> +      loongson,parent_int_map = <0xf0ffffff>, /* int0 */
> +                                <0x0f000000>, /* int1 */
> +                                <0x00000000>, /* int2 */
> +                                <0x00000000>; /* int3 */
> +
> +    };
> +
> +...
> --
> 2.24.1
>
