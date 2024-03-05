Return-Path: <linux-mips+bounces-2080-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F9387220E
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 15:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F5B282928
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 14:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7CF126F07;
	Tue,  5 Mar 2024 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZzcRaI8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002EB126F02;
	Tue,  5 Mar 2024 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650500; cv=none; b=FuVZlX2w/9jaacUuab+Mvwt53SuNjes+EfqP9IGp+wc+jU7lvbmy769rzG691om/gjCgk/VeGb10H5fzwLy/AGPEtp6sDQG8YPqgEoTMnUVAF1PMzs+u/mu30aCJwbIJiDo3snN6n1IaXIDTwwNCMt7E0Tf9aXOQ2C6CGTOgRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650500; c=relaxed/simple;
	bh=FFTJDi7gEJlgKd1yhagGEggsUbmSGNPge6OBTq5K2Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3hANqvSwik5NtFhdBPVncr/3EDXT7kkmShZWuiMQ4LBenYyLBDdEjja5M3WFVnBdxbZVunbc4Y9mSZKi1arDA2DXBHldCXbfyiISI6rsuuK2yuf9VsBRcAlkfu92kRi9N4frhA6/MIl4TLzoN/5DYYluHSJBKd+yPKgC8A+GNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZzcRaI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE71C433F1;
	Tue,  5 Mar 2024 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650499;
	bh=FFTJDi7gEJlgKd1yhagGEggsUbmSGNPge6OBTq5K2Ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZzcRaI87us1hQGkwBjWa6er0DYuBej0vuQQnFt28kuXJBZRQO1hbfFDHCI1vHHiO
	 SwsnU6pzas3zA+D+ZFZllQ0kal2N+BEYhnwGbDTTSbsZWWv8AstxYaW7gBaNdz/d7Z
	 8Xk8KLigJoUCF2IBnjPwG9f/ijTXaDcGrxaMs2GVX+BeFBNbB0J/Aczw6ZPSfcbJb7
	 DuJmVgjohRaUWSZg/ZR7Ml0wJQmelfKCesnWDYuwj5FuSPQG0Nh1UscQMfD2RceIwf
	 8dHxpbidiyKd3gPDEzMCcXntOW5WwI6DhMaOMR72XyDFj7p0QE+mlAES6BWD3/D9oV
	 s3AOeph9ZUjUA==
Date: Tue, 5 Mar 2024 14:54:54 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240305145454.GG86322@google.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305120947.GD86322@google.com>

On Tue, 05 Mar 2024, Lee Jones wrote:

> On Tue, 05 Mar 2024, Lee Jones wrote:
> 
> > On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
> > > If a simple trigger is assigned to a LED, then the LED may be off until
> > > the next led_trigger_event() call. This may be an issue for simple
> > > triggers with rare led_trigger_event() calls, e.g. power supply
> > > charging indicators (drivers/power/supply/power_supply_leds.c).
> > > Therefore persist the brightness value of the last led_trigger_event()
> > > call and use this value if the trigger is assigned to a LED.
> > > This change allows to use simple triggers in more cases.
> > > As a first use case simplify handling of the mute audio trigger.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] leds: trigger: Store brightness set by led_trigger_event()
> >       commit: 575129855dee0e364af7df84a77ab5cca54b1442
> > [2/3] ALSA: control-led: Integrate mute led trigger
> >       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
> > [3/3] leds: trigger: audio: Remove this trigger
> >       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
> 
> Submitted for build testing.
> 
> Once succeeded, a PR will follow for other maintainers to pull from.

make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc' allmodconfig
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vclock_gettime-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vgetcpu-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
/builds/linux/drivers/platform/x86/dell/dell-laptop.c: In function 'dell_init':
/builds/linux/drivers/platform/x86/dell/dell-laptop.c:2255:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
   micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
                                 ^~~~~~~~~~~~~~~~~
                                 led_trigger_set
cc1: all warnings being treated as errors
make[7]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/dell/dell-laptop.o] Error 1
make[7]: Target 'drivers/platform/x86/dell/' not remade because of errors.
make[6]: *** [/builds/linux/scripts/Makefile.build:481: drivers/platform/x86/dell] Error 2
/builds/linux/drivers/platform/x86/huawei-wmi.c: In function 'huawei_wmi_leds_setup':
/builds/linux/drivers/platform/x86/huawei-wmi.c:313:28: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
  huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
                            ^~~~~~~~~~~~~~~~~
                            led_trigger_set
cc1: all warnings being treated as errors
make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/huawei-wmi.o] Error 1
/builds/linux/drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_led_init':
/builds/linux/drivers/platform/x86/asus-wmi.c:1623:34: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
   asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
                                  ^~~~~~~~~~~~~~~~~
                                  led_trigger_set
cc1: all warnings being treated as errors
make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/asus-wmi.o] Error 1
/builds/linux/drivers/platform/x86/thinkpad_acpi.c: In function 'mute_led_init':
/builds/linux/drivers/platform/x86/thinkpad_acpi.c:9288:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
   mute_led_cdev[i].brightness = ledtrig_audio_get(i);
                                 ^~~~~~~~~~~~~~~~~
                                 led_trigger_set

############################3

Errors were caused
 
[v6.8-rc1] ib-leds-mips-sound-6.9 2c61168294d0e ("leds: trigger: audio: Remove this trigger")

 x86_64 allmodconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtQpYDimIIpMqO0Qm4AMAAPU/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhvxgZA6moBZmToTavyY4Eita/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9 

 x86_64 allmodconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtYCYEqxnUFmoH73iKlcEIV8/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw2i4B539YZXCoSN2LSRvsW8/ 	Fail (7 errors - 0 warnings) : ib-leds-mips-sound-6.9 

 x86_64 allyesconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtTzCsCxRpl9loRyfPrD1uhR/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw1WQ2BIpJRoyK7ruVCtihSN/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9

-- 
Lee Jones [李琼斯]

