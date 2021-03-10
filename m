Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C3D334509
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 18:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhCJRWe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 12:22:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:48078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233146AbhCJRWI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 12:22:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5E9264FCB;
        Wed, 10 Mar 2021 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615396928;
        bh=SK+6Zfd8qFN5HrEWQ1Qexu/sh62jiznyOdEEtUWkUUY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=giCFhb5jS/L5dNA9p3aqvol1FdK8R28L26bYoL7uSQ9C13PN+eZn4tHjyo6Cisx/i
         XSGnsWchcmB7ndb+aZuvUGjy7i62Yim5gYt+YoCYybjN4aHHcQiEFt27UCivB2RM70
         WFleWF122tfECk2R2pave7DgNclBcUOmeeX0AdyxymGAsI7VnNPuxxGtFjHVSdF7KD
         sVA+mrRzQ7MiY17oHe8ERHLLL8tPYhpzZZ/P2wZ/2E9a1QzDQ+7tzRwia/3IEQ+1qE
         sdAiwxnkxiss6WJMiNzf59KwbSO3RtEM59wioRKswSPo+L1G7meCnNeQVxJOybWN+V
         hNuoUKO3QinAQ==
Received: by mail-qk1-f174.google.com with SMTP id m186so985433qke.12;
        Wed, 10 Mar 2021 09:22:07 -0800 (PST)
X-Gm-Message-State: AOAM53158945bEbV3cIjpDuf9DgxHj/TeQm2zJmfpkPsgbKPBlyYCEGV
        ctCU95GeGbE88fwCPwgYWk9vio5aR6WFwz0w+Q==
X-Google-Smtp-Source: ABdhPJx8ZortjSvtESnDKmJbd7shsjiK7JG0zR24gC3xumihDFvY1IhcQ5GWdem+N4oMsJv19bHuG9wUbdLlpAmjB5g=
X-Received: by 2002:a05:620a:b02:: with SMTP id t2mr3822126qkg.128.1615396927087;
 Wed, 10 Mar 2021 09:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20210223204340.312-1-noltari@gmail.com> <20210224075640.20465-1-noltari@gmail.com>
 <20210224075640.20465-2-noltari@gmail.com> <20210306201404.GB1137882@robh.at.kernel.org>
 <889b9814-40d4-e012-ff7c-39b00f8c623a@gmail.com>
In-Reply-To: <889b9814-40d4-e012-ff7c-39b00f8c623a@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 10 Mar 2021 10:21:56 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJzFJvwTEk3u+g3Fjv_K2Te9F3hyZnEPWurWjxgs2dShg@mail.gmail.com>
Message-ID: <CAL_JsqJzFJvwTEk3u+g3Fjv_K2Te9F3hyZnEPWurWjxgs2dShg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: document
 BCM6345 external interrupt controller
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 7, 2021 at 3:12 AM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
>
> Hi Rob,
>
> El 06/03/2021 a las 21:14, Rob Herring escribi=C3=B3:
> > On Wed, Feb 24, 2021 at 08:56:39AM +0100, =C3=81lvaro Fern=C3=A1ndez Ro=
jas wrote:
> >> Document the binding for the BCM6345 external interrupt controller.
> >>
> >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>   v3: pass dt_binding_check.
> >>   v2: fix title typo.
> >>
> >>   .../brcm,bcm6345-ext-intc.yaml                | 78 +++++++++++++++++=
++
> >>   1 file changed, 78 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/interrupt-contr=
oller/brcm,bcm6345-ext-intc.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/br=
cm,bcm6345-ext-intc.yaml b/Documentation/devicetree/bindings/interrupt-cont=
roller/brcm,bcm6345-ext-intc.yaml
> >> new file mode 100644
> >> index 000000000000..a691510e78b7
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6=
345-ext-intc.yaml
> >> @@ -0,0 +1,78 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm6345-=
ext-intc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Broadcom BCM6345 external interrupt controller
> >> +
> >> +maintainers:
> >> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >> +  - Jonas Gorski <jonas.gorski@gmail.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - brcm,bcm6318-ext-intc
> >> +      - brcm,bcm6345-ext-intc
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 0
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  interrupts:
> >> +    description: Specifies the interrupt line(s) in the interrupt-par=
ent
> >> +      controller node. Valid values depend on the type of parent inte=
rrupt
> >> +      controller.
> >> +    maxItems: 4
> >> +
> >> +  brcm,field-width:
> >> +    description: Interrupt controller field width (the default is 4).
> >
> > default: 4
> >
> >> +    maxItems: 1
> >
> > All uint32's are 1 item.
>
> Ok, so I should remove this :)
>
> >
> > What's the set or range of values?
>
> Only BCM6348 needs to set this value to 5, other BCM63xx use the default
> value of 4 (BCM3368, BCM6318, BCM6328, BCM6338, BCM6345, BCM6358,
> BCM6362, BCM6368, BCM63268).

So:

enum: [ 4, 5 ]
