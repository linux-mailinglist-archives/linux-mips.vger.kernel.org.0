Return-Path: <linux-mips+bounces-3637-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA1905DDF
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 23:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5944B210AC
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 21:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4960684FDC;
	Wed, 12 Jun 2024 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab0aUMQD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4F84D02;
	Wed, 12 Jun 2024 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718228743; cv=none; b=FGKFqm2DckM5gDZ2QrdIf6AyJBtqpcLS0RUq8DipHb3jviZiF+l9FQZ0mqYwO5cYgrdNKV6P1PjPzF9xS2/d+MzeMDDauNgdyiZyzorLFzYDOaKpIE6WJZEnJilNIvN1F2dktdl/f2zcCYqmnxgY9e1T1SUNRtUWYQxytAW3+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718228743; c=relaxed/simple;
	bh=3qwM3YMDGCSC1fcQ0SSKCUNxj4nWENbqFIY8TjOX4jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQRfRnzusNBJy+TyvlJMXovPDQHtqA90NIpu0S+BSfbInc7ZuOIV8KrDesBg1Go8WHCiCkDkXmk9SxPbPbin6YEi6UnroQ4ct6vcmf8CrcHvSZPU3WUPHsj26PoFltd2/CaUfZql2OhQus191RFA+w3Yo4JM8tjzSKg8zIIZqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ab0aUMQD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70432d3406bso261734b3a.1;
        Wed, 12 Jun 2024 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718228741; x=1718833541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6lWae0B5/GP4WtvVp63JCaJ9laTWe/yar8hYd+cHUM=;
        b=ab0aUMQDnZni+oLzp/83JWaRuz5jApJvZItRJ3s3Q58TcF+OpqGSb6Yqf374rcYavg
         G9XLrEw8k8z/MIr+xweXTCdv3p/vcsLukPvg6fRXz0S3HMdDqc7kVO5G5hDnYXqPda4X
         X7uNxXCOqBk0Gnd8j2XdGyeUHbtH3WmRcfDrVBynGDlKcNzyA/Id+eyy0bpGjf35YNYv
         OaJP81/gJpnYruc92dvJuemCFrVQtb6SStDvIlEpdcSX+gZ9XDdnL85PNXLFqQhwomrI
         seZpBryvT1sZGX0QZHp2rk8beeFlWelHCq6ZZlHRCutHEDzi8Lpu9zWd3SvrAU6JyThz
         PwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718228741; x=1718833541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6lWae0B5/GP4WtvVp63JCaJ9laTWe/yar8hYd+cHUM=;
        b=dPfZelmwU5pDKGXFI+gjqLtbeuZC5VysOzVD7gU94w6MHWhLz9p41ZBxuAAWChaLYv
         jpEY38whoGgd3RXHpCZzGsrIEeVcDW6f72TRnPZ/KPZk6MaFoZ1LGsg7dHL79Yi1cKrw
         6ltQym3TAIbi1zxF/+5rcNFJnPZonhevGpT14cv+emDpuS8hswuPC3OAoxuudcxGDPfZ
         0WUC2SuFCCwvf6elv7VdkD3E/cyi8gS/Xj6Mlc10WueuadwKM7x+9Hvr1p8XWXHPbvvT
         VS6swYNvjllELukIfpdmCldYJu0hkGiK5HTYp8xl0EIcekZNvKzrM8vxbP0d/arKKtKj
         7JVg==
X-Forwarded-Encrypted: i=1; AJvYcCW12gCS5cuOgtifWAha7PKyRZBKqqJH3wy3jvWrymIIunjK+Z+wD2cnpJibJ772Cq/5MXRkUPy7bS8elyRGfRv+MVK/1GonvVYanJHR+PGC4Hv2mIDI5XieYTSnLVNHyWHoBUshtP0g2gou9TjSxznsAcO5B/R/EBrqCwwWWc8rKA==
X-Gm-Message-State: AOJu0Yy/u6HFOzbxtbLcLcD/c5RUA9LU01CCQtAgTJVKAIXLy0rSpcP3
	y9PPKIpAeW0S9sKH2ryYTq5NxuPX9KblAlRv2WbfKmXWCwLzlKO8
X-Google-Smtp-Source: AGHT+IGZC5SmaoqyXbCaLhBvQFZ1c0FtMBTPMwCFezpbf/bZb45GQ5Wm0sQBFB1zxS3xK8XrV31x/Q==
X-Received: by 2002:a05:6a20:a11e:b0:1b5:d172:91ef with SMTP id adf61e73a8af0-1b8a9b704ffmr3594757637.5.1718228740702;
        Wed, 12 Jun 2024 14:45:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b4efsm16518b3a.151.2024.06.12.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:45:40 -0700 (PDT)
Date: Wed, 12 Jun 2024 14:45:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>
Cc: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
	robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <ZmoXAR79emQBNyhj@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com>
 <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>

On Wed, Jun 12, 2024 at 09:47:39PM +0200, Martin Schiller wrote:
> On 2024-06-12 20:39, Martin Schiller wrote:
> > On 2024-06-12 19:47, Dmitry Torokhov wrote:
> > > Hi Marton,
> > 
> > Hi Dmitry,
> > 
> > > 
> > > On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
> > > > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod
> > > > API") not
> > > > only switched to the gpiod API, but also inverted / changed the
> > > > polarity
> > > > of the GPIO.
> > > > 
> > > > According to the PCI specification, the RST# pin is an active-low
> > > > signal. However, most of the device trees that have been widely
> > > > used for
> > > > a long time (mainly in the openWrt project) define this GPIO as
> > > > active-high and the old driver code inverted the signal internally.
> > > > 
> > > > Apparently there are actually boards where the reset gpio must be
> > > > operated inverted. For this reason, we cannot use the
> > > > GPIOD_OUT_LOW/HIGH
> > > > flag for initialization. Instead, we must explicitly set the gpio to
> > > > value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
> > > > may have been set.
> > > 
> > > Do you have example of such boards? They could not have worked before
> > > 90c2d2eb7ab5 because it was actively setting the reset line to
> > > physical
> > > high, which should leave the device in reset state if there is an
> > > inverter between the AP and the device.
> > 
> > Oh, you're right. I totally missed that '__gpio_set_value' was used in
> > the original code and that raw accesses took place without paying
> > attention to the GPIO_ACTIVE_* flags.
> > 
> > You can find the device trees I am talking about in [1].
> > 
> > @Thomas Bogendoerfer:
> > Would it be possible to stop the merging of this patch?
> > I think We have to do do some further/other changes.
> > 
> > > 
> > > > 
> > > > In order to remain compatible with all these existing device
> > > > trees, we
> > > > should therefore keep the logic as it was before the commit.
> > > 
> > > With gpiod API operating with logical states there's still
> > > difference in
> > > logic:
> > > 
> > > 	gpiod_set_value_cansleep(reset_gpio, 1);
> > > 
> > > will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
> > > apparently what you want for boards with broken DTS) but for boards
> > > that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
> > > 0, leaving the card in reset state.
> > > 
> > > You should either use gpiod_set_raw_value_calsleep() or we can try and
> > > quirk it in gpiolib (like we do for many other cases of incorrect GPIO
> > > polarity descriptions and which is my preference).
> 
> So you mean we should add an entry for "lantiq,pci-xway" to the
> of_gpio_try_fixup_polarity()?
> Do you know any dts / device outside the openWrt universe which is using
> this driver.

No, I don't.

Could you please try this:

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 59c7f8a2431a..4948ecaa422c 100644
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
+		{ "lantiq,pci-xway",	"gpios-reset",	false },
+#endif
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
 		/*
 		 * DTS for Nokia N900 incorrectly specified "active high"
@@ -512,7 +522,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
 		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
 #endif
-#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
+#if IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
 		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
 #endif

Thanks.

-- 
Dmitry

