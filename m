Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D607771464C
	for <lists+linux-mips@lfdr.de>; Mon, 29 May 2023 10:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjE2Ib6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 May 2023 04:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjE2Ib5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 May 2023 04:31:57 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1310FA4;
        Mon, 29 May 2023 01:31:56 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bad041bf313so4540560276.0;
        Mon, 29 May 2023 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685349115; x=1687941115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FxycY0EuudHbJCyhRTGcH7IuXekFEZEWmV5CsytKFQ=;
        b=VXpntmCbpolloNLKD8Bi6Ar6EI5uCPaS3KLfIfhu8+wzZpr1SvKjAPZbbpTPiY1oCK
         ylOEr8yeh6pzQRkcLveTW9zTCRwE2mNDVu5uMNKBGptrU9XrHhr1weYnDsucM7H/6IRr
         +awpjTusACIN06pXTaIDOB7Z18ov+VZUqvBMN5egkM1tlEmELGtrpGQAEWToFRiGfV7U
         thqm6VPItIq0PAvkneeR9oHr4NO0n0jN4ewHRK+zCIOBOXxQFItcQQ0VIbbINg1cJgfr
         RFwXnpPpJfBEYwCKPlVrQkTWBhdubgEsqcRt8yMNeb+FGS2auHbVmTJ+lhOrgTLrRmkj
         PwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685349115; x=1687941115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FxycY0EuudHbJCyhRTGcH7IuXekFEZEWmV5CsytKFQ=;
        b=CVxnaF6Fr/ZNrlzpPupddYUaHNudVLkA1f3A6dW2RQY+m3qY2c5YPN6EAmxV+7chV2
         j2YusZIR7EQgcMxQhNcqcUuhKwQfgk5S1yibppN6J4BezGfXzyUeruM+tlmJDGNVaIDn
         0TOMmNhNn8arxv+oKYBSEWEQ260hxTuu//Ab3vRXaWOJeebTw7TnuCppxExEXM3OHOn5
         Gaocb5/gQ+EeH0Uc8l//4v47d/FvAnjLJkOaoBMgX/c0zIzcTtdoEr8603T0niJMJpk5
         zt5wGruaLmT4lhYkeiuq8swT6uHk6xlPwBQorpzLJzFV94A2NoEmrOpBcF50a2Z1hnQZ
         E8Mw==
X-Gm-Message-State: AC+VfDybnfWRq9HH1vnL56m0rKJuiIEYVBZaSKpAmJGyyFAyCDQa4g4d
        7l5NE/znyP/8thDsy/fqgnYcyYEeSPIQ5ZI58Po=
X-Google-Smtp-Source: ACHHUZ6XUPf4mVUXBHGr8+dvKgOO1fTdQ2NGSgiKVZmkPRy+K60/QlBBts3Tt1FatGAJvNciWpjDnPxQC+3PfleVDuI=
X-Received: by 2002:a25:3607:0:b0:ba7:5005:dc46 with SMTP id
 d7-20020a253607000000b00ba75005dc46mr10014963yba.33.1685349115110; Mon, 29
 May 2023 01:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com> <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
In-Reply-To: <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Mon, 29 May 2023 16:31:42 +0800
Message-ID: <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Conor Dooley <conor@kernel.org>
Cc:     Keguang Zhang <keguang.zhang@gmail.com>,
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

Hi Krzysztof:

Excuse me.
We have different opinions on how to better describe rtc-loongson compatibl=
e.

Based on my previous communication with you, I think we should list
all the Socs in the driver and drop the wildcards.
This should be clearer and more straightforward:

        { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config
}, //ls1b soc
        { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_config
}, //ls1c soc
        { .compatible =3D "loongson,ls7a-rtc", .data =3D
&generic_rtc_config }, //ls7a bridge chip
        { .compatible =3D "loongson,ls2k0500-rtc", .data =3D
&generic_rtc_config }, // ls2k0500 soc
        { .compatible =3D "loongson,ls2k2000-rtc", .data =3D
&generic_rtc_config }, // ls2k2000 soc
        { .compatible =3D "loongson,ls2k1000-rtc", .data =3D
&ls2k1000_rtc_config }, // ls2k1000 soc

And Conor thought it should be rendered using a fallback compatible
form based on ".data".

        "loongson,ls1b-rtc"
        "loongson,ls1c-rtc", "loongson,ls1b-rtc"
        "loongson,ls7a-rtc"
        "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
        "longson,ls2k2000-rtc", "longson,ls7a-rtc"
        "loonson,ls2k1000-rtc"

        { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config }
        { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_confi=
g }
        { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rtc_=
config }

In this form,  I think it might not be possible to show very
graphically which chips are using the driver.
Also, for example, "ls7a" is a bridge chip, while
"ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
integrate them into one item.

Which one do you think is more suitable for us?

Here is the link to our discussion:

https://lore.kernel.org/linux-rtc/E229B204-1B00-4B24-B4BF-15277682FB4B@kern=
el.org/T/#m6c1ae9b74fceafc4042f7598b1bc594e68e5ec76

Thanks.
Binbin


On Mon, May 29, 2023 at 2:24=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
>
>
> On 29 May 2023 03:59:57 IST, Keguang Zhang <keguang.zhang@gmail.com> wrot=
e:
> >On Sun, May 28, 2023 at 6:22=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >>
> >> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> >> > > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley <con=
or@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
> >>
> >> > >> My recommendation is leaving compatible string as is.
> >> > >
> >> > > "as is" meaning "as it is right now in Linus' tree", or "as it is =
in
> >> > > this patch"?
> >> >
> >> > Ah sorry I meant in this patch.
> >> >
> >> > Since there won=E2=80=99t be any new ls1x chip that will boot Linux =
any time soon (due to
> >> > Loongson move away from MIPS but LoongArch32 is undefined for now), =
and
> >> > rest compatible strings are wide enough to cover their family, I thi=
nk the present
> >> > compatible strings in this patch describes hardware best.
> >>
> >> I don't see why new bindings being written for old hardware should som=
ehow
> >> be treated differently than new bindings for new hardware.
> >
> >Let me add that ls1b RTC and ls1c RTC are not exactly the same.
> >The former supports RTC interrupt, while the latter does not.
> >So my suggestion is to leave the compatible string as it is in this patc=
h.
>
> Just as a reminder, there are more than ls1b & c in the patch, lest we fo=
rget.
> Also, fallback compatibles mean a compatible subset, not only that two de=
vices are identical.
> The interrupt is passed by the interrupts property.
>
