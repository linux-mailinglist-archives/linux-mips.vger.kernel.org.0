Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7822C8F19
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 21:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbgK3UZr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 15:25:47 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:34183 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728678AbgK3UZq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 15:25:46 -0500
Received: by mail-ej1-f66.google.com with SMTP id s13so9032356ejr.1;
        Mon, 30 Nov 2020 12:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6b8ivBM6Oli9oGtMf1yFdu9kCZLwCSACgZwbQBElQoI=;
        b=ahIHr+EoS5fdRtzvvQoehDocex+WXu512OMyrcKGyNeArt2PUCHY9aNiaCdwfJtEqJ
         JZW3poPLEe2Et5KiXHwM0FUAGzPMDzqCW9OHkvbzMjZWqOg9f6XkGSwjuLaU5+i/TTRo
         PcxjWF3h/9JqYvVN4F5jCrGm2StTPgk+QJ/W1MEeg8jaHn3DScJw0+aGn7KyiFCPufvH
         aQVMhzOZEATu12ObX6Z8tswOGmxZotI/v112GSFKxEeeLHeySS5y/CSyC9HszhfiIqVY
         1iajfcYTsEdzAJK8DPICMBusiWMyG4yxBZBKHp6iHRRpibcuMCgblLzT/pU0xqw/UPvG
         cmYg==
X-Gm-Message-State: AOAM533a5WFRkQXyt73hoFzDamBb7KrYE2tLrSMHZM1+FLeqPdHvJius
        DCZZ0NaBP+yICa/i7X6EBgk=
X-Google-Smtp-Source: ABdhPJw43jHKCvzH5Ol/kuo8r2wqVPMFZO5f2gIMAGv9wMfgdu/Cmqi+0WgCA6uoH1f+BQqe2EHDSQ==
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr7922380ejj.105.1606767904160;
        Mon, 30 Nov 2020 12:25:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q24sm9418511edw.66.2020.11.30.12.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 12:25:03 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:25:01 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, emil.l.velikov@gmail.com,
        daniel.thompson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130202501.GA32878@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130191133.GA1565464@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130191133.GA1565464@ravnborg.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 08:11:33PM +0100, Sam Ravnborg wrote:
> On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> > Since the removal of generic_bl driver from the source tree in commit
> > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > therefore subject to clean-up from all configuration files.
> > 
> > This series introduces patches to address this removal, separated by
> > architectures in the kernel tree.
> > 
> > Andrey Zhizhikin (5):
> >   ARM: configs: drop unused BACKLIGHT_GENERIC option
> >   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
> >   MIPS: configs: drop unused BACKLIGHT_GENERIC option
> >   parisc: configs: drop unused BACKLIGHT_GENERIC option
> >   powerpc/configs: drop unused BACKLIGHT_GENERIC option
> 
> For defconfigs I expect arch maintainers to do a make xxxdefconfig / make
> savedefconfig / cp defconfig ... run now and then - this will remove
> all such symbols.

savedefconfig can be tricky because of risk of loosing options:
1. it will remove options which became the default or became selected,
2. later when the default is changed or selecting option is removed, the
   first option from #1 will not be brought back.

This was already for example with DEBUG_FS and the conclusion that time
was - do not run savedefconfig automatically.

Therefore if some symbol(s) can be safely removed, patch is welcomed.

Best regards,
Krzysztof

> 
> If the patches goes in like they are submitted then:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
