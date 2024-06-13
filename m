Return-Path: <linux-mips+bounces-3655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA090640B
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 08:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C4E284A8D
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 06:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DCF13775A;
	Thu, 13 Jun 2024 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/O8sbUd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C7136E38;
	Thu, 13 Jun 2024 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260157; cv=none; b=iiEWEV1tm+fatsKiP4rzT3wjn5VoQUiMoxU1/xTphcqzueTwxZSpPGjCHTr1dAQkRsVDcFO6KS8v4EtG2zK9cS1zrawK5ekZkrK1bFAChJWtmPVIKt3M7+7uY4RfoCzuhQ3U0NkWM2saRh48Rtoc/zHbEz2ZFwQrTYYYLvdVWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260157; c=relaxed/simple;
	bh=RVKch7RqqJ+PgOpw0XQ6ftqiSQDULA799tbjxNFwSQ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TpYPfhkCcshvcwzN+gmXjYhHcmCWGapImAea+W7z5hZsc25mKrZ7rZCX4VCvZmfD92nqGxW1NdEonu40ivym9RfIBS9skKhhBLBauGDY9u/qjGijWNyaPuvx81fu11dRPEpREwiZGB6YhGORHXboiBPV59FC3gVBLoYCfr0335E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/O8sbUd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7041ed475acso477963b3a.2;
        Wed, 12 Jun 2024 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718260155; x=1718864955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BeVfSZQLMy7ax7N/nGNFoXrUhJRULb9om6Cget9D8PY=;
        b=D/O8sbUd8N3nVruwHG7c60ozWhXNTxDQloaLgy9W3eAMiusTJXyjufXP4HktxxjzVW
         STMGyFKQfOD+UiVv/TIz/aiVMPcEM+QFBSh+T5qM8biyyBZh25SJ/rGFSBJDb0SmHHzU
         thu+Y7MaeUykBpUZtcbmaxQSsAo6eePMBu2HegYlmUBTzVVxsTswMrAly56WS9x1QMcG
         ZkRveOJ+bRgbSnoACdjO0dtE6R4c1vEmgiXPOiL/poc6LwjqUY+63YMBjwI3ljiM6Awb
         6A1V5MQ3g+1KU8z+x2zP3q8vdY4xKqysYZ71MYyA4/IhhWMJ0lKGvk0rMjRgdBeZeqEg
         TNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718260155; x=1718864955;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BeVfSZQLMy7ax7N/nGNFoXrUhJRULb9om6Cget9D8PY=;
        b=KxI1MDLJ4adnmpERrXb75o42vcs9RFG1YakTpEbo3jVeqSPBNzyQ81cZmrwH+M1h3h
         /ehzg16UVoO8dQD0HFWmXZijAfjjuGkjPFaM744sjUY/AINIjQeaKORAnbafyWdMVv89
         gXaJMzbxF9MPlSP1xora93jxxWMADibAPkudMJayooD2MmgsCgeNWqrS2pz0gBO0vZRw
         AMlmeALp44gLmlQQkccb47RGKc2A4dkQXRNexqDohIRTr+hwJiq+GLaYIPj8HNbX8QuI
         ziT7GSCVB0jAjqcvH3svwLAg8rGZLZlofw0uL+gbuBclrInRL4UremTDzg9S1cxOyiL9
         ITXg==
X-Forwarded-Encrypted: i=1; AJvYcCUDYTosTwyPnjjG3inVvS/+KK2emb6Mqi81sxZ26RF7aZi2SOUZ0sm28motz+FE5fOYUQfFVeUUC0ncaqdZLUK8/vLUSOd+Zpanggy8urZocdsPUVBUI6OErHOw8/I8554ineE9ABHerwL8gBzLdPfz99kWv4zf0/L4mwDFRRb+LQ==
X-Gm-Message-State: AOJu0YxVK/Ak79jojYucqwacMpxPmKYUQhx0RvzdAfSEIUfzxYA9Zw6j
	v0Xo9jbFVPwbLtobZQCFjRBOdMpHT88UrKA366B5rOYOVV3q4i6u
X-Google-Smtp-Source: AGHT+IHtedM7NS8ct6gRKc2hjocjE+7OGrcsRRYnKmfUUFoBqWkOxD/e5pb7FHEJk9z1POKCW/ldTg==
X-Received: by 2002:a05:6a21:398f:b0:1b7:edea:e3f with SMTP id adf61e73a8af0-1b8a9b65ec2mr4552481637.12.1718260155302;
        Wed, 12 Jun 2024 23:29:15 -0700 (PDT)
Received: from ?IPv6:::1? ([2601:647:5e00:4acd:ea61:2e6b:13a7:bae2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f04c81sm5419425ad.205.2024.06.12.23.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 23:29:14 -0700 (PDT)
Date: Wed, 12 Jun 2024 23:29:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>, olek2@wp.pl
CC: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
 robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
User-Agent: K-9 Mail for Android
In-Reply-To: <5452d21c1491d2c8c8ea07ac319b3850@dev.tdt.de>
References: <20240607090400.1816612-1-ms@dev.tdt.de> <ZmnfQWFoIw5UCV-k@google.com> <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de> <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de> <ZmoXAR79emQBNyhj@google.com> <Zmov-8IGm-misoRs@google.com> <5452d21c1491d2c8c8ea07ac319b3850@dev.tdt.de>
Message-ID: <85ADA7E0-ABCF-4C9D-AD92-C4864347700F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On June 12, 2024 11:01:42 PM PDT, Martin Schiller <ms@dev=2Etdt=2Ede> wrote=
:
>On 2024-06-13 01:32, Dmitry Torokhov wrote:
>> On Wed, Jun 12, 2024 at 02:45:37PM -0700, Dmitry Torokhov wrote:
>>> On Wed, Jun 12, 2024 at 09:47:39PM +0200, Martin Schiller wrote:
>>> > On 2024-06-12 20:39, Martin Schiller wrote:
>>> > > On 2024-06-12 19:47, Dmitry Torokhov wrote:
>>> > > > Hi Marton,
>>> > >
>>> > > Hi Dmitry,
>>> > >
>>> > > >
>>> > > > On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
>>> > > > > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod
>>> > > > > API") not
>>> > > > > only switched to the gpiod API, but also inverted / changed th=
e
>>> > > > > polarity
>>> > > > > of the GPIO=2E
>>> > > > >
>>> > > > > According to the PCI specification, the RST# pin is an active-=
low
>>> > > > > signal=2E However, most of the device trees that have been wid=
ely
>>> > > > > used for
>>> > > > > a long time (mainly in the openWrt project) define this GPIO a=
s
>>> > > > > active-high and the old driver code inverted the signal intern=
ally=2E
>>> > > > >
>>> > > > > Apparently there are actually boards where the reset gpio must=
 be
>>> > > > > operated inverted=2E For this reason, we cannot use the
>>> > > > > GPIOD_OUT_LOW/HIGH
>>> > > > > flag for initialization=2E Instead, we must explicitly set the=
 gpio to
>>> > > > > value 1 in order to take into account any "GPIO_ACTIVE_LOW" fl=
ag that
>>> > > > > may have been set=2E
>>> > > >
>>> > > > Do you have example of such boards? They could not have worked b=
efore
>>> > > > 90c2d2eb7ab5 because it was actively setting the reset line to
>>> > > > physical
>>> > > > high, which should leave the device in reset state if there is a=
n
>>> > > > inverter between the AP and the device=2E
>>> > >
>>> > > Oh, you're right=2E I totally missed that '__gpio_set_value' was u=
sed in
>>> > > the original code and that raw accesses took place without paying
>>> > > attention to the GPIO_ACTIVE_* flags=2E
>>> > >
>>> > > You can find the device trees I am talking about in [1]=2E
>>> > >
>>> > > @Thomas Bogendoerfer:
>>> > > Would it be possible to stop the merging of this patch?
>>> > > I think We have to do do some further/other changes=2E
>>> > >
>>> > > >
>>> > > > >
>>> > > > > In order to remain compatible with all these existing device
>>> > > > > trees, we
>>> > > > > should therefore keep the logic as it was before the commit=2E
>>> > > >
>>> > > > With gpiod API operating with logical states there's still
>>> > > > difference in
>>> > > > logic:
>>> > > >
>>> > > > 	gpiod_set_value_cansleep(reset_gpio, 1);
>>> > > >
>>> > > > will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (whi=
ch is
>>> > > > apparently what you want for boards with broken DTS) but for boa=
rds
>>> > > > that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive G=
PIO to
>>> > > > 0, leaving the card in reset state=2E
>>> > > >
>>> > > > You should either use gpiod_set_raw_value_calsleep() or we can t=
ry and
>>> > > > quirk it in gpiolib (like we do for many other cases of incorrec=
t GPIO
>>> > > > polarity descriptions and which is my preference)=2E
>>> >
>>> > So you mean we should add an entry for "lantiq,pci-xway" to the
>>> > of_gpio_try_fixup_polarity()?
>>> > Do you know any dts / device outside the openWrt universe which is u=
sing
>>> > this driver=2E
>>>=20
>>> No, I don't=2E
>>>=20
>>> Could you please try this:
>>>=20
>>> diff --git a/drivers/gpio/gpiolib-of=2Ec b/drivers/gpio/gpiolib-of=2Ec
>>> index 59c7f8a2431a=2E=2E4948ecaa422c 100644
>>> --- a/drivers/gpio/gpiolib-of=2Ec
>>> +++ b/drivers/gpio/gpiolib-of=2Ec
>>> @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const stru=
ct device_node *np,
>>>  		 */
>>>  		{ "qi,lb60",		"rb-gpios",	true },
>>>  #endif
>>> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
>>> +		/*
>>> +		 * According to the PCI specification, the RST# pin is an
>>> +		 * active-low signal=2E However, most of the device trees that
>>> +		 * have been widely used for a long time incorrectly describe
>>> +		 * reset GPIO as active-high, and were also using wrong name
>>> +		 * for the property=2E
>>> +		 */
>>> +		{ "lantiq,pci-xway",	"gpios-reset",	false },
>>=20
>> Sorry, "gpios-reset" is wrong, the driver used "gpio-reset"=2E So:
>>=20
>> diff --git a/drivers/gpio/gpiolib-of=2Ec b/drivers/gpio/gpiolib-of=2Ec
>> index 59c7f8a2431a=2E=2Ed21085830632 100644
>> --- a/drivers/gpio/gpiolib-of=2Ec
>> +++ b/drivers/gpio/gpiolib-of=2Ec
>> @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const
>> struct device_node *np,
>>  		 */
>>  		{ "qi,lb60",		"rb-gpios",	true },
>>  #endif
>> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
>> +		/*
>> +		 * According to the PCI specification, the RST# pin is an
>> +		 * active-low signal=2E However, most of the device trees that
>> +		 * have been widely used for a long time incorrectly describe
>> +		 * reset GPIO as active-high, and were also using wrong name
>> +		 * for the property=2E
>> +		 */
>> +		{ "lantiq,pci-xway",	"gpio-reset",	false },
>> +#endif
>>  #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
>>  		/*
>>  		 * DTS for Nokia N900 incorrectly specified "active high"
>> @@ -512,9 +522,9 @@ static struct gpio_desc
>> *of_find_gpio_rename(struct device_node *np,
>>  		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
>>  		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
>>  #endif
>> -#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
>> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
>>  		/* MIPS Lantiq PCI */
>> -		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
>> +		{ "reset",	"gpio-reset",	"lantiq,pci-xway" },
>>  #endif
>>=20
>>  		/*
>
>I wonder, when this renaming did not work so far, why did we not see the
>error message "failed to request gpio" in the log?

The GPIO is requested as optional, so if it's not found there's no error=
=2E

Interestingly the only user in the mainline kernel uses "gpios-reset" in i=
s device tree which never worked=2E=20

--=20
Dmitry

