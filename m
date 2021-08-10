Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E303E5987
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 13:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238345AbhHJL65 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 10 Aug 2021 07:58:57 -0400
Received: from aposti.net ([89.234.176.197]:48670 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233167AbhHJL65 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Aug 2021 07:58:57 -0400
Date:   Tue, 10 Aug 2021 13:58:24 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Message-Id: <C9HMXQ.KW3EEZJNMS8I@crapouillou.net>
In-Reply-To: <YRJcKeFKVoaFUeck@phenom.ffwll.local>
References: <20210805192110.90302-1-paul@crapouillou.net>
        <20210805192110.90302-3-paul@crapouillou.net> <YQw9hjZll4QmYVLX@kroah.com>
        <3HUDXQ.7RBGD4FUHR2F@crapouillou.net> <YQ0MU/GcLkPLiy5C@kroah.com>
        <LYZEXQ.9UWPIAZCVXIK@crapouillou.net> <YRJIb8ofHe8r5g1z@phenom.ffwll.local>
        <4BDMXQ.S6A97ME8XJUV@crapouillou.net> <YRJcKeFKVoaFUeck@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Daniel,

Le mar., ao�t 10 2021 at 12:59:53 +0200, Daniel Vetter 
<daniel@ffwll.ch> a �crit :
> On Tue, Aug 10, 2021 at 12:33:04PM +0200, Paul Cercueil wrote:
>>  Hi Daniel,
>> 
>>  Le mar., ao�t 10 2021 at 11:35:43 +0200, Daniel Vetter 
>> <daniel@ffwll.ch> a
>>  �crit :
>>  > On Fri, Aug 06, 2021 at 01:01:33PM +0200, Paul Cercueil wrote:
>>  > >  Hi Greg,
>>  > >
>>  > >  Le ven., ao�t 6 2021 at 12:17:55 +0200, Greg Kroah-Hartman
>>  > >  <gregkh@linuxfoundation.org> a �crit :
>>  > >  > On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil 
>> wrote:
>>  > >  > >  Hi Greg,
>>  > >  > >
>>  > >  > >  Le jeu., ao�t 5 2021 at 21:35:34 +0200, Greg 
>> Kroah-Hartman
>>  > >  > >  <gregkh@linuxfoundation.org> a �crit :
>>  > >  > >  > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil
>>  > > wrote:
>>  > >  > >  > >  When the drivers of remote devices (e.g. HDMI chip) 
>> are
>>  > >  > > disabled in
>>  > >  > >  > > the
>>  > >  > >  > >  config, we want the ingenic-drm driver to be able to 
>> probe
>>  > >  > >  > > nonetheless
>>  > >  > >  > >  with the other devices (e.g. internal LCD panel) 
>> that are
>>  > >  > > enabled.
>>  > >  > >  > >
>>  > >  > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  > >  > >  ---
>>  > >  > >  > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12
>>  > > ++++++++++++
>>  > >  > >  > >   1 file changed, 12 insertions(+)
>>  > >  > >  > >
>>  > >  > >  > >  diff --git 
>> a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > >  index d261f7a03b18..5e1fdbb0ba6b 100644
>>  > >  > >  > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > >  @@ -1058,6 +1058,18 @@ static int 
>> ingenic_drm_bind(struct
>>  > >  > > device
>>  > >  > >  > > *dev, bool has_components)
>>  > >  > >  > >   	for (i = 0; ; i++) {
>>  > >  > >  > >   		ret = drm_of_find_panel_or_bridge(dev->of_node, 
>> 0, i,
>>  > >  > > &panel,
>>  > >  > >  > > &bridge);
>>  > >  > >  > >   		if (ret) {
>>  > >  > >  > >  +			/*
>>  > >  > >  > >  +			 * Workaround for the case where the drivers for 
>> the
>>  > >  > >  > >  +			 * remote devices are not enabled. When that 
>> happens,
>>  > >  > >  > >  +			 * drm_of_find_panel_or_bridge() returns 
>> -EPROBE_DEFER
>>  > >  > >  > >  +			 * endlessly, which prevents the ingenic-drm 
>> driver
>>  > > from
>>  > >  > >  > >  +			 * working at all.
>>  > >  > >  > >  +			 */
>>  > >  > >  > >  +			if (ret == -EPROBE_DEFER) {
>>  > >  > >  > >  +				ret = driver_deferred_probe_check_state(dev);
>>  > >  > >  > >  +				if (ret == -ENODEV || ret == -ETIMEDOUT)
>>  > >  > >  > >  +					continue;
>>  > >  > >  > >  +			}
>>  > >  > >  >
>>  > >  > >  > So you are mucking around with devices on other busses
>>  > > within this
>>  > >  > >  > driver?  What could go wrong?  :(
>>  > >  > >
>>  > >  > >  I'm doing the same thing as everybody else. This is the 
>> DRM
>>  > > driver,
>>  > >  > > and
>>  > >  > >  there is a driver for the external HDMI chip which gives 
>> us a
>>  > > DRM
>>  > >  > > bridge
>>  > >  > >  that we can obtain from the device tree.
>>  > >  >
>>  > >  > But then why do you need to call this function that is there 
>> for
>>  > > a bus,
>>  > >  > not for a driver.
>>  > >
>>  > >  The documentation disagrees with you :)
>>  > >
>>  > >  And, if that has any weight, this solution was proposed by Rob.
>>  > >
>>  > >  > >  > Please use the existing driver core functionality for 
>> this
>>  > > type of
>>  > >  > >  > thing, it is not unique, no need for this function to be
>>  > > called.
>>  > >  > >
>>  > >  > >  I'm not sure you understand what I'm doing here. This 
>> driver
>>  > > calls
>>  > >  > >  drm_of_find_panel_or_bridge(), without guarantee that the
>>  > > driver
>>  > >  > > for the
>>  > >  > >  remote device (connected via DT graph) has been enabled 
>> in the
>>  > >  > > kernel
>>  > >  > >  config. In that case it will always return -EPROBE_DEFER 
>> and
>>  > > the
>>  > >  > > ingenic-drm
>>  > >  > >  driver will never probe.
>>  > >  > >
>>  > >  > >  This patch makes sure that the driver can probe if the 
>> HDMI
>>  > > driver
>>  > >  > > has been
>>  > >  > >  disabled in the kernel config, nothing more.
>>  > >  >
>>  > >  > That should not be an issue as you do not care if the config 
>> is
>>  > > enabled,
>>  > >  > you just want to do something in the future if the driver 
>> shows
>>  > > up,
>>  > >  > right?
>>  > >
>>  > >  Well, the DRM subsystem doesn't really seem to handle hotplug 
>> of
>>  > > hardware.
>>  > >  Right now all the drivers for the connected hardware need to 
>> probe
>>  > > before
>>  > >  the main DRM driver. So I need to know that a remote device
>>  > > (connected via
>>  > >  DT graph) will never probe.
>>  > >
>>  > >  Give me a of_graph_remote_device_driver_will_never_probe() and 
>> I'll
>>  > > use
>>  > >  that.
>>  > >
>>  > >  > Much like the device link code, have you looked at that?
>>  > >
>>  > >  I don't see how that would help in any way. The device link 
>> code
>>  > > would allow
>>  > >  me to set a dependency between the remote hardware (HDMI chip,
>>  > > provider) and
>>  > >  the LCD controller (consumer), but I already have that 
>> dependency
>>  > > though the
>>  > >  DT graph. What I need is a way for the consumer to continue 
>> probing
>>  > > if the
>>  > >  provider is not going to probe.
>>  >
>>  > Is this actually a legit use-case?
>>  >
>>  > Like you have hw with a bunch of sub-devices linked, and you 
>> decided to
>>  > disable some of them, which makes the driver not load.
>> 
>>  Yes. I'm facing that issue with a board that has a LCD panel and a 
>> HDMI
>>  controller (IT66121). I have a "flasher" program for all the 
>> Ingenic boards,
>>  that's basically just a Linux kernel + initramfs booted over USB 
>> (device). I
>>  can't realistically enable every single driver for all the hardware 
>> that's
>>  on these boards while still having a tiny footprint. And I 
>> shouldn't have to
>>  care about it either.
> 
> I think this is were things go wrong.
> 
> Either you have a generic image, where all the needed drivers are 
> included
> as modules.
> 
> Or you have a bespoke image, where you just built-in what you actually
> needed.

Yes, and that's what I want - a kernel with just the minimal number of 
built-in drivers that I need (so, not the HDMI chip).

> Asking for both is a bit much ...
> 
>>  > Why should we care? Is that hdmi driver really that big that we 
>> have to
>>  > support this use-case?
>> 
>>  DRM maintainers work with what embedded devs would call "infinite
>>  resources". It annoys me that CONFIG_DRM pulls the I2C code even 
>> though I
>>  may just have a LCD panel, and it annoys me that I have to enable 
>> support
>>  for hardware that I'm not even planning to use, just so that the 
>> DRM driver
>>  works for the hardware I do want to use.
> 
> No.
> 
> What I'm rejecting is when people add Kconfig knobs for a single 
> function,
> while we have everything else as fairly monolithic dependencies in 
> drm.
> That makes no sense.
> 
> The only requirement for tiny drm that I have is that whomever 
> proposes
> it:
> 
> - does an overall survey and shows that we do actually get rid of the 
> big
>   pieces, and not just of the pieces which are easy to make optional
> 
> - has a solid answer to the maintainance cost this will incur. This 
> one is
>   very important, because for historical reasons we have a bunch of
>   optional things like backlight, and the trend is to make them less
>   optional because a) those are all rather invalid configs anyway b) 
> no on
>   has time to review the constant flux of busy-work bugfixes when
>   something inevitably breaks again
> 
> Thus far all I got from people who want to make drm tiny is some 
> wishlist
> items and stand-alone patches that don't make sense stand-alone. Until
> that's fixed and someone invests serious amounts of time here drm 
> will be
> a big behemoth. And that's because we're very much not operating in
> an "infinite resource" world, the most constraint supply we have is
> contributor, reviewer and maintainer bandwidth.
> 
> Which yes means occasionally things will continue to suck because no 
> one
> cared enough about it yet.

Alright, I can totally understand that.

>>  > I know it's possible to do this, that doesn't mean it's a good 
>> idea.
>>  > There's inifinitely more randconfigs that don't boot on my 
>> machine here
>>  > for various reasons than the ones that do boot. We don't have 
>> "fixes"
>>  > for
>>  > all of these to make things still work, despite user 
>> misconfiguring
>>  > their
>>  > kernel.
>> 
>>  I understand, you can't really expect random configs to work every 
>> time. But
>>  it should still be possible to disable drivers for *optional* 
>> hardware in
>>  the config and end up with a working system.
> 
> The thing is, right now that stuff just isn't optional. Except if you
> patch your dt, which I think is the other approach that's been 
> discussed
> here.

It's not been discussed yet - I think we talked about it a few weeks 
ago on IRC.

DT is supposed to represent the hardware though, and not a specific 
configuration, which would be policy; so this isn't really the best 
solution either.

Cheers,
-Paul


