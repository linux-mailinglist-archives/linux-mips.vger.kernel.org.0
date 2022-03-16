Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018974DB50C
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 16:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241109AbiCPPkI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 11:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239846AbiCPPkI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 11:40:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71376659D
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 08:38:53 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id qx21so4969975ejb.13
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MM9vvwpaWPREB2BIsJI3sgamSMU6VcR3wb2cMMwvDM8=;
        b=k5ovTv4ZyfEUN9h+Mr+k8nVD02eTCgP/TJxKp8M71r1wiw9xCFMTnGsU/GykqzTTld
         Y966kGqs5zcAs/Q5ymsJhcKf6EyfhlQGSuWGRxEXObcbJIuKhknEly8bfUJa35S8PUFu
         8hMJCtB/hXzLPH0ZqRl6/Bg5m4Ugnrv7cOtjjnvJNPec6ey2bfk33snylc2/X1rXn67r
         i6LLdY3Lsu3JL5HodA/LQjGWrtpmsealwfS2B/9sVN68xRMNNGIoarSSQzeLitFHMhkB
         T2ruF7P3WAp1KdwqaRwzRAp19jHedGR/ir6Drlxgphvg8tG55/yA6TUyFh31donkg79F
         cS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MM9vvwpaWPREB2BIsJI3sgamSMU6VcR3wb2cMMwvDM8=;
        b=v2jom8PRjjWpPOuMVUt0q9ouPMYzijkZ/FO5xVPm/l70OEPXtqs8t0ptQyLpoNXPh2
         xIxgJs5BKYK0DMLumHlCbWjLbWRgbtXv5pWK122VnkpwgdbKAeD7REX7NMwWRW23CiIn
         vh4by5R65TnFX66eW3N/rCunGGk0xHqA5TBBbwLeP+P5K4md93+jufAglyC2ZfmQ8tqi
         Jim51Lmfh0nVRxRxmkcjWviz4FPzG086qviurjFr55CZ16gNUaAmiK3XAkOxmET9VuEd
         zHH5ppaGSrmu+tRxDBvLHP1rb/QlNhm4ykg4QqPkBqHQlfYVya3xChGJnBY13fJCVnc8
         CtHA==
X-Gm-Message-State: AOAM533dQuMYhvnij/ENsX5pQDZe4fLz8mlOj0JxgzSYi9pArcvRVcLv
        sPfTjGAPkFAHiyhRZolxLz2fgOXeBu5oGWU9MLY=
X-Google-Smtp-Source: ABdhPJw/nOM1fPPbqMTl4kWaHcO0wniMkXgjmyBy958cHRpvjf4VhEyYlu+oWgL450b6RtZGA96DEpZeE89rorj3Qx8=
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr472150ejc.77.1647445131884; Wed, 16 Mar
 2022 08:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220315173922.153389-1-paul@crapouillou.net> <CAHp75Vfas=H7Vb+mJor-LWckUpE8QUdD8Yauq4mdG4OY+7dfMg@mail.gmail.com>
 <L8FU8R.CQQY3F5UYD5O@crapouillou.net>
In-Reply-To: <L8FU8R.CQQY3F5UYD5O@crapouillou.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Mar 2022 17:37:37 +0200
Message-ID: <CAHp75Vca-Fnm3ddeB9=Nh6-B+CKwSruBykgt9M=s6hi=go5Zdw@mail.gmail.com>
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

On Wed, Mar 16, 2022 at 5:05 PM Paul Cercueil <paul@crapouillou.net> wrote:
> Le mer., mars 16 2022 at 16:47:24 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> a =C3=A9crit :
> > On Wed, Mar 16, 2022 at 4:11 AM Paul Cercueil <paul@crapouillou.net>
> > wrote:

...

> >>  +static const u32 enabled_socs =3D
> >
> > If you make it unsigned long, it would be easier to switch to bitmap
> > APIs if needed in the future.
>
> Sure, I can make it a unsigned long. But we'd need a lot more entries
> to justify a switch to bitmap APIs...

It was given below, i.e. using test_bit().

> >>  +       IS_ENABLED(CONFIG_MACH_JZ4730) << ID_JZ4730 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4740) << ID_JZ4740 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4725B) << ID_JZ4725B |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4750) << ID_JZ4750 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4755) << ID_JZ4755 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4760) << ID_JZ4760 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4770) << ID_JZ4770 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4775) << ID_JZ4775 |
> >>  +       IS_ENABLED(CONFIG_MACH_JZ4780) << ID_JZ4780 |
> >>  +       IS_ENABLED(CONFIG_MACH_X1000) << ID_X1000 |
> >>  +       IS_ENABLED(CONFIG_MACH_X1500) << ID_X1500 |
> >>  +       IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
> >>  +       IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
> >>  +       IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;

...

> >>  +is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum
> >> jz_version version)
> >>  +{
> >>  +       return (enabled_socs >> version) &&
> >>  +               (!(enabled_socs & GENMASK((unsigned int)version -
> >> 1, 0))
> >
> > Why casting? Why not use BIT()?
>
> Casting just to be explicit about what we're doing here - I don't like
> doing arithmetic on enums. But I can certainly remove it.
>
> > But these two lines seem like a very interesting way to reinvent the
> > test_bit().
>
> I don't use BIT() or test_bit() because I am not checking a bit, but a
> mask:
> - (enabled_socs >> version) checks that the config supports either
> (version) or anything above;
> - !(enabled_socs & GENMASK(version - 1, 0)) checks that the config does
> not support anything below. If true, the actual version check can be
> skipped and the operation is a compile-time constant, and GCC will trim
> the dead branches accordingly.

You can still simplify the code, no? Calling ffs() (or similar, I
don't remember by heart all of the details) will give you the result
in one op. And it may also be optimized away by the compiler.

> > If I'm mistaken, this all version code needs a good comment.
> >
> >>  +                || jzpc->info->version >=3D version);
> >>  +}

--=20
With Best Regards,
Andy Shevchenko
