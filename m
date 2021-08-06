Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBED63E286C
	for <lists+linux-mips@lfdr.de>; Fri,  6 Aug 2021 12:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbhHFKSP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Aug 2021 06:18:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231627AbhHFKSO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Aug 2021 06:18:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4383960E97;
        Fri,  6 Aug 2021 10:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628245077;
        bh=D4PMGHjNpPs/GyZsSvS7gU8Z4nzRZLNfB7GArNagtkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sao5TmBMDEqc2I1SOzrLfxqeIi8FejVp5HGNKBWtztEKbWnf783UjU1bRGtSDVBQ8
         f9CQ5IDZUpGECCsBhvDe1KbP+89VWI5nkwXxcduxVk6EkSzJB9c1M+I/qFeXrE9p5D
         V+TWQ3GBDB3mG6EwoJHpCzBfPy4PyHF0yrNap50A=
Date:   Fri, 6 Aug 2021 12:17:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Message-ID: <YQ0MU/GcLkPLiy5C@kroah.com>
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-3-paul@crapouillou.net>
 <YQw9hjZll4QmYVLX@kroah.com>
 <3HUDXQ.7RBGD4FUHR2F@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3HUDXQ.7RBGD4FUHR2F@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil wrote:
> Hi Greg,
> 
> Le jeu., août 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> a écrit :
> > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil wrote:
> > >  When the drivers of remote devices (e.g. HDMI chip) are disabled in
> > > the
> > >  config, we want the ingenic-drm driver to be able to probe
> > > nonetheless
> > >  with the other devices (e.g. internal LCD panel) that are enabled.
> > > 
> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  ---
> > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  index d261f7a03b18..5e1fdbb0ba6b 100644
> > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct device
> > > *dev, bool has_components)
> > >   	for (i = 0; ; i++) {
> > >   		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel,
> > > &bridge);
> > >   		if (ret) {
> > >  +			/*
> > >  +			 * Workaround for the case where the drivers for the
> > >  +			 * remote devices are not enabled. When that happens,
> > >  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
> > >  +			 * endlessly, which prevents the ingenic-drm driver from
> > >  +			 * working at all.
> > >  +			 */
> > >  +			if (ret == -EPROBE_DEFER) {
> > >  +				ret = driver_deferred_probe_check_state(dev);
> > >  +				if (ret == -ENODEV || ret == -ETIMEDOUT)
> > >  +					continue;
> > >  +			}
> > 
> > So you are mucking around with devices on other busses within this
> > driver?  What could go wrong?  :(
> 
> I'm doing the same thing as everybody else. This is the DRM driver, and
> there is a driver for the external HDMI chip which gives us a DRM bridge
> that we can obtain from the device tree.

But then why do you need to call this function that is there for a bus,
not for a driver.

> > Please use the existing driver core functionality for this type of
> > thing, it is not unique, no need for this function to be called.
> 
> I'm not sure you understand what I'm doing here. This driver calls
> drm_of_find_panel_or_bridge(), without guarantee that the driver for the
> remote device (connected via DT graph) has been enabled in the kernel
> config. In that case it will always return -EPROBE_DEFER and the ingenic-drm
> driver will never probe.
> 
> This patch makes sure that the driver can probe if the HDMI driver has been
> disabled in the kernel config, nothing more.

That should not be an issue as you do not care if the config is enabled,
you just want to do something in the future if the driver shows up,
right?

Much like the device link code, have you looked at that?

thanks,

greg k-h
