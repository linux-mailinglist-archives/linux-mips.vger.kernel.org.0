Return-Path: <linux-mips+bounces-2081-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B624387234D
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 16:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D81541C20D51
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 15:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F013128374;
	Tue,  5 Mar 2024 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/ab6b87"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85531128372;
	Tue,  5 Mar 2024 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709654178; cv=none; b=VIIj8rwZV8xBX1+0vp3urRPw8QC5N5fr8zT2IvSx4Dsed5P51jMrdjgWnN2hZdDPzwfPeXSZ/xRH2tIGunCVklQVEuHwj7E4NW7jyQmb3eu5mxmdhO8AKKbtyOApEZv6c4n77H2WQUc7lJX07l2dXo/A9PuW8M7joZfRYWr3v3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709654178; c=relaxed/simple;
	bh=BnaFDzBbmltAb5v+2wC3qWTbygfeUvKTmDcPvhmGNYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nulsiXPeJIrQvAkujdyFvK8vnWySN38jLIFuZ+jeO93dYPUFO9RqZDTlA+ojPrzzS5A4t5q8ljbMNQIGWPvN8dlDQk9b3AYxh+UwzoH1kbc/wvOx5mf+7Vrxn3JwzJhiXVdWD/6R3brHtROqKdHRpYUYlTz6gJwWm0mejDnW9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/ab6b87; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so73961521fa.3;
        Tue, 05 Mar 2024 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709654174; x=1710258974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CtBdSAcSwQ3TnbeDptF/Azjp8u4IA8m0A+cAla/IMsQ=;
        b=F/ab6b87Xge+C7V2adMwJr9Jl+zqfkE2U8GYAwl60h1C0K72nRziFwHpiB0VA6pRYq
         9AmSnd1+7yAZBWVw1o0eOguxYNw6JNKKljz4CPNVLxsk5I1ZcTUuc4EdgNzaxlTE/fPo
         QP220Tl1vpSQPPFb9NtfNm7ec7BzJexrWJX/moImFpseKSmSdPTg43fXiKJqZm9n3Y49
         vmokVUmVF6yuLgC4MnNMkeXsNF4piCsl1FKbwk0/GTvImOb64VBPqfVg1Wnj80ZZD1hc
         tE79tRXL4HEuSZo23X3AFZ8su2PKna/OejITkIofSFUKNwaxoON4TZRh4QjkERyf3yS0
         6R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709654174; x=1710258974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtBdSAcSwQ3TnbeDptF/Azjp8u4IA8m0A+cAla/IMsQ=;
        b=vAJW+O4TXKB2c5VnhfGQ9ulX34F71ClrKEquGXQnKPiwy/kRtcp57PiXXcDBsuSgn9
         PHHU1KUNwtNFBRJHdGN2pGg+9lipnHhzLgPFbMVijRY8Q6qk0TJuK+Lalr20GOSLC8SY
         ZN8FR2nNIO1+H1dZq0INdz7gn4+ugBPP8laCNt71mIKTQ8IO+ZwLudl9ZrMItdprb7cw
         Ql6Wm/7MtAdA/C9IuAz+es8ehfa4BuJdHbmgC/OoO+47/Sv/bEn6ZPlxv8ZpoWiUU0L6
         Ih7zglbeAm+mufUTJSH+Emb4utqhAR1XcstgpPbtKhHHjUVqBf2a6o0i0z1YQGxs89uB
         NXRw==
X-Forwarded-Encrypted: i=1; AJvYcCUcqKTe0R6g2zHY4wMIgJ8Vm92SpjDc8YL6LIkAP3kVW3TbVl7i6+DMfVyJpa1yOFT3CQ4VxXG+4VK/8pMT/1T2+9sDaFHgl5cM9yshOdMJKQPpJwhSWmLHjb7ihBdWCKPET771c6FB
X-Gm-Message-State: AOJu0YyM8Lu5DtAOD9BD9RCHJ7BEvjw9LLr5lXMHRg9YV0ezjlELBZv/
	cvmZsL7NlQiRb14+hnj1Ys/xorWk+7egXjhkKBuAvMv954iKB2We
X-Google-Smtp-Source: AGHT+IH0xTw+NsmOff/qConk8WbNXsaW01mYPdFaE+ctYS/tDRSWvT6y42MrROboHI8zb7nO3EXGBw==
X-Received: by 2002:a2e:3c07:0:b0:2d3:4b73:7b40 with SMTP id j7-20020a2e3c07000000b002d34b737b40mr1545546lja.17.1709654174098;
        Tue, 05 Mar 2024 07:56:14 -0800 (PST)
Received: from ?IPV6:2a01:c22:724c:8900:80cc:68f7:e37e:d133? (dynamic-2a01-0c22-724c-8900-80cc-68f7-e37e-d133.c22.pool.telefonica.de. [2a01:c22:724c:8900:80cc:68f7:e37e:d133])
        by smtp.googlemail.com with ESMTPSA id n14-20020a056402060e00b0056717df82d5sm3532441edv.64.2024.03.05.07.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 07:56:13 -0800 (PST)
Message-ID: <f2e7d244-62f4-4dde-bffc-8d96e5a4bac1@gmail.com>
Date: Tue, 5 Mar 2024 16:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
To: Lee Jones <lee@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Pavel Machek
 <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com> <20240305145454.GG86322@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240305145454.GG86322@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 15:54, Lee Jones wrote:
> On Tue, 05 Mar 2024, Lee Jones wrote:
> 
>> On Tue, 05 Mar 2024, Lee Jones wrote:
>>
>>> On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
>>>> If a simple trigger is assigned to a LED, then the LED may be off until
>>>> the next led_trigger_event() call. This may be an issue for simple
>>>> triggers with rare led_trigger_event() calls, e.g. power supply
>>>> charging indicators (drivers/power/supply/power_supply_leds.c).
>>>> Therefore persist the brightness value of the last led_trigger_event()
>>>> call and use this value if the trigger is assigned to a LED.
>>>> This change allows to use simple triggers in more cases.
>>>> As a first use case simplify handling of the mute audio trigger.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] leds: trigger: Store brightness set by led_trigger_event()
>>>       commit: 575129855dee0e364af7df84a77ab5cca54b1442
>>> [2/3] ALSA: control-led: Integrate mute led trigger
>>>       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
>>> [3/3] leds: trigger: audio: Remove this trigger
>>>       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
>>
>> Submitted for build testing.
>>
>> Once succeeded, a PR will follow for other maintainers to pull from.
> 
> make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc' allmodconfig
> make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
> x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vclock_gettime-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
> x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vgetcpu-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
> /builds/linux/drivers/platform/x86/dell/dell-laptop.c: In function 'dell_init':
> /builds/linux/drivers/platform/x86/dell/dell-laptop.c:2255:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>    micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>                                  ^~~~~~~~~~~~~~~~~
>                                  led_trigger_set
> cc1: all warnings being treated as errors
> make[7]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/dell/dell-laptop.o] Error 1
> make[7]: Target 'drivers/platform/x86/dell/' not remade because of errors.
> make[6]: *** [/builds/linux/scripts/Makefile.build:481: drivers/platform/x86/dell] Error 2
> /builds/linux/drivers/platform/x86/huawei-wmi.c: In function 'huawei_wmi_leds_setup':
> /builds/linux/drivers/platform/x86/huawei-wmi.c:313:28: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>   huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>                             ^~~~~~~~~~~~~~~~~
>                             led_trigger_set
> cc1: all warnings being treated as errors
> make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/huawei-wmi.o] Error 1
> /builds/linux/drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_led_init':
> /builds/linux/drivers/platform/x86/asus-wmi.c:1623:34: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>    asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>                                   ^~~~~~~~~~~~~~~~~
>                                   led_trigger_set
> cc1: all warnings being treated as errors
> make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/asus-wmi.o] Error 1
> /builds/linux/drivers/platform/x86/thinkpad_acpi.c: In function 'mute_led_init':
> /builds/linux/drivers/platform/x86/thinkpad_acpi.c:9288:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
>    mute_led_cdev[i].brightness = ledtrig_audio_get(i);
>                                  ^~~~~~~~~~~~~~~~~
>                                  led_trigger_set
> 
> ############################3
> 
> Errors were caused
>  
> [v6.8-rc1] ib-leds-mips-sound-6.9 2c61168294d0e ("leds: trigger: audio: Remove this trigger")
> 
>  x86_64 allmodconfig gcc-8
>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtQpYDimIIpMqO0Qm4AMAAPU/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhvxgZA6moBZmToTavyY4Eita/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9 
> 
>  x86_64 allmodconfig gcc-9
>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtYCYEqxnUFmoH73iKlcEIV8/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw2i4B539YZXCoSN2LSRvsW8/ 	Fail (7 errors - 0 warnings) : ib-leds-mips-sound-6.9 
> 
>  x86_64 allyesconfig gcc-8
>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtTzCsCxRpl9loRyfPrD1uhR/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
>      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw1WQ2BIpJRoyK7ruVCtihSN/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9
> 

Right, I forgot, there are patches applied via a different tree end of January,
that this series depends on. I assume this means that the series can be applied
only after the merge window.


