Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A189E83F
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 14:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfH0MqB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 08:46:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728419AbfH0MqB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 08:46:01 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 218A920828;
        Tue, 27 Aug 2019 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566909960;
        bh=yCqgQ12kHxYxzqTgTCI4OpjJkwqamfkpWEe0FJdQj4A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=odpAnp17cSEWoRRgUiUcoe8nXwCgL2/FZjuJgTyUkgpQbUhEC3zuDaHYaxIAqNyP9
         abWbUomdXnYqZckmdYKPDHNCKikn6IIAK1VrIowZYRZ4kD5ViGzz0e0zMtGBJ9bTfs
         uj73hbgdmL5oOjq4okwGOnAzTD7On4nCInkYvfqo=
Received: by mail-qt1-f169.google.com with SMTP id l9so21086881qtu.6;
        Tue, 27 Aug 2019 05:46:00 -0700 (PDT)
X-Gm-Message-State: APjAAAUAHojesIRbaV3imNiLcgyP+R1tFuJysP47vecmeKZ6uZEdtuLO
        Ao6zoaEs8j9O+i0grvuHDGk3MpEPSZOqceCR9Q==
X-Google-Smtp-Source: APXvYqxMIwkFC6XIiMee0sCToLwzxMHt+U7wnU76fdzIZruEqzXS6CF6ER8UK2SIZrvi1WgadOF9si04HG6inRzCz+Y=
X-Received: by 2002:aed:22b3:: with SMTP id p48mr20398904qtc.136.1566909959310;
 Tue, 27 Aug 2019 05:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20190827085302.5197-12-jiaxun.yang@flygoat.com>
In-Reply-To: <20190827085302.5197-12-jiaxun.yang@flygoat.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Aug 2019 07:45:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
Message-ID: <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
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

On Tue, Aug 27, 2019 at 3:55 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
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
> index 000000000000..410d896a0078
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license for new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

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

Is this definition specific to Loongson CPUs or all MIPS?

I would expect to see a common MIPS CPU schema with these compatibles
listed there.

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
> index 000000000000..181881a9f4a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC based Platforms Device Tree Bindings

MediaTek SoC?

> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
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
