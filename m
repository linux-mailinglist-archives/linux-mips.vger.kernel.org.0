Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387652C8D58
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 19:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388052AbgK3Sxv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 13:53:51 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55583 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387915AbgK3Sxv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 13:53:51 -0500
Received: by mail-wm1-f65.google.com with SMTP id x22so304124wmc.5;
        Mon, 30 Nov 2020 10:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wNVU7Wnc+eaUIFVNFzSXWeay3XxE3SLhhM3FYJKrr3g=;
        b=bMQCXRJMQZmblMVtTTURIL7z84TK54YdBQkh8a8RSQK2ZctMe9b3yKSGIHiCTTNvDI
         K0pBKSoIqbHXbQeLntjZmqMoqfFr39oik6sjX2EbtknAiqAWNtfrQoOPrFTek9V5nypf
         VnP8YTaxrBoNRMnOeuRlCiwqt7F11ef9zLnC53MXa+j7YGTVgAI1fvX2fYVnw7DBlRFR
         6PdiU5C1De0h0KZVFjEhDCfBcSMOUm4vjPdn+KV6zWH+Yx1+EeN/DO+ATUTSHWr5bg1s
         o7VDeVbgD2umpvsi8V/TY4f3Dl4MidVlfRg1gax+RPTLrCh8OCWtmQP6hPynYFiUsvoY
         oD1w==
X-Gm-Message-State: AOAM532Cd5OEYTR1hUg0qQrlPRwV0xe1nnlC+N2hHlwNqvHVgcGjX0LP
        l0X4ptjwQn2HQoizkz86RtM=
X-Google-Smtp-Source: ABdhPJw2FpgOR9PNeU1ye9qy5ni/TqLv9KVWJBGLmFHBKrWivAMsq4H9XX+Pn9Oe2EPE53IGBG4kBQ==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr195572wmb.175.1606762388808;
        Mon, 30 Nov 2020 10:53:08 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b73sm903707wmb.0.2020.11.30.10.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:53:07 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:53:04 +0200
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
Subject: Re: [PATCH 2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC
 option
Message-ID: <20201130185304.GB29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-3-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-3-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:34PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from arm64 configuration.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

The same trouble as with ARM patch - this should go directly via
arm-soc.

Best regards,
Krzysztof
