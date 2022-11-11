Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249A4625F8E
	for <lists+linux-mips@lfdr.de>; Fri, 11 Nov 2022 17:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbiKKQdZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Nov 2022 11:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234128AbiKKQdY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Nov 2022 11:33:24 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B881F6;
        Fri, 11 Nov 2022 08:33:23 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13bd19c3b68so5932028fac.7;
        Fri, 11 Nov 2022 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ya85+MALnZxxxlU7efxTNdWlWdJJAhON0t/Q2tf1OqY=;
        b=ovTig06c+bNI76h/7nFhhE3KO6t0WcKp0IHWRSjFMpN9LjVkVFVECnnHS0xs2QQVal
         ISCbDN0sEzluMU13hybFw26XlXQAAadDzJ57YUUPTKVfzw0BS7R6/Adotq8Wglw+G8gt
         nRLDGlnJtR3ZPmNqV626DsVJhyPAjEsGZDQYqkRsfl4IHABF+9/2e6aFeDHRIznpZZxq
         7IV6vbK2jrEpss7Fw7GM200y7A7iU/J4GTRrHfDC8yyPvEQCdX6QsogdQd763nu0/PeB
         khpmIUIqiTLw5ipSj42Ka6RZoC1oTsAdbjlMxG+2TBW6NeU3bBa6c1VhpXMO9Widl2um
         PvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ya85+MALnZxxxlU7efxTNdWlWdJJAhON0t/Q2tf1OqY=;
        b=Fq3aOUS7RsAQzGL//SdtYsE0Ex9ssctpzDbw4D+rK/NmE0WcdEzPCYQjDe3SjpqWjj
         5z0Pf1HjES7b6CQkdWUOASI6wmbCX1+WAl3ZYgGo0w95g7BgxB/nWutTmIepGKGBe6qo
         Y1yzn+bFU17iEeDshEsKGWK6dDGGgYT27+S43JnNYiMXnYRYmRnx1cyZwZFhruVm6Yuf
         81Zmesmh9Bb8hTlkG8EERfMPjmRL3B3cNuRQnqnzCnhdtwzwIlzx1OY861RRTKxEUV94
         yugmJ5bfjx/fVKle9tzYSDOzwWDzqtCH0f4tq/GIWCJis2BOfNoACsQkmHo27x/hJ3YY
         KbYQ==
X-Gm-Message-State: ANoB5plC8riTBF97DQrI2sAZpIYkP2JZCPl8U0xWilQmJIjDiaJ6KwVk
        mbBBc1neOYrX8VcunepzYvph/coym6NqLuf+dal0zNBCd74=
X-Google-Smtp-Source: AA0mqf7U1uQKokv37nNdXaHHl8Wi6LZzKLce8NetcDk/oKdDqQv69YHJPDqei8bTHmIDgrN/jTo02pHXgfL3ErB8CD8=
X-Received: by 2002:a05:6870:5cce:b0:13a:eee0:b499 with SMTP id
 et14-20020a0568705cce00b0013aeee0b499mr1404325oab.83.1668184402768; Fri, 11
 Nov 2022 08:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
 <20221006042945.1038594-2-sergio.paracuellos@gmail.com> <615c8c6d-3eab-0474-2c2c-6442052c0eee@fungible.com>
 <CAMhs-H8tMP-TyH9dBeO5dGe8spu3h6571-Zeo=_Xshh04x+w1g@mail.gmail.com>
 <20221021084713.GA5976@alpha.franken.de> <CAMhs-H_wEBELsKkpjA1aTTAjywz-LCDvA17AyE5vfzrEpSr-xQ@mail.gmail.com>
In-Reply-To: <CAMhs-H_wEBELsKkpjA1aTTAjywz-LCDvA17AyE5vfzrEpSr-xQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 11 Nov 2022 17:33:11 +0100
Message-ID: <CAMhs-H8HxsfoBXPqk0_GvdP9M37pq3rjKO424xbTq=ATx6+rEg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mips: add CPU bindings for MIPS architecture
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hauke@hauke-m.de,
        zajec5@gmail.com, zhouyanjie@wanyeetech.com,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com,
        f.fainelli@gmail.com, Rob Herring <robh@kernel.org>
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

On Fri, Oct 21, 2022 at 11:05 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Fri, Oct 21, 2022 at 11:02 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Mon, Oct 17, 2022 at 07:53:00AM +0200, Sergio Paracuellos wrote:
> > > On Thu, Oct 6, 2022 at 1:24 PM Philippe Mathieu-Daud=C3=A9
> > > <philmd@fungible.com> wrote:
> > > >
> > > > On 6/10/22 06:29, Sergio Paracuellos wrote:
> > > > > Add the yaml binding for available CPUs in MIPS architecture.
> > > > >
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > ---
> > > > >   .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
> > > > >   .../devicetree/bindings/mips/cpus.yaml        | 115 +++++++++++=
+++++++
> > > > >   .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
> > > > >   3 files changed, 115 insertions(+), 77 deletions(-)
> > > > >   delete mode 100644 Documentation/devicetree/bindings/mips/brcm/=
brcm,bmips.txt
> > > > >   create mode 100644 Documentation/devicetree/bindings/mips/cpus.=
yaml
> > > > >   delete mode 100644 Documentation/devicetree/bindings/mips/ingen=
ic/ingenic,cpu.yaml
> > > >
> > > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@fungible.com>
> > >
> > > Thanks!
> > >
> > > Thomas, are this series going through your tree?
> >
> > I'll take them.
>
> Thanks for letting me know!!

It=E2=80=99s been a while and this series is still not added to the mips tr=
ee=E2=80=A6
Gentle ping :)

Thanks!!

Best regards,
    Sergio Paracuellos

>
> >
> > Thomas.
> >
>
> Best regards,
>     Sergio Paracuellos
>
>
> > --
> > Crap can work. Given enough thrust pigs will fly, but it's not necessar=
ily a
> > good idea.                                                [ RFC1925, 2.=
3 ]
