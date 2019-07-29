Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD1679CAA
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 01:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbfG2XSB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 19:18:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727808AbfG2XSB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jul 2019 19:18:01 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8040A216C8;
        Mon, 29 Jul 2019 23:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564442280;
        bh=N2rwtwUzQ5vXhc2Rou7m8QrX8MBo9QM1SyZEDt1CeDE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2egu48ABH4l6nA3u50w8c3A0+yVjUm7oMKY3q7iV86uivReQ1samnXXJVAtGLk62b
         tLEtkmMV7DaUAZzMxln6LJWXupPiuGqwdhQmj1slbukiFcR5B+kbZlPj2CUJh4i5S8
         BaMv0MdzgNPIK1cOlXtaWLKvkOMowaKRbaQ51f/o=
Received: by mail-qt1-f174.google.com with SMTP id w17so16898823qto.10;
        Mon, 29 Jul 2019 16:18:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXx0wJXFQl2aaF+dNsa9Xy6uYZ37YPxA+phqWr/rv68gWG7PWtl
        as0sfWYnJo6Jbuu8dAlT+Tb0p6WVD6IeyC8e4g==
X-Google-Smtp-Source: APXvYqyCM9nYr/pqJTVSXr9g4MM31JUmo02cPC6C4os3agfx8G2Cp08P3yIJO+S6Z7fvK4vvnlh0FkidgCeFhfsl7tk=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr80553657qth.136.1564442279665;
 Mon, 29 Jul 2019 16:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com> <20190727175315.28834-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190727175315.28834-2-martin.blumenstingl@googlemail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 29 Jul 2019 17:17:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLRKF3mE7Xf_8Fxt2ycYAMmyo=bGB5f13cVoHShS3+G=g@mail.gmail.com>
Message-ID: <CAL_JsqLRKF3mE7Xf_8Fxt2ycYAMmyo=bGB5f13cVoHShS3+G=g@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: MIPS: lantiq: Add documentation for the
 External Bus Unit
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>, maz@kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 27, 2019 at 11:53 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Lantiq SoCs contain a so-called External Bus Unit.
>
> It attaches PCI memory as well as NAND and NOR flash. Additioanlly it

typo

> contains an interrupt-controller for the PCI_INTA interrupt line.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mips/lantiq/lantiq,ebu.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
>
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
> new file mode 100644
> index 000000000000..0b0b27d0b64b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,ebu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq External Bus Unit (EBU) bindings
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lantiq,falcon-ebu
> +      - lantiq,xway-ebu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The EBU module clock

I prefer just 'maxItems: 1' as when there's only one clock, the
description is not too useful.

> +
> +  interrupt-controller:
> +    type: boolean

Just 'true' is fine as this already has a defined type.

> +
> +  interrupt-cells:
> +    const: 2
> +
> +  interrupts:
> +    items:
> +      - description: The EBU module interrupt line
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    memory-controller@e105300 {
> +        compatible = "lantiq,xway-ebu";
> +        reg = <0xe105300 0x100>;
> +        clocks = <&pmu 10>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupt-parent = <&icu0>;
> +        interrupts = <30>;
> +    };
> +...
> --
> 2.22.0
>
