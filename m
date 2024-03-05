Return-Path: <linux-mips+bounces-2082-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E488E8723B8
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 17:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8F4285E94
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B227312D1F2;
	Tue,  5 Mar 2024 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxPNg1Zm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC5128399;
	Tue,  5 Mar 2024 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709654794; cv=none; b=eEoPQoV++L8WCFGbPPLPHtAJ0aOrEw1GGnclXrDzxf2EnC59TkmGZvy/csQVkbtBFxsrw6DNHboBMyA7rqW9x5k4kNf4ymbiFXle2XWiFyKHE1N6i8H7WJuel0GHDXODq3DZ3JAc15h3LqqDHMXrfGjk2N82VBMarFJz8U2uVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709654794; c=relaxed/simple;
	bh=iQ4ueZCtzUAUounXFnVno6yI9heqKH0W5Dph34x4a8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=risDjIhrDRi/YgDBLYfsrwtRt4zyG3LaMOBZPqhSYukjLign5JWFN047QMCtHaUJPYKXS2sNfZpkzIMJWZATVMYVGUNp9Lu90JFW7RHmG9pnn8el8DPD4Hx8ruTBAHHARiWCGezczQqwzxD5Ov2+J6UEcLaZCM8sYNt9LJM8lSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxPNg1Zm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F66CC433C7;
	Tue,  5 Mar 2024 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709654794;
	bh=iQ4ueZCtzUAUounXFnVno6yI9heqKH0W5Dph34x4a8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxPNg1ZmxayBUPsjxy9RQhDpBa9lRMs+kH0JU14MS9DXyPcPVSnPo6olELCIYGkG3
	 1apLIEGE/2hCtYeZSr7RLZ4yWLhc4xZJ2kqdnphv9CLkdX+tRiUlAJWQAN4wlOjS/d
	 zwlNN7+HoyxkGZiqghpDTM+EaNOamLDS+we7myyMLSDIjo+JWoI4L2U6QyqXAWCGOx
	 CDiMvZK+XG4mdIfmznnz7KKORI+oknDBV7eaPuVgTx5xQe+rtaaMqYtgOW/8xf3mY6
	 VChg0g2MXBclanr/LcYhDP37FI1zkuVQQDOZoO+65jedFECBNfmHHegT8k0duDjpHB
	 zlgtCl74qjUcw==
Date: Tue, 5 Mar 2024 16:06:26 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-leds@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240305160626.GH86322@google.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com>
 <20240305145454.GG86322@google.com>
 <f2e7d244-62f4-4dde-bffc-8d96e5a4bac1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2e7d244-62f4-4dde-bffc-8d96e5a4bac1@gmail.com>

On Tue, 05 Mar 2024, Heiner Kallweit wrote:

> On 05.03.2024 15:54, Lee Jones wrote:
> > On Tue, 05 Mar 2024, Lee Jones wrote:
> > 
> >> On Tue, 05 Mar 2024, Lee Jones wrote:
> >>
> >>> On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
> >>>> If a simple trigger is assigned to a LED, then the LED may be off until
> >>>> the next led_trigger_event() call. This may be an issue for simple
> >>>> triggers with rare led_trigger_event() calls, e.g. power supply
> >>>> charging indicators (drivers/power/supply/power_supply_leds.c).
> >>>> Therefore persist the brightness value of the last led_trigger_event()
> >>>> call and use this value if the trigger is assigned to a LED.
> >>>> This change allows to use simple triggers in more cases.
> >>>> As a first use case simplify handling of the mute audio trigger.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/3] leds: trigger: Store brightness set by led_trigger_event()
> >>>       commit: 575129855dee0e364af7df84a77ab5cca54b1442
> >>> [2/3] ALSA: control-led: Integrate mute led trigger
> >>>       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
> >>> [3/3] leds: trigger: audio: Remove this trigger
> >>>       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
> >>
> >> Submitted for build testing.
> >>
> >> Once succeeded, a PR will follow for other maintainers to pull from.
> > 
> > make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc' allmodconfig
> > make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
> > x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vclock_gettime-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
> > x86_64-linux-gnu-ld: warning: arch/x86/entry/vdso/vgetcpu-x32.o: corrupt GNU_PROPERTY_TYPE (5) size: 0x10
> > /builds/linux/drivers/platform/x86/dell/dell-laptop.c: In function 'dell_init':
> > /builds/linux/drivers/platform/x86/dell/dell-laptop.c:2255:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
> >    micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> >                                  ^~~~~~~~~~~~~~~~~
> >                                  led_trigger_set
> > cc1: all warnings being treated as errors
> > make[7]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/dell/dell-laptop.o] Error 1
> > make[7]: Target 'drivers/platform/x86/dell/' not remade because of errors.
> > make[6]: *** [/builds/linux/scripts/Makefile.build:481: drivers/platform/x86/dell] Error 2
> > /builds/linux/drivers/platform/x86/huawei-wmi.c: In function 'huawei_wmi_leds_setup':
> > /builds/linux/drivers/platform/x86/huawei-wmi.c:313:28: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
> >   huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> >                             ^~~~~~~~~~~~~~~~~
> >                             led_trigger_set
> > cc1: all warnings being treated as errors
> > make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/huawei-wmi.o] Error 1
> > /builds/linux/drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_led_init':
> > /builds/linux/drivers/platform/x86/asus-wmi.c:1623:34: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
> >    asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> >                                   ^~~~~~~~~~~~~~~~~
> >                                   led_trigger_set
> > cc1: all warnings being treated as errors
> > make[6]: *** [/builds/linux/scripts/Makefile.build:243: drivers/platform/x86/asus-wmi.o] Error 1
> > /builds/linux/drivers/platform/x86/thinkpad_acpi.c: In function 'mute_led_init':
> > /builds/linux/drivers/platform/x86/thinkpad_acpi.c:9288:33: error: implicit declaration of function 'ledtrig_audio_get'; did you mean 'led_trigger_set'? [-Werror=implicit-function-declaration]
> >    mute_led_cdev[i].brightness = ledtrig_audio_get(i);
> >                                  ^~~~~~~~~~~~~~~~~
> >                                  led_trigger_set
> > 
> > ############################3
> > 
> > Errors were caused
> >  
> > [v6.8-rc1] ib-leds-mips-sound-6.9 2c61168294d0e ("leds: trigger: audio: Remove this trigger")
> > 
> >  x86_64 allmodconfig gcc-8
> >      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtQpYDimIIpMqO0Qm4AMAAPU/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
> >      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhvxgZA6moBZmToTavyY4Eita/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9 
> > 
> >  x86_64 allmodconfig gcc-9
> >      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtYCYEqxnUFmoH73iKlcEIV8/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
> >      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw2i4B539YZXCoSN2LSRvsW8/ 	Fail (7 errors - 0 warnings) : ib-leds-mips-sound-6.9 
> > 
> >  x86_64 allyesconfig gcc-8
> >      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhtTzCsCxRpl9loRyfPrD1uhR/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
> >      https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGhw1WQ2BIpJRoyK7ruVCtihSN/ 	Fail (7 errors - 2 warnings) : ib-leds-mips-sound-6.9
> > 
> 
> Right, I forgot, there are patches applied via a different tree end of January,
> that this series depends on. I assume this means that the series can be applied
> only after the merge window.

Yes, unless there is a succinct immutable branch I can pull from.

-- 
Lee Jones [李琼斯]

