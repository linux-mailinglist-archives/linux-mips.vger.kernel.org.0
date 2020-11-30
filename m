Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D262C8D79
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 19:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388309AbgK3Syp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 13:54:45 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39148 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387844AbgK3Syo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 13:54:44 -0500
Received: by mail-wr1-f65.google.com with SMTP id e7so17625396wrv.6;
        Mon, 30 Nov 2020 10:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J0Y4dG+GSInC75horYKTdpMJ72uEPkG0rsUqEhklRfs=;
        b=JuDjKMplGvK1DbOaNdKf6Xr7lr3u8PEY/yJg4ce/TYevvM1Cl1hE3UW7Si3wee6VKa
         xn7aAkCkq+NSTy9k411R297qq0sXSX3CbJx89hDDH7UwZzks6u0TqDhOBAKErsMY3WqJ
         tzrQNdc3aID2b3T8VFEBAxb/lutAewEftjXdvD0WGe9tO91lvAYUG5lxS/lwLHsWr79P
         YV1eDWfTACHfGD0HEDuir7d70p1muggLnNgFn8RSpHsfEmPIcdZd2ZqSygYV9luO/Cgg
         MxeFRm2mxrbnhuqT+VQ8AHBqPWOVnJRb0H8ayIWQaD4CLwjUcmjJjJc8EYvsM9CqAzvQ
         fgYA==
X-Gm-Message-State: AOAM533RaJJ7ekDlFJGbKJ43IKC38ZUlrMwB8tX/rOo66tcOVJPu22Co
        EIILSYCtdw7Px9btF9ot5H4=
X-Google-Smtp-Source: ABdhPJzaY6oSMK9XtE7h+p3mGfqluRRVSwB1Bil1Ye28LiLYVgIzYdnlv4x47IHxrw1EjuGuSJVlFg==
X-Received: by 2002:a5d:688b:: with SMTP id h11mr29587757wru.417.1606762442112;
        Mon, 30 Nov 2020 10:54:02 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id w5sm24515754wrm.29.2020.11.30.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:54:00 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:53:59 +0200
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
Subject: Re: [PATCH 5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185359.GE29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:37PM +0000, Andrey Zhizhikin wrote:
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
>  arch/powerpc/configs/powernv_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
