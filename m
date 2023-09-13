Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C377D79EE39
	for <lists+linux-mips@lfdr.de>; Wed, 13 Sep 2023 18:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjIMQZh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 12:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjIMQZg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 12:25:36 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C2319AF
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 09:25:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bcc0adab4so3892566b.2
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694622329; x=1695227129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/h8LhBCMwqwCfF1tLU1WVlQTqaYSvf4SN9SeoE8D3o=;
        b=CC0DUK8W79ou8EyZqzDOPLEw1iIRzmJS2I2fumA5K6siDjj+D4LdKJHaehJH9Cwhsj
         9TqmwQwzSWh9DJ+2E4I6/p/0ASUqUyuXxTMA+Y40HMQteIXO3qKNcjEA62GR3TV9b0Oq
         uo8KNJId1LJnp8ika7JC5F4UOKFJY7VvNnjLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694622329; x=1695227129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/h8LhBCMwqwCfF1tLU1WVlQTqaYSvf4SN9SeoE8D3o=;
        b=dXLX0aN2kZ3FS/hodjBJ39lq4NOzicVIRnw8BYfejeC7J1JlnKnB3gbKP21X8FeI/W
         ppSgQreiA0zCz55Z8K6yRihzNPoDM8TsihnOyj6QY/0uLhUsm3R01rxuR/zFgjxGzWyv
         dyPm+ymXkv7c7uelEGRONNiJ+fdTgFC1mj1VwpclqchdmCXKz3wabL7S4Op5IoxH2zxe
         chUYOHC28CoO414oFf5LIS86xc/xiIaVVeiCjPolWrSGx3uOS0azez9roisvsrvFpqjV
         QInSuthm3cfcVjFX5PIHEEDfDBFMOfOAannK9IHdE97+O/zp6ktANI4oWwyvIDwnyHUd
         BJbQ==
X-Gm-Message-State: AOJu0Yx3Y31GZKoZd3wH6FJPLEm8rtGIT81Jus+Tcwvh9fSEQiroKpDU
        0DZkRKMNEIHs1L7UvnaqpiJCC/Z2z/0ERzvqdSJSV9w1
X-Google-Smtp-Source: AGHT+IFYNR/I9uAQ0XK5Yre6bkxSA3QSixpfX/LPQ2uTixmWsejF44IGC/XBzuM5q4MVcVRIuc6CsA==
X-Received: by 2002:a17:906:3117:b0:9a5:7ade:b5e9 with SMTP id 23-20020a170906311700b009a57adeb5e9mr2471160ejx.51.1694622328886;
        Wed, 13 Sep 2023 09:25:28 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id j1-20020a170906410100b0099bd1ce18fesm8772461ejk.10.2023.09.13.09.25.28
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 09:25:28 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so18153a12.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 09:25:28 -0700 (PDT)
X-Received: by 2002:a50:baef:0:b0:51a:1ffd:10e with SMTP id
 x102-20020a50baef000000b0051a1ffd010emr139918ede.3.1694622327845; Wed, 13 Sep
 2023 09:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net> <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 13 Sep 2023 09:25:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFkTHhsxFZGPqFVOX6ra+bx=1P-jAdh1wz-_Q=GBJc4Q@mail.gmail.com>
Message-ID: <CAD=FV=UFkTHhsxFZGPqFVOX6ra+bx=1P-jAdh1wz-_Q=GBJc4Q@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>, airlied@gmail.com,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Tue, Sep 5, 2023 at 1:16=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Paul,
>
> On Mon, Sep 4, 2023 at 2:15=E2=80=AFAM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> >
> > Hi Douglas,
> >
> > Le vendredi 01 septembre 2023 =C3=A0 16:41 -0700, Douglas Anderson a =
=C3=A9crit :
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > time. Among other things, this means that if a panel is in use that
> > > it
> > > won't be cleanly powered off at system shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > instance overview" in drm_drv.c.
> > >
> > > Since this driver uses the component model and shutdown happens at
> > > the
> > > base driver, we communicate whether we have to call
> > > drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > LGTM.
> > Acked-by: Paul Cercueil <paul@crapouillou.net>
>
> Thanks for the Ack! Would you expect this patch to land through
> "drm-misc", or do you expect it to go through some other tree?
> Running:
>
> ./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/ingenic/ingenic-drm-=
drv.c
>
> ...does not show that this driver normally goes through drm-misc, but
> it also doesn't show that it goes through any other tree so maybe it's
> just an artifact of the way it's tagged in the MAINTAINERS file? If
> it's fine for this to go through drm-misc, I'll probably land it (with
> your Ack and Maxime's Review) sooner rather than later just to make
> this patch series less unwieldy.
>
>
> > > ---
> > > This commit is only compile-time tested.
> > >
> > > NOTE: this patch touches a lot more than other similar patches since
> > > the bind() function is long and we want to make sure that we unset
> > > the
> > > drvdata if bind() fails.
> > >
> > > While making this patch, I noticed that the bind() function of this
> > > driver is using "devm" and thus assumes it doesn't need to do much
> > > explicit error handling. That's actually a bug. As per kernel docs
> > > [1]
> > > "the lifetime of the aggregate driver does not align with any of the
> > > underlying struct device instances. Therefore devm cannot be used and
> > > all resources acquired or allocated in this callback must be
> > > explicitly released in the unbind callback". Fixing that is outside
> > > the scope of this commit.
> > >
> > > [1] https://docs.kernel.org/driver-api/component.html
> > >
> >
> > Noted, thanks.
>
> FWIW, I think that at least a few other DRM drivers handle this by
> doing some of their resource allocation / acquiring in the probe()
> function and then only doing things in the bind() that absolutely need
> to be in the bind. ;-)

I've been collecting patches that are ready to land in drm-misc but,
right now, I'm not taking this patch since I didn't get any
clarification of whether it should land through drm-misc or somewhere
else.

-Doug
