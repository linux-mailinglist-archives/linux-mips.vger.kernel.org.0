Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE75F6016
	for <lists+linux-mips@lfdr.de>; Thu,  6 Oct 2022 06:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiJFEZm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Oct 2022 00:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJFEZl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Oct 2022 00:25:41 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFD583F37;
        Wed,  5 Oct 2022 21:25:37 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-131dda37dddso1014833fac.0;
        Wed, 05 Oct 2022 21:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=d2JXxAfgBmMctBEbejztHgwm8Eiz0+B139lc18MKTbk=;
        b=MIhq0Xp74Jj4YcwPXTy1xZ8hUmSYCbuHrx3eKjqfMzvKkfnBTCXqKQM440qquMJTJ2
         g2BO7+eOfHbFMXCIcHkjQn5esQhjxMtMbYrxjdoMKEGTEfh36yP+AL4r/4O56jJKyuAt
         A+dD9Z777f5R1l1Ms0tKFPE49V/MxycgnNgGMpjFOpcVZzDddD9bfB8c8zQqoOzdkSJz
         cCMwlCXXCawbvV7b1pT275ow+aZz8flQbq5iH4k8SNSMdsAlBk+CK3My5ZiD1Bkp72kz
         YDmN84ol6R8QWF70qsbYK2legzPFmYFwtJ7iecmi0oLt67ZbkaAer6WRSSX1E5lpJnvL
         xLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d2JXxAfgBmMctBEbejztHgwm8Eiz0+B139lc18MKTbk=;
        b=HUctSUwSx4pzUpGBgDsYvlJOhaAODEDQijsHP5HHEp0RzKyCrbxZfEYXYJ8U8dndya
         b58j8BB8rf+8D089QH+CVMsIP10JL6bKtrPXfZJuMOGdsPNsNinhVaJxgvF+xQaVmALR
         WYldw64eesEOsiUvFBcgjllWMb22qrTmfFwGgiMOPEZji9qeJ1sqMF1NR5d28ohRIcYx
         9wDxoOAdrdqwf6VphziVjT1sysPP7TYD7lcdNYFUj2are021VX2XmBWVvJ2km/FwQl9n
         86Acb38bFb8awZ1huSRN9czufB0chrIz/N2IEASpwmqWYvR4Ofy7p1ZhKMqf2EmarJCk
         tdCw==
X-Gm-Message-State: ACrzQf0d+aObsGs0IoOWHQC0KT5VbMij3RtmZU0v7kN+GtHLm/LdfTCk
        fbO849q7KdWDewQ3mkqk6VtgG9B4WRk689m102o=
X-Google-Smtp-Source: AMsMyM79DNAm/qKGdU8sD7OKScSxWKmi72A2wempPKReOekGoafHZgg6OwBS/0gJarbU7raSu3UNRzO1H2a9+V6aGoA=
X-Received: by 2002:a05:6871:89:b0:131:6362:e26f with SMTP id
 u9-20020a056871008900b001316362e26fmr1529388oaa.144.1665030336932; Wed, 05
 Oct 2022 21:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
 <20221004050924.986211-3-sergio.paracuellos@gmail.com> <d73089a7-f7ad-2f45-8307-3c4ec20cbb79@gmail.com>
 <CAMhs-H8531j+1b_rjZnbymfkhUjGUwg94QFFsHkcPAo8pzmkeQ@mail.gmail.com> <e9bf3c1a-1a18-c62a-0059-f57a29eeeb06@hauke-m.de>
In-Reply-To: <e9bf3c1a-1a18-c62a-0059-f57a29eeeb06@hauke-m.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 6 Oct 2022 06:25:24 +0200
Message-ID: <CAMhs-H_KTDdhnZfncAR00K2bYYv=EsPQsUAqcbMsmymyyrVhdQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mips: brcm: add Broadcom SoCs bindings
To:     Hauke Mehrtens <hauke@hauke-m.de>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 5, 2022 at 10:32 PM Hauke Mehrtens <hauke@hauke-m.de> wrote:
>
> On 10/4/22 07:20, Sergio Paracuellos wrote:
> > On Tue, Oct 4, 2022 at 7:14 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.co=
m> wrote:
> >>
> >> On 4.10.2022 07:09, Sergio Paracuellos wrote:
> >>> Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
> >>>
> >>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>> ---
> >>>    .../devicetree/bindings/mips/brcm/soc.yaml    | 98 +++++++++++++++=
++++
> >>>    1 file changed, 98 insertions(+)
> >>>    create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc=
.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/D=
ocumentation/devicetree/bindings/mips/brcm/soc.yaml
> >>> new file mode 100644
> >>> index 000000000000..39b4609cd1cc
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> >>> @@ -0,0 +1,98 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Broadcom cable/DSL/settop platforms
> >>> +
> >>> +maintainers:
> >>> +  - Hauke Mehrtens <hauke@hauke-m.de>
> >>> +  - Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >>> +  - Florian Fainelli <f.fainelli@gmail.com>
> >>
> >> The only MIPS SoCs I really worked on were BCM47xx. I didn't do any re=
al
> >> work on cable/DSL/STB.
> >>
> >> I don't really feel up to like maintaining those SoCs.
> >
> > I can remove you from maintainers in this new file. I added you
> > because of this entry in MAINTAINERS file:
> >
> > BROADCOM BCM47XX MIPS ARCHITECTURE
> > M:  Hauke Mehrtens <hauke@hauke-m.de>
> > M:  Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > L:  linux-mips@vger.kernel.org
> > S:  Maintained
> > F:  Documentation/devicetree/bindings/mips/brcm/
> > F:  arch/mips/bcm47xx/*
> > F:  arch/mips/include/asm/mach-bcm47xx/*
> >
> > Since 'Documentation/devicetree/bindings/mips/brcm/' is supposed to be
> > maintained also by you I thought it makes sense to list you also here.
> >
> > I don't know, maybe you should remove yourself also from the
> > MAINTAINERS file for BROADCOM BCM47XX MIPS ARCHITECTURE???
> >
> > Let me know what you want me to do.
> >
> > Thanks,
> >      Sergio Paracuellos
>
> Hi,
>
> Please remove me also from the maintainers of this Broadcom CPU like you
> removed Rafa=C5=82. The BCM47XX SoCs mostly use standard MIPS cores and o=
nly
> very few use Broadcom MIPS cores. The Broadcom MIPS cores are much more
> often used in the BCM63XX SoCs.

Sure. Will do and send v8.

Thanks.
    Sergio Paracuellos
>
> Hauke
>
