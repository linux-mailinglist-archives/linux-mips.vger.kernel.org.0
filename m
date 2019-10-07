Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DA6CED56
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 22:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbfJGUSn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 16:18:43 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38772 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbfJGUSm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Oct 2019 16:18:42 -0400
Received: by mail-ot1-f67.google.com with SMTP id e11so12150860otl.5;
        Mon, 07 Oct 2019 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fI56kb8XrBq/n2Vd1t2Eq/YF+8w9ByM+OoMJzAVvww=;
        b=junpjngobCXGrOQX8WIZrHiw8oAClJmkJSkc9/ivFMgsoFBhBiiWNVQiugV/6sGcpm
         2fF6UiSQEXDpzV3AWFwQHCQdQAKRFXgDJZepzMBYowxi3v1lHiFpJRVzOvdxsD4o8NDw
         2s+KAq6MJ36q/kEb3++w44Lyon6RdBUMvzJfQFgZ9BPO+2wJJfD7eTAaErvShkwsILVf
         Knhc2skyHAEOVRS0JDfUiqX19zx5XkXLFDGeSs5Jj5vFZt7uZ5A5+f2LooELKkDeplmQ
         YgqYbSAJ6mgVUPJeg0MnTo/mHgTqJ3r9ArejF2Fv5vg3Cf7xTZg0E7RUe7fGqspjMHpA
         xLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fI56kb8XrBq/n2Vd1t2Eq/YF+8w9ByM+OoMJzAVvww=;
        b=poi05zEDjptnooJ0uZswsZEaNnQebApXNgxrJGGBk8Ekjv2asGA/ZalmK0cQaceKym
         Kx/t00BvRdyl/s30/wOZyB1FBBVCBL5MoewfKB5TOrHr9Evd+N6MUt23CoKkhiSz64aq
         7+yGm8K8nlTxKbEls5VmLhEaVGIg6AJgVhEJqoYaf1FETqsu8GS+zpEIcwmWmHnXN4xb
         Ej9Epqg2HVIuK25tuj/pGIGvUBQoeJaRfifzBVVojK7An92/E7Du0x2sn8nkkG7Eluva
         f/eg8Hzl1eYIerD5rsXvaEXMpo9TkXHagrUqpQrHqLUSr5iuRkAG57zBG58k+w3USkKn
         8Vuw==
X-Gm-Message-State: APjAAAU7QcSiOVLU/464Io9Do2V+VeTOrtJoNo8VGdzRCMjNbskIwysj
        6eedWaL9XJyGSROuVSvGS6skecr9caVsWNc1KeUtWtsS
X-Google-Smtp-Source: APXvYqwoxF6wT+cdXqzZvOPYwc7uqh94iwKwWqJomkbznqqdiPli6LGgs912r9xTvoywg9/5BDf6qIb5romw9BdLSOg=
X-Received: by 2002:a9d:6d82:: with SMTP id x2mr21022411otp.42.1570479520637;
 Mon, 07 Oct 2019 13:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
 <20190704122319.8983-2-martin.blumenstingl@googlemail.com> <CAL_JsqJ9yUK2HNu9fLes1eEtEKdAZcXqBjGF90xKEuQh9fCU6g@mail.gmail.com>
In-Reply-To: <CAL_JsqJ9yUK2HNu9fLes1eEtEKdAZcXqBjGF90xKEuQh9fCU6g@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 7 Oct 2019 22:18:29 +0200
Message-ID: <CAFBinCDrEhCANr2V4mmhE62C8WNi=DBfyCh+yZ7jb0bXqUPfUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: add binding for the Lantiq
 VRX200 and ARX300 PCIe PHYs
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Martin Schiller <ms@dev.tdt.de>, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On Wed, Oct 2, 2019 at 4:37 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Jul 4, 2019 at 7:23 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> > The IP block contains settings for the PHY and a PLL.
> > The PLL mode is configurable through a dedicated #phy-cell in .dts.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 95 +++++++++++++++++++
> >  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> >  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
> >
> > diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > new file mode 100644
> > index 000000000000..8a56a8526cef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/lantiq,vrx200-pcie-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lantiq VRX200 and ARX300 PCIe PHY Device Tree Bindings
> > +
> > +maintainers:
> > +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > +
> > +properties:
> > +  "#phy-cells":
> > +    const: 1
> > +    description: selects the PHY mode as defined in <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
> > +
> > +  compatible:
> > +    enum:
> > +      - lantiq,vrx200-pcie-phy
> > +      - lantiq,arx300-pcie-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: PHY module clock
> > +      - description: PDI register clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: phy
> > +      - const: pdi
> > +
> > +  resets:
> > +    items:
> > +      - description: exclusive PHY reset line
> > +      - description: shared reset line between the PCIe PHY and PCIe controller
> > +
> > +  resets-names:
>
> This breaks 'make dt_binding_check'. It should be 'reset-names'.
sorry for the typo

Maxime has already fixed this (thank you!) and the fix has already
landed in 5.4-rc2 with f437ade3296bacaddb6d7882ba0515940f01daf4


Martin
