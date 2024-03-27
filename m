Return-Path: <linux-mips+bounces-2429-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B71788DE6A
	for <lists+linux-mips@lfdr.de>; Wed, 27 Mar 2024 13:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED9A1C28D05
	for <lists+linux-mips@lfdr.de>; Wed, 27 Mar 2024 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0C11386A0;
	Wed, 27 Mar 2024 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0F4aemb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A01384AD;
	Wed, 27 Mar 2024 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711541310; cv=none; b=K5Sw/u6GWPXQxAAqol5f5FDEuW8rXxBKvltOdthTjus/skA9ZEHgIobAamRQ5sskbCA7wfG5apKATQXKSwWkVbnHsSZSwWlqFp8q0+G7rvLQL5Ezm9gEO+fWAkijVjiuo7jVFhtAKvMuL7kCfMBCIIJiSoeyCX5rTYAAgeTaRuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711541310; c=relaxed/simple;
	bh=oZTe2+HsBnrS8zUXYQUyg0A+3ZpwvYYSvqBKARycrgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQeNWpwQ0Mg/va9WOWsXJmc+mNgVIWuTXDWsN6pUQAJ5XnRfrGt8wpIIyW79ryTTp0Abz8JpOSU8sYU/7kQQVuSDHlO4MMrZ170k7xUl/nz2DD/8l4TNRC9MVtzlRrx+RfJxLy7bneCZT2huyZhEGGBSN3QXdSfUf2s81KBTBrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0F4aemb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44f2d894b7so813692766b.1;
        Wed, 27 Mar 2024 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711541307; x=1712146107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GB/oh0gJaySzvfajzZi3YPER75UfgA1zu0gB/OoTPFY=;
        b=X0F4aemb0a/Ikslz2oLQw67KCTwKdwJJmUTR9OBv9rkv/TCMoca8c7tU7MrUlgi5dy
         4AvZc47nwwmPQpGUL4YNs5+s5Fm38EmxdGBm0IjovdpSrJnsYPVj/qqb9BdK5QjHcLP4
         EYFnXwqIyV0vOjSnYQnf1fPuGnq2PQmANbB7zugVlLT2ikAKUIlx9eFUv2bWZEEghVFZ
         YH0LqR34cBHHLQMpayh0g21xeP46HIfDc2lJDHlPoko98HLTURx+GcDGQbygTEzoJyW6
         Z4X8Uv6JJclw8vZ0e05JSdpQqqZz6zJhDtV5xTnyCo0TvpWFyFrrKf3eatArRuHHdJun
         X1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711541307; x=1712146107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB/oh0gJaySzvfajzZi3YPER75UfgA1zu0gB/OoTPFY=;
        b=XVQfz/Snb+1Y9tzYZDaYWvoFq17mzB1Rta3OjOxw3RXiGqG+kYrmNj+Ikc4RMZZTrU
         NkXrzjhRq1GaVx2LYSmiEZogO9KzCId6gge086X9g/G5C7wMfrjU3k4pvQ023NKzv3t7
         2TqCIvbFCS9iVEIdENhDquHFSsw0/dOp1LxyHLeAWdtRWh8b2Ck+jGpuIEmqaFHUAwoP
         oCCEl3VMNfEP5Z4WhXSuWExxXlWPGleNvrt9wFNLVPqeXfhReYYyOMTEWarFqXsegX4y
         1bQk916fxl37I1b5s397KdkGO92VUe3k9zq2WmBcZT71pXFdaxBXyXStAmIZ2/Wr1Bho
         LKUw==
X-Forwarded-Encrypted: i=1; AJvYcCUE64GD2B3sWz4nLVBkqZNVG7X77e6acA0pDj+X0bMYTmJusJYPfrICbLLqbjYYqDVgmM9P5+bnNrEgnTiphCYiPUbl98jBoUk/k9yp5C+93bMbXTS/WAO10c81UpQanN9IA3URIe1LOPmt2tsfc1oJSFV4H/Apt2L/d2/rUr93N/zgzg==
X-Gm-Message-State: AOJu0Ywr587YGIIi7lXVP2ikQy0N7f8JHWpKcbEGdRYgV7eUTnmxQPSX
	MRrVTtnNe7Fm2hCrXInkOly5p7m7kFJi4uRO5DopLuP/QvoH/qBw
X-Google-Smtp-Source: AGHT+IHcfilyApCcOQkxhGJ5YtMJqkiUwfEkTsluEDoaeeJTBDTlGt8juUP9t7Njs8YkTRW/+DQjYA==
X-Received: by 2002:a17:906:4709:b0:a4d:f1b4:6235 with SMTP id y9-20020a170906470900b00a4df1b46235mr3332192ejq.27.1711541306927;
        Wed, 27 Mar 2024 05:08:26 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7b87:a500:dd0e:a4dd:4c2a:b10a? (dynamic-2a01-0c22-7b87-a500-dd0e-a4dd-4c2a-b10a.c22.pool.telefonica.de. [2a01:c22:7b87:a500:dd0e:a4dd:4c2a:b10a])
        by smtp.googlemail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm5436432ejb.140.2024.03.27.05.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 05:08:26 -0700 (PDT)
Message-ID: <f18bb686-5e7c-446b-877c-b92a1dc70145@gmail.com>
Date: Wed, 27 Mar 2024 13:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
To: Lee Jones <lee@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-leds@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com> <20240305145454.GG86322@google.com>
 <f2e7d244-62f4-4dde-bffc-8d96e5a4bac1@gmail.com>
 <20240305160626.GH86322@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240305160626.GH86322@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 17:06, Lee Jones wrote:
> On Tue, 05 Mar 2024, Heiner Kallweit wrote:
> 
>> On 05.03.2024 15:54, Lee Jones wrote:
>>> On Tue, 05 Mar 2024, Lee Jones wrote:
>>>
>>>> On Tue, 05 Mar 2024, Lee Jones wrote:
>>>>
>>>>> On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
>>>>>> If a simple trigger is assigned to a LED, then the LED may be off until
>>>>>> the next led_trigger_event() call. This may be an issue for simple
>>>>>> triggers with rare led_trigger_event() calls, e.g. power supply
>>>>>> charging indicators (drivers/power/supply/power_supply_leds.c).
>>>>>> Therefore persist the brightness value of the last led_trigger_event()
>>>>>> call and use this value if the trigger is assigned to a LED.
>>>>>> This change allows to use simple triggers in more cases.
>>>>>> As a first use case simplify handling of the mute audio trigger.
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied, thanks!
>>>>>
>>>>> [1/3] leds: trigger: Store brightness set by led_trigger_event()
>>>>>       commit: 575129855dee0e364af7df84a77ab5cca54b1442
>>>>> [2/3] ALSA: control-led: Integrate mute led trigger
>>>>>       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
>>>>> [3/3] leds: trigger: audio: Remove this trigger
>>>>>       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
>>>>
>>>> Submitted for build testing.
>>>>
>>>> Once succeeded, a PR will follow for other maintainers to pull from.
>>>
>>> make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc' allmodconfig
>>> make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
>>> x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vclock_gettime-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
>>> x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vgetcpu-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
>>> /builds/linux/drivers/platform/x86/dell/dell-laptop.c: In function 'dell_init':
>>> /builds/linux/drivers/platform/x86/dell/dell-laptop.c:2255:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>>>    micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>>                                  ^~~~~~~~~~~~~~~~~
>>>                                  led_trigger_set
>>> cc1: all warnings being treated as errors
>>> make[7]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/dell/dell-laptop.o] Error 1
>>> make[7]: Target 'drivers/platform/x86/dell/' not remade because of errors.
>>> make[6]: *** [/builds/linux/scripts/Makefile.build:481: drivers/platform/x86/dell] Error 2
>>> /builds/linux/drivers/platform/x86/huawei-wmi.c: In function 'huawei_wmi_leds_setup':
>>> /builds/linux/drivers/platform/x86/huawei-wmi.c:313:28: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>>>   huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>>                             ^~~~~~~~~~~~~~~~~
>>>                             led_trigger_set
>>> cc1: all warnings being treated as errors
>>> make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/huawei-wmi.o] Error 1
>>> /builds/linux/drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_led_init':
>>> /builds/linux/drivers/platform/x86/asus-wmi.c:1623:34: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>>>    asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>>                                   ^~~~~~~~~~~~~~~~~
>>>                                   led_trigger_set
>>> cc1: all warnings being treated as errors
>>> make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/asus-wmi.o] Error 1
>>> /builds/linux/drivers/platform/x86/thinkpad_acpi.c: In function 'mute_led_init':
>>> /builds/linux/drivers/platform/x86/thinkpad_acpi.c:9288:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>>>    mute_led_cdev[i].brightness = ledtrig_audio_get(i);
>>>                                  ^~~~~~~~~~~~~~~~~
>>>                                  led_trigger_set
>>>
>>> ############################3
>>>
>>> Errors were caused
>>>  
>>> [v6.8-rc1] ib-leds-mips-sound-6.9 2c61168294d0e ("leds: trigger: audio: Remove this trigger")
>>>
>>>  x86_64 allmodconfig gcc-8
>>>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtQpYDimIIpMqO0Qm4AMAAPU/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
>>>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhvxgZA6moBZmToTavyY4Eita/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9 
>>>
>>>  x86_64 allmodconfig gcc-9
>>>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtYCYEqxnUFmoH73iKlcEIV8/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>>>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw2i4B539YZXCoSN2LSRvsW8/ 	Fail (7 errors - 0 warnings) : ib-leds-mips-sound-6.9 
>>>
>>>  x86_64 allyesconfig gcc-8
>>>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtTzCsCxRpl9loRyfPrD1uhR/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
>>>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw1WQ2BIpJRoyK7ruVCtihSN/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9
>>>
>>
>> Right, I forgot, there are patches applied via a different tree end of January,
>> that this series depends on. I assume this means that the series can be applied
>> only after the merge window.
> 
> Yes, unless there is a succinct immutable branch I can pull from.
> 
Now that 6.9-rc1 is out, can this series be applied?


