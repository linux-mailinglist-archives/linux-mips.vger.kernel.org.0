Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BDF3E3C29
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 20:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhHHS16 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 14:27:58 -0400
Received: from smtprelay0211.hostedemail.com ([216.40.44.211]:37816 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230049AbhHHS16 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Aug 2021 14:27:58 -0400
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 1364918225E17;
        Sun,  8 Aug 2021 18:27:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 42D601A29F9;
        Sun,  8 Aug 2021 18:27:36 +0000 (UTC)
Message-ID: <5a003da4e38fcb50782664496fc37b84773a7813.camel@perches.com>
Subject: Re: [PATCH 1/8] drm/ingenic: Remove dead code
From:   Joe Perches <joe@perches.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date:   Sun, 08 Aug 2021 11:27:34 -0700
In-Reply-To: <ff06e53b-ba7e-5535-8931-ce7f7cdae5a6@suse.de>
References: <20210808134526.119198-1-paul@crapouillou.net>
         <20210808134526.119198-2-paul@crapouillou.net>
         <ff06e53b-ba7e-5535-8931-ce7f7cdae5a6@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 42D601A29F9
X-Spam-Status: No, score=-0.13
X-Stat-Signature: q7179owfxbtowekyohhcpja96iagy15d
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+ldakpScWEGEFtHAUPDuqKsB2MKIB/sTQ=
X-HE-Tag: 1628447256-237769
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2021-08-08 at 19:58 +0200, Thomas Zimmermann wrote:
> 
> Am 08.08.21 um 15:45 schrieb Paul Cercueil:
> > The priv->ipu_plane would get a different value further down the code,
> > without the first assigned value being read first; so the first
> > assignation can be dropped.
> > 
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I think this is at best an incomplete description.

How is it known that this priv->ipu_plane assignment isn't
necessary for any path of any failure path after this assignment
and before the new assignment?

> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
[]
> > @@ -984,9 +984,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
> >   	priv->dma_hwdescs->hwdesc_pal.cmd = JZ_LCD_CMD_ENABLE_PAL
> >   		| (sizeof(priv->dma_hwdescs->palette) / 4);
> > 
> > -	if (soc_info->has_osd)
> > -		priv->ipu_plane = drm_plane_from_index(drm, 0);
> > -
> >   	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
> > 
> >   	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
> > 
> 


