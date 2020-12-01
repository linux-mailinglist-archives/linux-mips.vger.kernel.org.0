Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19082CAE47
	for <lists+linux-mips@lfdr.de>; Tue,  1 Dec 2020 22:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbgLAVTg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Dec 2020 16:19:36 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:45945 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729883AbgLAVTf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Dec 2020 16:19:35 -0500
Received: by mail-ej1-f66.google.com with SMTP id qw4so7277470ejb.12;
        Tue, 01 Dec 2020 13:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jryqI5sQqWi4PXznClcMpjDSZfGYWOSS95XBGrU9xYM=;
        b=GkhvCORVvg1kt+1N8y3nenDNiyBtA5+59dHp9uQqPpLMnY8Xld+GUV2p93cPPy7cuk
         /NKYKy/yK+iMWN7SU5Pl1IQAo38eviLMQIWXTP1HxbZI3LKFJ4VR9OwYkPdhpxm1SWOn
         XHh4ZQLffJiLtbMXa1rxxUpNT6nklJEP29kiJOvSQbSVip+eDe9uBagIDxtwZQZ0KcHA
         3MuPcGePNTzyBgMPm5RnpOr6PoJXJm9aDTUZOjRt5DXhiUnwabMN65q7XlmGOLcw6w/2
         hBAg/ic6XwhiaBmrPAEWGGVFxA6P2Q9/60CCPazGFLAymLJVvXXPJ4XzH66Takwc6mFU
         YKPA==
X-Gm-Message-State: AOAM53249uaSjuQdkhcIj/EWk83n7xNCxL01ylhu1EFY5DA92SIzc2Et
        SeXfGIlGwUimfkb9k15+wOQ=
X-Google-Smtp-Source: ABdhPJwVCwY+a1v0Hv+LTfv/oplZ+OnT3nmymHRP5j+/8a+SofJfABEbDHeJGwHTKrcOyfGOWnoRIA==
X-Received: by 2002:a17:906:2e16:: with SMTP id n22mr5070528eji.477.1606857532633;
        Tue, 01 Dec 2020 13:18:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d14sm484594edu.63.2020.12.01.13.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:18:51 -0800 (PST)
Date:   Tue, 1 Dec 2020 23:18:49 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>,
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
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201201211849.GA23379@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia>
 <20201201154139.GF2401593@piout.net>
 <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 01, 2020 at 04:50:22PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 1, 2020 at 4:41 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 01/12/2020 14:40:53+0000, Catalin Marinas wrote:
> > > On Mon, Nov 30, 2020 at 07:50:25PM +0000, ZHIZHIKIN Andrey wrote:
> > > > From Krzysztof Kozlowski <krzk@kernel.org>:
> 
> > > I tried to convince them before, it didn't work. I guess they don't like
> > > to be spammed ;).
> >
> > The first rule of arm-soc is: you do not talk about arm@ and soc@
> 
> I don't mind having the addresses documented better, but it needs to
> be done in a way that avoids having any patch for arch/arm*/boot/dts
> and arch/arm/*/configs Cc:d to soc@kernel.org.
> 
> If anyone has suggestions for how to do that, let me know.

Not a perfect solution but something. How about:
https://lore.kernel.org/linux-arm-kernel/20201201211516.24921-2-krzk@kernel.org/T/#u

Would not work on defconfigs but there is a chance someone will find
your addresses this way. Should not cause to much additional traffic.

Best regards,
Krzysztof

