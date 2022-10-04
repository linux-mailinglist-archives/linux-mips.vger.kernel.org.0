Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542875F3C54
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 07:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJDFI7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Oct 2022 01:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJDFI6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Oct 2022 01:08:58 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BFE3FA22;
        Mon,  3 Oct 2022 22:08:57 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id c17-20020a4aa4d1000000b0047653e7c5f3so8104005oom.1;
        Mon, 03 Oct 2022 22:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Amgr7AkCdrvKCP1JLZt5RQSAD6C59+8DB4RlYbF0xHI=;
        b=oE8l5ZyR7JUgXtLe/M9OJn6km1DJ71htlfVDM8cs2D1VrfW/9trNRwMeV4UQpfYLj4
         1vpQOty0WacoyB54Fs+FwgP6XFoJi3DOC6gYTLAxgkXxDwwscmisufEJXeoljKGBR6jv
         kKr7BGhBeoHnpmoHuTpNgw2RD8uOCGhAM38VUQWCEWNY5zNqc8Bol5bK4Th/FEZFXO+b
         JBtl3/tWijqywxuFYVdfrLu3JEhxbGnbgvUBWmcicU8IX200rCkRdtg4xbZS3uVe62Li
         cqSIduZtm/R61CO2xpyRCAMT3LYZY8lSXFxZNYLgBqZ+tUw5rPfeFU7cJLo5MTSLVFaG
         px8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Amgr7AkCdrvKCP1JLZt5RQSAD6C59+8DB4RlYbF0xHI=;
        b=TCQGq3/XbDXkXYvGg0S0WBNqZ84tnWyqj50ro3rkadP9MSYpekD6GPy8ZxfSxiHrf/
         i0ZkSdYeg1jQ6hAQuUnv0G1K3c+8nP2J4AVy4xsmyC+GWLcoqkVSsIOs8lLciu1ysdMI
         Wwx13sTcQhy2tq3ODYa//UDfDr3vkItrpDQTid+mOEIkRueLrnJ9VMa0X5hitXl2YQSp
         uRxJ/lW3yvOGCGN/A+xTPWFN989dwOhzu5Olyg1JzI8ERSdWmmexNt7JD24kqloAZ3/k
         Wenp1iajcp6Gid2ahobFb0WnVa2FM6sDnaWetOj0+LBVpCtZ2cBgkD4kd0O69qHm27Lx
         abZA==
X-Gm-Message-State: ACrzQf1o4DzedsLJsci+GrCOvImhozdSJhaHiea8E6VhpVWxfJUNsCR0
        TNuBs55HOhZBQe1trUQI9FpRPli1FShU286EMXQeypeZfxNcoA==
X-Google-Smtp-Source: AMsMyM45iVtxHsaukzdGnKNdsddFKNPgoW0ubaAGsSJL8EtuwZeP6v/sL/RfEX1Dg/lImjuIhnfVCP5xcWamoyXs8aI=
X-Received: by 2002:a05:6830:150e:b0:655:bc7d:1e5d with SMTP id
 k14-20020a056830150e00b00655bc7d1e5dmr9302863otp.272.1664860136922; Mon, 03
 Oct 2022 22:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
 <20221002091611.946210-3-sergio.paracuellos@gmail.com> <dbca5b5f-2fcc-8ef6-6081-e97c6304a7f2@gmail.com>
In-Reply-To: <dbca5b5f-2fcc-8ef6-6081-e97c6304a7f2@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 4 Oct 2022 07:08:45 +0200
Message-ID: <CAMhs-H_1v6Xf0AUxoY6+SKrbgZZ7ui4gbiRyZJni08NDT+ok6Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to schema
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
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

On Tue, Oct 4, 2022 at 12:31 AM Florian Fainelli <f.fainelli@gmail.com> wro=
te:
>
> On 10/2/22 02:16, Sergio Paracuellos wrote:
> > Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >   .../devicetree/bindings/mips/brcm/soc.yaml    | 97 ++++++++++++++++++=
+
> >   1 file changed, 97 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Doc=
umentation/devicetree/bindings/mips/brcm/soc.yaml
> > new file mode 100644
> > index 000000000000..a47a5bcc5e0b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom cable/DSL/settop platforms
> > +
> > +maintainers:
> > +  - Hauke Mehrtens <hauke@hauke-m.de>
> > +  - Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Could you also list myself here, since well, I am still listed in
> MAINTAINERS for BMIPS, and CCing would be nice, too.

I will add you and send v6 and sorry because I missed your name from
get_maintainers script output so I forgot to CC also you.

>
> With that:
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

Best regards,
    Sergio Paracuellos

> --
> Florian
