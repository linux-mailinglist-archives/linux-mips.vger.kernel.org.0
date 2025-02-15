Return-Path: <linux-mips+bounces-7783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1532A36C5C
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2025 07:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 583D31895FC0
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2025 06:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA7F1898FB;
	Sat, 15 Feb 2025 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uS4GDR/S"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87D1537AC;
	Sat, 15 Feb 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739602461; cv=none; b=VYPJsUp1kMKmjSu/EUfyr9VvpjUCm86mVzUaoqzsFqxtb0wS4ET1r9BWiRuYJCmthrBhJVE1y7kWV5rL9e3v8+nBrsWQFttgFQd7ZZkOFLweWOmlk0hiT3kYIDL/bNBBMPanUJ4Z5Da/XM0e9pGwygb8eop2OIDemgg5XgMXBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739602461; c=relaxed/simple;
	bh=mfCqWG6NaYR6Sxd++9L3Sle7RqL0qWrh+kjSNFtksAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiNsvpWNPiLItwfMnNORdjoG3HwQoox7xq8011uwWVUSGUTVDRTWICOLDf6SQQFAIY3tG4wknLnvesxu1/KreEUX6FkVqR+L0sa1GLmZS0YiG3FLXjcONFEIFfvBBq+VUNZkAegJV7vBjNia6txTuEqLia7tjV2qGH1mkqjJgV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uS4GDR/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326CCC4CEDF;
	Sat, 15 Feb 2025 06:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739602457;
	bh=mfCqWG6NaYR6Sxd++9L3Sle7RqL0qWrh+kjSNFtksAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS4GDR/SYf5jq318wLFt00h54nZgI/f4yIrfYTZvBV7jtSKQ1RY9pTAqlNYYxSCC6
	 zygTR0MT/JQ5CQ/0x1v48rY/2sgioAgVjQlS+fAcz/p+8ZpKoylYdoM2+Ime/YZKv1
	 76WODxrBGyq6uEyBhlP3dGL1sSbDsZD2GKoZSyLE=
Date: Sat, 15 Feb 2025 07:53:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021501-tamer-sank-142a@gregkh>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
 <2025021437-washout-stonewall-d13e@gregkh>
 <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>

On Fri, Feb 14, 2025 at 07:16:30PM +0100, Jerome Brunet wrote:
> On Fri 14 Feb 2025 at 17:33, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Feb 11, 2025 at 06:27:58PM +0100, Jerome Brunet wrote:
> >> Add helper functions to create a device on the auxiliary bus.
> >> 
> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> >> the same code repeated in the different drivers.
> >> 
> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/auxiliary_bus.h | 10 +++++
> >>  2 files changed, 98 insertions(+)
> >
> > I like the idea, see much the same of what I recently did for the "faux"
> > bus here:
> > 	https://lore.kernel.org/all/2025021023-sandstorm-precise-9f5d@gregkh/
> 
> Reading this, I'm getting the feeling that some (most?) simple auxiliary
> driver might be better off migrating to "faux", instead of what I'm
> proposing here ? Is this what you are suggesting ?

For any that do not actually talk to any real hardware (i.e. they are
NOT sharing resources with a parent device), then yes, they should.  I
was also trying to point out that "simple" apis like what you created
here are a good thing in my opinion, I like it!

> Few Q:
> Is there some sort of 'platform_data' (sorry for the lack of a better
> term, no provocation intended ;) ) ... it there a
> simple way to pass an arbitrary struct to the created device with 'faux' ?

There are at least 2 ways to do this:
  - embed a faux_device inside a larger structure and then do a
    container_of() in any sysfs callback to get to your real structure
  - in a provided probe() callback, set the driverdata field with a call
    to faux_device_set_drvdata()

> The difference between aux and faux I'm seeing it that aux seems to
> decouple things a bit more. The only thing aux needs is a module name to
> pop something up, while faux needs a reference to the ops instead.

aux is needed for when you want multiple drivers to be bound to the same
hardware resource and need some way to share all of that.  faux is used
for "fake" devices where you just need a struct device in the /sys/ tree
to be used for "something" or as a parent device for something else.
See the examples in the above patch series where I convert many
different types of drivers over to use faux.

> I can see the appeal to use aux for maintainers trying to decouple
> different subsystems.

Again aux is needed for "sharing" a real device.  faux is there for fake
ones that people previously were using platform devices for.

> > Some review comments:
> >
> >> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> >> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
> >> --- a/drivers/base/auxiliary.c
> >> +++ b/drivers/base/auxiliary.c
> >> @@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> >>  }
> >>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> >>  
> >> +static void auxiliary_device_release(struct device *dev)
> >> +{
> >> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> >> +
> >> +	kfree(auxdev);
> >> +}
> >> +
> >> +static struct auxiliary_device *auxiliary_device_create(struct device *dev,
> >> +							const char *modname,
> >> +							const char *devname,
> >> +							void *platform_data,
> >
> > Can you have the caller set the platform_data if they need/want it after
> > the device is created?  Or do you need that in the probe callback?
> 
> My assumption was that it is needed in probe, but I guess that entirely
> depends on the driver. If that was ever needed, it could be added later
> I think.
> 
> >
> > And can't this be a global function too for those that don't want to
> > deal with devm stuff?
> 
> There was a note about that in the cover-letter of the v1 but I did not
> repeat it after.
> 
> It can be exported but I had no use for it so I thought It was better not
> export it until it was actually needed. I really do not have a strong
> preference over this.
> 
> >
> >> +							int id)
> >> +{
> >> +	struct auxiliary_device *auxdev;
> >> +	int ret;
> >> +
> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> >> +	if (!auxdev)
> >> +		return ERR_PTR(-ENOMEM);
> >
> > Ick, who cares what the error value really is?  Why not just do NULL or
> > a valid pointer?  That makes the caller much simpler to handle, right?
> >
> 
> Sure why not
> 
> >> +
> >> +	auxdev->id = id;
> >> +	auxdev->name = devname;
> >> +	auxdev->dev.parent = dev;
> >> +	auxdev->dev.platform_data = platform_data;
> >> +	auxdev->dev.release = auxiliary_device_release;
> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> >> +
> >> +	ret = auxiliary_device_init(auxdev);
> >
> > Only way this will fail is if you forgot to set parent or a valid name.
> > So why not check for devname being non-NULL above this?
> 
> If auxiliary_device_init() ever changes it would be easy to forget to
> update that and lead to something nasty to debug, don't you think ?

Yes, this is being more defensive, I take back my objection, thanks.

> >> +	if (ret) {
> >> +		kfree(auxdev);
> >> +		return ERR_PTR(ret);
> >> +	}
> >> +
> >> +	ret = __auxiliary_device_add(auxdev, modname);
> >> +	if (ret) {
> >> +		/*
> >> +		 * NOTE: It may look odd but auxdev should not be freed
> >> +		 * here. auxiliary_device_uninit() calls device_put()
> >> +		 * which call the device release function, freeing auxdev.
> >> +		 */
> >> +		auxiliary_device_uninit(auxdev);
> >
> > Yes it is odd, are you SURE you should be calling device_del() on the
> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
> > just call that here?
> 
> I'm confused ... I am call auxiliary_device_uninit() here. What do you
> mean ? 

Oh wow, I got this wrong, sorry, I was thinking you were calling
auxiliary_device_destroy().  Nevermind, ugh, it was a long day...

thanks,

greg k-h

