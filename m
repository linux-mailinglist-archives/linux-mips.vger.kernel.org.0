Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002457155A0
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjE3Glj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 02:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjE3Glh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 02:41:37 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1C492;
        Mon, 29 May 2023 23:41:36 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-bacf7060678so6140757276.0;
        Mon, 29 May 2023 23:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685428896; x=1688020896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksc2a0nJPOl5HteHEt9zVIK3nbbw25L/fRHOoiC8NCA=;
        b=dseSC82+/ugzCB4OXcqx9WNoNB5/2VINEeY9CZMtxWB8oVBHC5MQ9housiTfb+HCXY
         agPX+ocNvQkgFyuK/M4+Zulzae8Rl8GIJXImhngEgNUNKl3ADNFj/+GGPgUfMoHemYzk
         HFokhKcIVFDy0PYTj3H4sCrNAX/ACjf23zd5+5/ODDlokYGfSvQQomfdDw6urO5tVh/+
         FC+0IyzJfrv13AYx0S1bDOltnIcLgGzaPN3nEbyQihxDfiu+anbElh70nydbEKtMJW2/
         ltfssRTNJoigddCCaS44eeNtclWavD/06Mt+iofcXW/aD5KGQ8d8iLVENwNK/Aw9ydWt
         sygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685428896; x=1688020896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksc2a0nJPOl5HteHEt9zVIK3nbbw25L/fRHOoiC8NCA=;
        b=esbpSHQHK1NppTNVkhtN8uV7UbieyM27c2uBfLf4wzHwITe9ZHE5gnvd1H9EKlPfwd
         dlVlqasaywx3lNUn+ccMo0ebfKhq1JOxvx9Tzxp8Tecl3vAfbyjLX1j4RrAaS+44Y9h4
         Aral7xnkZhk1zSEQPVWDt4D9/dnaCGMUSANFEFSHmMTFxV2+ultRcT3ysA0niTs9AMEb
         0UvC6lYD9Qq+yJDdf6CsThZxmdK26O0PS1wBE+Mqw6/WpByUSI+hhu+AmXwIR8T0zqdZ
         /Y5tcxBLIcWiO+GLXPm3F6ChjIS8vwu2aAz+3+JOu07LnhDSOl3kldVV6G0n+cVaRB+a
         zbZg==
X-Gm-Message-State: AC+VfDycWX+heUC0HxFusZ+GoWT5QyGtuiXoOD3+OdJI/+SAm3paw7bq
        Y8Zd7jwOI8qdy7A5v+4Nn6PBZQntMik7YYjwntc=
X-Google-Smtp-Source: ACHHUZ58Z2Jc5+6ob3VrFMHzmODh7gWfq9R9qYHbxX/ht0lSOPdInOYGVmgg3JsdAyijk1MO4zDQ13rgMkc/kh5Gyoo=
X-Received: by 2002:a25:d4b:0:b0:bad:dc4:88fd with SMTP id 72-20020a250d4b000000b00bad0dc488fdmr1599370ybn.8.1685428895763;
 Mon, 29 May 2023 23:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org> <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <2023052922200701b20517@mail.local>
In-Reply-To: <2023052922200701b20517@mail.local>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Tue, 30 May 2023 14:41:24 +0800
Message-ID: <CAMpQs4JSYg0PdeRXypnERf7RXUkAmt=M2RKsv19NqR8nkCDcLQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Conor Dooley <conor@kernel.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 30, 2023 at 6:20=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> Honestly, the list of compatibles is fine for me. I wouldn't go for
> fallback. The improvement would be to drop "loongson,ls1c-rtc",
> and probably "loongson,ls2k0500-rtc" and "loongson,ls2k2000-rtc".
>
> loongson,ls1c-rtc is definitively not needed, the alarm may not be wired
> but the registers are there.

Hi Alexandre:

I am glad to receive your reply.

Yes, we tested and found that ls1c indeed can't trigger alarm
interrupts, but can read and write RTC time normally.
Also, in the latest rtc driver (V4), we measure the alarm function by
the interrupts property.
Therefore, whether the ls1c compatible can be retained?

Thanks.
Binbin

>
> For 2k0500 and 2k2000, I don't mind either way.
>
> On 29/05/2023 16:31:42+0800, Binbin Zhou wrote:
> > Hi Krzysztof:
> >
> > Excuse me.
> > We have different opinions on how to better describe rtc-loongson compa=
tible.
> >
> > Based on my previous communication with you, I think we should list
> > all the Socs in the driver and drop the wildcards.
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
> >
> > And Conor thought it should be rendered using a fallback compatible
> > form based on ".data".
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
> > Also, for example, "ls7a" is a bridge chip, while
> > "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> > integrate them into one item.
> >
> > Which one do you think is more suitable for us?
> >
> > Here is the link to our discussion:
> >
> > https://lore.kernel.org/linux-rtc/E229B204-1B00-4B24-B4BF-15277682FB4B@=
kernel.org/T/#m6c1ae9b74fceafc4042f7598b1bc594e68e5ec76
> >
> > Thanks.
> > Binbin
> >
> >
> > On Mon, May 29, 2023 at 2:24=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > >
> > >
> > > On 29 May 2023 03:59:57 IST, Keguang Zhang <keguang.zhang@gmail.com> =
wrote:
> > > >On Sun, May 28, 2023 at 6:22=E2=80=AFAM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > >>
> > > >> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> > > >> > > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley =
<conor@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> > > >> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
> > > >>
> > > >> > >> My recommendation is leaving compatible string as is.
> > > >> > >
> > > >> > > "as is" meaning "as it is right now in Linus' tree", or "as it=
 is in
> > > >> > > this patch"?
> > > >> >
> > > >> > Ah sorry I meant in this patch.
> > > >> >
> > > >> > Since there won=E2=80=99t be any new ls1x chip that will boot Li=
nux any time soon (due to
> > > >> > Loongson move away from MIPS but LoongArch32 is undefined for no=
w), and
> > > >> > rest compatible strings are wide enough to cover their family, I=
 think the present
> > > >> > compatible strings in this patch describes hardware best.
> > > >>
> > > >> I don't see why new bindings being written for old hardware should=
 somehow
> > > >> be treated differently than new bindings for new hardware.
> > > >
> > > >Let me add that ls1b RTC and ls1c RTC are not exactly the same.
> > > >The former supports RTC interrupt, while the latter does not.
> > > >So my suggestion is to leave the compatible string as it is in this =
patch.
> > >
> > > Just as a reminder, there are more than ls1b & c in the patch, lest w=
e forget.
> > > Also, fallback compatibles mean a compatible subset, not only that tw=
o devices are identical.
> > > The interrupt is passed by the interrupts property.
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
