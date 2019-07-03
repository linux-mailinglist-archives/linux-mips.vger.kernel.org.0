Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10E0E5E586
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 15:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGCNaO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jul 2019 09:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfGCNaO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jul 2019 09:30:14 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D20E1218A6;
        Wed,  3 Jul 2019 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562160613;
        bh=cTnWaBSee+lzmHVjDnO8oDfQOivVCKCn+qdIVLNTsGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BqdXSUPSo303eoTU7vVKkQ4GfPqANU4J/QUjenOb4vVv9QGo42NYw5JSZz3ho7ZFO
         aKEaVwlYydckJDB7R675dG1+ZpJBx/+Iea1OQd1f/k67lpSgO75ZbOX6U3aXA+Yoxc
         gp9uhKoupJTIZp8Y2k/rnprqfMEh0HjrmIg9p/is=
Received: by mail-qt1-f174.google.com with SMTP id p15so872874qtl.3;
        Wed, 03 Jul 2019 06:30:12 -0700 (PDT)
X-Gm-Message-State: APjAAAX1qQ2kckLplWnL27COxsi57AWhdgao1WuXSSFeLu/wD3CRqJy3
        4vtWZzRG+z9NcH7C4uZKaTFgN9BvM1o/IFQ7Gg==
X-Google-Smtp-Source: APXvYqxIzyo7Lo/IajElk+Um68Us5zqISzGqoLwLUoKgjLKIwKRbqQpJeeZ+IUrlBWM2FQbSmw0DMax53XREB/jPi84=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr32868030qvc.39.1562160612082;
 Wed, 03 Jul 2019 06:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
 <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
 <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com> <CAFBinCCWzLyhzVcqHR0RY9+cSqDZ3EdJEim8SP4Mr2Q3M=OKTg@mail.gmail.com>
In-Reply-To: <CAFBinCCWzLyhzVcqHR0RY9+cSqDZ3EdJEim8SP4Mr2Q3M=OKTg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 3 Jul 2019 07:30:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4t+M69CJ3Q+Sf9Q10jheDzHsMoNdjPCQ7x5rfGGq6Kw@mail.gmail.com>
Message-ID: <CAL_JsqK4t+M69CJ3Q+Sf9Q10jheDzHsMoNdjPCQ7x5rfGGq6Kw@mail.gmail.com>
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

On Wed, Jul 3, 2019 at 2:58 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Wed, Jul 3, 2019 at 1:34 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Tue, Jul 2, 2019 at 2:35 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> > > The IP block contains settings for the PHY and a PLL.
> > > The PLL mode is configurable through a dedicated #phy-cell in .dts.
> > >
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > >  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 87 +++++++++++++++++++
> > >  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > >  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > > new file mode 100644
> > > index 000000000000..b7b222e772d0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> >
> > The preference is (GPL-2.0 OR BSD-2-Clause) for new bindings.
> to make sure I understand this correctly:
> the license is then only valid for the bindings - is it fine if the
> driver uses GPL-2.0-only?

Yes, as this isn't derived from the driver code nor used by the driver
code (though that would be fine).

BTW, 'GPL-2.0-only' is the newer, preferred form of 'GPL-2.0', so I
guess we should be using (GPL-2.0-only OR BSD-2-Clause).

> I don't have any datasheet for these SoCs so all my knowledge is based
> on the GPL-2.0-only driver from the Lantiq board support package
> (called "UGW").
> the .yaml file is 100% my own work so I'm fine with having GPL-2.0 OR
> BSD-2-Clause
> however, that still has to be compatible with my driver, which I chose
> to be GPL-2.0-only because that's the license from the Lantiq board
> support package
>
>
> Martin
