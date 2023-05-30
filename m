Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C025D715D69
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 13:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjE3LkF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 07:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjE3LkE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 07:40:04 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B53C5;
        Tue, 30 May 2023 04:40:03 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9daef8681fso3358245276.1;
        Tue, 30 May 2023 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685446802; x=1688038802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl5TicixGzRQ0Rq0fw3FNPOG1mfIhS0y+dbkDNMEbHI=;
        b=brYtG3pmzpjYxd0Gspn+o+J/iBHmc4MVzR7HSexEtLmYmHpWz1GUbxDnAePchkkuDT
         1X1eWz/LvDJ3VPoUwppx5yQIj5reIhouxsv5CIrwspQUd1p7DEzGuKnZLRrqSfA/Ut6v
         +DEsWTkChutc2HZT/Jo4WQhhys9SqMj5zujqLXp5XUJSgMc4yeFVcg1u+g9UfVxetwMj
         AT+wofkSXoUraY/WlFJOq8mLWycHCH+GR1fW+mysT8oBxYlrMXnOcdPbexFnJi4kBFC/
         rdvOS4sJoBZ2An8avCaTGirU9DJ2JDz9H6OCeanbmygSBFWqI1iFd9zIjqkRNXRvMsq6
         icHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446802; x=1688038802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pl5TicixGzRQ0Rq0fw3FNPOG1mfIhS0y+dbkDNMEbHI=;
        b=MwXqG9oqi1QPezU8pNf8B5UVP5YToh+cx6WTSMllKHXoufez5u1ClWljLBfzLlm65v
         HU3GLyGpsOG9+HbyEXTryuRdkuzUMO+e/V26+8IcaeNpJVefiR8il6bm9Iqcs8VI6/jc
         ne4GMtremsv/JoL0o5NZ+iAUs9PTU6zIT262SrkHar8LpNlEv2dwCXGrVscYAykod0gy
         MD7IT0V4Q73Xg12nFuDuL3MmiUd52RX1VbFvdIASYKXHn2KSBqy8gZnKqCdSK6ASu4Zj
         R7NAh10s9L4C6FJSCKN86wFJdLwPuDQedYs7X1N+DyLZXnGK43j3C5uKg5k/XI4lE1zr
         DTTg==
X-Gm-Message-State: AC+VfDwF+lD9UFEUPeejNerSFgWndht86Wg5iWFE27L+i/zGvcelxfff
        l8XsQeLkITbzvHRmsFHtwxmCryVF001a+EQ605Q=
X-Google-Smtp-Source: ACHHUZ5HLiNtBoCLtNDdf4gENt8MpYtx6f5wliUYDAFOEj+EumK9qpKm+caObyiJwcoOzICOaaSjesoNWnDLtA2vx+g=
X-Received: by 2002:a0d:d4cd:0:b0:564:c4db:633a with SMTP id
 w196-20020a0dd4cd000000b00564c4db633amr2212623ywd.15.1685446802410; Tue, 30
 May 2023 04:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org> <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
In-Reply-To: <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Tue, 30 May 2023 19:39:50 +0800
Message-ID: <CAMpQs4JLp3iUh6LkN6SND8O8wRZZcM04Shcq4rUa5QEOUAVsGg@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Conor Dooley <conor@kernel.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Conor Dooley <conor.dooley@microchip.com>,
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
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
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

On Tue, May 30, 2023 at 4:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/05/2023 10:31, Binbin Zhou wrote:
> > Hi Krzysztof:
> >
> > Excuse me.
> > We have different opinions on how to better describe rtc-loongson compa=
tible.
> >
> > Based on my previous communication with you, I think we should list
> > all the Socs in the driver and drop the wildcards.
>
> Suggestion was about the bindings. Not in the driver. I never said to
> list all compatibles in the driver...
>
> > This should be clearer and more straightforward:
> >
> >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_conf=
ig
> > }, //ls1b soc
> >         { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_conf=
ig
> > }, //ls1c soc
> >         { .compatible =3D "loongson,ls7a-rtc", .data =3D
> > &generic_rtc_config }, //ls7a bridge chip
> >         { .compatible =3D "loongson,ls2k0500-rtc", .data =3D
> > &generic_rtc_config }, // ls2k0500 soc
> >         { .compatible =3D "loongson,ls2k2000-rtc", .data =3D
> > &generic_rtc_config }, // ls2k2000 soc
> >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D
> > &ls2k1000_rtc_config }, // ls2k1000 soc
>
> I would suggest to use fallbacks as suggested by Conor at least for some
> of them. You referred to my previous comments about wildcards.
> Wildcard !=3D fallback.
>
> >
> > And Conor thought it should be rendered using a fallback compatible
> > form based on ".data".
>
> Based on common (compatible) programming model unless you already have
> clear hardware differences making them incompatible.
>
> >
> >         "loongson,ls1b-rtc"
> >         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> >         "loongson,ls7a-rtc"
> >         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> >         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
> >         "loonson,ls2k1000-rtc"
> >
> >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_conf=
ig }
> >         { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_c=
onfig }
> >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_=
rtc_config }
> >
> > In this form,  I think it might not be possible to show very
> > graphically which chips are using the driver.
>
> ??? How is it impossible? For all other SoCs and architectures it is
> possible, so what is special for Loongson?
>
> > Also, for example, "ls7a" is a bridge chip, while
> > "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> > integrate them into one item.
>
> Why it is inappropriate? I don't see the issue here... what is a
> "bridge" chip? Isn't this also an SoC?
>
Hi Krzysztof:

LS7A bridge chip can be considered as a combination of South and North
bridge. Generally, it will be connected to the Loongson-3 series CPUs.
LS2K500/LS2K1000/LS2K2000 refers to the LS2K series embedded CPU chip.

Therefore, from the understanding of the driver code, I don't think it
is appropriate to fallback them together. Please pardon me if this
view does not apply to dt-binding.

If fallback is necessary, can we have this:

Let ls7a remain a separate item.

"loongson,ls1b-rtc"
"loongson,ls1c-rtc", "loongson,ls1b-rtc"
"loongson,ls7a-rtc"
"loongson,ls2k0500-rtc"
"loongson,ls2k2000-rtc", "loongson,ls2k0500-rtc"
"loongson,ls2k1000-rtc"

{ .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config }
{ .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_config }
{ .compatible =3D "loongson,ls2k0500-rtc", .data =3D &generic_rtc_config }
{ .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rtc_config }

Thanks.
Binbin

>
> >
> > Which one do you think is more suitable for us?
>
> Use fallbacks for some. You pointed difference in alarm for ls1x, right?
> If so, then they can stay separate.
>
> ls2k500 and ls2k2000 seem compatible with each other so should use fallba=
ck.
>
> Best regards,
> Krzysztof
>
