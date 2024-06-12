Return-Path: <linux-mips+bounces-3636-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607C905C46
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 21:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2942B239B3
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 19:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D0C83CBA;
	Wed, 12 Jun 2024 19:48:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90002381C4;
	Wed, 12 Jun 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718221682; cv=none; b=HKbS54U+5abECphQbw5Vz5fYPYBEzJ5Yv6Rv40C5zg7XvFr1E+AuQINaHFmLk52w8o3q4/UopYyYcX+n6rjqls5/fx3Cl6FHByO+W7GVeshGbsY6Y403pCTN+mekxmR1wmwflrJncjbO4vpBraA9gukA84BKg982N/s2TwiM+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718221682; c=relaxed/simple;
	bh=VcP5QPo8mMAZf3HOjnC3ir8/AgsIrP19dT5MjMMl7GY=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=jJUd+VDN3k7cSJfCRMVoW7GGeIEPJZJ4PeIkJ0bIYNfhtFuxnyGLPQPZRq4g9Wd04S+sdPubc8cvBJ1hl7UNfWAWfEgCAk/M8bYM2UgdrkJLlTcURcRNP1+nh3bt1MLoIKIzF++Oa12B5X9pzBViMStrNYsdKBgqyBFhHvxtrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=9907278693=ms@dev.tdt.de>)
	id 1sHTwc-00DaCD-Bk; Wed, 12 Jun 2024 21:47:42 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sHTwb-00DaC7-CV; Wed, 12 Jun 2024 21:47:41 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id D6AE7240053;
	Wed, 12 Jun 2024 21:47:40 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 334C7240050;
	Wed, 12 Jun 2024 21:47:40 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 759433773C;
	Wed, 12 Jun 2024 21:47:39 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Jun 2024 21:47:39 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
 robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Organization: TDT AG
In-Reply-To: <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com> <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
Message-ID: <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1718221662-C3C498CF-BD03A402/0/0

On 2024-06-12 20:39, Martin Schiller wrote:
> On 2024-06-12 19:47, Dmitry Torokhov wrote:
>> Hi Marton,
> 
> Hi Dmitry,
> 
>> 
>> On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
>>> Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") 
>>> not
>>> only switched to the gpiod API, but also inverted / changed the 
>>> polarity
>>> of the GPIO.
>>> 
>>> According to the PCI specification, the RST# pin is an active-low
>>> signal. However, most of the device trees that have been widely used 
>>> for
>>> a long time (mainly in the openWrt project) define this GPIO as
>>> active-high and the old driver code inverted the signal internally.
>>> 
>>> Apparently there are actually boards where the reset gpio must be
>>> operated inverted. For this reason, we cannot use the 
>>> GPIOD_OUT_LOW/HIGH
>>> flag for initialization. Instead, we must explicitly set the gpio to
>>> value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
>>> may have been set.
>> 
>> Do you have example of such boards? They could not have worked before
>> 90c2d2eb7ab5 because it was actively setting the reset line to 
>> physical
>> high, which should leave the device in reset state if there is an
>> inverter between the AP and the device.
> 
> Oh, you're right. I totally missed that '__gpio_set_value' was used in
> the original code and that raw accesses took place without paying
> attention to the GPIO_ACTIVE_* flags.
> 
> You can find the device trees I am talking about in [1].
> 
> @Thomas Bogendoerfer:
> Would it be possible to stop the merging of this patch?
> I think We have to do do some further/other changes.
> 
>> 
>>> 
>>> In order to remain compatible with all these existing device trees, 
>>> we
>>> should therefore keep the logic as it was before the commit.
>> 
>> With gpiod API operating with logical states there's still difference 
>> in
>> logic:
>> 
>> 	gpiod_set_value_cansleep(reset_gpio, 1);
>> 
>> will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
>> apparently what you want for boards with broken DTS) but for boards
>> that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
>> 0, leaving the card in reset state.
>> 
>> You should either use gpiod_set_raw_value_calsleep() or we can try and
>> quirk it in gpiolib (like we do for many other cases of incorrect GPIO
>> polarity descriptions and which is my preference).

So you mean we should add an entry for "lantiq,pci-xway" to the
of_gpio_try_fixup_polarity()?
Do you know any dts / device outside the openWrt universe which is using
this driver.

For the lantiq targets in openWrt, the devicetree blob is appended to
the kernel image and therefore also updated when doing a firmware
upgrade. So, maybe it would also be an option to fix the driver (using
GPIO_ACTIVE_* flag for the initial level and set it to 0 -> 1 -> 0) and
rework all the dts files to use GPIO_ACTIVE_LOW.

Then we won't need any quirks.

>> 
>> This still leaves the question about boards that require inversion. 
>> Are
>> you saying that they have real signal inverter on the line or that 
>> their
>> device trees correctly describe the signal as GPIO_ACTIVE_LOW?
>> 
>> BTW, please consider getting DTS trees for your devices into mainline.
>> Why do you keep them separate?
> 
> Unfortunately, these are not "my" devices and I can't even test them.
> I've got feedback from some users when I updated the lantiq target to
> linux 6.1 in openwrt.
> 
> 
> Let's assume that all boards physically expect an active-low signal.
> 
> If the GPIO_ACTIVE_LOW flag were now set in the device tree, the
> original (old) driver would have an incorrect initial level (LOW 
> instead
> of HIGH) due to the
> 
> 	gpio_direction_output(reset_gpio, 1);
> 
> This is probably the reason why the flag GPIO_ACTIVE_HIGH is set in
> almost all dts files in openwrt.
> 
> But with commit 90c2d2eb7ab5 the initial level (LOW) is guaranteed to 
> be
> wrong because of the "GPIOD_OUT_LOW" and cannot be changed by "wrong"
> device tree settings.
> 
> The signal curve is LOW -> LOW -> HIGH instead of HIGH -> LOW -> HIGH.
> 
>> 
>>> 
>>> Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Martin Schiller <ms@dev.tdt.de>
>>> ---
>>>  arch/mips/pci/pci-lantiq.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>> 
>>> diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
>>> index 68a8cefed420..0844db34022e 100644
>>> --- a/arch/mips/pci/pci-lantiq.c
>>> +++ b/arch/mips/pci/pci-lantiq.c
>>> @@ -124,14 +124,14 @@ static int ltq_pci_startup(struct 
>>> platform_device *pdev)
>>>  		clk_disable(clk_external);
>>> 
>>>  	/* setup reset gpio used by pci */
>>> -	reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
>>> -					     GPIOD_OUT_LOW);
>>> +	reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", 
>>> GPIOD_ASIS);
>>>  	error = PTR_ERR_OR_ZERO(reset_gpio);
>>>  	if (error) {
>>>  		dev_err(&pdev->dev, "failed to request gpio: %d\n", error);
>>>  		return error;
>>>  	}
>>>  	gpiod_set_consumer_name(reset_gpio, "pci_reset");
>>> +	gpiod_direction_output(reset_gpio, 1);
>>> 
>>>  	/* enable auto-switching between PCI and EBU */
>>>  	ltq_pci_w32(0xa, PCI_CR_CLK_CTRL);
>>> @@ -194,10 +194,10 @@ static int ltq_pci_startup(struct 
>>> platform_device *pdev)
>>> 
>>>  	/* toggle reset pin */
>>>  	if (reset_gpio) {
>>> -		gpiod_set_value_cansleep(reset_gpio, 1);
>>> +		gpiod_set_value_cansleep(reset_gpio, 0);
>>>  		wmb();
>>>  		mdelay(1);
>>> -		gpiod_set_value_cansleep(reset_gpio, 0);
>>> +		gpiod_set_value_cansleep(reset_gpio, 1);
>>>  	}
>>>  	return 0;
>>>  }
>>> --
>>> 2.39.2
>>> 
>> 
>> Thanks.
> 
> [1]
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/lantiq/files/arch/mips/boot/dts/lantiq

