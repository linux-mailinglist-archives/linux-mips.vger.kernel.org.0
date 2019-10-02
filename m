Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3B2C8B5E
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 16:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfJBOhB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 10:37:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726951AbfJBOhB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 10:37:01 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 083D321D7B;
        Wed,  2 Oct 2019 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570027020;
        bh=l424NVEzG4ThrC9rmj9+Vglen2NQpsXN1YuwbmNYEIU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=byCCvAQuO7pG4NgtQHjzkNpqMJMc8uN9GoybJZJsfHTo2nmAl3VSY2yXF47ipcDb4
         Nk0fQmLETDXEolz7N8SS7wNiSXiaSfcIA4FWfK2HB+CTfah85Kwqux8g+8kj/d1aJH
         Z9ZD4LTmktO6DTYw1qEANP+Te5+tkMW/IoafqWwo=
Received: by mail-qk1-f177.google.com with SMTP id 4so15194402qki.6;
        Wed, 02 Oct 2019 07:36:59 -0700 (PDT)
X-Gm-Message-State: APjAAAXomx2/D338/z2DmS6coJ0wN3JIFgq+ML8v/7DK62XXOlp1/nfU
        4widuXSSnsApmgJKBnLd1CMKFf3TERThbwoyEA==
X-Google-Smtp-Source: APXvYqyQu5u58Q1H/RMYMjrc+hk8IrR9Ex+cJ5BZ5rEtYCuvFPeYbkLD00dRnvDJbQP0p52zUid51CoENQZ0ZOpbAFU=
X-Received: by 2002:a05:620a:7da:: with SMTP id 26mr3707675qkb.119.1570027019132;
 Wed, 02 Oct 2019 07:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com> <20190704122319.8983-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190704122319.8983-2-martin.blumenstingl@googlemail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 2 Oct 2019 09:36:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ9yUK2HNu9fLes1eEtEKdAZcXqBjGF90xKEuQh9fCU6g@mail.gmail.com>
Message-ID: <CAL_JsqJ9yUK2HNu9fLes1eEtEKdAZcXqBjGF90xKEuQh9fCU6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: add binding for the Lantiq
 VRX200 and ARX300 PCIe PHYs
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
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

On Thu, Jul 4, 2019 at 7:23 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> The IP block contains settings for the PHY and a PLL.
> The PLL mode is configurable through a dedicated #phy-cell in .dts.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 95 +++++++++++++++++++
>  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
>  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
>
> diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> new file mode 100644
> index 000000000000..8a56a8526cef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

This breaks 'make dt_binding_check'. It should be 'reset-names'.

Rob
