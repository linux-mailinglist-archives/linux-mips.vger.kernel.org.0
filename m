Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD687133A6
	for <lists+linux-mips@lfdr.de>; Sat, 27 May 2023 11:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjE0JXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 May 2023 05:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjE0JXR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 May 2023 05:23:17 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED05AE46;
        Sat, 27 May 2023 02:23:00 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5658875abfaso23969037b3.1;
        Sat, 27 May 2023 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685179380; x=1687771380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuPOou2ChL9QAjpTDeWMH9OMTxYByyxepLnhS7nCInU=;
        b=UypQL/1cTDi0jd5atuzjWwrNbEZHph9c81yu9B026PuuRefA2X7exdJbYS+AOx0nBp
         gAM4/C+tc/QMH5TXhnmPmcu1CzlDW+sm2lJ1uH28kYO/Iahk4SZgNrQB5Kp7NSDEcVtl
         TAIXWUnGNKQEkgubKWG/y2W1PtO0NSljxJeG0GJOdE717jgybvCyZtHUIJrl69fjSsPs
         c/lHsTB2ZHY1ZfwRytky/hcr8KVRp2qlxPOTva3Ow0wHEH1rK4w+J+jRsB75f8REyKCi
         ZDkc5cgIVQr4jW7tzWZEKPTjezlb0HKQII7emo61su46V7bDndt31K4y21jhN7q5jFqp
         l23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685179380; x=1687771380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuPOou2ChL9QAjpTDeWMH9OMTxYByyxepLnhS7nCInU=;
        b=EvO0hm4iRnbn42NhK8/sIJGFa45Ln/OY0aS+ok8DNloS8aamyGIOLs8Yi1qgvHbr0X
         aKwkVlONiP0Oh6XqAD0xT95aCOhRkgXeUmpY4/tAAF2UIJMc8sAaUMRYHNXPd9U1YfmE
         Kag2zxM/KXdOpbkqKB4/XgODL12M53pEZkpHjTB1f5QeSpzQsxZEfasc4RRpa1MquscD
         SGFojdGPZA1lyLG98faUzSabxyBsBr+fnzcQfNtYza+KaZK9EauCzVNd5JJzIHpmy+gx
         aq4psNMcm4vCbKrK+LrVjlqXIvbWBaWmZnsO2rG0rWsKOj9GHPMFM6ILXj30QaecFVXC
         FxdQ==
X-Gm-Message-State: AC+VfDyugCfpWUP3Q5Z9PAX+ZZ4KqvnjBUhf77gEBCWiHHwU7Pm0IVSd
        rvo1XONg4pPCYvg5DgG3IHhfiKFV5gNygSAbkwg=
X-Google-Smtp-Source: ACHHUZ4nCuMzRZKk6dXeDY7dZsT6tQWUJPKOPNYzgMbPZwdT1gG/zS5BtPMCqhQZ/U1B3et1LNOcHl0PMtnNpQgUMl0=
X-Received: by 2002:a0d:eb03:0:b0:565:e48d:32cf with SMTP id
 u3-20020a0deb03000000b00565e48d32cfmr134704ywe.7.1685179380005; Sat, 27 May
 2023 02:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
In-Reply-To: <20230526-dolly-reheat-06c4d5658415@wendy>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Sat, 27 May 2023 17:22:48 +0800
Message-ID: <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Conor Dooley <conor@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
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

On Fri, May 26, 2023 at 8:07=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, May 26, 2023 at 09:37:02AM +0800, Binbin Zhou wrote:
> > On Fri, May 26, 2023 at 1:05=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > > On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:
>
> >> > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - loongson,ls1b-rtc
> > > > +      - loongson,ls1c-rtc
> > > > +      - loongson,ls7a-rtc
> > > > +      - loongson,ls2k0500-rtc
> > > > +      - loongson,ls2k1000-rtc
> > > > +      - loongson,ls2k2000-rtc
> > >
> > > |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> > > |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_c=
onfig },
> > > |+       { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_c=
onfig },
> > > |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rt=
c_config },
> > > |+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D &generi=
c_rtc_config },
> > > |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k10=
00_rtc_config },
> > > |+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D &generi=
c_rtc_config },
> > > |+       { /* sentinel */ }
> > > |+};
> > >
> > > This is a sign to me that your compatibles here are could do with som=
e
> > > fallbacks. Both of the ls1 ones are compatible with each other & ther=
e
> > > are three that are generic.
> > >
> > > I would allow the following:
> > > "loongson,ls1b-rtc"
> > > "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > > "loongson,ls7a-rtc"
> > > "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > > "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> > > "loongson,ls2k1000-rtc"
> > >
> > > And then the driver only needs:
> > > |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> > > |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_c=
onfig },
> > > |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rt=
c_config },
> > > |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k10=
00_rtc_config },
> > > |+       { /* sentinel */ }
> > > |+};
> > >
> > > And ~if~when you add support for more devices in the future that are
> > > compatible with the existing ones no code changes are required.
> >
> > Hi Conor:
> >
> > Thanks for your reply.
> >
> > Yes, this is looking much cleaner. But it can't show every chip that
> > supports that driver.
> >
> > As we know, Loongson is a family of chips:
> > ls1b/ls1c represent the Loongson-1 family of CPU chips;
> > ls7a represents the Loongson LS7A bridge chip;
> > ls2k0500/ls2k1000/ls2k2000 represent the Loongson-2 family of CPU chips=
.
> >
> > Based on my previous conversations with Krzysztof, it seems that
> > soc-based to order compatible is more popular, so I have listed all
> > the chips that support that RTC driver.
>
> Right. You don't actually have to list them all *in the driver* though,
> just in the binding and in the devicetree. I think what you have missed
> is:
> > > I would allow the following:
> > > "loongson,ls1b-rtc"
> > > "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > > "loongson,ls7a-rtc"
> > > "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > > "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> > > "loongson,ls2k1000-rtc"
>
> This is what you would put in the compatible section of a devicetree
> node, using "fallback compatibles". So for a ls1c you put in
> compatible =3D "loongson,ls1c-rtc", "loongson,ls1b-rtc";
> and the kernel first tries to find a driver that supports
> "loongson,ls1c-rtc" but if that fails it tries to find one that supports
> "loongson,ls1b-rtc". This gives you the best of both worlds - you can
> add support easily for new systems (when an ls1d comes out, you don't
> even need to change the driver for it to just work!) and you have a
> soc-specific compatible in case you need to add some workaround for
> hardware errata etc in the future.

Hi Conor:

I seem to understand what you are talking about.
I hadn't delved into "fallback compatibles" before, so thanks for the
detailed explanation.

In fact, I have thought before if there is a good way to do it other
than adding comptable to the driver frequently, and "fallback
compatibles" should be the most suitable.

So in the dt-bindings file, should we just write this:

  compatible:
    oneOf:
      - items:
          - enum:
              - loongson,ls1c-rtc
          - const: loongson,ls1b-rtc
      - items:
          - enum:
              - loongson,ls2k0500-rtc
              - loongson,ls2k2000-rtc
          - const: loongson,ls7a-rtc
      - items:
          - const: loongson,ls2k1000-rtc

Thanks.
Binbin

>
> > > To maintain compatibility with the existing devicetrees, should the o=
ld
> > > "loongson,ls2x-rtc" be kept in the driver?
> >
> > No, It seems that wildcards in compatible are not allowed."
> > loongson,ls2x-rtc" itself was part of this patch series at one time,
> > but apparently it is not the right way to describe these chips.
>
> Right, but it has been merged - you are deleting the driver that supports
> it after all - which means that any dtb with the old compatible will
> stop working.
> I don't disagree with Krzysztof that having wildcard based compatibles
> is bad, but I do not think that regressing rtc support for systems with
> these old devicetrees is the right way to go either.
>
> Thanks,
> Conor.
