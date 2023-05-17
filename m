Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74BA707393
	for <lists+linux-mips@lfdr.de>; Wed, 17 May 2023 23:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjEQVL6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 May 2023 17:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjEQVL5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 May 2023 17:11:57 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEAD6A7D
        for <linux-mips@vger.kernel.org>; Wed, 17 May 2023 14:11:56 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-559e53d1195so14608587b3.2
        for <linux-mips@vger.kernel.org>; Wed, 17 May 2023 14:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684357915; x=1686949915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ESbY04o8nMiMylkhFsmBCHORahVNqly1l+b0KOa640=;
        b=v5SexcE/rX2IDDr2Q+Jg71qCnOgAEyqh82pmkfwBGRhxmmH1TRMWr90nRSxjjoCF1r
         hGYuFJu1daRVqli8IXLNSBOXNnNwKzOdeANaee76IbW06Pf/BTOfIUH2zHOWfF/wUeLr
         c9kW4YK0gfMM5I4x7QJZ47n0t+18qK5ugWD6CJ4BotPw8/dhlvZv24u9ZNAgwO59exXX
         MWvs3Bh2AC8sMAG2Hx/UD7eVqmCETIqXr/Ve9A2Pb9L+Cr7EBH415lQBjobg5AAXwpbz
         Sd7PazZFNAZ/ItAcx6G3TlD/PshhlglA0pY56ts9Lx8xkxwMk/sofpb/+T6wZqAd4tS0
         oXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357915; x=1686949915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ESbY04o8nMiMylkhFsmBCHORahVNqly1l+b0KOa640=;
        b=LY/1OymbGFwTgkWGIXEKl2eWnZEe6/l+qd6tHjYqzWVGysMxoD5eaFWui1ZGqgiJOC
         6rN3eYUZPJXFN5hJW+doW97FcAtZlzS9oubhKjY9g/o2QbY4SSlIY4jEEjttBx8YmjUz
         Vjtpr6CKMFx+47EA/69QDVmkp5QPoeVOrHmr3EVe/DTmsPhyicqeybYjSrMfQSgrtH6v
         lc4Mz2hR0VklGJqtKUL3oN1ik/QcmoXRkcz/tt2HSKYx4TbmwEojIMt0vn6e+KWkB52H
         9GaiiZUer63SosPLnUHyDBjnXCOTbRihucsKye65u7LlvHqX0L8W0bpXt4RVEiE7NYUs
         Fl1Q==
X-Gm-Message-State: AC+VfDyXI1oir/Z5FFRs0L4Q4tXsQEd4mAV4pbf2bj+/ULbmsbAkb2ce
        MSvpgNVe7i42qjegEFN8QJ1U//jf9GLl2fDzSdRteg==
X-Google-Smtp-Source: ACHHUZ4WiU/7XNv5tV812IdEVaHBoQ+14tMHeWf4rv+lcocaQlv66/13I8fR3QBFOtF5w7UHYni2NBlJ2CKlqIUUMBE=
X-Received: by 2002:a0d:e84f:0:b0:55a:679f:1d90 with SMTP id
 r76-20020a0de84f000000b0055a679f1d90mr43201104ywe.2.1684357915574; Wed, 17
 May 2023 14:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org> <20230517195911.GG271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517195911.GG271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 May 2023 23:11:43 +0200
Message-ID: <CACRpkdaxQQ3fJeYRs+M29MYA4=f+ha26m5Xa2+uV_MejtEdwUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Helge Deller <deller@gmx.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 17, 2023 at 9:59=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:

> This does not compile as nokia770_ads7846_props is declared twice,
> and nokia770_cbus_props and nokia770_mpuio_gpiochip_swnode are missing.

Hmmmm I think we should probably update omap1_defconfig to enable
all the OMAP1 drivers so we have good compile coverage. It's the
ifdefs that fool me into believeing the code actually compiles ...

> On Mon, May 08, 2023 at 11:20:06PM +0200, Linus Walleij wrote:
> > +static const struct software_node_ref_args nokia770_cbus_gpio_refs[] =
=3D {
> > +     SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 9, 0),
> > +     SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 10, 0),
> > +     SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 11, 0),
> > +};
>
> These should be nokia770_mpuio_gpiochip_node.

Fixed it.

> > +static const struct property_entry nokia770_ads7846_props[] =3D {
> > +     PROPERTY_ENTRY_REF_ARRAY("gpios", nokia770_cbus_gpio_refs),
> > +     { }
> >  };
>
> This should be nokia770_cbus_props.

Fixed it.

Also enabled CONFIG_I2C_CBUS_GPIO and recompiled.

Yours,
Linus Walleij

Yours,
Linus Walleij
