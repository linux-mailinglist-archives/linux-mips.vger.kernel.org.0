Return-Path: <linux-mips+bounces-3676-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF19086A3
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 10:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8BB5B2327E
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 08:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F1D186E4B;
	Fri, 14 Jun 2024 08:43:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF692186E36;
	Fri, 14 Jun 2024 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354638; cv=none; b=rRHBQQJdNLd5XHhgBymfplBR319I6nWiXo5IjQL2NQC3bzwEqv13b+9/evNbRlq0VvWM0gK3PyMAUILlORPoNJjmaGQocK1OgNmTPL3BRD5qovxdjuexmIzX1k8g78ycTpXXnjGaRCfU27H67ekBXi/EuUp3zd6COvdnyYxGCJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354638; c=relaxed/simple;
	bh=5sIskQjtFcX9EHh0WMpQ/QiDv3OPpfeQ2c/Dx/e4xTo=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=irN1t0v4YWTuAlf+2jKZcGY1ER+B2VDmOV4XQKHXxhhqn/c+WuwI2jX8p6EweQYg+1PCzkDvvfVSWnMT6fb1yiqDMrOv2H0KGH/UWUrjk9H1UzfaVbBaXynoPxj04EpDI6OYW0xQ0vtMTKflM4rpbQBaTJd40nirPFCA+w/pec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=9909fcaec8=ms@dev.tdt.de>)
	id 1sI2Wz-004jVP-3p; Fri, 14 Jun 2024 10:43:33 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sI2Wx-00A0SN-5s; Fri, 14 Jun 2024 10:43:31 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id C0C84240053;
	Fri, 14 Jun 2024 10:43:30 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 2A5B7240050;
	Fri, 14 Jun 2024 10:43:30 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id BE63C30F70;
	Fri, 14 Jun 2024 10:43:29 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Fri, 14 Jun 2024 10:43:29 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, tsbogend@alpha.franken.de,
 rdunlap@infradead.org, robh@kernel.org, bhelgaas@google.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Organization: TDT AG
In-Reply-To: <6e4eed26-0a15-4ab4-8f3f-7ed0e223db5e@hauke-m.de>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com> <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
 <6e4eed26-0a15-4ab4-8f3f-7ed0e223db5e@hauke-m.de>
Message-ID: <c1813503ba16e1d46a93382dd806ffa6@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1718354611-4697E746-AC1839CE/0/0
X-purgate-type: clean
X-purgate: clean

On 2024-06-13 22:06, Hauke Mehrtens wrote:
> On 6/12/24 21:47, Martin Schiller wrote:
>> On 2024-06-12 20:39, Martin Schiller wrote:
>>> On 2024-06-12 19:47, Dmitry Torokhov wrote:
>>>> Hi Marton,
>>>=20
>>> Hi Dmitry,
>>>=20
>>>>=20
>>>> On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
>>>>> Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod=20
>>>>> API") not
>>>>> only switched to the gpiod API, but also inverted / changed the=20
>>>>> polarity
>>>>> of the GPIO.
>>>>>=20
>>>>> According to the PCI specification, the RST# pin is an active-low
>>>>> signal. However, most of the device trees that have been widely=20
>>>>> used for
>>>>> a long time (mainly in the openWrt project) define this GPIO as
>>>>> active-high and the old driver code inverted the signal internally.
>>>>>=20
>>>>> Apparently there are actually boards where the reset gpio must be
>>>>> operated inverted. For this reason, we cannot use the=20
>>>>> GPIOD_OUT_LOW/HIGH
>>>>> flag for initialization. Instead, we must explicitly set the gpio=20
>>>>> to
>>>>> value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag=20
>>>>> that
>>>>> may have been set.
>>>>=20
>>>> Do you have example of such boards? They could not have worked=20
>>>> before
>>>> 90c2d2eb7ab5 because it was actively setting the reset line to=20
>>>> physical
>>>> high, which should leave the device in reset state if there is an
>>>> inverter between the AP and the device.
>>>=20
>>> Oh, you're right. I totally missed that '__gpio_set_value' was used=20
>>> in
>>> the original code and that raw accesses took place without paying
>>> attention to the GPIO_ACTIVE_* flags.
>>>=20
>>> You can find the device trees I am talking about in [1].
>>>=20
>>> @Thomas Bogendoerfer:
>>> Would it be possible to stop the merging of this patch?
>>> I think We have to do do some further/other changes.
>>>=20
>>>>=20
>>>>>=20
>>>>> In order to remain compatible with all these existing device trees,=
=20
>>>>> we
>>>>> should therefore keep the logic as it was before the commit.
>>>>=20
>>>> With gpiod API operating with logical states there's still=20
>>>> difference in
>>>> logic:
>>>>=20
>>>> =C2=A0=C2=A0=C2=A0=C2=A0gpiod_set_value_cansleep(reset_gpio, 1);
>>>>=20
>>>> will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which=20
>>>> is
>>>> apparently what you want for boards with broken DTS) but for boards
>>>> that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO=20
>>>> to
>>>> 0, leaving the card in reset state.
>>>>=20
>>>> You should either use gpiod_set_raw_value_calsleep() or we can try=20
>>>> and
>>>> quirk it in gpiolib (like we do for many other cases of incorrect=20
>>>> GPIO
>>>> polarity descriptions and which is my preference).
>>=20
>> So you mean we should add an entry for "lantiq,pci-xway" to the
>> of_gpio_try_fixup_polarity()?
>> Do you know any dts / device outside the openWrt universe which is=20
>> using
>> this driver.
>>=20
>> For the lantiq targets in openWrt, the devicetree blob is appended to
>> the kernel image and therefore also updated when doing a firmware
>> upgrade. So, maybe it would also be an option to fix the driver (using
>> GPIO_ACTIVE_* flag for the initial level and set it to 0 -> 1 -> 0)=20
>> and
>> rework all the dts files to use GPIO_ACTIVE_LOW.
>>=20
>> Then we won't need any quirks.
>=20
> I am not aware that anyone is using a recent kernel on the VRX200
> outside of OpenWrt. I am also not aware that anyone is *not* appending
> the DTB to the kernel. The SoC is pretty old now, the successor of
> this SoC was released about 10 years ago.
>=20

We're not just talking about VRX200 (VR9) here, but even older devices
such as AR9 and Danube.

> For me it would be fine if you fix the broken device device trees
> shipped with the upstream kernel and with OpenWrt to make them work
> with the PCI driver instead of investing too much time into handling
> old DTBs.
>=20
> The PCI reset is inverted on some boards to handle a dying gasp. If
> the power breaks down the reset should get triggered and the PCIe
> device can send a dying gasp signal to the other side. This is done on
> the reference designs of some Lantiq PCIe DSL card for the VRX318 and
> probably also some other components.
>=20
> Hauke

What I missed so far is the fact that the driver used '__gpio_set_value'
before Dmitry's commit and thus used raw access to the GPIO.

This effectively means that every device that has worked with the driver
so far must have an ACTIVE_LOW reset, no matter what was configured in
the device tree.


So renaming the property in the dts from "gpio-reset" to "reset-gpios"
and setting the FLAGS to "GPIO_ACTIVE_LOW" should actually solve the
problem.

What still bothers me about the driver itself are 2 things:
1. the initial value of GPIOD_OUT_LOW. This means that there is no real
    defined HIGH -> LOW -> HIGH on reset.
2. if we change 1., then I think "mdelay(1)" is too short and we would
    have to change it to at least "mdelay(100)".

Martin

