Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5907134D4AA
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 18:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhC2QP5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 29 Mar 2021 12:15:57 -0400
Received: from aposti.net ([89.234.176.197]:40924 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhC2QPz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 12:15:55 -0400
Date:   Mon, 29 Mar 2021 17:15:37 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/3] drm/encoder: Add macro drmm_plain_encoder_alloc()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <1UNQQQ.C8BL9EPXOLHR2@crapouillou.net>
In-Reply-To: <YF+6HY9dQbUBbXXG@pendragon.ideasonboard.com>
References: <20210327115742.18986-1-paul@crapouillou.net>
        <20210327115742.18986-3-paul@crapouillou.net>
        <YF+6HY9dQbUBbXXG@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le dim. 28 mars 2021 à 1:05, Laurent Pinchart 
<laurent.pinchart@ideasonboard.com> a écrit :
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Sat, Mar 27, 2021 at 11:57:41AM +0000, Paul Cercueil wrote:
>>  This performs the same operation as drmm_encoder_alloc(), but
>>  only allocates and returns a struct drm_encoder instance.
>> 
>>  v4: Rename macro drmm_plain_encoder_alloc() and move to
>>      <drm/drm_encoder.h>. Since it's not "simple" anymore it
>>      will now take funcs/name arguments as well.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Patchset applied to drm-misc-next.

Thanks!

-Paul

>>  ---
>>   include/drm/drm_encoder.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>> 
>>  diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
>>  index 5bf78b5bcb2b..6e91a0280f31 100644
>>  --- a/include/drm/drm_encoder.h
>>  +++ b/include/drm/drm_encoder.h
>>  @@ -224,6 +224,24 @@ void *__drmm_encoder_alloc(struct drm_device 
>> *dev,
>>   				      offsetof(type, member), funcs, \
>>   				      encoder_type, name, ##__VA_ARGS__))
>> 
>>  +/**
>>  + * drmm_plain_encoder_alloc - Allocate and initialize an encoder
>>  + * @dev: drm device
>>  + * @funcs: callbacks for this encoder (optional)
>>  + * @encoder_type: user visible type of the encoder
>>  + * @name: printf style format string for the encoder name, or NULL 
>> for default name
>>  + *
>>  + * This is a simplified version of drmm_encoder_alloc(), which 
>> only allocates
>>  + * and returns a struct drm_encoder instance, with no subclassing.
>>  + *
>>  + * Returns:
>>  + * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
>>  + */
>>  +#define drmm_plain_encoder_alloc(dev, funcs, encoder_type, name, 
>> ...) \
>>  +	((struct drm_encoder *) \
>>  +	 __drmm_encoder_alloc(dev, sizeof(struct drm_encoder), \
>>  +			      0, funcs, encoder_type, name, ##__VA_ARGS__))
>>  +
>>   /**
>>    * drm_encoder_index - find the index of a registered encoder
>>    * @encoder: encoder to find index for
> 
> --
> Regards,
> 
> Laurent Pinchart


