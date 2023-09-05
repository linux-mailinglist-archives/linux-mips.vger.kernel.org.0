Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E306792FC6
	for <lists+linux-mips@lfdr.de>; Tue,  5 Sep 2023 22:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242657AbjIEURX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Sep 2023 16:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241983AbjIEURW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Sep 2023 16:17:22 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F1DCF1
        for <linux-mips@vger.kernel.org>; Tue,  5 Sep 2023 13:16:52 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4c0so503749a12.0
        for <linux-mips@vger.kernel.org>; Tue, 05 Sep 2023 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693944982; x=1694549782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOMURYJK1jPXbcrQ6jgRnAGfsBHD/Md4WVv2cMc23FQ=;
        b=AHTTgaTBiY4tRo8ExH4eQ3DXDosgrK4ZSdVrk8kEAKmjyOAifLo6r786QWd2nuuZDn
         6JIxgk569ZRDePGC+3cNZuIQzg7Z02e5RA67AijcsL9RSxrEVwgM+nOVMSzCuYYFUs2U
         KHZlU6QGoEle+z9cP9oD8Ze+dM9NDfB7/PVdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693944982; x=1694549782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOMURYJK1jPXbcrQ6jgRnAGfsBHD/Md4WVv2cMc23FQ=;
        b=KF6Wbev3rQPLqQ950Yf2K+ijmsM459bMwT3zSLFi3OlqJjt53pxD4srKb4O/xeVrXN
         MNwoWQzrKsCVhIvz1X22uaMHvyPipAGj1PArETvEWf/b3I3z6djdLLxjaaYmmUOE/gN7
         ri2m00HyL4dNiiEOIok2Q/3rw2+MOhBZYfob/sBMFL0SIboj1VaHjtrwxfbaT/FZ3fes
         I3sUJRZQv+UimcaJP4Oxen7fn0jf7oy0W4ZH7xcjWHJFnhH8UJ3cYnUqv17PVaAq98yb
         t2gbxqyE9M75rXfWVr+4/OocBXcneQvxiWPIcAcfS5wYunSL0XzphAgIcSPMl5l2B1DU
         ePKw==
X-Gm-Message-State: AOJu0Yyf//ZqZlY0OUFKf6XAmNNhF3J2OivujcXSM6m8/1H2GC5YE5Zl
        Ak60DJB+OQX1l9T8tfVh2UquVtF66j3PTt78P1I4MuQi
X-Google-Smtp-Source: AGHT+IF3kW/0oNUU/SI0muW9yp52X1q5DJArW5HB1yQzhDUdMsMSKN5t/WNuv6kLW8IOz9pOlKxNvw==
X-Received: by 2002:aa7:dcd2:0:b0:522:3149:159b with SMTP id w18-20020aa7dcd2000000b005223149159bmr911537edu.2.1693944981988;
        Tue, 05 Sep 2023 13:16:21 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id v22-20020aa7d9d6000000b0052568bf9411sm7394261eds.68.2023.09.05.13.16.21
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 13:16:21 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so4418a12.0
        for <linux-mips@vger.kernel.org>; Tue, 05 Sep 2023 13:16:21 -0700 (PDT)
X-Received: by 2002:a50:d0c1:0:b0:523:bdc9:48a9 with SMTP id
 g1-20020a50d0c1000000b00523bdc948a9mr54207edf.0.1693944980934; Tue, 05 Sep
 2023 13:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid> <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
In-Reply-To: <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Sep 2023 13:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
Message-ID: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>, airlied@gmail.com,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Paul,

On Mon, Sep 4, 2023 at 2:15=E2=80=AFAM Paul Cercueil <paul@crapouillou.net>=
 wrote:
>
> Hi Douglas,
>
> Le vendredi 01 septembre 2023 =C3=A0 16:41 -0700, Douglas Anderson a =C3=
=A9crit :
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that
> > it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > Since this driver uses the component model and shutdown happens at
> > the
> > base driver, we communicate whether we have to call
> > drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> LGTM.
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Thanks for the Ack! Would you expect this patch to land through
"drm-misc", or do you expect it to go through some other tree?
Running:

./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/ingenic/ingenic-drm-dr=
v.c

...does not show that this driver normally goes through drm-misc, but
it also doesn't show that it goes through any other tree so maybe it's
just an artifact of the way it's tagged in the MAINTAINERS file? If
it's fine for this to go through drm-misc, I'll probably land it (with
your Ack and Maxime's Review) sooner rather than later just to make
this patch series less unwieldy.


> > ---
> > This commit is only compile-time tested.
> >
> > NOTE: this patch touches a lot more than other similar patches since
> > the bind() function is long and we want to make sure that we unset
> > the
> > drvdata if bind() fails.
> >
> > While making this patch, I noticed that the bind() function of this
> > driver is using "devm" and thus assumes it doesn't need to do much
> > explicit error handling. That's actually a bug. As per kernel docs
> > [1]
> > "the lifetime of the aggregate driver does not align with any of the
> > underlying struct device instances. Therefore devm cannot be used and
> > all resources acquired or allocated in this callback must be
> > explicitly released in the unbind callback". Fixing that is outside
> > the scope of this commit.
> >
> > [1] https://docs.kernel.org/driver-api/component.html
> >
>
> Noted, thanks.

FWIW, I think that at least a few other DRM drivers handle this by
doing some of their resource allocation / acquiring in the probe()
function and then only doing things in the bind() that absolutely need
to be in the bind. ;-)


-Doug
