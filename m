Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07D966D038
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 21:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjAPUcG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 15:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjAPUcF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 15:32:05 -0500
X-Greylist: delayed 964 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 12:32:04 PST
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EB72A16B
        for <linux-mips@vger.kernel.org>; Mon, 16 Jan 2023 12:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=qWZKxlX4KW/JmPpNe4hoOYISYsciP5gHQlpn+CvfXf8=;
        b=kt2RebpVMaIBssccQkMEgek+nwW85G6J0siMHGZ1qETVQeJlMBKmjG0mlVm3r7ePnu8jfPm81ygq7
         Mz8rQydCpwnm7+yWjbjNIN/fzDJe5WsKcBoAUsBadcQc0vOYb6T41tQjEeU/05VcOGjEkJnNNqYFDv
         W6Hs6b61sUUwtJAeXWksNEBFK4Y9hM1amCX4haYovx3yLNNcTv+aB4AWsRcwfANqGXT1LV3gcWRrqV
         ROUTznYXXwPl8HONFIMoZCbhWD4ezvanZv5cXNNxoJUbsVJ4K/EAnSMi/8BPSb4nuXYYFMXiL4SyAH
         nCwGrMJpVzOvZphymhAQroedp3D9X1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=qWZKxlX4KW/JmPpNe4hoOYISYsciP5gHQlpn+CvfXf8=;
        b=xE4aoD0tRO5MstpdlKpx4S2jKlZCleYS/37b6LqWjWapIOw44SoqoiaLAWrBeI0WODd2oUSv6O6cJ
         cNcxfeJCQ==
X-HalOne-ID: 90146bb7-95da-11ed-afa2-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay1 (Halon) with ESMTPSA
        id 90146bb7-95da-11ed-afa2-11abd97b9443;
        Mon, 16 Jan 2023 20:15:49 +0000 (UTC)
Date:   Mon, 16 Jan 2023 21:15:47 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 02/22] drm: Remove unnecessary include statements for
 drm_crtc_helper.h
Message-ID: <Y8Wwcy3LuknhDQz1@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-3-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas.

On Mon, Jan 16, 2023 at 02:12:15PM +0100, Thomas Zimmermann wrote:
> Several DRM core and helper source files include drm_crtc_helper.h
> without needing it or only to get its transitive include statements;
> leading to unnecessary compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible. The header file, drm_fixed.h, includes <linux/kernel.h>
> for lower_32_bits().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_crtc_helper.c  | 1 -
>  drivers/gpu/drm/drm_lease.c        | 2 +-
>  drivers/gpu/drm/drm_plane_helper.c | 1 -
>  include/drm/drm_fixed.h            | 1 +
>  4 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index a209659a996c..e7a23e18140c 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -39,7 +39,6 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_crtc_helper.h>

drm_crtc_helper.c may not require drm/drm_crtc_helper.h, but it should
include it so we get a warning in case there is a mismatch between the
header file and the implementation.
I think sparse would also complain that the function is not declared
or something like that.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 08ab75303a00..150fe1555068 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -6,7 +6,7 @@
>  #include <linux/uaccess.h>
>  
>  #include <drm/drm_auth.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_lease.h>
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index ba6a9136a065..c91e454eba09 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -28,7 +28,6 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_uapi.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 553210c02ee0..255645c1f9a8 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -25,6 +25,7 @@
>  #ifndef DRM_FIXED_H
>  #define DRM_FIXED_H
>  
> +#include <linux/kernel.h>
>  #include <linux/math64.h>
>  
>  typedef union dfixed {
> -- 
> 2.39.0
