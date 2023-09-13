Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072D679F2A0
	for <lists+linux-mips@lfdr.de>; Wed, 13 Sep 2023 22:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjIMUM5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 16:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbjIMUM5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 16:12:57 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF931BC6
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 13:12:53 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-58fae4a5285so2635097b3.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694635972; x=1695240772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su1HKHhLigyzqYlZO3Q6GiJPuDvWadoF+8eJgSHSJSM=;
        b=aiRSgXPbdPszjUbrmOvfo8VAbkCooNj2DlaPadFcfWqONmI1e1Ks9j2Zmtg9KMhvVx
         PX/x5k/D0b1WEwZtEzWZRkPA8IrfbYHsqP+tjC85HjqExhu7XheGk8CdHWuLCAz3ZOOM
         VCuoKtlcFasz019GO6zGs8sPXIZkq+03b5o4kMViuZUBPfWD1EkVMI5jbh/AGXOoQe5Y
         +rHm/yIuaKSCA/OMPD1AyTCabMcwJEvRXFYuODEV110l2EF96r0v5ZHKr67DsB0HExr7
         FK463fHavC8jhL1xEhQSum117HDUvYlfT7mfteSZTabEAvtcsAgJS/4vcWp6RjQJUIQO
         KsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635972; x=1695240772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su1HKHhLigyzqYlZO3Q6GiJPuDvWadoF+8eJgSHSJSM=;
        b=precpuDJwtfOtoEVja+OkHYfRbulgmBp8BcI6v+YwtaF1FnBOzwqERCducF/iE0civ
         dBBs1pJb3MJUrvgVBi/fAAYOdVQ3QIHy/gppFAkWT1QxLDSjoaleEmRUfp0nANAxNFFe
         ahduvP6NVBdeSxl/T/5BsBY8VlzeTRoa/swKk8Zqvv+ZAhi+Ta1bunpgJ4emIQvyqPtt
         ObyS8ZP7BCqu9bkbjwPW0w0+WdxJK76l/SrnQqNFeG+Tn7DEntiDRCChpuLwbbmAtCHD
         NQczDT0IZT8hWZpipCVmUOQ0Y1M1jr+vsrRIggS0oCd73c/Bum2PrgWmrX1V4IlHiuCZ
         bs+w==
X-Gm-Message-State: AOJu0YzdxoNrTnx3q1SXWUUhETyU6mMQvLqEPQT06+CTdawyf5foMlRV
        JK2NadPAvnPiibsi66NAfOm6oA/WYhA7U0QH6Okc/g==
X-Google-Smtp-Source: AGHT+IGNdHiKi9h+VMupJWAnl7lkQjZz2lyGhzlQ4y/m/GOS5wCeU4E04eoE42Ydser353023glv4MnCjnMPMHjH7ys=
X-Received: by 2002:a25:d246:0:b0:d81:6a54:48f0 with SMTP id
 j67-20020a25d246000000b00d816a5448f0mr2205331ybg.22.1694635972595; Wed, 13
 Sep 2023 13:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Sep 2023 22:12:40 +0200
Message-ID: <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 13, 2023 at 10:05=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Sep 13, 2023 at 2:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the new, less cumbersome interface for setting the GPIO as
> > active-high that doesn't require first checking the current state.
>
> ...
>
> >          * here for older DTs so we can re-use the generic nand_gpio_wa=
itrdy()
> >          * helper, and be consistent with what other drivers do.
> >          */
> > -       if (of_machine_is_compatible("qi,lb60") &&
> > -           gpiod_is_active_low(nand->busy_gpio))
> > -               gpiod_toggle_active_low(nand->busy_gpio);
> > +       if (of_machine_is_compatible("qi,lb60"))
> > +               gpiod_set_active_high(nand->busy_gpio);
>
> Why not moving this quirk to gpiolib-of.c?

That's a better idea here I think, it's clearly a quirk for a
buggy device tree.

Yours,
Linus Walleij
