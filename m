Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 036DA9E8AC
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 15:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfH0NIo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 09:08:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:39176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbfH0NIo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 09:08:44 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0E162077B;
        Tue, 27 Aug 2019 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566911322;
        bh=AX+JitzJv+K315th2SOy3YtH0VY/SuXeid3kXFuhBUE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CVsC+VDz2ihD4Mm+zIR+ySHxwO7R1ZjnAzMQBd0WbP8AxoP3TW692VdRMOtny23nQ
         i1IG4nuhZKuFC2N0Yzym8iHftvKzrHoYTuO/7QSdEcngeW+eCrW9qVfLHhEeritQHM
         7AEWsOIy+0N/pS+Xu4XcFCkCig/nUYCXppx0/CfA=
Received: by mail-qt1-f176.google.com with SMTP id v38so21203993qtb.0;
        Tue, 27 Aug 2019 06:08:42 -0700 (PDT)
X-Gm-Message-State: APjAAAX5OSsNMdf6xww7g8TCrm+aF8ZUgNgNLKeo9N1sUzxwf1Mvs3DQ
        db+UJaFtptexgVQQN08a4YigpqhbCHa2XNg60g==
X-Google-Smtp-Source: APXvYqwcXXM593kwWwoazOnu4lDw8LvX4m7hSKGd+f3fLIf8Vsa2X9oW7XZK9KrseUocOJeq32tPVRdHaNWYgMDFrio=
X-Received: by 2002:ad4:4050:: with SMTP id r16mr20016450qvp.200.1566911321782;
 Tue, 27 Aug 2019 06:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20190827085302.5197-6-jiaxun.yang@flygoat.com>
In-Reply-To: <20190827085302.5197-6-jiaxun.yang@flygoat.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Aug 2019 08:08:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+aEOPOvRr8c-umqwKdVi=WMXL=fufeDCj2+87P69tLgQ@mail.gmail.com>
Message-ID: <CAL_Jsq+aEOPOvRr8c-umqwKdVi=WMXL=fufeDCj2+87P69tLgQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: interrupt-controller: Add Loongson-3 IOINTC
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 27, 2019 at 4:00 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Document Loongson-3 I/O Interrupt controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-iointc.yaml                  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
> new file mode 100644
> index 000000000000..cc6ac8b2cd7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please.

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-iointc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson-3 I/O Interrupt Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |
> +  This interrupt controller is found in the Loongson-3 family of chips as the primary
> +  package interrupt source which can route interrupt to interrupt line of cores.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - loongson,ls3-iointc

Same comment here.

> +
> +  reg:
> +    maxItems: 1
> +
> +  'loongson,map-ip':
> +    description:
> +      The interrupt line it's going to map to.

I don't understand. Needs a better description.

> +    allOf:

You need to define the type here with a $ref.


> +      - maximum: 5
> +        minimum: 0
> +
> +  'loongson,map-core':
> +    description:
> +      The core it's going to map to.

There's 1 interrupt ctrlr per core or what?

> +    allOf:
> +      - maximum: 5
> +        minimum: 0
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'

Add a:

additionalProperties: false

> +
> +examples:
> +  - |
> +    iointc: interrupt-controller@3ff01400 {
> +        compatible = "loongson,ls3-io-intc";
> +        reg = <0x3ff01400 0x60>;
> +        interrupts = <2>;
> +        loongson,map-ip = <0>;
> +        loongson,map-core = <0>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +    };
> --
> 2.22.0
>
