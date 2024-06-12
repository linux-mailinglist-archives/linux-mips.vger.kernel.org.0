Return-Path: <linux-mips+bounces-3638-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF6905F43
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 01:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C870B20F2C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 23:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FFD12C53B;
	Wed, 12 Jun 2024 23:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCTKehGr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822F12EBE7;
	Wed, 12 Jun 2024 23:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718235137; cv=none; b=cdO9WOZ1LdBGdL6I8MJpJ3gxSTUVyTK7e4HFvmdKrzexV86lKLiGiv0PRzpKmvR/YdwXvYwZ6Zj5XMIKderJ0Ynkrg/MqVrc4ptiLqLydsualspWQRpXqSOtg+HT66Y1+Ep0iVQ7xUf8S/i5ldlJifjxHKtzZ82ouVGI77T8RBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718235137; c=relaxed/simple;
	bh=8WZdAvjKJ14mKlH1Yr6hIeTER5piM1OK9i/+eGgA2Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j28CmsL3R1ijhrthqeIPYLsPYyTLwdCe4C5yRVBhHD6bHHzf5Zzh0Ul1sDgCWH5Rehg6hFdXfA9BoASNFvoK10cDaMPFoeiDTW00ml++f9hHhkA1LChBFABUcRQpoWj9uCbEk3U0gr161wUCOONiDSHuyk+2bZ4NqQOc79tISB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCTKehGr; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70436048c25so323808b3a.0;
        Wed, 12 Jun 2024 16:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718235135; x=1718839935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nVIw2cLdhkDjDwByxv3BM9a0LGJHzegnu2v3rc/rNJ0=;
        b=JCTKehGrr1AirAx7C47+3/tXaSRXM6BKCcg6qsjSKvvD7ggn6vYOTjI0D44W1Ehf+0
         0x9qnBGbzvUeBRkztPzEekXiJ+8otKdNuOo0WIlhaYPfBsW3Iq49fGwZBUQbBvO11UCn
         jmcARMDOVZ7EpBiIBhzbiYGjmHDpJVK0erzjQApJuYfCdcvx+zenZEcx9uZOGU9+TjeE
         jdm4QorsVocbddzlNr9/QXNXce95pe9Q9PJNAnV0cfYrAh70gjZukNSBPNoqW3t8pCBC
         h+/8SmgsE4Wbog4ZpnV11AQKGe23BDtNwmkAUmeCXFZWeWAuFHTlVo0/or2NFaTkVvUZ
         zo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718235135; x=1718839935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVIw2cLdhkDjDwByxv3BM9a0LGJHzegnu2v3rc/rNJ0=;
        b=jPb5Gy2WgY1U4tGvMonsVycL8pqXccTV6Q04R1bvPIbtbOQD81nKxYoP01PwsH3Gq8
         Ti0RdfWTfQz3K30MZO/HurX7+WeeNu+mL74f088rARHIQg5WpVVNFYxQECjQHVgFak1C
         9PoRxKJ6Hax3iHu0cx0n68PZCmmszJcUC0z2R/+8zOsxIL8LwNlxJTZHvMIBfR+w1/fC
         E6HZPktSSeBdvwU7NP0rI0Wvv5sjjwK/Wa+dnCW9H2M2xXAvWv8o0bGy6vo00E49+MQc
         8llBb5E8aXbR4PZKk4Fs+PNXWPQUD/UzINETfjAcr/zXjGXw6QVCNaM6nGUkyaMBbXmm
         CfYw==
X-Forwarded-Encrypted: i=1; AJvYcCVXdJ89gHnDPFsA4VoYH/yc44xusgt1a/5GIR93ldyY3NTh2VuZY022NfTE8z0NFNCFNeiUguDoPwbOHu0ZcRIYdBmMw4j1yk5iZzTHT0XE36XtydMQDjuc+FgHZxAT7C5tzmouFIxG6W8DIoCVddkJqP8Jsar9oQ4KGg97Ac1bHg==
X-Gm-Message-State: AOJu0YyB2lkE0ktpbwmS+tIJMcqd/VEOblFA5FJXFeqv5O472f0hnGmS
	QtwxL+d0TyXOdm6PLFz1oeeSUj1m2Q8B/jLDDlgP3OHF5Bgm/QHJ
X-Google-Smtp-Source: AGHT+IGOEHfn8uKB6khdsycwfc4mPrOaj734dAuNKOUYgEplVijEho9TeDXMq0s7NQReq44ip3H9Ew==
X-Received: by 2002:a05:6a00:22cd:b0:704:1932:5604 with SMTP id d2e1a72fcca58-705bce75f56mr3059726b3a.15.1718235134867;
        Wed, 12 Jun 2024 16:32:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee2d36b96sm29224a12.74.2024.06.12.16.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 16:32:14 -0700 (PDT)
Date: Wed, 12 Jun 2024 16:32:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>
Cc: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
	robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <Zmov-8IGm-misoRs@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com>
 <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
 <ZmoXAR79emQBNyhj@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmoXAR79emQBNyhj@google.com>

On Wed, Jun 12, 2024 at 02:45:37PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 12, 2024 at 09:47:39PM +0200, Martin Schiller wrote:
> > On 2024-06-12 20:39, Martin Schiller wrote:
> > > On 2024-06-12 19:47, Dmitry Torokhov wrote:
> > > > Hi Marton,
> > > 
> > > Hi Dmitry,
> > > 
> > > > 
> > > > On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
> > > > > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod
> > > > > API") not
> > > > > only switched to the gpiod API, but also inverted / changed the
> > > > > polarity
> > > > > of the GPIO.
> > > > > 
> > > > > According to the PCI specification, the RST# pin is an active-low
> > > > > signal. However, most of the device trees that have been widely
> > > > > used for
> > > > > a long time (mainly in the openWrt project) define this GPIO as
> > > > > active-high and the old driver code inverted the signal internally.
> > > > > 
> > > > > Apparently there are actually boards where the reset gpio must be
> > > > > operated inverted. For this reason, we cannot use the
> > > > > GPIOD_OUT_LOW/HIGH
> > > > > flag for initialization. Instead, we must explicitly set the gpio to
> > > > > value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
> > > > > may have been set.
> > > > 
> > > > Do you have example of such boards? They could not have worked before
> > > > 90c2d2eb7ab5 because it was actively setting the reset line to
> > > > physical
> > > > high, which should leave the device in reset state if there is an
> > > > inverter between the AP and the device.
> > > 
> > > Oh, you're right. I totally missed that '__gpio_set_value' was used in
> > > the original code and that raw accesses took place without paying
> > > attention to the GPIO_ACTIVE_* flags.
> > > 
> > > You can find the device trees I am talking about in [1].
> > > 
> > > @Thomas Bogendoerfer:
> > > Would it be possible to stop the merging of this patch?
> > > I think We have to do do some further/other changes.
> > > 
> > > > 
> > > > > 
> > > > > In order to remain compatible with all these existing device
> > > > > trees, we
> > > > > should therefore keep the logic as it was before the commit.
> > > > 
> > > > With gpiod API operating with logical states there's still
> > > > difference in
> > > > logic:
> > > > 
> > > > 	gpiod_set_value_cansleep(reset_gpio, 1);
> > > > 
> > > > will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
> > > > apparently what you want for boards with broken DTS) but for boards
> > > > that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
> > > > 0, leaving the card in reset state.
> > > > 
> > > > You should either use gpiod_set_raw_value_calsleep() or we can try and
> > > > quirk it in gpiolib (like we do for many other cases of incorrect GPIO
> > > > polarity descriptions and which is my preference).
> > 
> > So you mean we should add an entry for "lantiq,pci-xway" to the
> > of_gpio_try_fixup_polarity()?
> > Do you know any dts / device outside the openWrt universe which is using
> > this driver.
> 
> No, I don't.
> 
> Could you please try this:
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 59c7f8a2431a..4948ecaa422c 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
>  		 */
>  		{ "qi,lb60",		"rb-gpios",	true },
>  #endif
> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
> +		/*
> +		 * According to the PCI specification, the RST# pin is an
> +		 * active-low signal. However, most of the device trees that
> +		 * have been widely used for a long time incorrectly describe
> +		 * reset GPIO as active-high, and were also using wrong name
> +		 * for the property.
> +		 */
> +		{ "lantiq,pci-xway",	"gpios-reset",	false },

Sorry, "gpios-reset" is wrong, the driver used "gpio-reset". So:

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 59c7f8a2431a..d21085830632 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "qi,lb60",		"rb-gpios",	true },
 #endif
+#if IS_ENABLED(CONFIG_PCI_LANTIQ)
+		/*
+		 * According to the PCI specification, the RST# pin is an
+		 * active-low signal. However, most of the device trees that
+		 * have been widely used for a long time incorrectly describe
+		 * reset GPIO as active-high, and were also using wrong name
+		 * for the property.
+		 */
+		{ "lantiq,pci-xway",	"gpio-reset",	false },
+#endif
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
 		/*
 		 * DTS for Nokia N900 incorrectly specified "active high"
@@ -512,9 +522,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
 		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
 #endif
-#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
+#if IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
-		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
+		{ "reset",	"gpio-reset",	"lantiq,pci-xway" },
 #endif
 
 		/*

-- 
Dmitry

