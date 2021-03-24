Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A8B346F8F
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 03:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhCXCdL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 22:33:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50618 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhCXCcw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 22:32:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 507D8580;
        Wed, 24 Mar 2021 03:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616553171;
        bh=SPT6PlC2qxMevfzY2I/dHdE0/CO5UmBJp6xZzw8hxQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OYOlaFZOtr5vJuMlYTG/Ji3sqhclbrRzX8VDYSZuW4NB8bsNPWn3nq2G+Crd1aZd/
         bcznrGviJr0/F3309SLpJK9LfpqrpHo/z60Sn7RjHEyLq53XZbwQujdV9ZalUXcTgd
         VKBIXk07KAXxn2aYQ3Ka/3hEE33Uhj0aqnp44zs4=
Date:   Wed, 24 Mar 2021 04:32:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
Message-ID: <YFqkqQnTNvb0/Ng3@pendragon.ideasonboard.com>
References: <20210124085552.29146-1-paul@crapouillou.net>
 <DUC1PQ.KO33KJE3BP5L@crapouillou.net>
 <09JFQQ.5A8HP2TTVT5Z1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09JFQQ.5A8HP2TTVT5Z1@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 23, 2021 at 04:03:00PM +0000, Paul Cercueil wrote:
> Le mer. 24 févr. 2021 à 13:44, Paul Cercueil a écrit :
> > Hi,
> > 
> > Some feedback for patches 1-3? Laurent?
> 
> 1-month anniversary ping :)

Haaappy birth-day toooo youuuuuuu :-)

Patches reviewed.

> > Le dim. 24 janv. 2021 à 8:55, Paul Cercueil a  écrit :
> >> Hi,
> >> 
> >> Here are three independent fixes. The first one addresses a
> >> use-after-free in bridge/panel.c; the second one addresses a
> >> use-after-free in the ingenic-drm driver; finally, the third one makes
> >> the ingenic-drm driver work again on older Ingenic SoCs.
> >> 
> >> Changes from v2:
> >> - patch [1/4] added a FIXME.
> >> - patch [2/4] is new. It introduces a drmm_plain_simple_encoder_alloc()
> >>   macro that will be used in patch [3/4].
> >> - patch [3/4] uses the macro introduced in patch [2/4].
> >> - patch [4/4] is unmodified.
> >> 
> >> Note to linux-stable guys: patch [v2 2/3] will only apply on the current
> >> drm-misc-next branch, to fix it for v5.11 and older kernels, use the V1
> >> of that patch.
> >> 
> >> Cheers,
> >> -Paul
> >> 
> >> Paul Cercueil (4):
> >>   drm: bridge/panel: Cleanup connector on bridge detach
> >>   drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
> >>   drm/ingenic: Register devm action to cleanup encoders
> >>   drm/ingenic: Fix non-OSD mode
> >> 
> >>  drivers/gpu/drm/bridge/panel.c            | 12 +++++++++++
> >>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 +++++++++++------------
> >>  include/drm/drm_simple_kms_helper.h       | 17 +++++++++++++++
> >>  3 files changed, 42 insertions(+), 13 deletions(-)
> >> 

-- 
Regards,

Laurent Pinchart
