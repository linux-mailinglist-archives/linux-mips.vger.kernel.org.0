Return-Path: <linux-mips+bounces-3635-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DB905B38
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 20:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40DDE1F2454D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 18:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5324AED1;
	Wed, 12 Jun 2024 18:40:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796447F4B;
	Wed, 12 Jun 2024 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217620; cv=none; b=PDq2HYKtRorLKwdRDKcQhWcvalsPbxG3YmxmDr+/03mCFERZZmtgCxmjUcKRenjVJcen14f9jDkmMP4mwtJlbcGtzNzfKXjXD5nAAeh/ZDaCFmF2aaXM0EJwPeBx97nqS6ZXsYk5a0vFgd7WPKKBbofZovREuBhghxiWSXdGq/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217620; c=relaxed/simple;
	bh=KuaLG9bzDcur9dwVKKPiSS8EqUoqRjZ3JTJzUwbnx/s=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=Zdkx7JDOx8PtDg/8Bzn3FhWBIF0lC+25S5QXxaik4UlGRu8rkvfMkeIsu6hsbgwx0/0rL1bcGxX/9KQiVCQXGjAI1zZbN3A1gB3ugJ/kpbrMjgq3zSLtc8yyNlR61n+F785Tmmv0ESLGnJBi4xiNOz6oupQEeB4k9PKFg6y4SM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=9907278693=ms@dev.tdt.de>)
	id 1sHSt8-003PMm-DD; Wed, 12 Jun 2024 20:40:02 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sHSt7-002UFN-H0; Wed, 12 Jun 2024 20:40:01 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 2386F240053;
	Wed, 12 Jun 2024 20:40:01 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 7CC15240050;
	Wed, 12 Jun 2024 20:40:00 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id E1FB53773C;
	Wed, 12 Jun 2024 20:39:59 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Jun 2024 20:39:59 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
 robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Organization: TDT AG
In-Reply-To: <ZmnfQWFoIw5UCV-k@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com>
Message-ID: <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1718217602-83CB5642-2266EBAB/0/0

On 2024-06-12 19:47, Dmitry Torokhov wrote:
> Hi Marton,

Hi Dmitry,

> 
> On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
>> Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") 
>> not
>> only switched to the gpiod API, but also inverted / changed the 
>> polarity
>> of the GPIO.
>> 
>> According to the PCI specification, the RST# pin is an active-low
>> signal. However, most of the device trees that have been widely used 
>> for
>> a long time (mainly in the openWrt project) define this GPIO as
>> active-high and the old driver code inverted the signal internally.
>> 
>> Apparently there are actually boards where the reset gpio must be
>> operated inverted. For this reason, we cannot use the 
>> GPIOD_OUT_LOW/HIGH
>> flag for initialization. Instead, we must explicitly set the gpio to
>> value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
>> may have been set.
> 
> Do you have example of such boards? They could not have worked before
> 90c2d2eb7ab5 because it was actively setting the reset line to physical
> high, which should leave the device in reset state if there is an
> inverter between the AP and the device.

Oh, you're right. I totally missed that '__gpio_set_value' was used in
the original code and that raw accesses took place without paying
attention to the GPIO_ACTIVE_* flags.

You can find the device trees I am talking about in [1].

@Thomas Bogendoerfer:
Would it be possible to stop the merging of this patch?
I think We have to do do some further/other changes.

> 
>> 
>> In order to remain compatible with all these existing device trees, we
>> should therefore keep the logic as it was before the commit.
> 
> With gpiod API operating with logical states there's still difference 
> in
> logic:
> 
> 	gpiod_set_value_cansleep(reset_gpio, 1);
> 
> will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
> apparently what you want for boards with broken DTS) but for boards
> that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
> 0, leaving the card in reset state.
> 
> You should either use gpiod_set_raw_value_calsleep() or we can try and
> quirk it in gpiolib (like we do for many other cases of incorrect GPIO
> polarity descriptions and which is my preference).
> 
> This still leaves the question about boards that require inversion. Are
> you saying that they have real signal inverter on the line or that 
> their
> device trees correctly describe the signal as GPIO_ACTIVE_LOW?
> 
> BTW, please consider getting DTS trees for your devices into mainline.
> Why do you keep them separate?

Unfortunately, these are not "my" devices and I can't even test them.
I've got feedback from some users when I updated the lantiq target to
linux 6.1 in openwrt.


Let's assume that all boards physically expect an active-low signal.

If the GPIO_ACTIVE_LOW flag were now set in the device tree, the
original (old) driver would have an incorrect initial level (LOW instead
of HIGH) due to the

	gpio_direction_output(reset_gpio, 1);

This is probably the reason why the flag GPIO_ACTIVE_HIGH is set in
almost all dts files in openwrt.

But with commit 90c2d2eb7ab5 the initial level (LOW) is guaranteed to be
wrong because of the "GPIOD_OUT_LOW" and cannot be changed by "wrong"
device tree settings.

The signal curve is LOW -> LOW -> HIGH instead of HIGH -> LOW -> HIGH.

> 
>> 
>> Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Martin Schiller <ms@dev.tdt.de>
>> ---
>>  arch/mips/pci/pci-lantiq.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
>> index 68a8cefed420..0844db34022e 100644
>> --- a/arch/mips/pci/pci-lantiq.c
>> +++ b/arch/mips/pci/pci-lantiq.c
>> @@ -124,14 +124,14 @@ static int ltq_pci_startup(struct 
>> platform_device *pdev)
>>  		clk_disable(clk_external);
>> 
>>  	/* setup reset gpio used by pci */
>> -	reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
>> -					     GPIOD_OUT_LOW);
>> +	reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", 
>> GPIOD_ASIS);
>>  	error = PTR_ERR_OR_ZERO(reset_gpio);
>>  	if (error) {
>>  		dev_err(&pdev->dev, "failed to request gpio: %d\n", error);
>>  		return error;
>>  	}
>>  	gpiod_set_consumer_name(reset_gpio, "pci_reset");
>> +	gpiod_direction_output(reset_gpio, 1);
>> 
>>  	/* enable auto-switching between PCI and EBU */
>>  	ltq_pci_w32(0xa, PCI_CR_CLK_CTRL);
>> @@ -194,10 +194,10 @@ static int ltq_pci_startup(struct 
>> platform_device *pdev)
>> 
>>  	/* toggle reset pin */
>>  	if (reset_gpio) {
>> -		gpiod_set_value_cansleep(reset_gpio, 1);
>> +		gpiod_set_value_cansleep(reset_gpio, 0);
>>  		wmb();
>>  		mdelay(1);
>> -		gpiod_set_value_cansleep(reset_gpio, 0);
>> +		gpiod_set_value_cansleep(reset_gpio, 1);
>>  	}
>>  	return 0;
>>  }
>> --
>> 2.39.2
>> 
> 
> Thanks.

[1] 
https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/lantiq/files/arch/mips/boot/dts/lantiq



