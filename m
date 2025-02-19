Return-Path: <linux-mips+bounces-7857-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D7A3BFAB
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 14:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82AC53A89AC
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCF21E0084;
	Wed, 19 Feb 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TZH/bQk4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD41C84A9;
	Wed, 19 Feb 2025 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971167; cv=none; b=J8QmLOWnINxKV2reKt61Svi5eBhWS5vVSej1DKf0iSjAy0NS2sOz3SlAtpUujX0OvWNFEQUjF9T0dYFE7lIEBhGtu9iJKuUiMOv5OOKwiJjvYixzUv8j1QinX3+luuPum5DLtMrdthwApj1KKhMRwfbYW+gG3Clu7NAJorsGxJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971167; c=relaxed/simple;
	bh=RcuQPWBAOebggXpc49oXCroXSGfFXw0R3wUoVFgSYw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvXuSMXNAovZ4IujWzgVxdchoI/POpfRfB5hdK5zZLLim1FZk6O75SmIH2pk17FXII8pPobYNJ8E87z8kKZNOolK1BzDStRRliWn7zHpxJPQnDILQM65uiwbtCccpTTCmBQc5Z6L49Wq7Gc++LVXtQEpzGaWK3ZUOmwVzOLwiSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TZH/bQk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26083C4CED1;
	Wed, 19 Feb 2025 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739971166;
	bh=RcuQPWBAOebggXpc49oXCroXSGfFXw0R3wUoVFgSYw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZH/bQk4qL6+2tnUJqqWBkPPTthw5gu9C17UymFAIupjP536vP5/A2uuLTBTsi5EM
	 G6Cwv45NY3dyN2GbwkOU/ec7M/aKurvYZOZohZZHB3xEdjNwkIGxGcUW3qgOJrXUR0
	 jXyHDhQTIbUsWIurk+PCF0wp5cC3JQAlgnZOUB20=
Date: Wed, 19 Feb 2025 14:19:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
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
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021937-trodden-snowdrop-99be@gregkh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
 <2025021922-spongy-swirl-0746@gregkh>
 <eskvhtljnrkhm6vmqy52gkweexj3tcethejeywcoib4la72jcl@ojuqcazpvht4>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eskvhtljnrkhm6vmqy52gkweexj3tcethejeywcoib4la72jcl@ojuqcazpvht4>

On Wed, Feb 19, 2025 at 02:08:22PM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 19, 2025 at 11:13:14AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > > > Add helper functions to create a device on the auxiliary bus.
> > > > 
> > > > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > > > the same code repeated in the different drivers.
> > > > 
> > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > ---
> > > >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> > > >  include/linux/auxiliary_bus.h |  17 +++++++
> > > >  2 files changed, 125 insertions(+)
> > > > 
> > > > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > > > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > > > --- a/drivers/base/auxiliary.c
> > > > +++ b/drivers/base/auxiliary.c
> > > > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> > > >  
> > > > +static void auxiliary_device_release(struct device *dev)
> > > > +{
> > > > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > > > +
> > > > +	kfree(auxdev);
> > > > +}
> > > > +
> > > > +/**
> > > > + * auxiliary_device_create - create a device on the auxiliary bus
> > > > + * @dev: parent device
> > > > + * @modname: module name used to create the auxiliary driver name.
> > > > + * @devname: auxiliary bus device name
> > > > + * @platform_data: auxiliary bus device platform data
> > > > + * @id: auxiliary bus device id
> > > > + *
> > > > + * Helper to create an auxiliary bus device.
> > > > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > > > + */
> > > > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > > > +						 const char *modname,
> > > > +						 const char *devname,
> > > > +						 void *platform_data,
> > > > +						 int id)
> > > > +{
> > > > +	struct auxiliary_device *auxdev;
> > > > +	int ret;
> > > > +
> > > > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > > > +	if (!auxdev)
> > > > +		return NULL;
> > > > +
> > > > +	auxdev->id = id;
> > > > +	auxdev->name = devname;
> > > > +	auxdev->dev.parent = dev;
> > > > +	auxdev->dev.platform_data = platform_data;
> > > > +	auxdev->dev.release = auxiliary_device_release;
> > > > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > > > +
> > > > +	ret = auxiliary_device_init(auxdev);
> > > > +	if (ret) {
> > > > +		kfree(auxdev);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	ret = __auxiliary_device_add(auxdev, modname);
> > > > +	if (ret) {
> > > 
> > > This loses possible error return values from __auxiliary_device_add().
> > 
> > Why does that really matter?
> 
> At the very least the caller (or caller of a caller) can call
> dev_err_probe() or dev_err("%pe"). With the current implementation as
> everybody maps NULL to -ENOMEM the error message will be cryptic.
> 
> Or just having a cryptic value in the logs.

So all you can get here could be:
	-ENOMEM - memory couldn't be allocated somewhere
	-EINVAL - wrong parameters sent to auxiliary_device_init() or __auxiliary_device_add()
	-EEXIST - duplicate name

And if -EEXIST happens, you will get a kernel log splat from sysfs
showing you that something went wrong.

So while I understand the need to be specific here in reporting the
exact error, I fail to understand how it really matters at all.  A
driver writer really only wants to know "did it work?" and have a simple
way to test it.

IS_ERR_OR_NULL() and then getting the error using PTR_ERR() is rough and
feels like boilerplate code that everyone gets wrong (how many times do
people accidentally only check for NULL?).

Anyway, I'm for simple apis, and NULL or valid pointer seems simple to
me.

thanks,

greg k-h

