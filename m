Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71AEA5F1BCC
	for <lists+linux-mips@lfdr.de>; Sat,  1 Oct 2022 12:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiJAKfw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Oct 2022 06:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJAKfs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Oct 2022 06:35:48 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4412CDE0;
        Sat,  1 Oct 2022 03:35:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id n83so7142477oif.11;
        Sat, 01 Oct 2022 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=xPzh0o8T0iLcOtas9xM3qofchjL35BUs8eXqH2tEBwY=;
        b=qUWEvdrgeS/vc/IP7AzDEgc7NC2A4bx/895o8VmrstTcXp4I9fSClFI90tBye6a12X
         16joFI+qTtjZr4hjxGGmDTMNpR9CSCMSiD7bDta6TYUmdrgYgXhDJ3ryRMHilVieCXP4
         XPDU3nVOhsqQnQI+O0Px0xnAPp25iIXE+BLb/Flougm0LqNhljr26lhj0fT04NgDpU34
         3nma/QppUTmhd/qdgSL0TqXph5wxoUONbAc7Ia63haSFtHpp2l9U/9w0PhKkuMiSEYot
         VzfTI5mc3s0IVl+8o7KGY50cylNNdD5LTTb+ki/EcMW5HAH1zyT7Qm0LGgW+Dl0ayAes
         yEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xPzh0o8T0iLcOtas9xM3qofchjL35BUs8eXqH2tEBwY=;
        b=RWSqY9uL0qWFJlc/Gb3YAn6ncsK5o4GxbM+gVQPW1F09/1qAtGCG+APb9BB2h6a6p9
         PfHDWvDq/JSRsDgCWi33MlSYxeb0m2V2ZIOAv6sp9IkM70pIbBSWqSzPMcTP5I4wds6I
         hqE+zCmBbONv+5S3tIN7tLstq5ElrtgCODA+F8yu6ytkqQ9heT26XC7C2pSnWdBwr/2y
         qZXbDaFSNQiJpuQgv9TB6PpZ9h1JnKAYnzGx7Qu824M8SRlQRwswEErcDBNG3mc1d7ST
         sEYixfQBu1yrwc0Mokyo95D+kuuus49Lo5bNWb4askvX+sGaY2xFD6Th0SN2CkUaEhi6
         Pjpw==
X-Gm-Message-State: ACrzQf1eaSP+Jqnl7zyF+89YXQLkV7b+o//OO1+D914Jnhk2Zdjm+skt
        Bufo5JzneHx6F0s9ntQmJ8qRhQB16vP0NiE8TqI=
X-Google-Smtp-Source: AMsMyM6HAxBXgeA0GIVmqq3qDGKTB62EqFEUEAxiu43+QeN/kGmQ+uV01VmNC71e1YRx5EPW4/0+Bm4P54htHtJtXNg=
X-Received: by 2002:a05:6808:23ca:b0:350:92c4:3422 with SMTP id
 bq10-20020a05680823ca00b0035092c43422mr849051oib.144.1664620533185; Sat, 01
 Oct 2022 03:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221001043855.933528-1-sergio.paracuellos@gmail.com>
 <20221001043855.933528-3-sergio.paracuellos@gmail.com> <ce6c360a-f364-72db-4f44-dea66dc5e744@linaro.org>
In-Reply-To: <ce6c360a-f364-72db-4f44-dea66dc5e744@linaro.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 1 Oct 2022 12:35:21 +0200
Message-ID: <CAMhs-H_999=LsUcEm6CNw5tai+v_D3xJ50JWycbqq4LZgPN9Zg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof,

On Sat, Oct 1, 2022 at 11:47 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2022 06:38, Sergio Paracuellos wrote:
> > Convert Broadcom cable/DSL/settop platforms to YAML schema.
>
> Where is the conversion? Conversion is remove+add, but there is no
> removal here.

True, removal is in the other patch since removed doc it is more
related with CPUs.
Will redo this commit message.

>
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../devicetree/bindings/mips/brcm/soc.yaml    | 110 ++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yam=
l
> >
> > diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Doc=
umentation/devicetree/bindings/mips/brcm/soc.yaml
> > new file mode 100644
> > index 000000000000..0ddf1fe51802
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom cable/DSL/settop platforms Device Tree Bindings
>
> Drop "Device Tree Bindings"

Understood.

>
> > +
> > +maintainers:
> > +  - Hauke Mehrtens <hauke@hauke-m.de>
> > +  - Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > +
> > +description: |
> > +    Boards Broadcom cable/DSL/settop SoC shall have the following prop=
erties.
> > +    The experimental -viper variants are for running Linux on the 3384=
's
> > +    BMIPS4355 cable modem CPU instead of the BMIPS5000 application pro=
cessor.
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
>
> Blank line.

Ok.

>
> > +  compatible:
> > +    oneOf:
> > +      - description: Boards with Broadcom bcm3368 SoC
> > +        items:
> > +          - const: brcm,bcm3368
> > +
> > +      - description: Boards with Broadcom bcm3384 SoC
> > +        items:
> > +          - const: brcm,bcm3384
>
> I don't understand what did you want to achieve here. Either you
> document SoC or boards. If boards, where are the actual boards? If SoC,
> then why calling it boards, why making it oneOf?

I agree with description should just say "Broadcom bcm3384 SoC", but I
don't understand what is wrong with oneOf here...

>
>
> > +
> > +      - description: Boards with Broadcom bcm33843 SoC
> > +        items:
> > +          - const: brcm,bcm33843
> > +
> > +      - description: Boards with Broadcom bcm3384-viper SoC
> > +        items:
> > +          - const: brcm,bcm3384-viper
> > +
> > +      - description: Boards with Broadcom bcm33843-viper SoC
> > +        items:
> > +          - const: brcm,bcm33843-viper
> > +
> > +      - description: Boards with Broadcom bcm6328 SoC
> > +        items:
> > +          - const: brcm,bcm6328
> > +
> > +      - description: Boards with Broadcom bcm6358 SoC
> > +        items:
> > +          - const: brcm,bcm6358
> > +
> > +      - description: Boards with Broadcom bcm6362 SoC
> > +        items:
> > +          - const: brcm,bcm6362
> > +
> > +      - description: Boards with Broadcom bcm6368 SoC
> > +        items:
> > +          - const: brcm,bcm6368
> > +
> > +      - description: Boards with Broadcom bcm63168 SoC
> > +        items:
> > +          - const: brcm,bcm63168
> > +
> > +      - description: Boards with Broadcom bcm63268 SoC
> > +        items:
> > +          - const: brcm,bcm63268
> > +
> > +      - description: Boards with Broadcom bcm7125 SoC
> > +        items:
> > +          - const: brcm,bcm7125
> > +
> > +      - description: Boards with Broadcom bcm7346 SoC
> > +        items:
> > +          - const: brcm,bcm7346
> > +
> > +      - description: Boards with Broadcom bcm7358 SoC
> > +        items:
> > +          - const: brcm,bcm7358
> > +
> > +      - description: Boards with Broadcom bcm7360 SoC
> > +        items:
> > +          - const: brcm,bcm7360
> > +
> > +      - description: Boards with Broadcom bcm7362 SoC
> > +        items:
> > +          - const: brcm,bcm7362
> > +
> > +      - description: Boards with Broadcom bcm7420 SoC
> > +        items:
> > +          - const: brcm,bcm7420
> > +
> > +      - description: Boards with Broadcom bcm7425 SoC
> > +        items:
> > +          - const: brcm,bcm7425
> > +
> > +  cpus:
> > +    $ref: "/schemas/mips/cpus.yaml#"
>
> No need for quotes.

Understood.

>
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      mips-hpt-frequency:
> > +        description: This is common to all CPUs in the system so it li=
ves
> > +         under the "cpus" node.
>
> You need to describe what is this. Not where it lives. Because where it
> lives, we can easily see from the schema.

I have just copied this from the previous documented bmips text file. I gue=
ss
writing the following will be better:

properties:
      mips-hpt-frequency:
        description: MIPS counter high precision timer frequency.
         This is common to all CPUs in the system so it lives
         under the "cpus" node.
        $ref: /schemas/types.yaml#/definitions/uint32

>
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +    required:
> > +      - mips-hpt-frequency
> > +
> > +additionalProperties: true
> > +
> > +...
>
> Best regards,
> Krzysztof
>

Thanks,
    Sergio Paracuellos
