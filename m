Return-Path: <linux-mips+bounces-2002-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E086F0CB
	for <lists+linux-mips@lfdr.de>; Sat,  2 Mar 2024 16:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDD13B209FF
	for <lists+linux-mips@lfdr.de>; Sat,  2 Mar 2024 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9D717C66;
	Sat,  2 Mar 2024 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uqurx7L6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018451119A;
	Sat,  2 Mar 2024 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709392152; cv=none; b=OpY+suMSsvVP5b7kFsysW3DCFfEJKS6WT6kBVJzTEckRGXeqNU8VCQzbhLut82MHW/H3RJs22AmzLhpayTQ+rRP+qW1hpH1RTp7fTpHCO4a/5OhRqIewrL+myvjJxDOhobZR3ZbOFH0avE5zO9lGlKhpITFIrG1GgT2h7pxDJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709392152; c=relaxed/simple;
	bh=fFlC0pPy3vfJ4/zGymDcSMHtHsLWlxsA3iKdlnI4kjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i10rwKIODMLu7E4hqxfk1LEh3y2a/A8BUoYrG10gUcy2isgkpPsF/a8ch+jvOBtm1oRrAZWWki2F1ExyDNvSF/G+VRcbnzWM34g+wRf9YZrUIV5CHRcKVXZdrcdd+FoM76OMKhq9PH/fJp1k79UzX4NITkilLfZuYjGGN1u/6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uqurx7L6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412d501fb96so3066475e9.0;
        Sat, 02 Mar 2024 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392149; x=1709996949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZnmyEbp7/KapwN09X3KPNmenF0EZ+gIMNP6ui8wv+8=;
        b=Uqurx7L6i2K+RNwgPaNQEOYpPiGSUvLOeZy/aXevAlgZJqRe2XC0jyropywj3YP8Qp
         E/orzKJWPCPcvSu0EpgyMvqFKgTUG4zcA736BCfUeQ2+fqBVjcEbMfmh5CA7kaCKjhUV
         v+gsNPrMNWa4rawAV7TSqa5UiddDjokJmQKKFTSalZHDtP1lrQ/AcED1Bmfthr9jUvEE
         6lkvXcKG2ss1SQ87BYBhuLDgfHvnaOM5o7iPcS3oLysdFnLWVEowNdTPGO/BL7FvoFJj
         +eGy2DUDC6kABrw+Abn/GrubrhuybAcHhK7arKVhPjvX3TvZgIY8aVVdoAJ1mlYkfB3v
         ybew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392149; x=1709996949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZnmyEbp7/KapwN09X3KPNmenF0EZ+gIMNP6ui8wv+8=;
        b=J1605mAeI9raAV2BGcBmZv4cq3Obp59tpT3Bd7YG7ImAusAqiytyLOYUINiPliDjU3
         cWzinX7KdWm9g6ET+SB0n+hIEZvD9quy/wgvPyTAo4h0Wgqh/ZRZreR0P2xWKyw6dQbR
         6sI+/vdCKE2P5EUn1squ6ysXHkSsaNMPI8idqZOeXztCEkKUk5Y2kZRVR7UYfch6kSsk
         TGfPltSyR/8rwcOUBEr2KQ58Pa9zvg+NdoTKbV8i3gOhO4C2xqEp9er1yLkft/b9NWom
         YaQ+hT1wwW+0d3yb0+sb5qVcyKf9+VcwqjwkVWRcY7JuFKnqSwUpZ6ihHVOSHMzSG6Db
         KntQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxfe//kOl/RE67IwJuMoP/iWHBuGXlO2WzaK+NfoxYN9j6n9dmGolQmCz0qmOqBfXrYp9Gj7ocutUQSKiPu7ggf4oK7mNP2QcglA3zgwLsaOHViCMYIkRkaKSaxCN+vux8dKARn1mYy2ZfW9sO9NfDh5pfLYRDDfKtW4yuxXJaqswbh/cPFsVvLC1BDUVKQCaOCuBFnI+NJ/AUMCyhaLhH
X-Gm-Message-State: AOJu0YyP66msOHSC7Poqase6aGCk6jJeh+6L+MQiRzcoaOTLc/fiVN8Y
	Xpojj/KA1rDlpVrwn6hYOsB4heZMlqMJR7cFf5yD5B/e1Hw8xNEG
X-Google-Smtp-Source: AGHT+IFjI7EL9wmaOMs9DKRRoNoT/K+vGVVN1tRzp4FVvAb7IlMcgE0CtEM8KM4rNz0E+V7pGjBM0Q==
X-Received: by 2002:a05:600c:4e90:b0:411:c9c0:eddf with SMTP id f16-20020a05600c4e9000b00411c9c0eddfmr4004505wmq.36.1709392149165;
        Sat, 02 Mar 2024 07:09:09 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id k7-20020a7bc407000000b004126e26f756sm11827464wmi.43.2024.03.02.07.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 07:09:08 -0800 (PST)
Message-ID: <208e8bcc-1f35-4095-9a70-7243fdabaf87@gmail.com>
Date: Sat, 2 Mar 2024 16:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-mips@vger.kernel.org
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <20240229172653.GB1209090@google.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240229172653.GB1209090@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 18:26, Lee Jones wrote:
> On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> 
>> If a simple trigger is assigned to a LED, then the LED may be off until
>> the next led_trigger_event() call. This may be an issue for simple
>> triggers with rare led_trigger_event() calls, e.g. power supply
>> charging indicators (drivers/power/supply/power_supply_leds.c).
>> Therefore persist the brightness value of the last led_trigger_event()
>> call and use this value if the trigger is assigned to a LED.
>> This change allows to use simple triggers in more cases.
>> As a first use case simplify handling of the mute audio trigger.
>>
>> This series touches few subsystems. I'd propose to handle it via
>> the LED subsystem.
>>
>> Heiner Kallweit (4):
>>   leds: trigger: Store brightness set by led_trigger_event()
>>   ALSA: control-led: Integrate mute led trigger
>>   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
>>   leds: trigger: audio: Remove this trigger
>>
>>  arch/mips/configs/ci20_defconfig     |  1 -
> 
>>  drivers/input/input-leds.c           |  8 +---
> 
> This does not apply.
> 
> Please rebase onto v6.8-rc1.
> 
Since v6.8-rc1 the following has been added, which is touched by
my series:
698b43780ba2 ("Input: leds - set default-trigger for mute")

Rebasing onto v6.8-rc1 would mean:
- remove the change to input-leds from the series
- resubmit this change via input subsystem

This would affect bisectability, because for the time being
input-leds would reference a config symbol that doesn't exist
any longer.

We'd be fine only if the change to input-leds is applied first.
I think that's the best way to go, if you can't accept a series
based on linux-next.

>>  drivers/leds/led-triggers.c          |  6 ++-
>>  drivers/leds/trigger/Kconfig         |  7 ---
>>  drivers/leds/trigger/Makefile        |  1 -
>>  drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
>>  include/linux/leds.h                 | 29 ++++++------
>>  sound/core/Kconfig                   |  1 -
>>  sound/core/control_led.c             | 20 +++++++--
>>  9 files changed, 37 insertions(+), 103 deletions(-)
>>  delete mode 100644 drivers/leds/trigger/ledtrig-audio.c
>>
>> -- 
>> 2.43.1
>>
> 


