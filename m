Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394224DB60F
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 17:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357507AbiCPQX1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 12:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357494AbiCPQW4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 12:22:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7A132ECB
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 09:21:42 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bi12so5327369ejb.3
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K7qn/p31SlQZpMhAuZuenCBZnwco1l7Jxgh/miVWBgs=;
        b=RIIAtmlJvmZkxp9v1k9NlwGc87mH+Pm0gZ3GxqAgpfiGJpiUGPvD7/Rh/tYBmk1OkQ
         dDwrhFF9CDWs4CZZLEzYCWB5aqNlmmmHITPbKf/xzt96YcbhkcL9dbpCqNhFvXXrEnJG
         gSYD2snqxowl2rA+M50lXPL0+mgF2IlKSaQ+YjYYHB8geTPVan1D15bQzZJpnSmG3gzj
         FA8VIrBbewf8ark4sqgjr8x9ALcbbuQwA9umz5h/r/42klqpwpUP2F4BLVdfxCLnL9vA
         hddVZAqTK66h1UJijd80W3hvT+nh4HDjnxqQ3n7GcHVKXhRTcQy7JTVsdFPyC7u/QpgP
         v+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K7qn/p31SlQZpMhAuZuenCBZnwco1l7Jxgh/miVWBgs=;
        b=UffhyRT+pCa8iLxgt9dPkHuMto5501HQOSn4kUzGR6Xweg6U2Dflguw1QWJQMxQaqw
         sH9eAg7Ry9yBVb2ZERstTbG8IMYO+xb1tVZhZ+RKvIK6RDUn/Cq/NAS5b80ze6I/K9X0
         naJTAp+kh1SEq5WL2sBKLTFSHZXWYVTJdJGfqB6jiVZdzTK5g1PHV1TY5U79H9dyt9Ns
         OWSY5+OsCWvQORKb4XZ6uqKxZBF3EamW7ozbAqWbbFRh025/41INA8ByFdyrekiiqvfI
         uzRS4orwA3p/drvgPnyVFaiUczeI4yVoyt7Np1G5+jbSn99aSapqaqpRTcp/v79tzXhY
         WWEw==
X-Gm-Message-State: AOAM533XNdiXxikRzQngfxmuk2H14gMUj/eKj+kN/eqXYqxW3mjluPEE
        yFO7jgcl5+G6cScOhCk3FbvcqFBvpXVvfCw23wt4/oaBYZs=
X-Google-Smtp-Source: ABdhPJyNkEyFShMFSAun4NytH/xuNnJKLfiWplLXhj23NUqvP4ALdZ9lI7aMFDYy2z5wgtUSI+XB7PUMXENXhOw+Eyw=
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr634126ejc.77.1647447700552; Wed, 16 Mar
 2022 09:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220315173922.153389-1-paul@crapouillou.net> <CAHp75Vfas=H7Vb+mJor-LWckUpE8QUdD8Yauq4mdG4OY+7dfMg@mail.gmail.com>
 <L8FU8R.CQQY3F5UYD5O@crapouillou.net> <CAHp75Vca-Fnm3ddeB9=Nh6-B+CKwSruBykgt9M=s6hi=go5Zdw@mail.gmail.com>
 <RXHU8R.MCIBF6I07ISV@crapouillou.net>
In-Reply-To: <RXHU8R.MCIBF6I07ISV@crapouillou.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Mar 2022 18:20:27 +0200
Message-ID: <CAHp75Vez_9CGa6RY5iPrdzTQ79c8OBT7=UOY5w69reM1TLcHkA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Garbage-collect code paths for SoCs
 disabled by config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@opendingux.net,
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>
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

On Wed, Mar 16, 2022 at 6:03 PM Paul Cercueil <paul@crapouillou.net> wrote:
> Le mer., mars 16 2022 at 17:37:37 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> a =C3=A9crit :
> > On Wed, Mar 16, 2022 at 5:05 PM Paul Cercueil <paul@crapouillou.net>
> > wrote:
> >>  Le mer., mars 16 2022 at 16:47:24 +0200, Andy Shevchenko
> >>  <andy.shevchenko@gmail.com> a =C3=A9crit :
> >>  > On Wed, Mar 16, 2022 at 4:11 AM Paul Cercueil
> >> <paul@crapouillou.net>
> >>  > wrote:

...

> > It was given below, i.e. using test_bit().
>
> Again, I am not checking a bit, but a mask.

Yes, that's why "was".

...

> >>  >>  +       return (enabled_socs >> version) &&
> >>  >>  +               (!(enabled_socs & GENMASK((unsigned int)version
> >> -
> >>  >> 1, 0))
> >>  >
> >>  > Why casting? Why not use BIT()?
> >>
> >>  Casting just to be explicit about what we're doing here - I don't
> >> like
> >>  doing arithmetic on enums. But I can certainly remove it.
> >>
> >>  > But these two lines seem like a very interesting way to reinvent
> >> the
> >>  > test_bit().
> >>
> >>  I don't use BIT() or test_bit() because I am not checking a bit,
> >> but a
> >>  mask:
> >>  - (enabled_socs >> version) checks that the config supports either
> >>  (version) or anything above;
> >>  - !(enabled_socs & GENMASK(version - 1, 0)) checks that the config
> >> does
> >>  not support anything below. If true, the actual version check can be
> >>  skipped and the operation is a compile-time constant, and GCC will
> >> trim
> >>  the dead branches accordingly.
> >
> > You can still simplify the code, no? Calling ffs() (or similar, I
> > don't remember by heart all of the details) will give you the result
> > in one op. And it may also be optimized away by the compiler.
>
> ffs() gives me the first bit set, this is absolutely not what I want.
>
> Let's say that my kernel supports the JZ4750, JZ4755, JZ4760 SoCs.
> That means that I have enabled_socs =3D=3D 0x38.
>
> Calling is_soc_or_above(jzpc, ID_JZ4740) would resolve to:
> (0x38 >> 1) && (!(0x38 & GENMASK(0, 0)) || jzpc->info->version >=3D
> version);
> =3D=3D 1 && (1 || jzpc->info->version >=3D version)
>
> Which is a compile-time constant equal to 1.
>
> Calling is_soc_or_above(jzpc, ID_JZ4755) would resolve to:
> (0x38 >> 4) && (!(0x38 & GENMASK(3, 0)) || jzpc->info->version >=3D
> version);
> =3D=3D 1 && (0 || jzpc->info->version >=3D version)
>
> which is not a compile-time constant, so the jzpc->info->version must
> be checked.
>
> Calling is_soc_or_above(jzpc, ID_JZ4770) would resolve to:
> (0x38 >> 6) && (!(0x38 & GENMASK(5, 0)) || jzpc->info->version >=3D
> version);
> =3D=3D 0 && ...
>
> which is a compile-time constant equal to 0.

And what's wrong with

  ffs(enabled_socs) >=3D BIT(version)

?

--=20
With Best Regards,
Andy Shevchenko
