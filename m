Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05CB5F19A6
	for <lists+linux-mips@lfdr.de>; Sat,  1 Oct 2022 05:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiJADkC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Sep 2022 23:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiJADj7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Sep 2022 23:39:59 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DC7FADF;
        Fri, 30 Sep 2022 20:39:54 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id m11-20020a4aab8b000000b00476743c0743so3469928oon.10;
        Fri, 30 Sep 2022 20:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JbJpSRLe2fy92XnkaEQUWwoKUwgq2j9g9DTkpHFR95I=;
        b=Ler14OgZhf46dsdVaOlD6N4k5g3dCO0RzF0gzjDE7FDwHuvA8M79g8Zas+xDVyoq/p
         ffZc2CTYphQuJMbmjyAGPNaAmLpftKgrQdhEAPydrTfJtSGbU7Gbh+HpIO9gGrLpI+nk
         9iBVjM37IsvKWHsfT9lr2IYQWRWyG7+2K3mPFBQmkMwTjsh6qFSFIQAYfxlRwNqAm/XF
         CKyW7W6kzwMAevQB9ahJqt8pKQy+BWQreDfxJOnjOIydDy8RnYBuBDetgWqIdb9XUYp7
         qK/QFSJg2rXiHXeBvMx/JYBRZi+GWyzyQ1QADzm9zpklhRR/rNE+6XhvTxfpwMqlvaDK
         YLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JbJpSRLe2fy92XnkaEQUWwoKUwgq2j9g9DTkpHFR95I=;
        b=Thamj16W6Rxz+dnNUd2sM67t8IAHMs2nvpS9KvCuHlV13/dCiIOMinblR8oTMU+L0A
         tAR75C4FADrVy54AHWTz5p/3dP8lKZ0S1jPrPKDIP4CVWosvwL2RiU27pchNCYd0NY+b
         c++gFpG4nPT8+BeY09FbR201n3olscwG9cXSIvEjlC6CbOHNk9EsbKoieuaPetId4kix
         YACVKg+oLoYedPhvH6V8JVJaMAdGDIztX1jv5DbMIzxkYS0qp5ldtWRdWMNFueS9hlAh
         mBKdSdMFAPnjMITO6mEF0uDaOyDuJ+aQtNnG5ksS1VX/2XPmHkT/fOmzURQSieXC5BPP
         IbJQ==
X-Gm-Message-State: ACrzQf0cIx9vRXs038arnxuQXzlIjYEM8wWkjYYKut2HjwIpOf8WH/Mq
        KiPGPK/XyRI3N7177ef1R0ud7YLfIIJuYq1yBRk=
X-Google-Smtp-Source: AMsMyM6fXa9AT+YH5eAFfV9AIT42+4+yUGWhdlKQfrGYRT+Sijx1Us9qHLn9Lf1YRgINC6UVdUimUj2D0Q9kPK+/4cI=
X-Received: by 2002:a9d:19ca:0:b0:655:bcdc:f546 with SMTP id
 k68-20020a9d19ca000000b00655bcdcf546mr4771382otk.304.1664595594189; Fri, 30
 Sep 2022 20:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
 <20220929072004.874795-2-sergio.paracuellos@gmail.com> <20220930171637.GA526500-robh@kernel.org>
In-Reply-To: <20220930171637.GA526500-robh@kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 1 Oct 2022 05:39:42 +0200
Message-ID: <CAMhs-H-FbJocYyuyDi_Ki+U+yEHT7GV56hk+Qh+2gbLeWkZ0Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mips: add CPU bindings for MIPS architecture
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On Fri, Sep 30, 2022 at 7:16 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 09:20:02AM +0200, Sergio Paracuellos wrote:
> > Add the yaml binding for available CPUs in MIPS architecture.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../devicetree/bindings/mips/cpus.yaml        | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
> > new file mode 100644
> > index 000000000000..4f8891f0755b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/cpus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MIPS CPUs bindings
> > +
> > +maintainers:
> > +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > +
> > +description: |
> > +  The device tree allows to describe the layout of CPUs in a system through
> > +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> > +  defining properties for every CPU.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bmips3300
> > +      - brcm,bmips4350
> > +      - brcm,bmips4380
> > +      - brcm,bmips5000
> > +      - brcm,bmips5200
>
> Need to remove
> Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt.

This is removed in the BMIPS CPUs related PATCH.

>
> > +      - ingenic,xburst-mxu1.0
> > +      - ingenic,xburst-fpu1.0-mxu1.1
> > +      - ingenic,xburst-fpu2.0-mxu2.0
>
> So we should remove
> Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml?

Oh, I missed that documentation, thanks. I guess I can include that
info in this schema and remove the file? Or maybe just drop this
ingenic compatible from here? I wonder what is the best approach.

>
> > +      - loongson,gs264
> > +      - mips,m14Kc
> > +      - mips,mips4Kc
> > +      - mips,mips4KEc
> > +      - mips,mips24Kc
> > +      - mips,mips24KEc
> > +      - mips,mips74Kc
> > +      - mips,mips1004Kc
> > +      - mti,interaptiv
> > +      - mti,mips24KEc
> > +      - mti,mips14KEc
> > +      - mti,mips14Kc
> > +
> > +  reg:
> > +    maxItems: 1
>
> Does the numbering have some basis in the h/w?

Looking into the current mainlined dts files I ended up with this.
Other than that I don't really know.

>
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: true
>
> Do you need this to be true? What's missing besides 'device_type'?

As I tried to explain in the cover letter of this series, current
'arch/mips/boot/dts' folder dts files are a bit messy
for cpu nodes, so I set additionalProperties to true and only make
them required for 'compatible' in this schema.
Just to avoid surprises.  I guess I can try to set this to false and
add clock and other properties required for some compatibles, if that
is preferred.

> We've got the same issue for Arm cpu schema, so fine for now if there's
> not an easy fix.
>
> Rob

Thanks,
    Sergio Paracuellos
