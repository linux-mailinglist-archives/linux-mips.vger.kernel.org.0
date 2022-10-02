Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60FAF5F2224
	for <lists+linux-mips@lfdr.de>; Sun,  2 Oct 2022 10:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiJBIzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Oct 2022 04:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJBIze (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Oct 2022 04:55:34 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C226F252A3;
        Sun,  2 Oct 2022 01:55:32 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id k11-20020a4ab28b000000b0047659ccfc28so5019761ooo.8;
        Sun, 02 Oct 2022 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8Cp5Q2FDKlt3Bt5D2hx1rj+q2/w4dAs/81TnS2a7Ojg=;
        b=jpUDhH4EzlkSdPI0eSnk3gbGO1b+VxDOl6iqo8kZmYBErLZtqu20NIhwFHONnwoay8
         aFD9Z7UOx5NBXEZEZUwDF9BNXEe4azvKB9YLVqsAZ/5JJB6CMNETGwM3bIxzFJDu9OrZ
         b1b4E+7XY+BTDcwVKgqDDK3QGR8FnxmF31xv36QBemiWBcKZr7gGn4j1mE7PPPorC74u
         fIq0L6o3IL9shlF4s7IOndRNIUf5KTHYc/G9O/YKVDg4jg27ut749/WU9u9d5oP32jKP
         NdCCk+dfHddNTthYTFCH9BWqPxe4dZ/RYPYrwOWWE29Q6USJKHb1Wog/maVuanJqTMgM
         jm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8Cp5Q2FDKlt3Bt5D2hx1rj+q2/w4dAs/81TnS2a7Ojg=;
        b=VMK/WJmFu8HV06Ag9A0WHMrzZh8l6B3Q6IQ+jDEg1sbBhnXWvliGQAPnbarmlm1ZOq
         9rnWFi2Sc+k4WaoBtPVacyzgp2gRjyisjKhRlcv0p/HGUFfEwev1nCkS1lVW9fat3kWK
         4v19U9/+JmFHBssKPhSkWs4HuShDr83JbAqHOknENlTHIYTeTAIyTZHdoCWD1iV7gID5
         BRcU6slVCLAVsmthv7EeLpMiklUUVtcSVn65XIijfjCq1RH2AbluxU3hFdYPojeD3WQ2
         eCqckzpHKPkB16n9ZHo/B8G3iTV6BpZcZCelAjRoFDRRG+oRoaROH0LSUyoxPWhuoXqi
         EWkA==
X-Gm-Message-State: ACrzQf0CXMCX1hBb4O/hHzLAM3fP7s9HCp5EUuoDw6Lb91LuZB4TLQ4x
        too0luFY/IEj2QXM4dLbSQ4GMp5Np5+ySWo7/9QuIluok78qxw==
X-Google-Smtp-Source: AMsMyM5HnehQtTY7Kj6VSHboCxnk9lQPs0MsJO8OC5g0FyYdcSpka7vBDVBkYuM3wn9K3ri9+NKnkXPAc5Yzp3SuEd4=
X-Received: by 2002:a05:6830:150e:b0:655:bc7d:1e5d with SMTP id
 k14-20020a056830150e00b00655bc7d1e5dmr6272254otp.272.1664700932087; Sun, 02
 Oct 2022 01:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221001043855.933528-1-sergio.paracuellos@gmail.com>
 <20221001043855.933528-3-sergio.paracuellos@gmail.com> <ce6c360a-f364-72db-4f44-dea66dc5e744@linaro.org>
 <CAMhs-H_999=LsUcEm6CNw5tai+v_D3xJ50JWycbqq4LZgPN9Zg@mail.gmail.com> <25261abe-ad91-d648-f47e-b9236b35f06f@linaro.org>
In-Reply-To: <25261abe-ad91-d648-f47e-b9236b35f06f@linaro.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 2 Oct 2022 10:55:20 +0200
Message-ID: <CAMhs-H-PTR3QR0bPYjzNv2MnM8OP4hgdaa6Bg7tvGZCW-h1Ttg@mail.gmail.com>
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

On Sun, Oct 2, 2022 at 10:03 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2022 12:35, Sergio Paracuellos wrote:
> >>
> >>> +  compatible:
> >>> +    oneOf:
> >>> +      - description: Boards with Broadcom bcm3368 SoC
> >>> +        items:
> >>> +          - const: brcm,bcm3368
> >>> +
> >>> +      - description: Boards with Broadcom bcm3384 SoC
> >>> +        items:
> >>> +          - const: brcm,bcm3384
> >>
> >> I don't understand what did you want to achieve here. Either you
> >> document SoC or boards. If boards, where are the actual boards? If SoC,
> >> then why calling it boards, why making it oneOf?
> >
> > I agree with description should just say "Broadcom bcm3384 SoC", but I
> > don't understand what is wrong with oneOf here...
>
> If you document SoCs, this should be just an enum because it will take
> 20% of that lines. Much smaller, easier to read.
>
> In the same time (for documenting SoCs) all the descriptions are
> redundant. We know that this is "Broadcom bcm33843 SoC" because
> compatible is "brcm,bcm33843".

I see. Ok. I will convert this into an enum and will drop all the descriptions.

>
> >
> >>
> >>
> >>> +
> >>> +      - description: Boards with Broadcom bcm33843 SoC
> >>> +        items:
> >>> +          - const: brcm,bcm33843
> >>> +
>
> (...)
>
> >
> >>
> >>> +    unevaluatedProperties: false
> >>> +
> >>> +    properties:
> >>> +      mips-hpt-frequency:
> >>> +        description: This is common to all CPUs in the system so it lives
> >>> +         under the "cpus" node.
> >>
> >> You need to describe what is this. Not where it lives. Because where it
> >> lives, we can easily see from the schema.
> >
> > I have just copied this from the previous documented bmips text file. I guess
> > writing the following will be better:
> >
> > properties:
> >       mips-hpt-frequency:
> >         description: MIPS counter high precision timer frequency.
> >          This is common to all CPUs in the system so it lives
> >          under the "cpus" node.
> >         $ref: /schemas/types.yaml#/definitions/uint32
>
> Much better, thanks.

Thanks,
    Sergio Paracuellos
>
>
> Best regards,
> Krzysztof
>
