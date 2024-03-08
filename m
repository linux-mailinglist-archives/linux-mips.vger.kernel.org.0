Return-Path: <linux-mips+bounces-2225-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACF8769F2
	for <lists+linux-mips@lfdr.de>; Fri,  8 Mar 2024 18:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4C151F223D6
	for <lists+linux-mips@lfdr.de>; Fri,  8 Mar 2024 17:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E78957879;
	Fri,  8 Mar 2024 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1/C6jAX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E60D56745;
	Fri,  8 Mar 2024 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709919006; cv=none; b=WDbQk2rsV2vRZwTJlSpfzTZJz8wOgP54RMjuM2TGEiSK+Hc+uEAYJA8ZlVSrlOIcUcOzJ3XWEBlfOiY3akg3vb5LbGbEVvEfOn+u5KcQlRgWKHVMX2fUO2w5BiSVu++NhRzSx2+Erihr4ITyQTWtrdaIo7qNpIXuxunqVQyeaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709919006; c=relaxed/simple;
	bh=/lE282a7VLHgEOKVYB3C+L7TeijD1aqg+83fmDD9DmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPgOEprN/LiKD5E3f4lRpjRkAgc9IeGkRTnzdaopMdZPcN9lRs7j5RmBddO1J0WUf4JAsrghYoNCJdXcQ3bm6MesO7J0elqoTHvtLpMvew0ttXnXAIsMofkz1Dlj7Pp3ZiNLJkbJ1RCGzPPy5dtvX26iStvSzRekzPYQNHDdxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1/C6jAX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5658082d2c4so3051095a12.1;
        Fri, 08 Mar 2024 09:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709919003; x=1710523803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wDv6b1iN91vu3sTSiY/BLnJBxcjkXwIC5tDkY2TtAg0=;
        b=S1/C6jAXggZEPGqWkjNEJCG41dFpfSPeUWfl1B1GSXkLB03g88k11MD3eBnJf47j7+
         GNv37bwAGMEmXf/bUetmZobvZnzKUzIX/oXoKjW/dmbaSsIx/gyYvr33uxbdnXFQYOIF
         ZClClInE0AgKlPG3H6MZ1B/GRumDEwXTDZRfDNnwm17Moy/pfr2wvqiWNb5vbos9mnFB
         bWmG8UwgNoBOgN8192D1rJgdcN5GOdIUnPqgv4vMNpv40M22HmckKQV/JGvn+YYmAz2D
         afxgXm4IjVZ6Ly4dzjCG6tA9NbBHcZJk6gi2BvrSyazHXKVq6IsS4d6qb3Yj5qKvCFgV
         aSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709919003; x=1710523803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDv6b1iN91vu3sTSiY/BLnJBxcjkXwIC5tDkY2TtAg0=;
        b=FHNTwcPNbAci0Fy2dwnmQszpLkA6FJtnb3OkFIULW0J8q1kN4RNowPO4uGgHcDO7ZS
         36PAYN/NaQAnJVyk/LlB+/bIC+nzpJRjqtwEIWkKEcIT+CHY3gNuLcRAmHEh+WXEtpI8
         JVZfyipKzhTaDooVheAZA13cMaoXTMjJYtQyWA3m+inzdGpBbGXf0NHG83/X8W/x9CeZ
         e9ypmId1UPqVYb92CtnivS/Ao7T5OUrlmn0320sQyiOYOAFOMRGGbR8BPRFx8d6PpoRj
         OONuPr3w2BsqQOpa+xmQJAqKHBCcrPue7jjOe8dIg1HetTBCF3UsWI0mAViphV7JBEKm
         +QQw==
X-Forwarded-Encrypted: i=1; AJvYcCVhMlgP4eoIDkbSEhH+0dCycdulJC5luUs7C9UBcXlZoFumKWVQeBKkhasb8QD1uH5JyhJWVwy44G6yqBJ0dB6kg6Ovclj+tOEoYb5LHVmS1e+UU8S1oiR7LloorTekcQWyFpLlXR3p2e6uMVs4XsLk7RMd+rsWDIR+/NMwBguWUAGRaw==
X-Gm-Message-State: AOJu0Yx2LkVHLdd3AFD96HA38VX1Qe1VfYqOEby+lHyjI3g1+G2uD3BO
	F8Tk2YiUYdCQMgRwta64eI7P72hGcBtr0QNe0Ez+9otz0CHM5LEF
X-Google-Smtp-Source: AGHT+IHBxgRUjZoD/mp8Sq21o+mtfART8/1gmmDNBzqJyoeaih4zoByqabPhMT0fP85yW+X3rt0WLw==
X-Received: by 2002:a17:906:5585:b0:a45:25d:a291 with SMTP id y5-20020a170906558500b00a45025da291mr11534148ejp.25.1709919002589;
        Fri, 08 Mar 2024 09:30:02 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e92:f300:6c30:e65e:d563:ab94? (dynamic-2a01-0c22-6e92-f300-6c30-e65e-d563-ab94.c22.pool.telefonica.de. [2a01:c22:6e92:f300:6c30:e65e:d563:ab94])
        by smtp.googlemail.com with ESMTPSA id s19-20020a170906501300b00a433f470cf1sm1619ejj.138.2024.03.08.09.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 09:30:01 -0800 (PST)
Message-ID: <9c256c60-3baa-429f-979b-8e60ef03fed3@gmail.com>
Date: Fri, 8 Mar 2024 18:30:00 +0100
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
I'm not aware of such a branch. 6.9-rc1 isn't too far away, so let's wait for it.


