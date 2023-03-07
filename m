Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD816AE09A
	for <lists+linux-mips@lfdr.de>; Tue,  7 Mar 2023 14:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbjCGNcC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Mar 2023 08:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjCGNbt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Mar 2023 08:31:49 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB635DED2
        for <linux-mips@vger.kernel.org>; Tue,  7 Mar 2023 05:31:23 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5384ff97993so245230497b3.2
        for <linux-mips@vger.kernel.org>; Tue, 07 Mar 2023 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678195881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qZDlZ4nvcYqnA7rrOlrlk7Ib6bN2Rj+gic41qjc6Sk=;
        b=csz6D+7qw4ihr/1Q1hYTSkqILMOaSoUsowp1U7h/ni56nX/+aBQoIiHoWIlKyKl8X4
         zq+xVwxcBDGzSLtahMpQOBACWxrveOj/+ArcjOvPNLoL0suTP+ukwNGwF136A4Dayybp
         GWm/DvqIfyJp/htKSqEncFX+eZbRZ7sSzAtOJDXWcHuMpJniKM4HOecz5cJlcIlcoeZT
         NwRGshB2J6j7TBILMDdY18XXPwOTMabvfG94WLpgb8pygXE7oNNk/bXcz1yPfurDwS5F
         iqZzm32yEqVrCiIJ73X4pZARre+jNFfGwBUYO1Yj7dANhtHMb8RORDzGtnlY+SUL820M
         2BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qZDlZ4nvcYqnA7rrOlrlk7Ib6bN2Rj+gic41qjc6Sk=;
        b=lg3fQT/AH0xWDS/eJAeijNGSKOLW8Jg43j7g1CRIYrYc9zS71cld3oQow8cJ63lpmt
         7CGuCjnBTwEbmKjqWSv+V7oizOxk5GaMX7m9vzM0mWpSifTuOIAYpMwUSZ9xX5Op+ph3
         EUANYk2PAV6rJNXoN0swid9VaacyUS5YVSIVVUsxTw7jAv2a3b+p2W1PsGXKkB5/rRXM
         3rq0+2bm9vizeh/eH1lQSFpk2Qup94uIj/LCvyFjSz0/niUfx+mqhPV4pwMF8twpQT0a
         hL4ztd8dxkPF/FtP4zq/rqu/TvNH1KvC4gMdqUgLOcoPk4YAYsyCks8f/utFQ8EAkbMl
         uSpg==
X-Gm-Message-State: AO0yUKUxzHCU7hqYTe1ggPX9r1ZTehxTUb8FP1hE7tvm9NGIo48bxdGX
        oeDduA7q3K2DGH2Cg7rdLv0JN3bLj7BhAlkC/xm6Rg==
X-Google-Smtp-Source: AK7set9E8w0pJh0BVoOHhtl6CYrFbDwMltsJpSZJqp2AS97HPe+ed7p/77Kqwpjgt1kY1eeDT2PPd1l/BExC7pyIBuc=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr8676951ywh.10.1678195881039; Tue, 07
 Mar 2023 05:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20230302125215.214014-1-keguang.zhang@gmail.com>
 <20230302125215.214014-2-keguang.zhang@gmail.com> <CAMRc=Me=Yrr5BuRaMd4r91URzmdYHWUvVGvLL9YFuZPaV0WYFA@mail.gmail.com>
 <CAJhJPsVf8EvFc9N8eMtc8Qu2BhODv7PzZm9C5ePR+GdTFiAY1w@mail.gmail.com>
In-Reply-To: <CAJhJPsVf8EvFc9N8eMtc8Qu2BhODv7PzZm9C5ePR+GdTFiAY1w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:31:09 +0100
Message-ID: <CACRpkda_y1Hz69XyDjcDPd=gEi_n2PChJOgKsonXcvYyxQzg4w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: loongson1: Convert to SPDX identifier
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 7, 2023 at 3:25 AM Keguang Zhang <keguang.zhang@gmail.com> wrot=
e:
> On Mon, Mar 6, 2023 at 5:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Thu, Mar 2, 2023 at 1:52=E2=80=AFPM Keguang Zhang <keguang.zhang@gma=
il.com> wrote:
> > >
> > > Use SPDX-License-Identifier instead of the license text and
> > > update the author information.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>

> > Why are you removing credits of the old author?

> Kelvin Cheung and Keguang Zhang are the same person.
> This change is to keep pace with the related entry of MAINTAINERS.

That's a pretty interesting change!

Is Kelvin Cheung the "westernized" name and Keguang Zhang the
closer to the real name, such as pinyin form? That would make
a lot of sense.

I think some authors even use the native characters these days,
as git and all tools and terminals should support Unicode now.
It might make it hard for us to answer mails (not knowing which
characters to refer to as given name) but I kind of like it when I
see it.

Yours,
Linus Walleij
