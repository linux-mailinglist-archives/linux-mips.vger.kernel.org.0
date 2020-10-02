Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9D3281050
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 12:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387726AbgJBKGp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 06:06:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:44192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBKGp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 06:06:45 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B5202065D;
        Fri,  2 Oct 2020 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601633204;
        bh=UJnxaC4M1lOTDgzs586QRSYYhrDCyDplqGq8e17l78E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zK6KwWMfGx+COYeTiW7XydYPT01P72wNhoDo1SEhefHyCZ2dCm5+bFatWiMRR3iyG
         pV7fqxOJPOW+mEONS9qBxxAEg/5+9PT+UdMukVhcUctmHwSVNjY1+32RMDdRWy6r9m
         KaGUN9J4TqtYuUjQJ6SSBLyjrSliBPEQN5WSsiOQ=
Received: by mail-ed1-f54.google.com with SMTP id 33so1039877edq.13;
        Fri, 02 Oct 2020 03:06:44 -0700 (PDT)
X-Gm-Message-State: AOAM532nPoDVjsF2o87zJ6CHXawD5rFczMpZFvF81KWFF1jeBQyw5U82
        8vdtcDt1+pMYMLozG9HsZbbbgfMKIV/ZkOm+HaQ=
X-Google-Smtp-Source: ABdhPJyMUEsiLReOne5kMxnk5FpY37kPG9ggO9a1YAGcyv6YS7ZODs7IzG6QmWx9MLtvVFTrSOvy1Y7+WgappyP9AWU=
X-Received: by 2002:a50:a452:: with SMTP id v18mr350430edb.143.1601633202677;
 Fri, 02 Oct 2020 03:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-6-post@lespocky.de>
 <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com> <4533120.poq1GmoeVQ@ada>
In-Reply-To: <4533120.poq1GmoeVQ@ada>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 12:06:30 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd3um-RvcmjexhYbpnbwcd6yKRYdCV1fnmjKoLguVOLKQ@mail.gmail.com>
Message-ID: <CAJKOXPd3um-RvcmjexhYbpnbwcd6yKRYdCV1fnmjKoLguVOLKQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-leds@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2 Oct 2020 at 11:28, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Krzysztof,
>
> Am Freitag, 2. Oktober 2020, 11:12:50 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).
> > >
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > ---
> > >
> > > Notes:
> > >     v6:
> > >       * added this patch to series
> > >
> > >  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
> > >  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
> > >  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
> > >  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
> > >  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
> > >  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
> > >  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
> > >  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
> > >  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
> > >  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
> >
> > Somehow you did not CC the maintainers... please use
> > scripts/get_maintainers.pl to obtain list of addresses.
>
> Well, that will be a huge list of Cc then.  What is the policy?  Everybody
> gets the whole series or different list of receivers per patch?

With git send email and get_maintainers.pl you can simplify it:
1. Send cover letter to everyone (could be skipped and instead send to
mailing lists and then link included under --- in each patch).
2. Send automatically each patch only to maintainers, with adjusted
in-reply-to to the cover letter already sent. Something like: git
send-email --cc-cmd "scripts/get_maintainer.pl --no-git --no-roles
--no-rolestats".

Probably 1+2 could be even one command if you put manually lists as Cc
in the cover letter.

Best regards,
Krzysztof
