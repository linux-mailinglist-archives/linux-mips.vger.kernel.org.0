Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 990D56E767D
	for <lists+linux-mips@lfdr.de>; Wed, 19 Apr 2023 11:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbjDSJjB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Apr 2023 05:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjDSJjA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Apr 2023 05:39:00 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A91B4;
        Wed, 19 Apr 2023 02:38:59 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54fbee98814so244042567b3.8;
        Wed, 19 Apr 2023 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681897138; x=1684489138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRHcjArQaNr6nNzWwoStBzQEW/Ojj9XJqinqP7AUllA=;
        b=sMDTeUZJ2K7fC4FgthyKO7A+JpxYJjkilgpcCdJ2zcAWwD8qmbUK3RlcoawKSDKbPk
         dMZRFJGBabT2dqYifM/mbk2SbUGWTP/Ik5z7zZ8k8UIMMoF85ISqNOjIY+447ymZZ7Co
         aKq/LCl3RNIjfMsvZq0GbSZWsXKCLOkbULa3dokT6lq13E1+7BOUQ3EG7PwG3BTFvXsv
         1Ecug5pLDMXfj7KQWdFv+2SHro6ri/fOEOaDOK7FPQhL4D3L/WOwNodHL9FSHRuU2UWi
         TIVcoty/gKa5MVSECC/GO9EcbOFZUDCr46BTALAtR0EthF37Ls4Ojh/Dr89K5fi1YoPS
         KFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681897138; x=1684489138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRHcjArQaNr6nNzWwoStBzQEW/Ojj9XJqinqP7AUllA=;
        b=DgS0gw2+Jo0IKHRw7Fu4xrEVDEJd8t4iKrp8c3ZKkuDcpgM/Vv+PzGVD1TLjmbQgvS
         OGgX69Dw64iYkIKQXtn0nB0KHZlkabkG88NGf0xtN4ghKS6wrZJhIAAavlLtQBoY85u/
         mhft6ZWaoi7Xr13yNsixcDqocc83AhO0aWVgecX+7k0JHibxBAjETv3XfhzXLVsQltl5
         kp7VOh/M+GHYm2YRB0aMSHOOurtOGXYwu0yI5444y+HrKxgsQCtiYJCM+lgkF7sVjRw2
         WjMBMtLLQe6ogw3FbVFw2HXM7gazwrRqoW1hY0lCYpU8CdEVbl/FdxBX4bkkenZ2+F0c
         i5GQ==
X-Gm-Message-State: AAQBX9cnDf46pkcbs4QTwXLwO19E7bn1FzJyxa9BAthovhqgxlpOorJq
        8W1EL+KciH4zGBEq6Z3RTev/j/e2JnkUpdXbNfw=
X-Google-Smtp-Source: AKy350Ylx9KmB1gHOHjRlU3RnR/lCkV6QxNTGy5VlOsWgBa7IZ11v8LZfMSjQ3ftSwL9SIUcHjpCEsd9nZN/huxcNqU=
X-Received: by 2002:a0d:cc0b:0:b0:552:c30d:2243 with SMTP id
 o11-20020a0dcc0b000000b00552c30d2243mr1639675ywd.11.1681897138171; Wed, 19
 Apr 2023 02:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681370153.git.zhoubinbin@loongson.cn> <35f43a8cfc32b5a065e4a04eb6cc6abf311f2700.1681370153.git.zhoubinbin@loongson.cn>
 <b4b23751-a44c-2b38-0d55-a34711ad53c4@linaro.org> <CAMpQs4+XBQD9KB3XOPe4zp_vC5RxPaOZU0aJQZKTW=+9r5nmag@mail.gmail.com>
 <05ebf834-2220-d1e6-e07a-529b8f9cb100@linaro.org>
In-Reply-To: <05ebf834-2220-d1e6-e07a-529b8f9cb100@linaro.org>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Wed, 19 Apr 2023 17:38:45 +0800
Message-ID: <CAMpQs4+oMZ=BA2O0L8mgBKatyWK5WJsOsrGKua0h2kGHax4JFg@mail.gmail.com>
Subject: Re: [PATCH V3 1/7] dt-bindings: rtc: Subdivision of LS2X RTC compatible
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        keguang.zhang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 19, 2023 at 4:52=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/04/2023 09:12, Binbin Zhou wrote:
> > On Mon, Apr 17, 2023 at 1:31=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 13/04/2023 09:57, Binbin Zhou wrote:
> >>> The LS2X RTC alarm depends on the associated registers in a separate
> >>> power management domain.
> >>>
> >>> In order to define the PM domain addresses of the different chips, a
> >>> more detailed description of compatible is required.
> >>
> >> This does not match your diff at all.
> >>
> >>>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 7 +++++--
> >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b=
/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> >>> index a3603e638c37..2928811b83a0 100644
> >>> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> >>> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> >>> @@ -47,8 +47,11 @@ properties:
> >>>        - isil,isl1218
> >>>        # Intersil ISL12022 Real-time Clock
> >>>        - isil,isl12022
> >>> -      # Loongson-2K Socs/LS7A bridge Real-time Clock
> >>> -      - loongson,ls2x-rtc
> >>
> >> Why removing it?
> >>
> >>> +      # Loongson LS7A bridge Real-time Clock
> >>> +      - loongson,ls7a-rtc
> >>> +      # Loongson-2K Socs Real-time Clock
> >>> +      - loongson,ls2k0500-rtc
> >>> +      - loongson,ls2k1000-rtc
> >>
> >> That's even more surprising...
> >>
> >> I don't understand what you are doing here at all.
> > Hi Krzysztof:
> >
> > Sorry, maybe my description was not accurate.
> >
> > Looking back at my V2 patchset, the first patch was to add ls2x-rtc com=
patible.
> > (https://lore.kernel.org/linux-rtc/0288efeb4209e4a49af07de6399045aaa00a=
970c.1673227292.git.zhoubinbin@loongson.cn/)
> >
> > In the process of modifying the V2 patchset, it was discovered that
> > the ACPI domain offset addresses on some of the socs (LS2K1000) were
> > different and I wanted to differentiate them by soc compatible. So I
> > was going to drop the ls2x-rtc compatible directly from the V3 patch
> > set.
> > However, when I rebased the V3 patchset, I found that the previous
> > ls2x-rtc compatible patch had been merged (commit 473a8ce756fd). So I
> > had to remove it and add soc compatible.
>
> Can all folks in Loongson stop adding wildcards as compatibles? Several
> compatibles were acked, because we do not know what 'x' stands for. Now,
> it turns out it's a wildcard which is not allowed.
>
> https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree=
/bindings/writing-bindings.rst#L42
>
> >
> > How about the following description:
> > Since commit 473a8ce756fd (dt-bindings: rtc: Add Loongson LS2X RTC
> > support), the ls2x-rtc compatible has been added. But the specific soc
> > compatible is needed to be used to define different ACPI domain offset
> > addresses.
> >
> It's better. Anyway, SoC parts are rarely trivial devices, so this
> should be probably moved to its own schema.

OK, I'll move these from rivial-rtc.yaml to a separate schema file.


Thanks.
Binbin

>
> Best regards,
> Krzysztof
>
