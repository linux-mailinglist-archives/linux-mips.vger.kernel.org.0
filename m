Return-Path: <linux-mips+bounces-1419-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2D8529F7
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 08:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 102621C20B75
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 07:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB631758D;
	Tue, 13 Feb 2024 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpLhMsE2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C0717583;
	Tue, 13 Feb 2024 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809650; cv=none; b=k9FEujMPt0KOywyFO+bA39jWlkDorLZo+RklnC7hVmI8l5tM4HXneRD8KD/PPr8SLTivYHO8G3PQAB1UrnQdPpOwHqOC97VfBDcHJ3Vgvb5KniiG2biCpGRZcy7KBbg83XOycvwudZCeDwpLdCVDj/zDK8tdZUU6puCdsy8YLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809650; c=relaxed/simple;
	bh=mImGS2FUaLNTH+3c5ZI5QZBUT1jkyJXPNm6dfIT8lmM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=u/xLDuQ0pcr5OdYUvZcpqpSv3zQ6CvatKB3e95wpc1xi5cOJ/0i952Q/6f3hokHO+fCdI5mb5Tcc2SSfifzOVf4Xr7IjyauLKVIcYcgpyocstXhgymo16hVgigAjftTsMAGl+QAEsPPrxwAultDe9/p9N1ZDOf7JiLv30mTXuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpLhMsE2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3cf9c970d8so46255366b.3;
        Mon, 12 Feb 2024 23:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707809647; x=1708414447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=isNeZP/rP42rhcuGqltQyT3Dku65VLTVYk/NO91/p/g=;
        b=mpLhMsE2YIA2rfqk6+fc+R+LioEDvbM4wk/TqBbujY77ZHrxEY5z5665TE7CSj1g01
         xXbRXZTAyVTFpd5LOmAd7s4FH5fO9RvWohkrPs9nvwXdPuHPD3MX+f6ONpfJeYX9CsjT
         lSU4qcsLWFISOWXiBeaVzGBqp5Nzgu5jw/eq9vG/noids9kvVjNEyBOt81TgWLPUYcfx
         eMr+eYf4v/vHf39KOQanGXahWG50UKP62jdlgVcNeTzpEtnJJRG3LCV332dZI3U/7AoM
         maX/yY2/TNB+OcW6Xko5wU6mTeKaqfI4E6doh+FpBFzyfhEm6cfAugI07GZ9s/YjUvlH
         Rp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809647; x=1708414447;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isNeZP/rP42rhcuGqltQyT3Dku65VLTVYk/NO91/p/g=;
        b=KJU85B9zKg/SHNn9l9CeNCHKpJ7Pc5tjHVY+yR1tKuKwFy/w9lJ6zOGYJQY7sZh2hD
         jhggMfPDXxFPJlPIiazueMevaPq/d5zPODRCv/sMkCwKW+lyK0BzJ8nOlW8OsBlztwQq
         MLaCVRX84PW6aPtKfsobIB6BxasN2JqvGiMBt8UIb2xShp2koLfqptrokkPG3hsjDK0s
         iC8ieiLL5THIbdG9MBzY/JDUILnu8Qx+7+RfQ2RpvdvDTGsRchHay+FWIuRGJpIDU8m3
         c1VcJqAJzvAH8XIzSgQhyLSpjYeUuBVryZ2yGRaY+xtjPk/Dw9xigydZ1ow0D9ZJ9WL/
         Qhbg==
X-Forwarded-Encrypted: i=1; AJvYcCWuSjkEbDysIwto4SDHJsfQn75hXK4pw7R2HYwAMqGaw43KkSyk4zWk1W3RqAoklHo5wjz6QJqo0GkqDicFLWbg59jKkrZ43N3tMwu8T/+3nn4hHgpN1BODgI1ssdDitp5UKbM70tOkVNWozM3qKIjDC8+XBeOChabRKIy12Z32MUhHBik=
X-Gm-Message-State: AOJu0YwYLXX4Im4J4vGXr8AY+1XXY4RnsmdoT0W9FHJORUOCG0Z6Y6Yq
	DdcJPNduVveEnAbksfFTA3FtAQp02zukBa8pMqbDs7YEs9pbCJzr
X-Google-Smtp-Source: AGHT+IG+m/bM34SwNSHAlHCc/Opdtk5V4XAQWG6Mq13jstCpRasAiCmIQ3mF780XI99jP0Y8k4uEog==
X-Received: by 2002:a17:906:b28a:b0:a3c:c0a8:3b20 with SMTP id q10-20020a170906b28a00b00a3cc0a83b20mr2405461ejz.22.1707809646735;
        Mon, 12 Feb 2024 23:34:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWb1+TiQjv9lnhwxmvvMTqZODkujRUzecr6h4k8IJoepMQnSyDkSV3M/O78YfBBikC1hkt+2s0f3rw/4YzA+ZAPg852u8oR/F+r5WwZjEv7sEoCT0iKIHreb5dn6SuBrI+L6Y3AFj8PAD/CzjUoyeaomlKADo4KHx55juTwdShA6UZlZzcMFhfH4ku5MaJsoQS0IXDK3drjOujZ4YaTKnJHNH+whR3Ls/mXh6s8FPmyajNdHdAdhVQx0a8tNZd8k8GH/+EH3qlEwBDIHb5RVMWOkh347P+gljxwayniMjqHkhd1qqcrrFwgVBQ=
Received: from ?IPV6:2a01:c23:bdaf:b200:457b:b235:98c6:f76b? (dynamic-2a01-0c23-bdaf-b200-457b-b235-98c6-f76b.c23.pool.telefonica.de. [2a01:c23:bdaf:b200:457b:b235:98c6:f76b])
        by smtp.googlemail.com with ESMTPSA id vh2-20020a170907d38200b00a3d08f3283fsm251555ejc.104.2024.02.12.23.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:34:06 -0800 (PST)
Message-ID: <81c2a494-3e25-45df-854e-9fe4d6acbfb8@gmail.com>
Date: Tue, 13 Feb 2024 08:34:07 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] leds: trigger: audio: Remove this trigger
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-mips@vger.kernel.org
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that the audio trigger is fully integrated in
sound/core/control_led.c, we can remove it here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/mips/configs/ci20_defconfig     |  1 -
 drivers/leds/trigger/Kconfig         |  7 ---
 drivers/leds/trigger/Makefile        |  1 -
 drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
 include/linux/leds.h                 | 14 ------
 sound/core/Kconfig                   |  1 -
 6 files changed, 91 deletions(-)
 delete mode 100644 drivers/leds/trigger/ledtrig-audio.c

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index cdf2a782d..7827b2b39 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -152,7 +152,6 @@ CONFIG_LEDS_TRIGGER_CAMERA=m
 CONFIG_LEDS_TRIGGER_PANIC=y
 CONFIG_LEDS_TRIGGER_NETDEV=y
 CONFIG_LEDS_TRIGGER_PATTERN=y
-CONFIG_LEDS_TRIGGER_AUDIO=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index d11d80176..31576952e 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -136,13 +136,6 @@ config LEDS_TRIGGER_PATTERN
 	  which is a series of tuples, of brightness and duration (ms).
 	  If unsure, say N
 
-config LEDS_TRIGGER_AUDIO
-	tristate "Audio Mute LED Trigger"
-	help
-	  This allows LEDs to be controlled by audio drivers for following
-	  the audio mute and mic-mute changes.
-	  If unsure, say N
-
 config LEDS_TRIGGER_TTY
 	tristate "LED Trigger for TTY devices"
 	depends on TTY
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 25c4db97c..242f6c4e3 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -14,5 +14,4 @@ obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
 obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
 obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
 obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
-obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
 obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
deleted file mode 100644
index 2ecd4b760..000000000
--- a/drivers/leds/trigger/ledtrig-audio.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Audio Mute LED trigger
-//
-
-#include <linux/kernel.h>
-#include <linux/leds.h>
-#include <linux/module.h>
-#include "../leds.h"
-
-static enum led_brightness audio_state[NUM_AUDIO_LEDS];
-
-static int ledtrig_audio_mute_activate(struct led_classdev *led_cdev)
-{
-	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MUTE]);
-	return 0;
-}
-
-static int ledtrig_audio_micmute_activate(struct led_classdev *led_cdev)
-{
-	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MICMUTE]);
-	return 0;
-}
-
-static struct led_trigger ledtrig_audio[NUM_AUDIO_LEDS] = {
-	[LED_AUDIO_MUTE] = {
-		.name     = "audio-mute",
-		.activate = ledtrig_audio_mute_activate,
-	},
-	[LED_AUDIO_MICMUTE] = {
-		.name     = "audio-micmute",
-		.activate = ledtrig_audio_micmute_activate,
-	},
-};
-
-enum led_brightness ledtrig_audio_get(enum led_audio type)
-{
-	return audio_state[type];
-}
-EXPORT_SYMBOL_GPL(ledtrig_audio_get);
-
-void ledtrig_audio_set(enum led_audio type, enum led_brightness state)
-{
-	audio_state[type] = state;
-	led_trigger_event(&ledtrig_audio[type], state);
-}
-EXPORT_SYMBOL_GPL(ledtrig_audio_set);
-
-static int __init ledtrig_audio_init(void)
-{
-	led_trigger_register(&ledtrig_audio[LED_AUDIO_MUTE]);
-	led_trigger_register(&ledtrig_audio[LED_AUDIO_MICMUTE]);
-	return 0;
-}
-module_init(ledtrig_audio_init);
-
-static void __exit ledtrig_audio_exit(void)
-{
-	led_trigger_unregister(&ledtrig_audio[LED_AUDIO_MUTE]);
-	led_trigger_unregister(&ledtrig_audio[LED_AUDIO_MICMUTE]);
-}
-module_exit(ledtrig_audio_exit);
-
-MODULE_DESCRIPTION("LED trigger for audio mute control");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("ledtrig:audio-mute");
-MODULE_ALIAS("ledtrig:audio-micmute");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 48fff5980..d2668b427 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -705,18 +705,4 @@ enum led_audio {
 	NUM_AUDIO_LEDS
 };
 
-#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
-enum led_brightness ledtrig_audio_get(enum led_audio type);
-void ledtrig_audio_set(enum led_audio type, enum led_brightness state);
-#else
-static inline enum led_brightness ledtrig_audio_get(enum led_audio type)
-{
-	return LED_OFF;
-}
-static inline void ledtrig_audio_set(enum led_audio type,
-				     enum led_brightness state)
-{
-}
-#endif
-
 #endif		/* __LINUX_LEDS_H_INCLUDED */
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index 8077f481d..b970a1734 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -262,6 +262,5 @@ config SND_CTL_LED
 	tristate
 	select NEW_LEDS if SND_CTL_LED
 	select LEDS_TRIGGERS if SND_CTL_LED
-	select LEDS_TRIGGER_AUDIO if SND_CTL_LED
 
 source "sound/core/seq/Kconfig"
-- 
2.43.1



