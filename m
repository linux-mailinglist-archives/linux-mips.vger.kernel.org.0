Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF272C8D6B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 19:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388263AbgK3SyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 13:54:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45764 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388189AbgK3SyM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 13:54:12 -0500
Received: by mail-wr1-f65.google.com with SMTP id t4so17565296wrr.12;
        Mon, 30 Nov 2020 10:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mtWjhyJKSY07pJm4d9iFY7jeF0Tu5I4taqa0sRTC28A=;
        b=SZIKxLLQ2BouUMWT+dUuGmV4eTAGQU3NYFSdsphElYOgBo1C9aO2tDvgQsoZSOPUdO
         98A9IKxmfocXo8MDCp7VqXaLXDHbqJhDcN0kfNO5mZlPyaBbHeGW4a0vUo5wdfVRZBlu
         c7LW3T1a3KRHPWdX/LKBERwz2cq5e5rZ45LiSlWiKRs11cGyQz0VJ7ICDgn6OG2NcncU
         mwr9QeTL0U1tkPVgjeoRxJl19BBzT6fAnFVepy8ZsVdWwbJe5eL/Qg13LER9ij6dtFrq
         Jk+IlHtJaFe0SkJf13yT81XFtlZWVy3M6BeMwIl0UV3zXnHZr4dSMIDLCHV2XSl+5WZ6
         vtbg==
X-Gm-Message-State: AOAM531ILtcNsNL/B+Lt22JQ/wOO+7m0Mfrxs1nNSNnx23i9B1UkwyHo
        I/mlFqpdVwXzJpMHxwLqzdU=
X-Google-Smtp-Source: ABdhPJwXa0AqF81gvDse9p0Yw/CaQ7O2QUQTvVTmgvjzB90sBz+llfV2kANrqxAIRMnHg7L2O6jxCw==
X-Received: by 2002:adf:f441:: with SMTP id f1mr30343737wrp.225.1606762409693;
        Mon, 30 Nov 2020 10:53:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id u23sm245138wmc.32.2020.11.30.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:53:28 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:53:26 +0200
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
Subject: Re: [PATCH 3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185326.GC29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-4-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-4-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:35PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from all MIPS configurations.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/mips/configs/gcw0_defconfig      | 1 -
>  arch/mips/configs/gpr_defconfig       | 1 -
>  arch/mips/configs/lemote2f_defconfig  | 1 -
>  arch/mips/configs/loongson3_defconfig | 1 -
>  arch/mips/configs/mtx1_defconfig      | 1 -
>  arch/mips/configs/rs90_defconfig      | 1 -
>  6 files changed, 6 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
