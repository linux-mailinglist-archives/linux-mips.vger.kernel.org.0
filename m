Return-Path: <linux-mips+bounces-3654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27D9063B3
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 08:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4FB91F22A73
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 06:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1B71304B7;
	Thu, 13 Jun 2024 06:02:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1D37C;
	Thu, 13 Jun 2024 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258521; cv=none; b=HTAv8449X0u1bORL3LJVu+sa4i3MA00UkJkopxIbObFhcxpy0KXxAe/Dy3AYOWMe2KxjCJUCaAAK6OUzAN0FyCvUN6kwt2DvUBvGbjniN2zmGnT98y/EpVbrhQTgaCjjugHcX06+2H1PwWfOhCYyvRXa94/n2gPf33iIxBSm8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258521; c=relaxed/simple;
	bh=hmOOc21yf/tAgKaxOaNGQyF8RRQ7+21Xky3Lkd+n81Q=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=fv+0BWCdnN6M4uTQdJoNf3EkZy76e28pC97k7EO9ff6STCykiz4AzCc4vA+kXKDXmh2enW+yux99XuhUsUcNEs6QDF/PhhlnUuBt64xoHM+seLXnh408Lw57Im89gJ5J+mL/iC1fksIq0gVEutV2O05Nu7igQVVX6ee+mWQ1qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=99085fba10=ms@dev.tdt.de>)
	id 1sHdWr-00FGeX-6Z; Thu, 13 Jun 2024 08:01:45 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sHdWq-000M6s-59; Thu, 13 Jun 2024 08:01:44 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id B66A4240054;
	Thu, 13 Jun 2024 08:01:43 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 09632240053;
	Thu, 13 Jun 2024 08:01:43 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 6E79838543;
	Thu, 13 Jun 2024 08:01:42 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Jun 2024 08:01:42 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, olek2@wp.pl
Cc: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
 robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Organization: TDT AG
In-Reply-To: <Zmov-8IGm-misoRs@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com> <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de> <ZmoXAR79emQBNyhj@google.com>
 <Zmov-8IGm-misoRs@google.com>
Message-ID: <5452d21c1491d2c8c8ea07ac319b3850@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate-ID: 151534::1718258504-1DCDF522-A67FD917/0/0
X-purgate-type: clean
X-purgate: clean

On 2024-06-13 01:32, Dmitry Torokhov wrote:
> On Wed, Jun 12, 2024 at 02:45:37PM -0700, Dmitry Torokhov wrote:
>> On Wed, Jun 12, 2024 at 09:47:39PM +0200, Martin Schiller wrote:
>> > On 2024-06-12 20:39, Martin Schiller wrote:
>> > > On 2024-06-12 19:47, Dmitry Torokhov wrote:
>> > > > Hi Marton,
>> > >
>> > > Hi Dmitry,
>> > >
>> > > >
>> > > > On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
>> > > > > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod
>> > > > > API") not
>> > > > > only switched to the gpiod API, but also inverted / changed the
>> > > > > polarity
>> > > > > of the GPIO.
>> > > > >
>> > > > > According to the PCI specification, the RST# pin is an active-low
>> > > > > signal. However, most of the device trees that have been widely
>> > > > > used for
>> > > > > a long time (mainly in the openWrt project) define this GPIO as
>> > > > > active-high and the old driver code inverted the signal internally.
>> > > > >
>> > > > > Apparently there are actually boards where the reset gpio must be
>> > > > > operated inverted. For this reason, we cannot use the
>> > > > > GPIOD_OUT_LOW/HIGH
>> > > > > flag for initialization. Instead, we must explicitly set the gpio to
>> > > > > value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
>> > > > > may have been set.
>> > > >
>> > > > Do you have example of such boards? They could not have worked before
>> > > > 90c2d2eb7ab5 because it was actively setting the reset line to
>> > > > physical
>> > > > high, which should leave the device in reset state if there is an
>> > > > inverter between the AP and the device.
>> > >
>> > > Oh, you're right. I totally missed that '__gpio_set_value' was used in
>> > > the original code and that raw accesses took place without paying
>> > > attention to the GPIO_ACTIVE_* flags.
>> > >
>> > > You can find the device trees I am talking about in [1].
>> > >
>> > > @Thomas Bogendoerfer:
>> > > Would it be possible to stop the merging of this patch?
>> > > I think We have to do do some further/other changes.
>> > >
>> > > >
>> > > > >
>> > > > > In order to remain compatible with all these existing device
>> > > > > trees, we
>> > > > > should therefore keep the logic as it was before the commit.
>> > > >
>> > > > With gpiod API operating with logical states there's still
>> > > > difference in
>> > > > logic:
>> > > >
>> > > > 	gpiod_set_value_cansleep(reset_gpio, 1);
>> > > >
>> > > > will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
>> > > > apparently what you want for boards with broken DTS) but for boards
>> > > > that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
>> > > > 0, leaving the card in reset state.
>> > > >
>> > > > You should either use gpiod_set_raw_value_calsleep() or we can try and
>> > > > quirk it in gpiolib (like we do for many other cases of incorrect GPIO
>> > > > polarity descriptions and which is my preference).
>> >
>> > So you mean we should add an entry for "lantiq,pci-xway" to the
>> > of_gpio_try_fixup_polarity()?
>> > Do you know any dts / device outside the openWrt universe which is using
>> > this driver.
>> 
>> No, I don't.
>> 
>> Could you please try this:
>> 
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index 59c7f8a2431a..4948ecaa422c 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const 
>> struct device_node *np,
>>  		 */
>>  		{ "qi,lb60",		"rb-gpios",	true },
>>  #endif
>> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
>> +		/*
>> +		 * According to the PCI specification, the RST# pin is an
>> +		 * active-low signal. However, most of the device trees that
>> +		 * have been widely used for a long time incorrectly describe
>> +		 * reset GPIO as active-high, and were also using wrong name
>> +		 * for the property.
>> +		 */
>> +		{ "lantiq,pci-xway",	"gpios-reset",	false },
> 
> Sorry, "gpios-reset" is wrong, the driver used "gpio-reset". So:
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 59c7f8a2431a..d21085830632 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const
> struct device_node *np,
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
> +		{ "lantiq,pci-xway",	"gpio-reset",	false },
> +#endif
>  #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
>  		/*
>  		 * DTS for Nokia N900 incorrectly specified "active high"
> @@ -512,9 +522,9 @@ static struct gpio_desc
> *of_find_gpio_rename(struct device_node *np,
>  		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
>  		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
>  #endif
> -#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
>  		/* MIPS Lantiq PCI */
> -		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
> +		{ "reset",	"gpio-reset",	"lantiq,pci-xway" },
>  #endif
> 
>  		/*

I wonder, when this renaming did not work so far, why did we not see the
error message "failed to request gpio" in the log?

@Aleksander Jan Bajkowski:
You had problems with the PCI connection when you switched to linux 6.1
and also have corresponding devices to test.

Could you please remove my patch in the latest openWrt and try out
Dmitry's change?

