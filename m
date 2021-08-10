Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574903E58BA
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 12:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbhHJLAU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Aug 2021 07:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236602AbhHJLAT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Aug 2021 07:00:19 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D9EC061798
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 03:59:57 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q11so7479050wrr.9
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=S17kkOE7NXl9gCUN+dzBg78chbeum9RRJd1kaJZW5m8=;
        b=LddAyGozybyccp7yls42cvZQv6zW8IQSh3HvQfDjQd5rwAlnj0akLl+/UFVqMtNbGs
         qfAgDr+Tofp2Vi6JrtSHPxev3XoJ0VnUHwklzPacI3wemDXBMFML+VPYsfvh+4OYgosA
         6MooerljDrdoxh/1f7z7q824amqm4gFWY0nFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=S17kkOE7NXl9gCUN+dzBg78chbeum9RRJd1kaJZW5m8=;
        b=hbeTUrfnJM0LyX3FPal1QsZPqpEJ4iomgWhYyHdoMO1s89tFjHRcFICpI+pmyk0fdx
         JCdzWD7WnUuQP671HyFBeZBTV1bW6BzcpqMh15H58Nqgo5OsRbmkVUAzg1HYyxFJGox8
         tOK0sQv2rf0X8MPTZhl9UVIQJfpZVKhSntovHXefMONrlwck3rhi2HpyK7807uHbOPHj
         vSDDVnLanFXwCsBUzQ9vcEms3XcFQnTBIMkvAQATrJwVZP+rX9KqQwbWIUR/2wNJ6Dz0
         5QEXgTOql0vhNaFWq0R23MI8LxRPpkhEwn0I7czS8E9UrPFAhIusqCKk+UzYopPNUtFs
         movA==
X-Gm-Message-State: AOAM532wGRIRcCFBlj4ywROlvHDbJpZ5S51/9R8yyvwrk7+i7BQo09+E
        SnRd9P70jfayRxbtP8mp6fTisg==
X-Google-Smtp-Source: ABdhPJy0Bdm7iMJcLDPGmkKD0Q1zFAprjkJgqaO7/wj21af24FjLeDIUIuJou2C3Q0tPo0RAETFXGQ==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr29408295wrn.426.1628593196160;
        Tue, 10 Aug 2021 03:59:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y19sm2575471wmq.5.2021.08.10.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:59:55 -0700 (PDT)
Date:   Tue, 10 Aug 2021 12:59:53 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Message-ID: <YRJcKeFKVoaFUeck@phenom.ffwll.local>
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
 <YRJIb8ofHe8r5g1z@phenom.ffwll.local>
 <4BDMXQ.S6A97ME8XJUV@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4BDMXQ.S6A97ME8XJUV@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 10, 2021 at 12:33:04PM +0200, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le mar., août 10 2021 at 11:35:43 +0200, Daniel Vetter <daniel@ffwll.ch> a
> écrit :
> > On Fri, Aug 06, 2021 at 01:01:33PM +0200, Paul Cercueil wrote:
> > >  Hi Greg,
> > > 
> > >  Le ven., août 6 2021 at 12:17:55 +0200, Greg Kroah-Hartman
> > >  <gregkh@linuxfoundation.org> a écrit :
> > >  > On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil wrote:
> > >  > >  Hi Greg,
> > >  > >
> > >  > >  Le jeu., août 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman
> > >  > >  <gregkh@linuxfoundation.org> a écrit :
> > >  > >  > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil
> > > wrote:
> > >  > >  > >  When the drivers of remote devices (e.g. HDMI chip) are
> > >  > > disabled in
> > >  > >  > > the
> > >  > >  > >  config, we want the ingenic-drm driver to be able to probe
> > >  > >  > > nonetheless
> > >  > >  > >  with the other devices (e.g. internal LCD panel) that are
> > >  > > enabled.
> > >  > >  > >
> > >  > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  > >  > >  ---
> > >  > >  > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12
> > > ++++++++++++
> > >  > >  > >   1 file changed, 12 insertions(+)
> > >  > >  > >
> > >  > >  > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > >  index d261f7a03b18..5e1fdbb0ba6b 100644
> > >  > >  > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > >  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct
> > >  > > device
> > >  > >  > > *dev, bool has_components)
> > >  > >  > >   	for (i = 0; ; i++) {
> > >  > >  > >   		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i,
> > >  > > &panel,
> > >  > >  > > &bridge);
> > >  > >  > >   		if (ret) {
> > >  > >  > >  +			/*
> > >  > >  > >  +			 * Workaround for the case where the drivers for the
> > >  > >  > >  +			 * remote devices are not enabled. When that happens,
> > >  > >  > >  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
> > >  > >  > >  +			 * endlessly, which prevents the ingenic-drm driver
> > > from
> > >  > >  > >  +			 * working at all.
> > >  > >  > >  +			 */
> > >  > >  > >  +			if (ret == -EPROBE_DEFER) {
> > >  > >  > >  +				ret = driver_deferred_probe_check_state(dev);
> > >  > >  > >  +				if (ret == -ENODEV || ret == -ETIMEDOUT)
> > >  > >  > >  +					continue;
> > >  > >  > >  +			}
> > >  > >  >
> > >  > >  > So you are mucking around with devices on other busses
> > > within this
> > >  > >  > driver?  What could go wrong?  :(
> > >  > >
> > >  > >  I'm doing the same thing as everybody else. This is the DRM
> > > driver,
> > >  > > and
> > >  > >  there is a driver for the external HDMI chip which gives us a
> > > DRM
> > >  > > bridge
> > >  > >  that we can obtain from the device tree.
> > >  >
> > >  > But then why do you need to call this function that is there for
> > > a bus,
> > >  > not for a driver.
> > > 
> > >  The documentation disagrees with you :)
> > > 
> > >  And, if that has any weight, this solution was proposed by Rob.
> > > 
> > >  > >  > Please use the existing driver core functionality for this
> > > type of
> > >  > >  > thing, it is not unique, no need for this function to be
> > > called.
> > >  > >
> > >  > >  I'm not sure you understand what I'm doing here. This driver
> > > calls
> > >  > >  drm_of_find_panel_or_bridge(), without guarantee that the
> > > driver
> > >  > > for the
> > >  > >  remote device (connected via DT graph) has been enabled in the
> > >  > > kernel
> > >  > >  config. In that case it will always return -EPROBE_DEFER and
> > > the
> > >  > > ingenic-drm
> > >  > >  driver will never probe.
> > >  > >
> > >  > >  This patch makes sure that the driver can probe if the HDMI
> > > driver
> > >  > > has been
> > >  > >  disabled in the kernel config, nothing more.
> > >  >
> > >  > That should not be an issue as you do not care if the config is
> > > enabled,
> > >  > you just want to do something in the future if the driver shows
> > > up,
> > >  > right?
> > > 
> > >  Well, the DRM subsystem doesn't really seem to handle hotplug of
> > > hardware.
> > >  Right now all the drivers for the connected hardware need to probe
> > > before
> > >  the main DRM driver. So I need to know that a remote device
> > > (connected via
> > >  DT graph) will never probe.
> > > 
> > >  Give me a of_graph_remote_device_driver_will_never_probe() and I'll
> > > use
> > >  that.
> > > 
> > >  > Much like the device link code, have you looked at that?
> > > 
> > >  I don't see how that would help in any way. The device link code
> > > would allow
> > >  me to set a dependency between the remote hardware (HDMI chip,
> > > provider) and
> > >  the LCD controller (consumer), but I already have that dependency
> > > though the
> > >  DT graph. What I need is a way for the consumer to continue probing
> > > if the
> > >  provider is not going to probe.
> > 
> > Is this actually a legit use-case?
> > 
> > Like you have hw with a bunch of sub-devices linked, and you decided to
> > disable some of them, which makes the driver not load.
> 
> Yes. I'm facing that issue with a board that has a LCD panel and a HDMI
> controller (IT66121). I have a "flasher" program for all the Ingenic boards,
> that's basically just a Linux kernel + initramfs booted over USB (device). I
> can't realistically enable every single driver for all the hardware that's
> on these boards while still having a tiny footprint. And I shouldn't have to
> care about it either.

I think this is were things go wrong.

Either you have a generic image, where all the needed drivers are included
as modules.

Or you have a bespoke image, where you just built-in what you actually
needed.

Asking for both is a bit much ...

> > Why should we care? Is that hdmi driver really that big that we have to
> > support this use-case?
> 
> DRM maintainers work with what embedded devs would call "infinite
> resources". It annoys me that CONFIG_DRM pulls the I2C code even though I
> may just have a LCD panel, and it annoys me that I have to enable support
> for hardware that I'm not even planning to use, just so that the DRM driver
> works for the hardware I do want to use.

No.

What I'm rejecting is when people add Kconfig knobs for a single function,
while we have everything else as fairly monolithic dependencies in drm.
That makes no sense.

The only requirement for tiny drm that I have is that whomever proposes
it:

- does an overall survey and shows that we do actually get rid of the big
  pieces, and not just of the pieces which are easy to make optional

- has a solid answer to the maintainance cost this will incur. This one is
  very important, because for historical reasons we have a bunch of
  optional things like backlight, and the trend is to make them less
  optional because a) those are all rather invalid configs anyway b) no on
  has time to review the constant flux of busy-work bugfixes when
  something inevitably breaks again

Thus far all I got from people who want to make drm tiny is some wishlist
items and stand-alone patches that don't make sense stand-alone. Until
that's fixed and someone invests serious amounts of time here drm will be
a big behemoth. And that's because we're very much not operating in
an "infinite resource" world, the most constraint supply we have is
contributor, reviewer and maintainer bandwidth.

Which yes means occasionally things will continue to suck because no one
cared enough about it yet.

> > I know it's possible to do this, that doesn't mean it's a good idea.
> > There's inifinitely more randconfigs that don't boot on my machine here
> > for various reasons than the ones that do boot. We don't have "fixes"
> > for
> > all of these to make things still work, despite user misconfiguring
> > their
> > kernel.
> 
> I understand, you can't really expect random configs to work every time. But
> it should still be possible to disable drivers for *optional* hardware in
> the config and end up with a working system.

The thing is, right now that stuff just isn't optional. Except if you
patch your dt, which I think is the other approach that's been discussed
here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
