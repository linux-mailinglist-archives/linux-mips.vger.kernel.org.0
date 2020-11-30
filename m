Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8642C8D43
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 19:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgK3SxO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 13:53:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33281 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbgK3SxO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 13:53:14 -0500
Received: by mail-wr1-f68.google.com with SMTP id u12so17644296wrt.0;
        Mon, 30 Nov 2020 10:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GEH2GiLihB/we0wTKIA4s4JgPz0UXo9ohOBmB1H6nPM=;
        b=V+rF0pza/okMpu2aZmpaMNubmUnOIFjkhuuyu1XDNgS6rguJEgw5LouLfCTDfBhCc2
         k5sW/aEZBGG/L9nGxvhY+NLU2bi082eT9b9z5VqKZHrGhEMZd3UByx3dl5alrGd0Xlgr
         9PKoUPCs5TpFq+bKYMpH1W4OvUi2U1U0e3FFkZ8MB6lKFiYjs8B+EXlVFGCGsdqKeKBC
         9qp43T7E5PXarXuRVwlcaXtXGZ5LyeTuvp6GSMlLCNxLFHvedUtfEMaIQw3tRBK7cLnz
         zfYsjSjAEj9LGXl9noORIy79oYyB0sNDdDbQ+L+kIR4tfVSuncns4AkRJiqIvtQ2nYGA
         Gw3Q==
X-Gm-Message-State: AOAM532ajNItpPPkE4KoCpgoqvJDnRGmEx3iBtblw9oHmuhKw/R/c3Yc
        TGzufi6piJZ6byIDgjkjzdo=
X-Google-Smtp-Source: ABdhPJz821U/zJI64E/s1m2nEjCfNrUEUrLV+rXCVRdKBs+Xe9IzhenHRej5zcolpGNDRBBoo4I2dA==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr29689107wrr.64.1606762350398;
        Mon, 30 Nov 2020 10:52:30 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q25sm258812wmq.37.2020.11.30.10.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:52:29 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:52:27 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, sam@ravnborg.org,
        emil.l.velikov@gmail.com, daniel.thompson@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185227.GA29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:33PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from all ARM configurations.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/arm/configs/at91_dt_defconfig        | 1 -
>  arch/arm/configs/cm_x300_defconfig        | 1 -
>  arch/arm/configs/colibri_pxa300_defconfig | 1 -
>  arch/arm/configs/jornada720_defconfig     | 1 -
>  arch/arm/configs/magician_defconfig       | 1 -
>  arch/arm/configs/mini2440_defconfig       | 1 -
>  arch/arm/configs/omap2plus_defconfig      | 1 -
>  arch/arm/configs/pxa3xx_defconfig         | 1 -
>  arch/arm/configs/qcom_defconfig           | 1 -
>  arch/arm/configs/sama5_defconfig          | 1 -
>  arch/arm/configs/sunxi_defconfig          | 1 -
>  arch/arm/configs/tegra_defconfig          | 1 -
>  arch/arm/configs/u8500_defconfig          | 1 -
>  13 files changed, 13 deletions(-)

You need to send it to arm-soc maintainers, otherwise no one might feel
responsible enough to pick it up.
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

+CC Arnd and Olof,

Dear Arnd and Olof,

Maybe it is worth to add arm-soc entry to the MAINTAINERS file?
Otherwise how one could get your email address? Not mentioning the
secret-soc address. :)

Best regards,
Krzysztof
