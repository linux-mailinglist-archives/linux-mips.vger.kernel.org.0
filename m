Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808C52C8D74
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 19:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388288AbgK3Sy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 13:54:26 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50535 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388286AbgK3SyZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 13:54:25 -0500
Received: by mail-wm1-f67.google.com with SMTP id c198so345294wmd.0;
        Mon, 30 Nov 2020 10:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wEkOn9qoquG6oipNfPDzFFz3fOS5TO34T/W7axYneSU=;
        b=Cbr0DpqxVxCWwHiRadLIzOhhckKDNWlQBVCm8Ojvinw+1PZeF/AHHnBF3IyoqZI8er
         +LAIe0ZoUrN+p1FzxXUsjDaVIWU5U8oF5NQeVdPmhsrkBPZNN50KJKf6DELdNzQq4UO7
         11vgZBTRaqHbo0CJTo9ExZwSTce95xUdev2EikI05MjFndm2riJGILqYMBvBDDnftulJ
         SO06KDMBD5CFU/MWU3sYnPj0OJ6LN56zfKFD8KpcmOWS67tE2nl3G4WaFfO0Qjjwlenw
         wJ0hkU3BQTbJz+tS4qbeJj2JU0A91L3ZcgyBpUAiMbJaT2f4rbQ914fe4NH4teetaNgp
         gYvg==
X-Gm-Message-State: AOAM530f4fStRKRHAXudWG2f6kCuJYR7zr0n8oLTBbKXUyEDnumLKOrr
        oeSXbQUnKsiwPb6C1Y9MI7s=
X-Google-Smtp-Source: ABdhPJwJyfKuo4W0SYlWBb6ad73QnSfb9L/S1W/eDIgjHJlVVga+I2lNoxlbYCTXknSlY8aka5Q2Ng==
X-Received: by 2002:a1c:56c4:: with SMTP id k187mr251200wmb.92.1606762423516;
        Mon, 30 Nov 2020 10:53:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id u203sm246654wme.32.2020.11.30.10.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:53:42 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:53:40 +0200
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
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/5] parisc: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185340.GD29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-5-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-5-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:36PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from generic-64bit_defconfig.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/parisc/configs/generic-64bit_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
