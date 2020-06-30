Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C5D20F23D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 12:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732199AbgF3KJF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jun 2020 06:09:05 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:34406 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732165AbgF3KJF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jun 2020 06:09:05 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 6952A80554;
        Tue, 30 Jun 2020 12:09:02 +0200 (CEST)
Date:   Tue, 30 Jun 2020 12:09:01 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v2 03/10] drm/ingenic: Rename ingenic-drm.c to
 ingenic-drm-drv.c
Message-ID: <20200630100901.GB553950@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-3-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=-1inhyF0M4_q5xynx34A:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 30, 2020 at 01:52:03AM +0200, Paul Cercueil wrote:
> Full rename without any modification, except to the Makefile.
> 
> Renaming ingenic-drm.c to ingenic-drm-drv.c allow to decouple the module
> name from the source file name in the Makefile. This will be useful
> later when more source files are added.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Notes:
>     v2: New patch
> 
>  drivers/gpu/drm/ingenic/Makefile                             | 1 +
>  drivers/gpu/drm/ingenic/{ingenic-drm.c => ingenic-drm-drv.c} | 0
>  2 files changed, 1 insertion(+)
>  rename drivers/gpu/drm/ingenic/{ingenic-drm.c => ingenic-drm-drv.c} (100%)
> 
> diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
> index 11cac42ce0bb..9875628dd8bc 100644
> --- a/drivers/gpu/drm/ingenic/Makefile
> +++ b/drivers/gpu/drm/ingenic/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
> +ingenic-drm-y += ingenic-drm-drv.o
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> similarity index 100%
> rename from drivers/gpu/drm/ingenic/ingenic-drm.c
> rename to drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
