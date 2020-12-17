Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9041F2DCDFE
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 10:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgLQI7I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 03:59:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:32996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgLQI7I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Dec 2020 03:59:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608195507;
        bh=89Rrw3aBfmj49VIcsFK0hxM3oXxLCW7ouMh8y82kb8c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jSM8yIJeNXE2vbVBtrhtHPxiIvg3M2ZUY4PpsQ6HWbzbJ57SHE7Su1WHykBMYxJfv
         7Oet2owLzFdWUI7lKwBCNx1Vhm0MmL9Qr9p6QM9EcWH3dZSse/NhX0IKLuPCeFhLp/
         mvXDJARC/IrF++8iS9JIh6MdK/N1yM30FbdQM2hEdXi7HRbTW66pN3dQ7abUhi87a4
         JhrKcevsI++WNiAtoNs7ZnNFtYOZQN+WlIGNRXSMY4P/zHHz4opdahBPzpfcheuR/V
         VdAV3dgvfPJeH9QniPA9YLljEidWSb5XcqQchHh5xFooX9LHZni7L1Aknyp94dXP1J
         w4bk84/dNUniw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201122095556.21597-3-sergio.paracuellos@gmail.com>
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com> <20201122095556.21597-3-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v4 2/6] dt: bindings: add mt7621-clk device tree binding documentation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        evicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        mturquette@baylibre.com
Date:   Thu, 17 Dec 2020 00:58:26 -0800
Message-ID: <160819550615.1580929.14234996916739809712@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2020-11-22 01:55:52)
> Adds device tree binding documentation for clocks in the
> MT7621 SOC.
>=20
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-clk.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt76=
21-clk.yaml
>=20

Rob?

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.=
yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> new file mode 100644
> index 000000000000..6aca4c1a4a46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT7621 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description: |
> +  The MT7621 has a PLL controller from where the cpu clock is provided
> +  as well as derived clocks for the bus and the peripherals. It also
> +  can gate SoC device clocks.
> +
> +  Each clock is assigned an identifier and client nodes use this identif=
ier
> +  to specify the clock which they consume.
> +
> +  All these identifiers could be found in:
> +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> +
> +  The mt7621 clock node should be the child of a syscon node with the
> +  required property:
> +
> +  - compatible: Should be one of the following:
> +                "mediatek,mt7621-sysc", "syscon"
> +
> +  Refer to the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7621-clk
> +
> +  "#clock-cells":
> +    description:
> +      The first cell indicates the clock gate number, see [1] for availa=
ble
> +      clocks.
> +    const: 1
> +
> +  clock-output-names:
> +    maxItems: 8
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clock-output-names

Why is clock-output-names required? Hopefully it is not required.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt7621-clk.h>
> +
> +    sysc: sysc@0 {

syscon@0? I don't think sysc is a standard node name.

> +      compatible =3D "mediatek,mt7621-sysc", "syscon";
> +      reg =3D <0x0 0x100>;
> +
> +      pll {

clock-controller? Why can't the parent device be the clk provider and
have #clock-cells?

> +        compatible =3D "mediatek,mt7621-clk";
> +        #clock-cells =3D <1>;
> +        clock-output-names =3D "xtal", "cpu", "bus",
> +                             "50m", "125m", "150m",
> +                             "250m", "270m";
> +      };
> +    };
