Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2B0A1667A1
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 20:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgBTTyI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 14:54:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:45302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728556AbgBTTyI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 14:54:08 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD217208E4;
        Thu, 20 Feb 2020 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582228447;
        bh=G7F0PXamV8KjthSBpmnQYzM9wFyKJlEKoCMkaPi/V2A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QBbz2JVlL4gMj+bS1andjj5ao4hXrn6mRCwkQXu+GYp+ytsMzxurmAj1uGfifTfvS
         BIP92Y44BHzLEYC80V2kJn/hgSTB9+wMDxhTJr+PmCsioO0byrKdVWIb8eQmIsjfgw
         XTeymf6neRgd1tabn0V11TyrknFmoCCjnP/e8oYw=
Received: by mail-qk1-f180.google.com with SMTP id o28so4744342qkj.9;
        Thu, 20 Feb 2020 11:54:07 -0800 (PST)
X-Gm-Message-State: APjAAAXkezniAWzeyhGgM17YluTC3Nm9shk20G83yhGRX0ovJLySDXEC
        uSeCrli5ObJX312ozF5P5+LPeCcIx+oC4TZIhQ==
X-Google-Smtp-Source: APXvYqwUpbePX8rcwBZf0o9pMlMFzEH0M7fCorDHPbfwgZVsl3To5oa244R0QJ3sIPjUMWARlW8Y5KyDGO8NwfCeV64=
X-Received: by 2002:a37:5347:: with SMTP id h68mr29237844qkb.393.1582228446784;
 Thu, 20 Feb 2020 11:54:06 -0800 (PST)
MIME-Version: 1.0
References: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com> <20200220060001.25807-1-andreas@kemnade.info>
In-Reply-To: <20200220060001.25807-1-andreas@kemnade.info>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 20 Feb 2020 13:53:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTdpbLfPq_eGUf-w-0s8JMndbMrQ2BsMt+8y+eqQ-kZw@mail.gmail.com>
Message-ID: <CAL_JsqKTdpbLfPq_eGUf-w-0s8JMndbMrQ2BsMt+8y+eqQ-kZw@mail.gmail.com>
Subject: Re: [PATCH RFC] Bindings: nvmem: add bindings for JZ4780 efuse
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 20, 2020 at 12:00 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>
> This patch brings support for the JZ4780 efuse. Currently it only expose
> a read only access to the entire 8K bits efuse memory.
>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> [converted to yaml]
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> I will not update/maintain this, just have the impression that here some
> more work is needed to make somebody comfortable with yaml than stick
> to the usual pointing to documentation and I have not the ingredients
> for doing
> cat  Antihistamines >/dev/brain ;-)
> and I do not want to see the other patches get lost.

Looks about right...

>
>  .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>
> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> new file mode 100644
> index 000000000000..ad56c17b0bd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic JZ EFUSE driver bindings
> +
> +maintainers:
> +  - tbd <tbd@tbd>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ingenic,jz4780-efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    # Handle for the ahb for the efuse.
> +    maxItems: 1
> +
> +  clock-names:
> +   items:
> +     - const:  bus_clk

My prior comment still applies.

Also, for a single clock, you don't really need a name.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clock

'make dt_binding_check' would have pointed the error here for you:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.example.dt.yaml:
efuse@134100d0: 'clock' is a required property

> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    efuse@134100d0 {
> +        compatible = "ingenic,jz4780-efuse";
> +        reg = <0x134100d0 0x2c>;
> +
> +        clocks = <&cgu JZ4780_CLK_AHB2>;
> +        clock-names = "bus_clk";
> +    };
> +
> +...
> --
> 2.20.1
>
