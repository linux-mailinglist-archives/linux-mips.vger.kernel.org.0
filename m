Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E8C415BB4
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 12:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240329AbhIWKFJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Sep 2021 06:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240296AbhIWKFI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Sep 2021 06:05:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D94AC061574;
        Thu, 23 Sep 2021 03:03:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9A7E45E;
        Thu, 23 Sep 2021 12:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632391416;
        bh=QWEG82V5G7D0G117wXh9PFLZKVi96y001Ge/iBI4Nxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YREPVEVszHxTtgJ8ePsrRFxMpTg956Y4W/xYvS5yhCMQYBzgqN8sRz2pfXKX8sX3f
         Q8BfEuhf+lrgglRu+aPqfsJ98pNEX4cnEfJb0cm64sQL6jGoUMJVBcb0GcR7DHQLjN
         jZdpD6MsRIuMO/lo2TyDgs0J/otY4hiL09L9KXIQ=
Date:   Thu, 23 Sep 2021 13:03:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Boddie <paul@boddie.org.uk>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
Message-ID: <YUxQ9k/CDYz20rYo@pendragon.ideasonboard.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
 <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
 <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

On Thu, Sep 23, 2021 at 11:55:56AM +0200, H. Nikolaus Schaller wrote:
> > Am 23.09.2021 um 11:27 schrieb Laurent Pinchart:
> > On Thu, Sep 23, 2021 at 11:19:23AM +0200, H. Nikolaus Schaller wrote:
> >> 
> >>>>> +		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
> >>>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>> 
> >>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally incompatible
> >>>> with synopsys/dw_hdmi.c
> >>>> That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being NOT present,
> >>>> since it wants to register its own connector through dw_hdmi_connector_create().
> >>>> It does it for a reason: the dw-hdmi is a multi-function driver which does
> >>>> HDMI and DDC/EDID stuff in a single driver (because I/O registers and power
> >>>> management seem to be shared).
> >>> 
> >>> The IT66121 driver does all of that too, and does not need
> >>> DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has
> >>> callbacks to handle cable detection and DDC stuff.
> >>> 
> >>>> Since I do not see who could split this into a separate bridge and a connector driver
> >>>> and test it on multiple SoC platforms (there are at least 3 or 4), I think modifying
> >>>> the fundamentals of the dw-hdmi architecture just to get CI20 HDMI working is not
> >>>> our turf.
> >>> 
> >>> You could have a field in the dw-hdmi pdata structure, that would
> >>> instruct the driver whether or not it should use the new API. Ugly,
> >>> I know, and would probably duplicate a lot of code, but that would
> >>> allow other drivers to be updated at a later date.
> >> 
> >> Yes, would be very ugly.
> >> 
> >> But generally who has the knowledge (and time) to do this work?
> >> And has a working platform to test (jz4780 isn't a good development environment)?
> >> 
> >> The driver seems to have a turbulent history starting 2013 in staging/imx and
> >> apparently it was generalized since then... Is Laurent currently dw-hdmi maintainer?
> > 
> > "Maintainer" would be an overstatement. I've worked on that driver in
> > the past, and I still use it, but don't have time to really maintain it.
> > I've also been told that Synopsys required all patches for that driver
> > developed using documentation under NDA to be submitted internally to
> > them first before being published, so I decided to stop contributing
> > instead of agreeing with this insane process. There's public
> > documentation about the IP in some NXP reference manuals though, so it
> > should be possible to still move forward without abiding by this rule.
> > 
> >>>> Therefore the code here should be able to detect if drm_bridge_attach() already
> >>>> creates and attaches a connector and then skip the code below.
> >>> 
> >>> Not that easy, unfortunately. On one side we have dw-hdmi which
> >>> checks that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on the
> >>> other side we have other drivers like the IT66121 which will fail if
> >>> this flag is not set.
> >> 
> >> Ok, I see. You have to handle contradicting cases here.
> >> 
> >> Would it be possible to run it with DRM_BRIDGE_ATTACH_NO_CONNECTOR first
> >> and retry if it fails without?
> >> 
> >> But IMHO the return value (in error case) is not well defined. So there
> >> must be a test if a connector has been created (I do not know how this
> >> would work).
> >> 
> >> Another suggestion: can you check if there is a downstream connector defined in
> >> device tree (dw-hdmi does not need such a definition)?
> >> If not we call it with 0 and if there is one we call it with
> >> DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one?
> > 
> > I haven't followed the ful conversation, what the reason why
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR can't always be use here ?
> 
> The synopsys driver creates its own connector through dw_hdmi_connector_create()
> because the IP handles DDC/EDID directly.

That doesn't require creating a connector though. The driver implements
drm_bridge_funcs.get_edid(), which is used to get the EDID without the
need to create a connector in the dw-hdmi driver.

> Hence it checks for ! DRM_BRIDGE_ATTACH_NO_CONNECTOR which seems to be the
> right thing to do on current platforms that use it.
> 
> For CI20/jz4780 we just add a specialisation of the generic dw-hdmi to
> make HDMI work.
> 
> Now this patch for drm/ingenic wants the opposite definition and create its own
> connector. This fails even if we remove the check (then we have two interfering
> connectors).
> 
> > We're moving
> > towards requiring DRM_BRIDGE_ATTACH_NO_CONNECTOR for all new code, so it
> > will have to be done eventually.
> 
> So from my view drm/ingenic wants to already enforce this rule and breaks dw-hdmi.
> 
> IMHO it should either handle this situation gracefully or include a fix for
> dw-hdmi.c to keep it compatible.

-- 
Regards,

Laurent Pinchart
