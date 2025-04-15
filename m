Return-Path: <linux-mips+bounces-8608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE8A89F4B
	for <lists+linux-mips@lfdr.de>; Tue, 15 Apr 2025 15:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492053BDFBE
	for <lists+linux-mips@lfdr.de>; Tue, 15 Apr 2025 13:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80761297A72;
	Tue, 15 Apr 2025 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZ43ARME"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D70297A68;
	Tue, 15 Apr 2025 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723347; cv=none; b=J5GHL28e4ymcdM8auiDlKsPJXq4lWljdZ8fiE6f4kKunYUhrX4ehUb8RaDiZyVR6c6jDtAQbMKvGgu60poCbLXU9bvi14Mb+8dtUD2NGrHBmg5JDsQGH64p6GhQRi8Mi37OQF9qBx8AkoPEE5miLzKSWfH/KArO84iJEmBkpFXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723347; c=relaxed/simple;
	bh=RRW47R1L7/5mlFWx4w8Iz2jOualfmecSBafClG5oO7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o53wxbpHFQKcssLJibyC6ypMGvidzUKtvOnvJE4lTkIyHRy0no3Lw/hIkq2AjaSrqrgEPUh5n8Z2gPRm3Vao+el1M1BmTcPFMoFtN3XlQV1t3Lo459y4sLhUNsmoLIaTSQ/ImD2RjmhdQAO0z97GJin5XD6C7RzV8ZdFuR/m4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EZ43ARME; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF09C4CEDD;
	Tue, 15 Apr 2025 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744723346;
	bh=RRW47R1L7/5mlFWx4w8Iz2jOualfmecSBafClG5oO7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZ43ARME0oN0cZwYNSw0w8v/oqZQVtsnKvLPa+61dXAl0xfbNV5WsjKmuwtYuqoWa
	 l70CaLBbqw3lS1d6ftYnd0AdLEFRyxwRR+DBeVImrTw1HKryvX9nWAHdx2PRVrekSU
	 0xPfp3YvGyuZ8Toq9mhyEA90JZvkFS5z9EL1gm1Y=
Date: Tue, 15 Apr 2025 15:22:24 +0200
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
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025041506-unrented-props-6226@gregkh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <2025021938-swan-facedown-e96a@gregkh>
 <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
 <2025041508-remix-plasma-cd47@gregkh>
 <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>

On Tue, Apr 15, 2025 at 03:10:38PM +0200, Jerome Brunet wrote:
> On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
> >> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >> 
> >> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> >> >> Add helper functions to create a device on the auxiliary bus.
> >> >> 
> >> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> >> >> the same code repeated in the different drivers.
> >> >> 
> >> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> >> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> >
> >> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> 
> >> Hey Greg,
> >> 
> >> Do you need me to do something else on this topic ?
> >
> > I don't know what tree it is going through, do you?  If you want me to
> > take in the driver-core tree, just let me know.
> 
> For patch #1, I think driver-core would be appropriate, unless there is
> something more specific for the auxiliary device support ?
> 
> I'll wait for this sink into an rc1, then resubmit the different driver
> changes to the appropriate tree, no rush.

Ok, will take just the first one then, thanks.

greg k-h

