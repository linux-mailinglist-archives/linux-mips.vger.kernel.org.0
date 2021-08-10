Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276623E571D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 11:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239187AbhHJJgM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Aug 2021 05:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239183AbhHJJgL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Aug 2021 05:36:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6C6C0613D3
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 02:35:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 203-20020a1c00d40000b02902e6a4e244e4so447664wma.4
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SnObdE2PiNGsfRPS46ERfps2QDWQ5wa/Co24Nmz1JjU=;
        b=cp/oeAnU7T0jp0ojUWOu943VdAyYxVRio84CZBhy//vwBoDNwzoSMaYu9qpvOzPrRN
         W768lgBCaFweAhqZFtdUxwD2igKIKKOTiqmJNS4HOIu4zx1QixY1mtSBuIuEiEIc47Vp
         gMIUJVsmbIWOwYhvFtUy79MDszZQbwHQYkABY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=SnObdE2PiNGsfRPS46ERfps2QDWQ5wa/Co24Nmz1JjU=;
        b=dgOPZc9/RXhcLVAZqHXIc+DjOnJZkEa44/6DexXWHVjhHG7RUYuPzD497yRf5chKWu
         oN8cgUy9zNSsA5DwONcqvCSsU8IKJ3Gc3zximoqyvHH5rRoLTLAx+4iZ/ZnDk0EeHDIg
         SYTt3pPqI/ELKv6X6KrW1H2CIrGUl61UcPMfnQ2IMNoVnoM3OWlV/z5Rji8i56fRRMJe
         WQcBd0GdsTPF+Z4s27fFdgjEjpcWsloS+sbr9JUZqDIOIra4h0QaYuHmPSDLU5dyI/8i
         wsKGgy3Qi0f5CQzcg/8/cuzwn2tNEm68d5dRjcCG6MXMs0ZYcCPy5vegctB5DarKWlPF
         PyuA==
X-Gm-Message-State: AOAM532Jfh+VwoZRRVvUqpFYZ0RK7trHNWsFAX5IvBIN5uo3r2O79ioG
        yuxxXylE8REpagp9f5B9IvpiYQ==
X-Google-Smtp-Source: ABdhPJyvRhUq0NEH1QoEWA28YXT5OY37p60cM+3r20SU+7tVWsNXreGNSoTdzpkn9DfRdlOiMDeq/w==
X-Received: by 2002:a1c:95:: with SMTP id 143mr21623788wma.29.1628588146347;
        Tue, 10 Aug 2021 02:35:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t8sm23805252wmj.5.2021.08.10.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:35:45 -0700 (PDT)
Date:   Tue, 10 Aug 2021 11:35:43 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Message-ID: <YRJIb8ofHe8r5g1z@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
        list@opendingux.net, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-3-paul@crapouillou.net>
 <YQw9hjZll4QmYVLX@kroah.com>
 <3HUDXQ.7RBGD4FUHR2F@crapouillou.net>
 <YQ0MU/GcLkPLiy5C@kroah.com>
 <LYZEXQ.9UWPIAZCVXIK@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LYZEXQ.9UWPIAZCVXIK@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 06, 2021 at 01:01:33PM +0200, Paul Cercueil wrote:
> Hi Greg,
> 
> Le ven., août 6 2021 at 12:17:55 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> a écrit :
> > On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil wrote:
> > >  Hi Greg,
> > > 
> > >  Le jeu., août 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman
> > >  <gregkh@linuxfoundation.org> a écrit :
> > >  > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil wrote:
> > >  > >  When the drivers of remote devices (e.g. HDMI chip) are
> > > disabled in
> > >  > > the
> > >  > >  config, we want the ingenic-drm driver to be able to probe
> > >  > > nonetheless
> > >  > >  with the other devices (e.g. internal LCD panel) that are
> > > enabled.
> > >  > >
> > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  > >  ---
> > >  > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
> > >  > >   1 file changed, 12 insertions(+)
> > >  > >
> > >  > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  index d261f7a03b18..5e1fdbb0ba6b 100644
> > >  > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct
> > > device
> > >  > > *dev, bool has_components)
> > >  > >   	for (i = 0; ; i++) {
> > >  > >   		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i,
> > > &panel,
> > >  > > &bridge);
> > >  > >   		if (ret) {
> > >  > >  +			/*
> > >  > >  +			 * Workaround for the case where the drivers for the
> > >  > >  +			 * remote devices are not enabled. When that happens,
> > >  > >  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
> > >  > >  +			 * endlessly, which prevents the ingenic-drm driver from
> > >  > >  +			 * working at all.
> > >  > >  +			 */
> > >  > >  +			if (ret == -EPROBE_DEFER) {
> > >  > >  +				ret = driver_deferred_probe_check_state(dev);
> > >  > >  +				if (ret == -ENODEV || ret == -ETIMEDOUT)
> > >  > >  +					continue;
> > >  > >  +			}
> > >  >
> > >  > So you are mucking around with devices on other busses within this
> > >  > driver?  What could go wrong?  :(
> > > 
> > >  I'm doing the same thing as everybody else. This is the DRM driver,
> > > and
> > >  there is a driver for the external HDMI chip which gives us a DRM
> > > bridge
> > >  that we can obtain from the device tree.
> > 
> > But then why do you need to call this function that is there for a bus,
> > not for a driver.
> 
> The documentation disagrees with you :)
> 
> And, if that has any weight, this solution was proposed by Rob.
> 
> > >  > Please use the existing driver core functionality for this type of
> > >  > thing, it is not unique, no need for this function to be called.
> > > 
> > >  I'm not sure you understand what I'm doing here. This driver calls
> > >  drm_of_find_panel_or_bridge(), without guarantee that the driver
> > > for the
> > >  remote device (connected via DT graph) has been enabled in the
> > > kernel
> > >  config. In that case it will always return -EPROBE_DEFER and the
> > > ingenic-drm
> > >  driver will never probe.
> > > 
> > >  This patch makes sure that the driver can probe if the HDMI driver
> > > has been
> > >  disabled in the kernel config, nothing more.
> > 
> > That should not be an issue as you do not care if the config is enabled,
> > you just want to do something in the future if the driver shows up,
> > right?
> 
> Well, the DRM subsystem doesn't really seem to handle hotplug of hardware.
> Right now all the drivers for the connected hardware need to probe before
> the main DRM driver. So I need to know that a remote device (connected via
> DT graph) will never probe.
> 
> Give me a of_graph_remote_device_driver_will_never_probe() and I'll use
> that.
> 
> > Much like the device link code, have you looked at that?
> 
> I don't see how that would help in any way. The device link code would allow
> me to set a dependency between the remote hardware (HDMI chip, provider) and
> the LCD controller (consumer), but I already have that dependency though the
> DT graph. What I need is a way for the consumer to continue probing if the
> provider is not going to probe.

Is this actually a legit use-case?

Like you have hw with a bunch of sub-devices linked, and you decided to
disable some of them, which makes the driver not load.

Why should we care? Is that hdmi driver really that big that we have to
support this use-case?

I know it's possible to do this, that doesn't mean it's a good idea.
There's inifinitely more randconfigs that don't boot on my machine here
for various reasons than the ones that do boot. We don't have "fixes" for
all of these to make things still work, despite user misconfiguring their
kernel.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
