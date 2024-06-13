Return-Path: <linux-mips+bounces-3671-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA46907D20
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 22:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 586F7B2718B
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 20:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E68614D;
	Thu, 13 Jun 2024 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="W+EP8Igu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2460D57C8D;
	Thu, 13 Jun 2024 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309181; cv=none; b=aNbPDhJ6aGsIrqmj2/IMKiyuKaPw6jDzlUsFicqZy8u5PPstCT/b/u8auASAlwiEUZf4WKCnO1k1JAK+yrgh76uYbSjucmQjIGqmpQFWpuIijsL015j4l7bin/Laf0G51aCP8DdTVLDLy+g0vev4ks1ZY/DO9zMu6EX4/Suhj20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309181; c=relaxed/simple;
	bh=pmQLbnxNeix35LACGGgkQM5CANOhdFmQJHiAOTuOOTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoAk3UcYtrzBta4b69Mg9fOnyCndtxCYFkAhdg2KW0Oi0YT/RfkfJxoz/WMTQ5XbdXveLlBraSYjF+TeIC6sbpBz+z7kWR3mWFnHDBwvRd43TnD2fX4Le9gpl9i7DEIyMnqQnwmyubYvlsDRrM9OXmE4/u5dn5KsR2eMSeiYJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=W+EP8Igu; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4W0YM46yDBz9srt;
	Thu, 13 Jun 2024 22:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1718309169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQmLUvtzAsNFE7xP7nFPT7DkdHv5DvPLP43079u0hVE=;
	b=W+EP8Igug9ZLWc46767W4sbETegg3MhvHXuwepyH6slZV7xKe+g3TIlfmLg2q4g1p6RzNW
	M8V0tWBBB35PS23nYbrZXjv1Sp+9jxcecfKtJxACiHV+Z5kz/lwmJx+lTusRv6ieoBexp0
	PF3OOT07EuP1SRZLSpHgrH+9VgN1q6yMT1ERU+43crGVnOIlIL1Exw+XxMXjMkVn5b9hcu
	3wKCESUpwv17G1b50vs200ZqXaStxgJrl0GGFztaMSyxldZjcBNIcorKnl4dsOWGikPk+0
	B057iMFKLsjBPGpJaDDKEpB2xthM7G39y4+L44CNHBzhuQNNYN9pWui7YzD2Tw==
Message-ID: <6e4eed26-0a15-4ab4-8f3f-7ed0e223db5e@hauke-m.de>
Date: Thu, 13 Jun 2024 22:06:06 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
To: Martin Schiller <ms@dev.tdt.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: tsbogend@alpha.franken.de, rdunlap@infradead.org, robh@kernel.org,
 bhelgaas@google.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com> <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
Content-Language: en-US
From: Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/24 21:47, Martin Schiller wrote:
> On 2024-06-12 20:39, Martin Schiller wrote:
>> On 2024-06-12 19:47, Dmitry Torokhov wrote:
>>> Hi Marton,
>>
>> Hi Dmitry,
>>
>>>
>>> On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
>>>> Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") 
>>>> not
>>>> only switched to the gpiod API, but also inverted / changed the 
>>>> polarity
>>>> of the GPIO.
>>>>
>>>> According to the PCI specification, the RST# pin is an active-low
>>>> signal. However, most of the device trees that have been widely used 
>>>> for
>>>> a long time (mainly in the openWrt project) define this GPIO as
>>>> active-high and the old driver code inverted the signal internally.
>>>>
>>>> Apparently there are actually boards where the reset gpio must be
>>>> operated inverted. For this reason, we cannot use the 
>>>> GPIOD_OUT_LOW/HIGH
>>>> flag for initialization. Instead, we must explicitly set the gpio to
>>>> value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
>>>> may have been set.
>>>
>>> Do you have example of such boards? They could not have worked before
>>> 90c2d2eb7ab5 because it was actively setting the reset line to physical
>>> high, which should leave the device in reset state if there is an
>>> inverter between the AP and the device.
>>
>> Oh, you're right. I totally missed that '__gpio_set_value' was used in
>> the original code and that raw accesses took place without paying
>> attention to the GPIO_ACTIVE_* flags.
>>
>> You can find the device trees I am talking about in [1].
>>
>> @Thomas Bogendoerfer:
>> Would it be possible to stop the merging of this patch?
>> I think We have to do do some further/other changes.
>>
>>>
>>>>
>>>> In order to remain compatible with all these existing device trees, we
>>>> should therefore keep the logic as it was before the commit.
>>>
>>> With gpiod API operating with logical states there's still difference in
>>> logic:
>>>
>>>     gpiod_set_value_cansleep(reset_gpio, 1);
>>>
>>> will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
>>> apparently what you want for boards with broken DTS) but for boards
>>> that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
>>> 0, leaving the card in reset state.
>>>
>>> You should either use gpiod_set_raw_value_calsleep() or we can try and
>>> quirk it in gpiolib (like we do for many other cases of incorrect GPIO
>>> polarity descriptions and which is my preference).
> 
> So you mean we should add an entry for "lantiq,pci-xway" to the
> of_gpio_try_fixup_polarity()?
> Do you know any dts / device outside the openWrt universe which is using
> this driver.
> 
> For the lantiq targets in openWrt, the devicetree blob is appended to
> the kernel image and therefore also updated when doing a firmware
> upgrade. So, maybe it would also be an option to fix the driver (using
> GPIO_ACTIVE_* flag for the initial level and set it to 0 -> 1 -> 0) and
> rework all the dts files to use GPIO_ACTIVE_LOW.
> 
> Then we won't need any quirks.

I am not aware that anyone is using a recent kernel on the VRX200 
outside of OpenWrt. I am also not aware that anyone is *not* appending 
the DTB to the kernel. The SoC is pretty old now, the successor of this 
SoC was released about 10 years ago.

For me it would be fine if you fix the broken device device trees 
shipped with the upstream kernel and with OpenWrt to make them work with 
the PCI driver instead of investing too much time into handling old DTBs.

The PCI reset is inverted on some boards to handle a dying gasp. If the 
power breaks down the reset should get triggered and the PCIe device can 
send a dying gasp signal to the other side. This is done on the 
reference designs of some Lantiq PCIe DSL card for the VRX318 and 
probably also some other components.

Hauke

