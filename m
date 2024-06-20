Return-Path: <linux-mips+bounces-3745-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FC90FA83
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 02:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6790C283005
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 00:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32600EEAA;
	Thu, 20 Jun 2024 00:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzDIg2ly"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8FCDDC7;
	Thu, 20 Jun 2024 00:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718844852; cv=none; b=XJk74X2dhhqY4RP9r+a1+aJiCJ4oAKYvv/ugtBrjt9YAwqxPIgSul2rN7BUP1pc/g7Dhxt+k0uERf9bQ2T14uu4wWGAsMgTUSr1WLMTSybpMNuwwJXlf4xlLg58u2cDQ14Ok2pKTgnHs/5SA2hiK8lM/ufHl1oVveLz1GpMUX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718844852; c=relaxed/simple;
	bh=5ZzxlnPl6QHH8zZM0Bxkh6bNL5fo2OEy/Yyo92Jqi6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+pvBw1/lNq3InpS/VdGSCu0KtvbhQWlpg6+Oiv2p3vJrjZVgoVYSXlaDWsCkImgMi6g34rdjvNwavBVld+lBgs+DQuy8S3lbg8aWf7REJY+Kkh2lAa29462mgU8SivYjEBsKb6dqTjYE5kdtZ9HsbZuET0hQdCo3Vxw0ssJigY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzDIg2ly; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f70131063cso2976285ad.2;
        Wed, 19 Jun 2024 17:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718844850; x=1719449650; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kos3a5+8tgScme3AXUkmStzF9iR6lkKUT5lESoizK2o=;
        b=RzDIg2lyr+BgLVuE2ZDQHBIIRNc4itKHK4Ux8npTamWtfPHBDrhnPDedn1PpH4xctb
         WwQgPpyCcHzSQF2gwiBkEv6qp7+4nPfgOaLrNctK7PQ0+ThqCGtta1VL7zo7OLdlkQv4
         GdxHzhhjove+OIQmfmJ0y0479wCKYxgj1T4SmtgU2ThrhfbW8hPdEqGf0S3ogrcNIb1F
         OEYmdauQ3GfAkV2Ll6fQf1otA+eZe4oEmVJz7seBLZcsImR/KTCaLarKJNW20k2j9Et6
         IdWeemVwlr3O9HQjwAJE4fIiyV1iL3OkOs09EyXxaqrQYJ0WqSGArNSeyELV73lU3TtV
         WQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718844850; x=1719449650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kos3a5+8tgScme3AXUkmStzF9iR6lkKUT5lESoizK2o=;
        b=SCOk7hYxmwmzOUt3ExMWY+odUbXSrY8O84OCsD8g9oVNVwLfS7nN+dBggOipBfzAO6
         zECM3T3eK3D9arDvClPigAbKj0+SrE5wUrkCSqYp1PEsJiYaQuvz5JTTD8u1O6F9FiwG
         sbjdryfUde9nLq0d7xw0kGJutkWQVW5n/O+1sAT+skPpt8u8OIOFhpmz0sxJl9m1XkmK
         dNBFC7TzJJ5bUCRBG3kNMlhHf0vhjkxfmSEB8olS+yupVDEsPCrNPadUEcj3FsBm3Tv+
         fmkR5A771KEi7GTKQOMT0/CcxC/AYI+okUZi6oPrvl7DRpKsTfXdhWX297QSV4Vo5WFn
         Shmg==
X-Forwarded-Encrypted: i=1; AJvYcCUYYt6WtoewCazTZOAt9dqpUIMyJLQ49OjaWQ3qzJ7o6ztYfJCAjdksgM5SWtUgZCY2xPnBm5U5xjvgOsraSFkvxPBB/RWTY1gZJNGn7Aw/GeEpl3ZyL7RHLCrisa5H/x1E+GynEWo47j5hi1IwEcVTKcc9DOYY2liYbnwA41IqrA==
X-Gm-Message-State: AOJu0YxA9Qws/Rw4m5Jgin8PCb2c9ajzq0CgoYJwKaUaX0E8SsGhMkGM
	LYS2FXddUPAtsCjNfaQcOH5+v7PiXC7s1T7c3HoxYjZc3WMaunT5
X-Google-Smtp-Source: AGHT+IHUZRsqBZONk1cnHXYagT0xqKFsmQ1HV2Poe9z4T6xIIhlzFZn750OVF/2JqoteiFDZy2TAdA==
X-Received: by 2002:a17:902:da8e:b0:1f9:99d8:4a9e with SMTP id d9443c01a7336-1f9aa3ddab3mr46103265ad.25.1718844849641;
        Wed, 19 Jun 2024 17:54:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36d9:2b1f:59f:8e9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f99cfbfa1bsm37273355ad.26.2024.06.19.17.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 17:54:09 -0700 (PDT)
Date: Wed, 19 Jun 2024 17:54:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, tsbogend@alpha.franken.de,
	rdunlap@infradead.org, robh@kernel.org, bhelgaas@google.com,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <ZnN9rkNqucEYuXzR@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com>
 <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
 <6e4eed26-0a15-4ab4-8f3f-7ed0e223db5e@hauke-m.de>
 <c1813503ba16e1d46a93382dd806ffa6@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1813503ba16e1d46a93382dd806ffa6@dev.tdt.de>

On Fri, Jun 14, 2024 at 10:43:29AM +0200, Martin Schiller wrote:
> On 2024-06-13 22:06, Hauke Mehrtens wrote:
> > On 6/12/24 21:47, Martin Schiller wrote:
> > > On 2024-06-12 20:39, Martin Schiller wrote:
> > > > On 2024-06-12 19:47, Dmitry Torokhov wrote:
> > > > > Hi Marton,
> > > > 
> > > > Hi Dmitry,
> > > > 
> > > > > 
> > > > > On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
> > > > > > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using
> > > > > > gpiod API") not
> > > > > > only switched to the gpiod API, but also inverted /
> > > > > > changed the polarity
> > > > > > of the GPIO.
> > > > > > 
> > > > > > According to the PCI specification, the RST# pin is an active-low
> > > > > > signal. However, most of the device trees that have been
> > > > > > widely used for
> > > > > > a long time (mainly in the openWrt project) define this GPIO as
> > > > > > active-high and the old driver code inverted the signal internally.
> > > > > > 
> > > > > > Apparently there are actually boards where the reset gpio must be
> > > > > > operated inverted. For this reason, we cannot use the
> > > > > > GPIOD_OUT_LOW/HIGH
> > > > > > flag for initialization. Instead, we must explicitly set
> > > > > > the gpio to
> > > > > > value 1 in order to take into account any
> > > > > > "GPIO_ACTIVE_LOW" flag that
> > > > > > may have been set.
> > > > > 
> > > > > Do you have example of such boards? They could not have
> > > > > worked before
> > > > > 90c2d2eb7ab5 because it was actively setting the reset line
> > > > > to physical
> > > > > high, which should leave the device in reset state if there is an
> > > > > inverter between the AP and the device.
> > > > 
> > > > Oh, you're right. I totally missed that '__gpio_set_value' was
> > > > used in
> > > > the original code and that raw accesses took place without paying
> > > > attention to the GPIO_ACTIVE_* flags.
> > > > 
> > > > You can find the device trees I am talking about in [1].
> > > > 
> > > > @Thomas Bogendoerfer:
> > > > Would it be possible to stop the merging of this patch?
> > > > I think We have to do do some further/other changes.
> > > > 
> > > > > 
> > > > > > 
> > > > > > In order to remain compatible with all these existing
> > > > > > device trees, we
> > > > > > should therefore keep the logic as it was before the commit.
> > > > > 
> > > > > With gpiod API operating with logical states there's still
> > > > > difference in
> > > > > logic:
> > > > > 
> > > > >     gpiod_set_value_cansleep(reset_gpio, 1);
> > > > > 
> > > > > will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH
> > > > > (which is
> > > > > apparently what you want for boards with broken DTS) but for boards
> > > > > that accurately describe GPIO as GPIO_ACTIVE_LOW it well
> > > > > drive GPIO to
> > > > > 0, leaving the card in reset state.
> > > > > 
> > > > > You should either use gpiod_set_raw_value_calsleep() or we
> > > > > can try and
> > > > > quirk it in gpiolib (like we do for many other cases of
> > > > > incorrect GPIO
> > > > > polarity descriptions and which is my preference).
> > > 
> > > So you mean we should add an entry for "lantiq,pci-xway" to the
> > > of_gpio_try_fixup_polarity()?
> > > Do you know any dts / device outside the openWrt universe which is
> > > using
> > > this driver.
> > > 
> > > For the lantiq targets in openWrt, the devicetree blob is appended to
> > > the kernel image and therefore also updated when doing a firmware
> > > upgrade. So, maybe it would also be an option to fix the driver (using
> > > GPIO_ACTIVE_* flag for the initial level and set it to 0 -> 1 -> 0)
> > > and
> > > rework all the dts files to use GPIO_ACTIVE_LOW.

Yes, cleaning up DTS files when it is possible is nice.

> > > 
> > > Then we won't need any quirks.

Quirks are fairly cheap and we are not in a hot path here.

> > 
> > I am not aware that anyone is using a recent kernel on the VRX200
> > outside of OpenWrt. I am also not aware that anyone is *not* appending
> > the DTB to the kernel. The SoC is pretty old now, the successor of
> > this SoC was released about 10 years ago.
> > 
> 
> We're not just talking about VRX200 (VR9) here, but even older devices
> such as AR9 and Danube.
> 
> > For me it would be fine if you fix the broken device device trees
> > shipped with the upstream kernel and with OpenWrt to make them work
> > with the PCI driver instead of investing too much time into handling
> > old DTBs.
> > 
> > The PCI reset is inverted on some boards to handle a dying gasp. If
> > the power breaks down the reset should get triggered and the PCIe
> > device can send a dying gasp signal to the other side. This is done on
> > the reference designs of some Lantiq PCIe DSL card for the VRX318 and
> > probably also some other components.
> > 
> > Hauke
> 
> What I missed so far is the fact that the driver used '__gpio_set_value'
> before Dmitry's commit and thus used raw access to the GPIO.
> 
> This effectively means that every device that has worked with the driver
> so far must have an ACTIVE_LOW reset, no matter what was configured in
> the device tree.
> 
> 
> So renaming the property in the dts from "gpio-reset" to "reset-gpios"
> and setting the FLAGS to "GPIO_ACTIVE_LOW" should actually solve the
> problem.

Right, luckily (to a definition of luckily) the driver and DTB used
"wrong" syntax for the gpio property, so we can quirk it and make
force ACTIVE_LOW polarity on old DTBs, and new DTBs with "reset-gpios"
property will follow polarity specified in DTB.

> 
> What still bothers me about the driver itself are 2 things:
> 1. the initial value of GPIOD_OUT_LOW. This means that there is no real
>    defined HIGH -> LOW -> HIGH on reset.

Is this actually needed? Typically a card requires certain time in reset
state (with reset line active) before it can be released, however there
usually no restrictions on line being inactive beforehand. But typically
it will be pulled up to avoid leakage...

Thanks.

-- 
Dmitry

