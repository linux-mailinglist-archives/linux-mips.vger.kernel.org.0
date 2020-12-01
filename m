Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35ECE2CAD95
	for <lists+linux-mips@lfdr.de>; Tue,  1 Dec 2020 21:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgLAUp3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Dec 2020 15:45:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:37198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727764AbgLAUp3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Dec 2020 15:45:29 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 295B422250;
        Tue,  1 Dec 2020 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606855488;
        bh=UFEBHXg8TVXYu2V42/6zenhsEaO7jAcjOCzMkhg+LBE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lwlru6BYBaQkldbv5U24rjcM8VjychQZXi28eVSbUL5E58zO63hAOFrsZ5UmxL/b/
         6qjv7C7dxujv3yUoZVgH3BWI7DuQik/X+pk21WSsPL+iXb/qGJIT0jhf4F/pRRcuBy
         NO5ghpzT4kdg2RcruQ/Sg3hqAyPMNEr1E/aa4JBw=
Received: by mail-oi1-f175.google.com with SMTP id t9so2136694oic.2;
        Tue, 01 Dec 2020 12:44:48 -0800 (PST)
X-Gm-Message-State: AOAM531znyYIoZ+Mwh+hmrK5GRtkyR9drbk6GVT+GcdK6rrHM5xKZosX
        lPPy4cYzdnU9nRawuD3NYvaBfxhbAjzO0IXFr5c=
X-Google-Smtp-Source: ABdhPJx3HpJhpKp7V1wx4hETSd/vq2BWsy3Lzp9NXDHTg0LYmh47Db0gDHt2H1j7zyKtvEwaw8HufP+JviyrmLq6s74=
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr3002783oig.4.1606855486726;
 Tue, 01 Dec 2020 12:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap> <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia> <20201201154139.GF2401593@piout.net>
 <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com> <AM6PR06MB4691A5E1603BBE57F35F3B17A6F40@AM6PR06MB4691.eurprd06.prod.outlook.com>
In-Reply-To: <AM6PR06MB4691A5E1603BBE57F35F3B17A6F40@AM6PR06MB4691.eurprd06.prod.outlook.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 1 Dec 2020 21:44:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1QC+582vyxiGOtE3-17m8rbadtrN4yyaGozOP+fEf-3A@mail.gmail.com>
Message-ID: <CAK8P3a1QC+582vyxiGOtE3-17m8rbadtrN4yyaGozOP+fEf-3A@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
To:     ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
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

On Tue, Dec 1, 2020 at 8:48 PM ZHIZHIKIN Andrey
<andrey.zhizhikin@leica-geosystems.com> wrote:
> Hello Arnd,
> > > > Or rather, SoC-specific patches, even to defconfig, should go
> > > > through the specific SoC maintainers. However, there are occasional
> > > > defconfig patches which are more generic or affecting multiple SoCs.
> > > > I just ignore them as the arm64 defconfig is usually handled by the
> > > > arm-soc folk (when I need a defconfig change, I go for
> > > > arch/arm64/Kconfig directly ;)).
> > >
> > > IIRC, the plan was indeed to get defconfig changes through the
> > > platform sub-trees. It is also supposed to be how multi_v5 and
> > > multi_v7 are handled and they will take care of the merge.
> >
> > For cross-platform changes like this one, I'm definitely happy to pick up the
> > patch directly from soc@kernel.org, or from mailing list if I know about it.
>
> Should I collect all Ack's and re-send this series including the list "nobody
> talks about" :), or the series can be picked up as-is?
>
> Your advice would be really welcomed here!

Yes, please do, that makes my life easier. I would apply the patches
for arch/arm and arch/arm64 when you send them to soc@kernel.org,
the others go to the respective architecture maintainers, unless they
want me to pick up the whole series.

      Arnd
