Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9744339D881
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jun 2021 11:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFGJVC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Jun 2021 05:21:02 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:34685 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFGJU7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Jun 2021 05:20:59 -0400
Received: by mail-oi1-f169.google.com with SMTP id u11so17390849oiv.1;
        Mon, 07 Jun 2021 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vaMfDc5+xZHaTJ5VtyzdwaPy3rvFSYLfAqTz4rcxcKQ=;
        b=YB5mufC+GqLiPx78PP4hKgVJO5vjSwTwzg6cfAoYZhgCaSEWj4uXQPC0+BJUWyI681
         epWToEASJO8izUjKBhZOGo2eLaTB7eqT5hanfAmfXUDeja4SSQekNVo5UGFvtNDyuUE9
         tqgNhP9n625Oem72nQ03IW/uixZki+GMiV7mYhaS5j/bhH7MWTPWoyZkW4cpQ+5i20G8
         iuEA9njdQrliLC0oz+k9n/vaGRcPB6c9wbJm6M3ZkdGA5A9Dcvn3F3nGQwRJLnW6Whgd
         7SL7HiJlCSbbFBDd2FX1I24/iyT97piIkA50ERwPV0cFXzJaMlsykD8udqBK0viH0pjT
         /TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vaMfDc5+xZHaTJ5VtyzdwaPy3rvFSYLfAqTz4rcxcKQ=;
        b=Qy7sM6MCtcK0jrzQFKddu+wNs7Xx0nxaCNC5HF5pyjyg9/4gA2tx6PaVrqT9EyrE8f
         BpY5bNQsJ+NdcpNv8fiDDueJgPaIf2qkoV58LT3P6QIeVIUdUPkrc7oDOA94WVk+l6No
         BJSslt/pJ5tkRbLjUmlrHP9d5sCp10HuDTcXbrGUt6x7QFuEcAbIM5GxeL5tij5fygza
         00/CRMvrDp0jEuVCqah53fI2emNiF7wEE5HEEySGf/TqaM6OaKmmXVfUk8TOIGkBhlmr
         lJsekuPcMiTZ8yPTQtZOiEgue9CvPckjKILowjJ+0Gtg6tVT78zZd8ILRZfoaLkkMB3t
         Q20g==
X-Gm-Message-State: AOAM532R+7MYbNgg6Xxyqgdf1HOuZuNJQaTTI5fIsge5AFLYm0T8Z6y2
        HCgQ46RZ+x+jxKjoBsXvkDq3QurGD4zkTbtbhXxtQfSFmy4=
X-Google-Smtp-Source: ABdhPJzmAVq+vWXAYtgelslvcmb9xZfuSXaCyhX01mJIED4SxLCj2JymDNAcopsMCdiSE7lih9GF7um8RJSyFifHdew=
X-Received: by 2002:a54:400a:: with SMTP id x10mr19351976oie.158.1623057487457;
 Mon, 07 Jun 2021 02:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com> <CACRpkdbn+OTdTgTj5wmDiegetoe=Wbz3YbWMwqR9TQAFND+H4g@mail.gmail.com>
In-Reply-To: <CACRpkdbn+OTdTgTj5wmDiegetoe=Wbz3YbWMwqR9TQAFND+H4g@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 7 Jun 2021 11:17:56 +0200
Message-ID: <CAMhs-H-fRzfU8E94O4DjHGyHO2_GKhOfC0cxiGiJZ5PkxrS5Cg@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: ralink: move all pinmux arch stuff into
 driver code
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

On Mon, Jun 7, 2021 at 9:23 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jun 4, 2021 at 1:52 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > We currently have 'drivers/pinctrl/ralink/' with common code to all of them
> > in 'pinctrl-rt2880.c' file. Pinctrl data was being passed in SoC initilization
> > to the driver. Instead of doing that just move all related code to the driver
> > itself. We maintain for all of them compatible string to avoid to make more
> > changes in dts's an so on. If a new compatible string is neccessary to be
> > defined for each different SoC, we can change them after this series are
> > applied.
> >
> > I have only tested MT7621 platform using GNUBee PC1 board. I don't have
> > other boards to test other SoC changes.
> >
> > This series are rebased on the master branch of linux-pinctrl git tree so
> > I expect this to be merged through pinctrl tree. Thomas, if 'linux-mips'
> > is preferred to merge this series just let me know and I can rebase them
> > to make you things easier.
> >
> > Thanks in advance for your time.
>
> I have simply applied all patches so we get some testing in linux-next
> (last time we found some snags through linux-next).

Good! Let's see what happen, then :)

>
> This is an important modernization of the ralink SoCs so I
> am pushing the fastforward button a bit.

I also do believe that having moved all of this stuff from the arch
headers to the driver itself is a very good step.

>
> If some ralink maintainer has opinions they can either patch it or
> complain loudly so I can take the patches out again.

Please, complain loudly if necessary :). As I said I only tested the
changes for mt7621 SoC, so it might be something wrong there.

>
> Yours,
> Linus Walleij

Thanks!
    Sergio Paracuellos
