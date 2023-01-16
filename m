Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F7F66D03C
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 21:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjAPUcn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 15:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbjAPUcm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 15:32:42 -0500
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B832A165
        for <linux-mips@vger.kernel.org>; Mon, 16 Jan 2023 12:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=dxZrgiFiSWE0neC/Zn81efMq20upjy192H3IxuR5/u8=;
        b=acpUj4knulQkBKBaY+52P5qMowzl3CqetGOVLg/297AeK+8Ryp/AKK2Xhs78wcpqAWKMYggzJWDzB
         biPi7fjApEW+sEGRVKj43UtyH27cyE30zC5xeKBIWLeDxMvBMaWIQ9C2KNsct8BVV/z5Xi2Z9xmXdN
         iB2Tp6//DgFIal9nwQvjsa5mljq2hOLf4Zl++xLkESSZCEU8Wx7V/M8Yabz6d5rgsJjERIdkci8tJF
         BzJIC9Ass7ItSJBCwTMvAx3dwBffjSnlLBYYHAB6/KYGwz02LqImL0TBBlVYOqzuWH81uTr8k+kGQw
         oF52hXCmjcfEX0rspiuM5UBSj5DoeAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=dxZrgiFiSWE0neC/Zn81efMq20upjy192H3IxuR5/u8=;
        b=R3QeKkvU5DTf1usW/irfIsJev9hjfAQvABn1WhWFZnkOGF2yihtMhXjFJCHCSPYm0dh3TEmBVSzY6
         8ufGRagDA==
X-HalOne-ID: c3e8962f-95dc-11ed-8539-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay5 (Halon) with ESMTPSA
        id c3e8962f-95dc-11ed-8539-7703b0afff57;
        Mon, 16 Jan 2023 20:31:35 +0000 (UTC)
Date:   Mon, 16 Jan 2023 21:31:34 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 18/22] drm/sun4i: Remove unnecessary include statements
 for drm_crtc_helper.h
Message-ID: <Y8W0JnmbyQnObFa+@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-19-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 16, 2023 at 02:12:31PM +0100, Thomas Zimmermann wrote:
> Several source files include drm_crtc_helper.h without needing it or
> only to get its transitive include statements; leading to unnecessary
> compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 477cb6985b4d..37dc66332bbd 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -8,8 +8,8 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_modeset_helper_vtables.h>

Move one up to maintain sorting.
With that fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  #include <drm/drm_simple_kms_helper.h>
>  
>  #include "sun8i_dw_hdmi.h"
> -- 
> 2.39.0
