Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA58E4A9424
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 07:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241936AbiBDGxP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 01:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiBDGxN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 01:53:13 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4E8C061714;
        Thu,  3 Feb 2022 22:53:12 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id s5so16381590ejx.2;
        Thu, 03 Feb 2022 22:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7CP/6j3dag0neitGTjDIhgQVFUWl39v8Ocw1xxKJ7OQ=;
        b=WNR4oABRMeFAI+TvcrRKK/Nt0Hhhevvn30y2SGMxUdnhJ8ePZLQaP1kLqu+4MMY//x
         TBu5ATQASrG1OKBPc/sqgkdnY2xYbpfMp6vd2idd+AoXIUOOqTtwoyx4hrfZ24nPJrIP
         WtSpKGqnfl3al3N96RUSp86e0xUTOjxFWrDU/z+EEptGK4tM10BZQrr4uuk/0IJxROa2
         Ih8abc+46dxwRsRVlStwWWRa0mLkVGsM2Zhql5efyLNM0u0u9Qv/FFdx9AQ8JKQ2Yxpv
         LIVkRuIy47SNp/nihVz5mJw3UKScGIh/UXDUDSpH2PdPteHJhCUAXT8LE7ZWtOaM4+FO
         E6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7CP/6j3dag0neitGTjDIhgQVFUWl39v8Ocw1xxKJ7OQ=;
        b=MlK4IIjzhS7uEwVf2FTgDuZvcKsUTZh7pZ6O9LH9PAOVQktwPF3csBuWQKNPjEc3qv
         KFTm0imsp5RLm4R3kEi/BazFIYLS9T5cNbtz25EDC5/DhFyAcxzNH7JMuQQf2eOcsUd3
         y1WGO8n3+vyBdq4jiQB+YN4rSO9gmAN7i9WxaMYhfqj7dHRIHy6EOULGR1o8FwMz2cDB
         dOV1jV4zpDydXaLEu5r45c/cVdAGuJMhzmpdp5IF5bKTIMArda9WHLrC7aU/5jFMgf3h
         0n69ULwmLYcZuUqMyWGrf+eXeq1pq/TbSSCS6cR10g8Lp+hepmNGliz0SBMwGMdkjMMO
         LmZA==
X-Gm-Message-State: AOAM533lIkqrf1VOHtFV0lX91EKYSX23EYO1u16+c0jkvW63SsF2BUp+
        mYHUAK44w/AoqWkstsAaWFfUQyYK/X70tYv95xw=
X-Google-Smtp-Source: ABdhPJz22uCP7SFV4boUh7XsGmSqaoOEQZf2rnM7IZusi0+PqKGU3ECkfZvEff+6tro4eqcPRwvAqUw1ARgpt+ySL84=
X-Received: by 2002:a17:906:ce45:: with SMTP id se5mr1278374ejb.649.1643957591173;
 Thu, 03 Feb 2022 22:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20220204052641.538970-1-lis8215@gmail.com> <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
In-Reply-To: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
From:   Siarhei Volkau <lis8215@gmail.com>
Date:   Fri, 4 Feb 2022 09:53:00 +0300
Message-ID: <CAKNVLfYxHP=eKe1thziJnjDre3-q8oMgZMzOW74X0_9PvSE4jw@mail.gmail.com>
Subject: Re: [PATCH 0/1] clk: jz4725b: fix mmc0 clock gating
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=D0=BF=D1=82, 4 =D1=84=D0=B5=D0=B2=D1=80. 2022 =D0=B3. =D0=B2 09:24, Paul C=
ercueil <paul@crapouillou.net>:
>
> Hi Siarhei,

Hi Paul,

> Le ven., f=C3=A9vr. 4 2022 at 08:26:40 +0300, Siarhei Volkau
> <lis8215@gmail.com> a =C3=A9crit :
> > The mmc0 clock gate bit was mistakenly assigned to "i2s" clock.
> > You can find that the same bit is assigned to "mmc0" too.
> > It leads to mmc0 hang for a long time after any sound activity
> > also it  prevented PM_SLEEP to work properly.
> > I guess it was introduced by copy-paste from jz4740 driver
> > where it is really controls I2S clock gate.
>
> This is useful information, please use the same text in the commit
> message.
Ok.
>
> However... My JZ4725B programming manual does say that the MMC0 clock
> is gated with bit 6, and the I2S clock has no gating bit.
>
> Where did you find this info?
My programming manual says exactly the same, but look at the clk
driver source - the bit 6
is used in both clock domains (i2s and mmc0). That's the patch intended to =
fix.
Background: I'm trying to port OpenDingux to a Ritmix RZX-27 device.
It uses mmc0 as main storage. That's where the problem arises - after
init.d/alsa-hack.sh
mmc0 hungs for ~5 minutes till sdmmc core does reset it.
>
> Cheers,
> -Paul
>
> >
> > Siarhei Volkau (1):
> >   clk: jz4725b: fix mmc0 clock gating
> >
> >  drivers/clk/ingenic/jz4725b-cgu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > --
> > 2.35.1
> >
>
>
