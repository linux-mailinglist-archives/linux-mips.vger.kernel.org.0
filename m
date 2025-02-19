Return-Path: <linux-mips+bounces-7850-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353EEA3BB45
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 11:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7D4C7A62E9
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 10:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8051D90D9;
	Wed, 19 Feb 2025 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LHj7SUL6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F872862A1;
	Wed, 19 Feb 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959999; cv=none; b=decUiUzvOHP/DB4tNME6IdlpIxmFg7XiZxbpS3wa/1neOJQjeUAQiR1KbUkC4zuQH2TbVHBIQZAUF4d1eLvyjdg9HLbNyuY+rnKwktRMPd8Yoj1lPAarHioNx4BXu8tCou/5aO/DrW5qALbouTtdmseXC2URcv6HMdYF7lAuvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959999; c=relaxed/simple;
	bh=fMTgCZ4pkvP3/QIoF7iwpCmqEdcG6A1koNbMDvsj2dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aov2Bk8RY+eTZ4wflic/7PYWbkQDymoSSRkIEOJqvebmWRuk5R3WeHv2wi+BpxT6prqfkpFd6K1Y8hjux27ZYDdDzko4zlNkYmMMF16SzfvJCPmzL0WQOjfEPrqhKBhhq2JZbfTj34TK2DvP876ewxWKWGDQJptkN56sDm0MuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LHj7SUL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40B3C4CED1;
	Wed, 19 Feb 2025 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739959997;
	bh=fMTgCZ4pkvP3/QIoF7iwpCmqEdcG6A1koNbMDvsj2dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHj7SUL6hr9dnxeuMouAoZl+TqgPJkJnt6OxeGZBVnwjG1an8QfGZTZhAz67SUNMi
	 V5LaRH/n8f0+cZvr3kZbgPWLsV3MQceZE5n+wYuzRWmC4ZHELcec25299VKUrxRVkD
	 lwg+grq7xKKnKHBmMBQEKZrZR5rJUGwcEwJFWwx8=
Date: Wed, 19 Feb 2025 11:13:14 +0100
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
Message-ID: <2025021922-spongy-swirl-0746@gregkh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>

On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > Add helper functions to create a device on the auxiliary bus.
> > 
> > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > the same code repeated in the different drivers.
> > 
> > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/auxiliary_bus.h |  17 +++++++
> >  2 files changed, 125 insertions(+)
> > 
> > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > --- a/drivers/base/auxiliary.c
> > +++ b/drivers/base/auxiliary.c
> > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> >  }
> >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> >  
> > +static void auxiliary_device_release(struct device *dev)
> > +{
> > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > +
> > +	kfree(auxdev);
> > +}
> > +
> > +/**
> > + * auxiliary_device_create - create a device on the auxiliary bus
> > + * @dev: parent device
> > + * @modname: module name used to create the auxiliary driver name.
> > + * @devname: auxiliary bus device name
> > + * @platform_data: auxiliary bus device platform data
> > + * @id: auxiliary bus device id
> > + *
> > + * Helper to create an auxiliary bus device.
> > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > + */
> > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > +						 const char *modname,
> > +						 const char *devname,
> > +						 void *platform_data,
> > +						 int id)
> > +{
> > +	struct auxiliary_device *auxdev;
> > +	int ret;
> > +
> > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > +	if (!auxdev)
> > +		return NULL;
> > +
> > +	auxdev->id = id;
> > +	auxdev->name = devname;
> > +	auxdev->dev.parent = dev;
> > +	auxdev->dev.platform_data = platform_data;
> > +	auxdev->dev.release = auxiliary_device_release;
> > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > +
> > +	ret = auxiliary_device_init(auxdev);
> > +	if (ret) {
> > +		kfree(auxdev);
> > +		return NULL;
> > +	}
> > +
> > +	ret = __auxiliary_device_add(auxdev, modname);
> > +	if (ret) {
> 
> This loses possible error return values from __auxiliary_device_add().

Why does that really matter?

> I'd suggest to return ERR_PTR(ret) here and in the
> auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
> failure.

Will the caller do something different based on the error value here?
All we care is that this worked or not, the specific error isn't going
to matter for device creation like this.

thanks,

greg k-h

