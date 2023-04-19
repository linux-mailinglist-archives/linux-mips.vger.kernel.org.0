Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC76E73B2
	for <lists+linux-mips@lfdr.de>; Wed, 19 Apr 2023 09:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjDSHMt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Apr 2023 03:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjDSHMs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Apr 2023 03:12:48 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D4640D7;
        Wed, 19 Apr 2023 00:12:47 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-54fbb713301so246459377b3.11;
        Wed, 19 Apr 2023 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681888366; x=1684480366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVeP5cq2EO+OuFnBm8kw67Gm0GIgoI+tGwrWWLx/Nfo=;
        b=XRcAPnyy3uDOLCkbfRI6mRjEFYyzPVN4fbDVZAlQCSshqYISt8vQ4hJ5Y7Y69U1oH7
         fOCwk8iwvWxhbYfJ3QnmesGtSweIm1O5kMxSXd85JPG2n2xciBUBD8tWS1Zewoek1Rg2
         ae4F3biyV+5QHpByh/2RFMNCFmUO8AAv9o+pJeP0Q/bK8zDAbhYQ7T3hFXiC8WJRB6/f
         FSqomCDIoBcadvuHgfpsKTe94r9gArmep+eiicA9TpW/tZEAkJKka3pZ5Vk+UfhBr6Ly
         vYwCYqr7M4468AtrsJI8aWTVM93SatQ3LQ7YWCr1ixKRY6KNu2r1DO/PvMKVboDmTsis
         llwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681888366; x=1684480366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVeP5cq2EO+OuFnBm8kw67Gm0GIgoI+tGwrWWLx/Nfo=;
        b=ZKGocif4sn7Y3FQh+db43eTBDWKvYtfH2Y6TEC5wlz035kviWRDS/agnLUIVirWdxT
         6NWEp/D1xqaZK4TH9hn1UHEimnWg30AGrZI0xN96tEyLxUhQcOvXFlPUk4sw2/pNZdyg
         qrf12rm2TA95+Y63FdZfaFvKPx4cPZJ6WFMr6f/wNQz9MUKd9pHN3Z4azBUXv+BMEdny
         vMEY2tVvbYn30TuSF48qdezP/M83EwpbsGncs6fTM7bdrYbgFTVq9xw9UCpbU6PdXovW
         PnL3Qtq8OOiTaNaEarFBh32XcT893dFZfMAHVt2IzlKJ9BPrdGzftWIzpPqLvKivqx+6
         /4Ug==
X-Gm-Message-State: AAQBX9dPhQ5GZ8onVTvIzMkNyIhQJSy+hkgXnbCONGEwR+d7G88K8I+R
        eFuAHJlNXE8+GuwNsTBIGXKKDl7D8gm8yEkedBY=
X-Google-Smtp-Source: AKy350ZaiH/YXTwaKNsql0vzNT9tYTds/ENyfbs45+TYlcHgZ0DnD6bJDoXycB1ytGAij9IS4gyefD0mfCnaa4QV41I=
X-Received: by 2002:a81:4810:0:b0:54f:b857:7fdc with SMTP id
 v16-20020a814810000000b0054fb8577fdcmr2274661ywa.17.1681888366292; Wed, 19
 Apr 2023 00:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681370153.git.zhoubinbin@loongson.cn> <35f43a8cfc32b5a065e4a04eb6cc6abf311f2700.1681370153.git.zhoubinbin@loongson.cn>
 <b4b23751-a44c-2b38-0d55-a34711ad53c4@linaro.org>
In-Reply-To: <b4b23751-a44c-2b38-0d55-a34711ad53c4@linaro.org>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Wed, 19 Apr 2023 15:12:34 +0800
Message-ID: <CAMpQs4+XBQD9KB3XOPe4zp_vC5RxPaOZU0aJQZKTW=+9r5nmag@mail.gmail.com>
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
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 17, 2023 at 1:31=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/04/2023 09:57, Binbin Zhou wrote:
> > The LS2X RTC alarm depends on the associated registers in a separate
> > power management domain.
> >
> > In order to define the PM domain addresses of the different chips, a
> > more detailed description of compatible is required.
>
> This does not match your diff at all.
>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/D=
ocumentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > index a3603e638c37..2928811b83a0 100644
> > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > @@ -47,8 +47,11 @@ properties:
> >        - isil,isl1218
> >        # Intersil ISL12022 Real-time Clock
> >        - isil,isl12022
> > -      # Loongson-2K Socs/LS7A bridge Real-time Clock
> > -      - loongson,ls2x-rtc
>
> Why removing it?
>
> > +      # Loongson LS7A bridge Real-time Clock
> > +      - loongson,ls7a-rtc
> > +      # Loongson-2K Socs Real-time Clock
> > +      - loongson,ls2k0500-rtc
> > +      - loongson,ls2k1000-rtc
>
> That's even more surprising...
>
> I don't understand what you are doing here at all.
Hi Krzysztof:

Sorry, maybe my description was not accurate.

Looking back at my V2 patchset, the first patch was to add ls2x-rtc compati=
ble.
(https://lore.kernel.org/linux-rtc/0288efeb4209e4a49af07de6399045aaa00a970c=
.1673227292.git.zhoubinbin@loongson.cn/)

In the process of modifying the V2 patchset, it was discovered that
the ACPI domain offset addresses on some of the socs (LS2K1000) were
different and I wanted to differentiate them by soc compatible. So I
was going to drop the ls2x-rtc compatible directly from the V3 patch
set.
However, when I rebased the V3 patchset, I found that the previous
ls2x-rtc compatible patch had been merged (commit 473a8ce756fd). So I
had to remove it and add soc compatible.

How about the following description:
Since commit 473a8ce756fd (dt-bindings: rtc: Add Loongson LS2X RTC
support), the ls2x-rtc compatible has been added. But the specific soc
compatible is needed to be used to define different ACPI domain offset
addresses.

Thanks.
Binbin

>
> Best regards,
> Krzysztof
>
>
