Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8748346F7D
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 03:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhCXC0I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 22:26:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhCXCZe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 22:25:34 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92A7F580;
        Wed, 24 Mar 2021 03:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616552732;
        bh=yQk2Et593ck5JEiyof4AfzdzEASSQa7eRxQPm/iZHL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G2hljkGBJ/mQhub4L5wvIJdf4861qlayDfVzGuRCTTzaNOlR9aKpRt1plscTOnnba
         q1C/7dP/0GIWrdAEe7BB+4TcFQIsg+X2oiHmU40HfBZdOf7dCk8CmGMOd2UuFMGew4
         WjRgoZ2RlK+oWWWmGx0yX/CaePyL/BOYxTBQ+OZg=
Date:   Wed, 24 Mar 2021 04:24:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, od@zcrc.me,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 2/4] drm/simple_kms_helper: Add macro
 drmm_plain_simple_encoder_alloc()
Message-ID: <YFqi8v49Gckca7CO@pendragon.ideasonboard.com>
References: <20210124085552.29146-1-paul@crapouillou.net>
 <20210124085552.29146-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210124085552.29146-3-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Sun, Jan 24, 2021 at 08:55:50AM +0000, Paul Cercueil wrote:
> This performs the same operation as drmm_simple_encoder_alloc(), but
> only allocates and returns a struct drm_encoder instance.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/drm/drm_simple_kms_helper.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index e6dbf3161c2f..f07e70303cfb 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -209,4 +209,21 @@ void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
>  					     offsetof(type, member), \
>  					     encoder_type))
>  
> +/**
> + * drmm_plain_simple_encoder_alloc - Allocate and initialize a drm_encoder
> + *                                   struct with basic functionality.
> + * @dev: drm device
> + * @encoder_type: user visible type of the encoder
> + *
> + * This performs the same operation as drmm_simple_encoder_alloc(), but
> + * only allocates and returns a struct drm_encoder instance.
> + *
> + * Returns:
> + * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
> + */
> +#define drmm_plain_simple_encoder_alloc(dev, encoder_type) \
> +	((struct drm_encoder *) \
> +	 __drmm_simple_encoder_alloc(dev, sizeof(struct drm_encoder), \
> +				     0, encoder_type))
> +

As this isn't related to the simple encoder helper anymore, how about
using __drmm_encoder_alloc instead ?

#define drmm_plain_simple_encoder_alloc(dev, encoder_type) \
	((struct drm_encoder *) \
	__drmm_encoder_alloc(dev, sizeof(struct drm_encoder), 0, NULL, \
			     encoder_type, NULL))

I'd also rename the macro to drmm_plain_encoder_alloc(), and move it to
drm_encoder.h. That way drivers that don't need the simple KMS helper
won't have to select it just for this.

>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */

-- 
Regards,

Laurent Pinchart
