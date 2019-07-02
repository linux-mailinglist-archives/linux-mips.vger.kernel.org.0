Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E37E5D9C4
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 02:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfGCAxM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jul 2019 20:53:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727025AbfGCAxF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Jul 2019 20:53:05 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCD5D21BF2;
        Tue,  2 Jul 2019 23:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562110455;
        bh=kyo0eoaQ9Ha/fgbOaPGSkh+lU4/GNQGtCW3mk29fTtM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zMKkZ2iUwvFBFFgKCayDWNYa87sLl+Q8jJ0kQOrFNc7kW8nMZkXdEpUslpqFE27Vu
         QuPL5GiJwl9Q5DeAl4/I3YyP6oFv0QIMbDb+v5SalR2BFdZqt23TBcsx8pwxkayO03
         CcA9U3c6C3qoUMw1R7X0HkQqv3wh56/KrByGFtS0=
Received: by mail-qt1-f174.google.com with SMTP id a15so544678qtn.7;
        Tue, 02 Jul 2019 16:34:15 -0700 (PDT)
X-Gm-Message-State: APjAAAV5cmEyKD9pJQi0ZGAXYmTddQYD9SRYXLbnNYhV2O/XknWKi4Ov
        VchDaSGGDSsZBXMP83ZUnYr83UFSN72yU0ERPg==
X-Google-Smtp-Source: APXvYqwMCTfWzt/cQHKnUuZttwa2DgK2f5+/+x0lGfaPAIO+YrwZjCWAUf7qdAt2QRHL6vYe/2+RJeRw3PUodEdU/vM=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr27918576qtc.143.1562110455015;
 Tue, 02 Jul 2019 16:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com> <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 2 Jul 2019 17:34:03 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com>
Message-ID: <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200
 and ARX300 PCIe PHYs
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 2, 2019 at 2:35 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> The IP block contains settings for the PHY and a PLL.
> The PLL mode is configurable through a dedicated #phy-cell in .dts.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 87 +++++++++++++++++++
>  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
>  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
>
> diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> new file mode 100644
> index 000000000000..b7b222e772d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0

The preference is (GPL-2.0 OR BSD-2-Clause) for new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/lantiq,vrx200-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq VRX200 and ARX300 PCIe PHY Device Tree Bindings
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  "#phy-cells":
> +    const: 1
> +    description: selects the PHY mode as defined in <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
> +
> +  compatible:
> +    enum:
> +      - lantiq,vrx200-pcie-phy
> +      - lantiq,arx300-pcie-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PHY module clock
> +      - description: PDI register clock
> +
> +  clock-names:
> +    items:
> +      - const: phy
> +      - const: pdi
> +
> +  resets:
> +    items:
> +      - description: exclusive PHY reset line
> +      - description: shared reset line between the PCIe PHY and PCIe controller
> +
> +  resets-names:
> +    items:
> +      - const: phy
> +      - const: pcie
> +
> +  lantiq,rcu:
> +    maxItems: 1
> +    description: phandle to the RCU syscon

You need to define the type (and drop maxItems):

$ref: /schemas/types.yaml#/definitions/phandle

> +
> +  lantiq,rcu-endian-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: the offset of the endian registers for this PHY instance in the RCU syscon
> +
> +  lantiq,rcu-big-endian-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: the mask to set the PDI (PHY) registers for this PHY instance to big endian
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - lantiq,rcu
> +  - lantiq,rcu-endian-offset
> +  - lantiq,rcu-big-endian-mask
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie0_phy: phy@106800 {
> +        compatible = "lantiq,vrx200-pcie-phy";
> +        reg = <0x106800 0x100>;
> +        lantiq,rcu = <&rcu0>;
> +        lantiq,rcu-endian-offset = <0x4c>;
> +        lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
> +        big-endian;

The example will fail to validate because big-endian is not listed as
a property and you have 'additionalProperties: false'. So you have to
either list big-endian or drop additionalProperties.

Note that the examples are validated against the schema in linux-next now.

Rob
