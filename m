Return-Path: <linux-mips+bounces-7810-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB110A39505
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 09:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A753B1463
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 08:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A3423C8A3;
	Tue, 18 Feb 2025 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f4mC4+xj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB57749A;
	Tue, 18 Feb 2025 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866503; cv=none; b=F9ycMRELl+Rsb7jZfDH79A0+JXBMmfXoPxPZejS2OFi1ft+yoTFhCi2P5yymo8zoEonFrvCyyXTf7If8+4PbEf1a699N8gdIGD4lWpmNtXK/J7O9pz7HaEXjOdRhvWw2FT32J+TAQSgTXV4OTDyn2SQEvbCPmZOdwTji4GfLqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866503; c=relaxed/simple;
	bh=UFdR7IbguGl7iKpceVwoQo+fFJc+Ocd7Dgzg0nOOeAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QR0TTmQpVg9VULZAspdn3kAXaCZJChPkVIgXhsTYTZbzZVqgBBNZoz0wAp3d7nmjlQNxnAR0aYXJhD8IWKBH+ur1iKiUOBz2XASSXQVyfPO1LB6oe+AwzwMqPB4q2W9x1nJZa+Az6/z5rPiZqgOKYUn2m6kp347tvTIBHSeLW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f4mC4+xj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D0C4CEE2;
	Tue, 18 Feb 2025 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739866502;
	bh=UFdR7IbguGl7iKpceVwoQo+fFJc+Ocd7Dgzg0nOOeAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4mC4+xjy8+3Ap3+zmCq4f4juZVPx3MmLXCA2pN+OuMHab5gaVtMq0RgIb/vmcIt4
	 5pomyFm6UrsvIjuGwEbtdC0Cnn6HgTkNdbLBGtu/S6H3634IT4Qh8f1TMWeYpsxTMx
	 HEiie4JkezV19OJAsaovd47Bq7gU0JDqjGhlceHw=
Date: Tue, 18 Feb 2025 09:14:59 +0100
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
Message-ID: <2025021826-smile-batting-e52f@gregkh>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
 <2025021437-washout-stonewall-d13e@gregkh>
 <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
 <2025021501-tamer-sank-142a@gregkh>
 <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>

On Mon, Feb 17, 2025 at 07:10:54PM +0100, Jerome Brunet wrote:
> On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> [...]
> 
> >> 
> >> >
> >> >> +							int id)
> >> >> +{
> >> >> +	struct auxiliary_device *auxdev;
> >> >> +	int ret;
> >> >> +
> >> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> >> >> +	if (!auxdev)
> >> >> +		return ERR_PTR(-ENOMEM);
> >> >
> >> > Ick, who cares what the error value really is?  Why not just do NULL or
> >> > a valid pointer?  That makes the caller much simpler to handle, right?
> >> >
> >> 
> >> Sure why not
> 
> I have tried the 'NULL or valid' approach. In the consumers,
> which mostly return an integer from their various init function, I got
> this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
> really pick one.
> 
> It is actually easier to pass something along.

Ok, fair enough, thanks for trying.  But I would have returned just
-ENODEV in all cases, as that's what the end result was :)

thanks,

greg k-h

