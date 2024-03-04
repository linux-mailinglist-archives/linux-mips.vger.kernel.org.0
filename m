Return-Path: <linux-mips+bounces-2045-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6C3870BFE
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 21:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5462825B6
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 20:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E02910A05;
	Mon,  4 Mar 2024 20:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8Mw6XpI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69334FC1B;
	Mon,  4 Mar 2024 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585987; cv=none; b=KA+KnWAgDUrJJu5+13lxTlJj0/Zvm4ABnClbuUzsm0u+aCly151aF7bDMQjoUEeFaIDEGFO57D8ONOtGBM5i7PbRkieOi13Bi7l/pNnza2gTogM+wZI0gPgGm4HDZE65Du/alg0sW9gea3VatTYULD2RQoVQ4P31yipjzU8xWRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585987; c=relaxed/simple;
	bh=tBuwNHb9+8917mO4T5BfGcUIt/E7uEn3hHtqjypippo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bA9KOHHiqsG/JBDgEQ56g8aiOFafRQWnsPAyjL0rA+rkYxEKaLjy3Kh95B44B93Uy2ApFcwOy0yJ0SdRDmunCmIcK6k/zvqryO2cjCMV/FeJmr+DI+ZLGLxYj6OD9BijyQ4kH41xRLNod8L9O1qdFpIgnxbvUleAFxU6+fF6/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8Mw6XpI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so10032167a12.1;
        Mon, 04 Mar 2024 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709585984; x=1710190784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0lC9epgHNagMNtVX5cTIFML+6IihHp/4HaA0X8mUiw=;
        b=h8Mw6XpI8yBFJGjSICdrmikndiSeiJq4I169/y84WBQ5d3ezVDfuoyixGvsKdzKVRG
         NE+G51FDP/sbZiABZ4hJjtdWM8SuFQ5j1EzD6W1iP01nQzzU+AW3gveScbYiAcFuFCcn
         8d84gHNKJxDMeTSOtIKtMLBwHN8AU7Bw3X26filFtOhQcUBIsEV4Cn75hSvkWCiE0Gol
         KLiWFZpiKUBYnteDSzMHzeECt5BkRUuS8hQYXv6A9Ql87fMnN0IHhWIWRFJAPWDbxRuT
         N4r/mnOqC3rRvo39L3E2XKta4pVxG3FFr3d90y8unZKGwTJlmbIXXwlQjYS94U/YvxPE
         NPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585984; x=1710190784;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0lC9epgHNagMNtVX5cTIFML+6IihHp/4HaA0X8mUiw=;
        b=ccp7/4pJqr08DzEA49PvknGzJwvepdHJa2RfLdktf8HSRWmjwZksny8BbjYSE2dXYu
         E96IHLHj9yzf0tuBIjnbq2Zma0eNzOWJ780Da4J/R1WoB1Nie7rpz5W+YDwQ0px8BqTx
         31C6sxbXdoKmFID3YMhDtP7ahLCaqhRz9GktC3YyOxu3sWqiNZxhAQojGb1uHjddLcl3
         pFUm3VHMMTzv5tlldf26CUEjRyg11IrqoaFgBLlUdPpXamgJpUxgmbshpK8j6UxbFX/6
         46TsuSsXZ1giysJ8qqn2CJYireKFjqF2ljfSGGFSrQYpnMdrjE6+FpyRrkWI3Hgxemt/
         z91g==
X-Forwarded-Encrypted: i=1; AJvYcCX0sGbzBaFECYYukWpga1Pl9LHRH+MIvqjNe9S5xJV/LjTBjIFbMCA7a2oZfoE2LCHiwRbWzT8ndiX6pIbN2YIOH334qckAFW+ftwe41beVK4qD/1OiLbD38L+9CVoO08MNYaVnGjRT
X-Gm-Message-State: AOJu0Yz0SS6wjYNbxtt3op0Fj0hVfjPQqOR92PSSa2ICHVyssrp8E54m
	Q6iTwzsmrvVi5D6QMofHgMkUbVKVqllnYCzkmafh8sWSiM+Z9PVW
X-Google-Smtp-Source: AGHT+IHLTtruACg2s5x6W73EU3x7BtRoa3LZnyqIqdLDFk9ySA7s4N2kLw2G8Avb9nfUAdCzmzyzxQ==
X-Received: by 2002:a17:906:fa85:b0:a3e:53d9:c7d5 with SMTP id lt5-20020a170906fa8500b00a3e53d9c7d5mr618651ejb.36.1709585983693;
        Mon, 04 Mar 2024 12:59:43 -0800 (PST)
Received: from ?IPV6:2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64? (dynamic-2a01-0c23-c411-1a00-49f1-9fda-4d1e-4f64.c23.pool.telefonica.de. [2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64])
        by smtp.googlemail.com with ESMTPSA id tb25-20020a1709078b9900b00a4557115465sm1405531ejc.13.2024.03.04.12.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:59:43 -0800 (PST)
Message-ID: <1e339779-6d04-4392-8ea2-5592c0fd1aa2@gmail.com>
Date: Mon, 4 Mar 2024 21:59:47 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] leds: trigger: audio: Remove this trigger
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that the audio trigger is fully integrated in
sound/core/control_led.c, we can remove it here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/mips/configs/ci20_defconfig     |  1 -
 drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
 include/linux/leds.h                 | 14 ------
 3 files changed, 82 deletions(-)
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
-- 
2.44.0



