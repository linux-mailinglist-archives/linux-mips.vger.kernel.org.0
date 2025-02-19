Return-Path: <linux-mips+bounces-7847-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 817E7A3B791
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 10:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0528F17D39C
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 09:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B020D1AF0C8;
	Wed, 19 Feb 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PReTmFs1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF51DF721
	for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955968; cv=none; b=iv0E333wn+SDfllPKCU7OkM88xOQDo0dbOHGcev6VXygSX/zA0hacjuXbzHBEAbk5/ZGh6FJaMrmw9B0DRe3GFgvV+3zF7Eoanb25HeebgfTlMpfbdf6hmR5tHyNv+nzsXhhCneIMLIQ1Gj1oWmUPgYLSMdQ60WnIjH1qf3nmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955968; c=relaxed/simple;
	bh=Ll4Hm33BOP6BRDteNaeEkalteukRrEcf/dQJ2Kgc9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddymI6+HXWG/KtlQYj1wvkX4T7Ah66XZ7074KrB3bljAOB1LYL4YuyPf12epxLNFNwUMkaPiZJi1NSgYyF0fJ5JsAwe4ilPetIKOF2Q6NdPnT34arHPQDzzzTTdsWACg4m2vMsGb+AGmc4FFmxn/1qCHRcCPXfqny9ytlkImb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PReTmFs1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54626a71b40so2374756e87.3
        for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955965; x=1740560765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=PReTmFs1TguXQvzw4JHw6oj6EisZHwVxZ0CeL8wrXLAJlbmx6ZY267eHem9cbm5Ymf
         n0AZsRflHSMLcA33EavM/PQaGi8IhfjZJFVSK3WtgceUHb60BEPeD2RCAk2AUj6bTa7Q
         7I9Hty5dboMTRxUIGj8D9k9ZMOdaIPhDqddVSpL8T7uYIddLcZZ+tZbPTS/HMOLbDAx1
         lTY4x9mji9qRrZFmBvYPthjpAySOwUiHK5G112Ccz6/Ac3+CM50+Nbb3YTKgGtlEJ6B2
         5j4lAjV541IwUb4vlypVj9vTNzsrixIxdRafjJaULDorJWTwdARSgnOGxbB9kYdmRmrl
         TZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955965; x=1740560765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=gL7Taw4UrSMK37ZeUE4YZ/zsNmv2zWBWgB4BK1r8Dsxq69NmjxpWIHt8GqUMqaU3Bq
         TNhU7YILw61iK/XfbgdTx1c7lpOho7fhEAwL3h9QHP7aqlRYQjDsr3CcdVhqikzNxX6x
         tXCmIm3vQ/1KkH5nAVlTL0jhDjCyY5Gt3xKe6RuL3p0E911oFXHPgQohhpV9mLzVxgUj
         LlZx/K8dIWNUE2g1cTTnCtL//v3oUBsU9QZNwfLzheN6Kdg21cEj2r7R9VY+LRfpLa98
         wPAQtQf1dV9IsOUEv1JB9hvkj1NqOV8hqm+G3pOSjEAd8rL5AKvGff/P8yaRVp2VFPU0
         00vg==
X-Forwarded-Encrypted: i=1; AJvYcCXzsJm4Z0ZXvrc9PHDu1qCTGcjM0yKuP72Nf/wMTH6SXVCiuKOMLQNPB+hPtTKssGviE2G2e5sow0uY@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJMF1bvYkh63gUNqdwJwRsNZf5mNNVN5Zv1plglGBFhHD/EeA
	/Qk3wwAXNYoMK2zo67xF6lGtXFqkXef3xUP8BQwoNc0YSD+CNMGsZTNM6ssVlhs=
X-Gm-Gg: ASbGncsf/6QAgqjhPJYjhczbcDV2SDXAFoXG1FDD3ZcCygJKeQKWv+35dp8n8gLTOhb
	kwQ9BjbZAi2ziQPVUlhffL0BxjYHLFwF2SdoHQapREtB+gqdTzDF5FV+Ahzq8sWzybjA+NZ3ig3
	G1gLxoivnA8Vd50zL4ObO4oc7hKKV8gLPSN64BInnqZ+qIXKOinQyrHosFgohZKKbf2yJCJJev2
	aweqWjRfS43RD+nvPXjbPZRl4aif7Rq9MZKHcU+uD6+Jk4jLhSFIvVAekp+uZDBOgmOG3GSruvm
	MAE43kfSjFIbY0fBEA1CRv6K0ty4r5n6ezikTsef+34qSw0tvYzzEUNdhjSK6rSenlo4mqs=
X-Google-Smtp-Source: AGHT+IHm7rrZGF7gWE8rLuZPX4nvDlV3DcFc5Uk1QwC4R6ncjGo7U2SoOER3uymDvhu6BZaa/4okgQ==
X-Received: by 2002:a05:6512:3a94:b0:545:10bc:20ca with SMTP id 2adb3069b0e04-5452fe583c4mr6368433e87.24.1739955964491;
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54530df9016sm1454714e87.36.2025.02.19.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Date: Wed, 19 Feb 2025 11:06:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>

On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/auxiliary_bus.h |  17 +++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>  }
>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>  
> +static void auxiliary_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	kfree(auxdev);
> +}
> +
> +/**
> + * auxiliary_device_create - create a device on the auxiliary bus
> + * @dev: parent device
> + * @modname: module name used to create the auxiliary driver name.
> + * @devname: auxiliary bus device name
> + * @platform_data: auxiliary bus device platform data
> + * @id: auxiliary bus device id
> + *
> + * Helper to create an auxiliary bus device.
> + * The device created matches driver 'modname.devname' on the auxiliary bus.
> + */
> +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> +						 const char *modname,
> +						 const char *devname,
> +						 void *platform_data,
> +						 int id)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> +	if (!auxdev)
> +		return NULL;
> +
> +	auxdev->id = id;
> +	auxdev->name = devname;
> +	auxdev->dev.parent = dev;
> +	auxdev->dev.platform_data = platform_data;
> +	auxdev->dev.release = auxiliary_device_release;
> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret) {
> +		kfree(auxdev);
> +		return NULL;
> +	}
> +
> +	ret = __auxiliary_device_add(auxdev, modname);
> +	if (ret) {

This loses possible error return values from __auxiliary_device_add().
I'd suggest to return ERR_PTR(ret) here and in the
auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
failure.

> +		/*
> +		 * It may look odd but auxdev should not be freed here.
> +		 * auxiliary_device_uninit() calls device_put() which call
> +		 * the device release function, freeing auxdev.
> +		 */
> +		auxiliary_device_uninit(auxdev);
> +		return NULL;
> +	}
> +
> +	return auxdev;
> +}
> +EXPORT_SYMBOL_GPL(auxiliary_device_create);
> +

-- 
With best wishes
Dmitry

