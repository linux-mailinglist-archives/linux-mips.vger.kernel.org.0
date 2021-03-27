Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A2334BA18
	for <lists+linux-mips@lfdr.de>; Sun, 28 Mar 2021 00:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhC0XF7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 19:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhC0XFs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 19:05:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E13C0613B1;
        Sat, 27 Mar 2021 16:05:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3070292;
        Sun, 28 Mar 2021 00:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616886345;
        bh=T9I6/cxnL7tY87h2phfEbefCP2jelKeL3kwJoG1/rlg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FiloUNWCgl1R5nzb3UZNZ2NKvjgWBqZ4+qStMPP8k4BmypMRiCgEsMqbCHs5qgnCR
         vudo0oQk4dbd1sB2H3qocY+6A2/itsSo4l7DOoDPpw1HeSkrXwqB26Zo6G+pQ/Ie/2
         vyojC4tCrGF4liwKtLMRrvWrbiMW8pqrl8Of5Qp4=
Date:   Sun, 28 Mar 2021 01:05:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm/encoder: Add macro drmm_plain_encoder_alloc()
Message-ID: <YF+6HY9dQbUBbXXG@pendragon.ideasonboard.com>
References: <20210327115742.18986-1-paul@crapouillou.net>
 <20210327115742.18986-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210327115742.18986-3-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Sat, Mar 27, 2021 at 11:57:41AM +0000, Paul Cercueil wrote:
> This performs the same operation as drmm_encoder_alloc(), but
> only allocates and returns a struct drm_encoder instance.
> 
> v4: Rename macro drmm_plain_encoder_alloc() and move to
>     <drm/drm_encoder.h>. Since it's not "simple" anymore it
>     will now take funcs/name arguments as well.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_encoder.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 5bf78b5bcb2b..6e91a0280f31 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -224,6 +224,24 @@ void *__drmm_encoder_alloc(struct drm_device *dev,
>  				      offsetof(type, member), funcs, \
>  				      encoder_type, name, ##__VA_ARGS__))
>  
> +/**
> + * drmm_plain_encoder_alloc - Allocate and initialize an encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder (optional)
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for default name
> + *
> + * This is a simplified version of drmm_encoder_alloc(), which only allocates
> + * and returns a struct drm_encoder instance, with no subclassing.
> + *
> + * Returns:
> + * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
> + */
> +#define drmm_plain_encoder_alloc(dev, funcs, encoder_type, name, ...) \
> +	((struct drm_encoder *) \
> +	 __drmm_encoder_alloc(dev, sizeof(struct drm_encoder), \
> +			      0, funcs, encoder_type, name, ##__VA_ARGS__))
> +
>  /**
>   * drm_encoder_index - find the index of a registered encoder
>   * @encoder: encoder to find index for

-- 
Regards,

Laurent Pinchart
