Return-Path: <linux-mips+bounces-1415-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE88529D8
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 08:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32F5BB237B1
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 07:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D6517573;
	Tue, 13 Feb 2024 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVgPm00v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6EB17566;
	Tue, 13 Feb 2024 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809434; cv=none; b=XBjlXlqdp/FMQ9JOEtQHbblcy3/bWXMF12jbG+Jv+HsyHzYhsFbumJLD4pOwhUGaiMhUdG33NcCIIqo6RL7LD+Xt8rgs4hIe4HGkk+9om5hlM65cHJQO4f6DzTKcGqqe5JBuHS8PGMAhMswgvNQX4flmWvVkYyyn4faMKXEzPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809434; c=relaxed/simple;
	bh=frvcFXXkFVHDbqMmYl179RvLgqm5ksSrWgB0qTmKjc4=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=hWkywEnNbWLT8up7m/zJuUEdQu9Qd2GCxNP60e7uvsYg8G1GnDCnUmGii7qj1yOXqKZkmvPmcXuN9sa37gK7w3c74i+uHBS1mfol0Sa6INU4YBkc2jGH174e4SxYsqBcZBcf1nfxUGWLrukClL3vaNJbJpBAsIsg/qLUpj9ruVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVgPm00v; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-561f8b8c058so339801a12.0;
        Mon, 12 Feb 2024 23:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707809430; x=1708414230; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:content-language:cc:to
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oFUNwkqZ0w6dII497/f6Et0kIrHPyrjVVAYzErSbMo0=;
        b=IVgPm00vz4qcpTJ51z/7pRLSd1CBg9mYuH0DT/k82y4TtZaNLrkIO5Jm3u0opDtHQw
         nU4yA3MqpHJ1xlec9T/xTPJKWotTl9Ki6GfZmuZULDLc1VzEoA6pMqhGtPxkQ8CUAEkW
         8hhnEaI5iIsqFU60W4QHZLZ+AmvmsBRPY5mKSqFF9eGmlyxsz1GgnqD1QubTRWgyGh2z
         nR3/Wna0owbd1HLQ/oJuzPBQ9RPz+4H8K42f60W/AriNSEPe0xzQvGS0WrO5LR7rIxqc
         IRxGo5th03MDd2VsdgIF93uJREScLwumfDug1W2UjvNb1q+lhOKlA9FnToPO4cBq+Ngb
         PfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809430; x=1708414230;
        h=content-transfer-encoding:autocrypt:subject:content-language:cc:to
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFUNwkqZ0w6dII497/f6Et0kIrHPyrjVVAYzErSbMo0=;
        b=bogHgj2x6w2WeJCPcCQsGnZPF0beuNGq9K/OYRLpJltdc+JoGB0E0+pj1xXeSndRHP
         9cnc1gm5sfv8EpQi6KtBJ13aK1nMfhB1J1V4ECKPCV2S6aBh+SKqoVUnH4OQUgoRJzdy
         pPeoMZjTlCdah/1+Hh4/okKrRjCgrrhXqIe8GtNsMurmimockQnE4YUhIUOtcF0brwFJ
         3FubTTULjSbqfg631jXw1bpwsbT0GxQ5sdiDpJhTHvATP1NPzw/cNLDNAi7/ktYHq0Tg
         mAg+cdvZf2LA+WrV5jT9e6hYZdP+5ZZyjUNSBLsgbAqSzitaR3wgxkymohnDJALvBuoP
         v9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUDxVsw8MQyytZfxC40bPCXCwK/tVaUj/3lFhHgwcgaP4+RnlBxLIkDPzQPI97NObnqIab1d1HmOqnL5L6tgQ3NNevCMWvfluo/LJtVjk0HJmJwWWjz/c+2x8x5fEWbzAzpJWhBhs+0XF4YuyF5hfCZa/lssJfUBz2ZWdcu8A1zzIYG9ig=
X-Gm-Message-State: AOJu0YxDHGjrfkr7Hsbz93tp04jzOYja8LdzW2ZmqcltwCbDDzdkbI4H
	y8lg9uBXGH0Er7Unm8x8pr01LmVViDhuQNIP/dn9MILT6IbhUF5L
X-Google-Smtp-Source: AGHT+IH9GiA3EpInRnq01WoRzdVMmzhnZP487D9Aa/KTzHCSdkRooZNqexlpGAU72CZ8/L8QiPacxg==
X-Received: by 2002:a17:906:c2cc:b0:a38:158b:bbbc with SMTP id ch12-20020a170906c2cc00b00a38158bbbbcmr1324222ejb.38.1707809430206;
        Mon, 12 Feb 2024 23:30:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUt9W0QAMT7py8xhpYB1rdImE5GGL88v2ZmmkR1v4vnoh/ojnuG6dk9LtEBM1h9v4GxVU0cZrRgHTuqkm28OWzvCYQaIsqPxaxHTrGCnDYwSPCou/yH77eDX+Wtwkup68OLFs9B4dHtX42grJtoN94VwPJXdMWT27g7umeUpRzCJoJlccYvGRhR76uQx/k2xG9gMRpz5KS9XIhoyeakvxW8NMgCzuAsK62AOv7OEUJkuaPxxekv0bUw3eZ7dd/Efuc9OeAKZzNM1K0CTb/H24QKRcDHqqdk8YK1yv/9Y2bowlEuoFXGMRCCto=
Received: from ?IPV6:2a01:c23:bdaf:b200:457b:b235:98c6:f76b? (dynamic-2a01-0c23-bdaf-b200-457b-b235-98c6-f76b.c23.pool.telefonica.de. [2a01:c23:bdaf:b200:457b:b235:98c6:f76b])
        by smtp.googlemail.com with ESMTPSA id vh2-20020a170907d38200b00a3d08f3283fsm251555ejc.104.2024.02.12.23.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:30:29 -0800 (PST)
Message-ID: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
Date: Tue, 13 Feb 2024 08:30:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-mips@vger.kernel.org
Content-Language: en-US
Subject: [PATCH 0/4] leds: trigger: Improve handling of led_trigger_event()
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

Heiner Kallweit (4):
  leds: trigger: Store brightness set by led_trigger_event()
  ALSA: control-led: Integrate mute led trigger
  Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
  leds: trigger: audio: Remove this trigger

 arch/mips/configs/ci20_defconfig     |  1 -
 drivers/input/input-leds.c           |  8 +---
 drivers/leds/led-triggers.c          |  6 ++-
 drivers/leds/trigger/Kconfig         |  7 ---
 drivers/leds/trigger/Makefile        |  1 -
 drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
 include/linux/leds.h                 | 29 ++++++------
 sound/core/Kconfig                   |  1 -
 sound/core/control_led.c             | 20 +++++++--
 9 files changed, 37 insertions(+), 103 deletions(-)
 delete mode 100644 drivers/leds/trigger/ledtrig-audio.c

-- 
2.43.1


