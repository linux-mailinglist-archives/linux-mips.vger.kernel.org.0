Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4143FE426
	for <lists+linux-mips@lfdr.de>; Wed,  1 Sep 2021 22:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhIAUkS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 1 Sep 2021 16:40:18 -0400
Received: from aposti.net ([89.234.176.197]:60424 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhIAUkS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Sep 2021 16:40:18 -0400
Date:   Wed, 01 Sep 2021 21:39:02 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 08/16] MIPS: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <21WRYQ.3FG7R58QMYBX2@crapouillou.net>
In-Reply-To: <20210901131531.v3.8.Ic7a6e3f8dd4760a302c91320843be5a00206bd63@changeid>
References: <20210901201934.1084250-1-dianders@chromium.org>
        <20210901131531.v3.8.Ic7a6e3f8dd4760a302c91320843be5a00206bd63@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Douglas,

Le mer., sept. 1 2021 at 13:19:26 -0700, Douglas Anderson 
<dianders@chromium.org> a écrit :
> In the patch ("drm/panel-simple-edp: Split eDP panels out of
> panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> give everyone who had the old driver enabled the new driver too. If
> folks want to opt-out of one or the other they always can later.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  arch/mips/configs/qi_lb60_defconfig | 1 +
>  arch/mips/configs/rs90_defconfig    | 1 +

The SoCs on these two boards don't support eDP, you can drop this patch.

Cheers,
-Paul

>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/mips/configs/qi_lb60_defconfig 
> b/arch/mips/configs/qi_lb60_defconfig
> index b4448d0876d5..3e99e223ea02 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -72,6 +72,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_DRM=y
>  CONFIG_DRM_FBDEV_OVERALLOC=200
>  CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_DRM_PANEL_SIMPLE_EDP=y
>  CONFIG_DRM_INGENIC=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
>  # CONFIG_VGA_CONSOLE is not set
> diff --git a/arch/mips/configs/rs90_defconfig 
> b/arch/mips/configs/rs90_defconfig
> index 7ce3b814fdc8..42b4f621cbfa 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -94,6 +94,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_DRM=y
>  CONFIG_DRM_FBDEV_OVERALLOC=300
>  CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_DRM_PANEL_SIMPLE_EDP=y
>  CONFIG_DRM_INGENIC=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_PWM=y
> --
> 2.33.0.259.gc128427fd7-goog
> 


