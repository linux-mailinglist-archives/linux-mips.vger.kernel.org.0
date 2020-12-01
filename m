Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468132CA76F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Dec 2020 16:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390493AbgLAPvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Dec 2020 10:51:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:34842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbgLAPvW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Dec 2020 10:51:22 -0500
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B6382220B;
        Tue,  1 Dec 2020 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606837841;
        bh=ocP+REHyvc3INvCyRToWa0BDelMYpVNAD4Ht4bVMxw4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d0BXfp9B678drYtWqDBUlknaZrgIENz3/9P8PkQTHdjgiToHebGZd6AT15QYDi9o3
         of85a0gKvoI/ETgfnp9XrwnI4Xto0nyM976m+c8Ye8M6eJpwXu4nGmsJDnNTU34Hh9
         6/i/TQQ1NbuyKJYpe4hPrtWe70ECqRFJoCOWZgsU=
Received: by mail-yb1-f172.google.com with SMTP id s8so2225238yba.13;
        Tue, 01 Dec 2020 07:50:41 -0800 (PST)
X-Gm-Message-State: AOAM531/SlNtlJFYd/kTkfrc/cZXJFH5SwYLrnrnu5J1G/KMaGl006sl
        fXZmBkJ8IerwiGIcUvSYdkExIqBsAjD55hbuBjw=
X-Google-Smtp-Source: ABdhPJwlRbiyuko5jdeqhi5YEFdXPQ6zEuSN349AgsmyyWjcElmhcbPPjEuYreBsAU023iCYpnCQs8p8Rs/BnCHJ/AM=
X-Received: by 2002:a4a:eac1:: with SMTP id s1mr2310247ooh.15.1606837839133;
 Tue, 01 Dec 2020 07:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap> <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia> <20201201154139.GF2401593@piout.net>
In-Reply-To: <20201201154139.GF2401593@piout.net>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 1 Dec 2020 16:50:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
Message-ID: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "tony@atomide.com" <tony@atomide.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "will@kernel.org" <will@kernel.org>,
        "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "James.Bottomley@HansenPartnership.com" 
        <James.Bottomley@hansenpartnership.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        "paulus@samba.org" <paulus@samba.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 1, 2020 at 4:41 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 01/12/2020 14:40:53+0000, Catalin Marinas wrote:
> > On Mon, Nov 30, 2020 at 07:50:25PM +0000, ZHIZHIKIN Andrey wrote:
> > > From Krzysztof Kozlowski <krzk@kernel.org>:

> > I tried to convince them before, it didn't work. I guess they don't like
> > to be spammed ;).
>
> The first rule of arm-soc is: you do not talk about arm@ and soc@

I don't mind having the addresses documented better, but it needs to
be done in a way that avoids having any patch for arch/arm*/boot/dts
and arch/arm/*/configs Cc:d to soc@kernel.org.

If anyone has suggestions for how to do that, let me know.

> > Or rather, SoC-specific patches, even to defconfig,
> > should go through the specific SoC maintainers. However, there are
> > occasional defconfig patches which are more generic or affecting
> > multiple SoCs. I just ignore them as the arm64 defconfig is usually
> > handled by the arm-soc folk (when I need a defconfig change, I go for
> > arch/arm64/Kconfig directly ;)).
>
> IIRC, the plan was indeed to get defconfig changes through the platform
> sub-trees. It is also supposed to be how multi_v5 and multi_v7 are
> handled and they will take care of the merge.

For cross-platform changes like this one, I'm definitely happy to
pick up the patch directly from soc@kernel.org, or from mailing
list if I know about it.

We usually do the merges for the soc tree in batches and rely
on patchwork to keep track of what I'm missing, so if Olof and
I are just on Cc to a mail, we might have forgotten about it
by the time we do the next merges.

      Arnd
