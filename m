Return-Path: <linux-mips+bounces-2042-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EC870BEF
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 21:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885131C21FE5
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 20:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0A9107B6;
	Mon,  4 Mar 2024 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+lkfYQu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0871CA94;
	Mon,  4 Mar 2024 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585790; cv=none; b=Dsutgzs91YAdKaHPyHwt/HVQfmj6tLtpDDEAkgCCQGVpjzQeG4LsrS2Tc3kz5ZSID+4gAqPT8rtZceJZRBiyQsp+IGyvtPK0YnQAbMZefhlVSgCRrPS5OcwiM0F4rB2DbS7RCd3ljVbOvAausESypL7e/VUNSrzI5YW/2eU5eHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585790; c=relaxed/simple;
	bh=Cbtm2zL/5+I4hWXHFC5vNNae0nfkBO/gMESIQYQqebY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nHiws2gDTniFZASmuH2zZRrPO7gSEgXbmBqd9LGzyV83UWzhUavAW3ZgAC8V8lSbHFtbMQe6z8UzXch2O/JYbEhsI/83vSnB8AdxVc1cJWiJ/nQDWeicI47thXEk119BJxn0A4ORlg5jtMJSH7/3g4ZEye6y+IXQJBf8lXfIOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+lkfYQu; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512e39226efso4903107e87.0;
        Mon, 04 Mar 2024 12:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709585787; x=1710190587; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlRNmAp6oc6mRw+U/oxXT8xWm/794COQRqH81BoO21E=;
        b=l+lkfYQu3ttys6dtKQoJBzgp4yBHp9EMrVZy9yUC+HGjwbOvqfURJocnKdhUHoFmC0
         thWetASWBnU2YQCoegVY0uZxi/cj2RAbBEFSFid7JfdXKD4vRHrFahMUTD7cFjb//F2P
         arO+X6lxeDKgUetCHdbMJgBNfH8wEHRTJIya0jCeSjfnnor1MyDKa/5iBJ6Tyn3hGU6M
         YtWIWcXafFjfn7MA609RntjKoogMjw5u+OQoscX1QcLC+HSqH0P5c5O0c5BgrcpQjmK3
         UmQIHtrakURxwc8sb4UISPR+vgNDNo4leZjWGRVUNz37q8Q+992Wvye1zTLzh/aNGbWT
         oRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585787; x=1710190587;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlRNmAp6oc6mRw+U/oxXT8xWm/794COQRqH81BoO21E=;
        b=lA7qcdcSgzWm162lMMaUraH44Td74Z7POK7Qmv6MeSV99/blpBZd1UQK54LML/w7eO
         OQ1a9kEZtbNW1G6X1Ug8V2v/QEMzG/Ix6ASSdz9ezs715q1fgQfbCwPOihZhykSICVeU
         ifLSgvoVmnSg6aZoSYfhfWHAOYc/k4iA4i8z0fjZusSRMjlk4udHTdbB2W2Jy2dPatOB
         GmKuSGhu1cbaty0HWlinzbfUBSUPWBDlFP9ph/7w10BDUSubo8djo2j5r8qfvXwMzO3s
         9GQLJ+TqGYgFB+hMkLGLztmg+RLFFd6WEsHHBfp4SUFnXOscFk4dSijl5RWvNKxWKnn2
         64CA==
X-Forwarded-Encrypted: i=1; AJvYcCXtSJrOWR3IyCMKY9jiSEWXG5pasqyT1PjEFHjw7WBNtpWGSuQ9fpism7Yglw4S5rp5IOdDhU4G8O86+Ozpc7jLYxiYu60yD6dKAc9J7uYXI54tkla1UbvRJmiq/J/YYcjYXne3hDc9
X-Gm-Message-State: AOJu0YwB/F9SNcsEGKYqcfmyjpFdZSMQbvbH3UCgBMRgzP2hVnqjc5fc
	FLtBRWvuE9kxqEhyUxjvdMKst69+DxvQL6aXtLATDH+E8vckeK5J4QP+vtIY
X-Google-Smtp-Source: AGHT+IFm0VtBWXVuPskT8VCWwze+tfErEi88n9OFuC/BQ1l911Dop6lcK8GOz4qlJHpqJKRebHzd6A==
X-Received: by 2002:a19:e00d:0:b0:512:bdcd:f22b with SMTP id x13-20020a19e00d000000b00512bdcdf22bmr6385780lfg.64.1709585786412;
        Mon, 04 Mar 2024 12:56:26 -0800 (PST)
Received: from ?IPV6:2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64? (dynamic-2a01-0c23-c411-1a00-49f1-9fda-4d1e-4f64.c23.pool.telefonica.de. [2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64])
        by smtp.googlemail.com with ESMTPSA id tb25-20020a1709078b9900b00a4557115465sm1405531ejc.13.2024.03.04.12.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:56:25 -0800 (PST)
Message-ID: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
Date: Mon, 4 Mar 2024 21:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/3] leds: trigger: Improve handling of led_trigger_event()
 and simplify mute audio trigger
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If a simple trigger is assigned to a LED, then the LED may be off until
the next led_trigger_event() call. This may be an issue for simple
triggers with rare led_trigger_event() calls, e.g. power supply
charging indicators (drivers/power/supply/power_supply_leds.c).
Therefore persist the brightness value of the last led_trigger_event()
call and use this value if the trigger is assigned to a LED.
This change allows to use simple triggers in more cases.
As a first use case simplify handling of the mute audio trigger.

This series touches few subsystems. I'd propose to handle it via
the LED subsystem.

v2:
- Split out patch 3 from series and apply it separately via Input tree
- Improve bisectability and ensure that audio mute trigger can't be
  built twice between patches 2 and 4.

Heiner Kallweit (3):
  leds: trigger: Store brightness set by led_trigger_event()
  ALSA: control-led: Integrate mute led trigger
  leds: trigger: audio: Remove this trigger

 arch/mips/configs/ci20_defconfig     |  1 -
 drivers/leds/led-triggers.c          |  6 ++-
 drivers/leds/trigger/Kconfig         |  7 ---
 drivers/leds/trigger/Makefile        |  1 -
 drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
 include/linux/leds.h                 | 29 ++++++------
 sound/core/Kconfig                   |  1 -
 sound/core/control_led.c             | 20 +++++++--
 8 files changed, 36 insertions(+), 96 deletions(-)
 delete mode 100644 drivers/leds/trigger/ledtrig-audio.c

-- 
2.44.0

