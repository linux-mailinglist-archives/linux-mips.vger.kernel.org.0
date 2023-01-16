Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5544566D00A
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 21:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbjAPUT2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 15:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233631AbjAPUT1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 15:19:27 -0500
X-Greylist: delayed 143 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 12:19:25 PST
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC76D83C5
        for <linux-mips@vger.kernel.org>; Mon, 16 Jan 2023 12:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=bytMIduQNheRqZe6kytm7ykaGcqK/vKRwfXEFkmSQ90=;
        b=QyWyNEP/8+tGmIwWiEt9T7RyGf/vIOdDrLK40zukj0pdscxv8+C/qAH+sgoBlHmgjVIefXoSUF4jH
         Xt9O1NouPoVELk7nTE/xW6hIZBEW1ZJ6Qr2QTro/02sZYiWpOed3SFv1PerB5de3A/aXdMVkw82Cz0
         wZjKtq+ux5P3qYOysPwrHB5utIaKFtMxIf3ybwGNSOQunHtchICX6AFPhIUSSPHjbe7VjamdWH/T4A
         am9/LBvAr5TLWp3D5Dtrz2asFE6c2vHwR/p25qvtnYe1GeIrrCCygm9z5knlSWirunI6DZHRTMEKVm
         vTANNZ/ycTbCK28vo9dFA/JId2NgLyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=bytMIduQNheRqZe6kytm7ykaGcqK/vKRwfXEFkmSQ90=;
        b=vtzSjnBZqhZ4qvoCa9tGfq1uiYGVTigg/jlRxjalISRNzouXb9Cok8iKjyjF61/lGG6D46KLzGBKy
         7zf9MIgCA==
X-HalOne-ID: eb382d74-95da-11ed-b179-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3 (Halon) with ESMTPSA
        id eb382d74-95da-11ed-b179-ede074c87fad;
        Mon, 16 Jan 2023 20:18:21 +0000 (UTC)
Date:   Mon, 16 Jan 2023 21:18:20 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 03/22] drm/amdgpu: Remove unnecessary include statements
 for drm_crtc_helper.h
Message-ID: <Y8WxDCtn8HriRhyG@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-4-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 16, 2023 at 02:12:16PM +0100, Thomas Zimmermann wrote:
> Several source files include drm_crtc_helper.h without needing it or
> only to get its transitive include statements; leading to unnecessary
> compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c     | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c    | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c   | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c        | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h       | 1 -
>  drivers/gpu/drm/amd/amdgpu/atombios_crtc.c     | 1 -
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 1 -
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         | 2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         | 2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          | 2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          | 2 ++
>  12 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 2ebbc6382a06..3c962d0214cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -25,7 +25,9 @@
>   */
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 0993ee91fe18..63122482208d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_crtc_helper.h>
Move it one line up to keep the sorting.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include <linux/vgaarb.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b22471b3bd63..c5b98e9a69e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_modeset_helper.h>
>  #include <drm/drm_vblank.h>
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
> index c96e458ed088..27a782a9dc72 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
> @@ -24,7 +24,6 @@
>   *          Alex Deucher
>   */
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include "amdgpu.h"
>  #include "amdgpu_connectors.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index a6aef488a822..d0a1cc88832c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -45,7 +45,6 @@
>  #include <linux/irq.h>
>  #include <linux/pci.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/amdgpu_drm.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 8a39300b1a84..cf4b6e8d7d1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -35,7 +35,6 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fixed.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_probe_helper.h>
>  #include <linux/i2c.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
> index afad094f84c2..10098fdd33fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
> @@ -24,7 +24,6 @@
>   *          Alex Deucher
>   */
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include <drm/drm_fixed.h>
>  #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index 18ae9433e463..d95b2dc78063 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -28,7 +28,6 @@
>  
>  #include <acpi/video.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include "amdgpu.h"
>  #include "amdgpu_connectors.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index a2452fc304c5..01d1e2a631be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -22,6 +22,8 @@
>   */
>  
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 6ac680c4c6e2..973abe989ebe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -22,6 +22,8 @@
>   */
>  
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 354ae09cc9a2..86e95b1c9d0e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -24,6 +24,8 @@
>  #include <linux/pci.h>
>  
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 33977b0ba19d..f81f1d5d3e8a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -22,6 +22,8 @@
>   */
>  
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_vblank.h>
>  
>  #include "amdgpu.h"
> -- 
> 2.39.0
