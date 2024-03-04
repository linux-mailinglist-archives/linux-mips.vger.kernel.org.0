Return-Path: <linux-mips+bounces-2044-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 911EA870BFC
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 21:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B51F01C2231A
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 20:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EC910A3F;
	Mon,  4 Mar 2024 20:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFE5Ta6G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78510A01;
	Mon,  4 Mar 2024 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585927; cv=none; b=JfNyaT8v1h63Di7ulMUbwHBmIZPuQk/03dsJdxSlC4A2KBtnfgH53Knp7E2hzFUbIKtJeNLoPLFm6bsPKiNu9pZ/hUvZbTPU1MQlx611bxkmvo1MTVFGVDvdQvJ06lXe1OfC092+vxsYz7jnwtPY1cYgIuVPXg4q0sczyNEoNoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585927; c=relaxed/simple;
	bh=9/E8wJqf3X7iD8KdFkbc1weS3Ag5fuPQdaDHkvlPeh4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IOmHsL52bJDTp0iivdr1EbUYmwE0pDw03kNGDeGQfk74qBkEBYWru9uFwbj7kJM6QScDV8v1QOoquykbDSSDsvt68HujV3/UBYbxPX01owHbx0T5zsndEnNgiTxF25p930P5QYDxnsoFem4Ji5cc+sVWkcpU7xkMnGWc+1NOGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFE5Ta6G; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512f892500cso3616708e87.3;
        Mon, 04 Mar 2024 12:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709585923; x=1710190723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hAKiJjKzkoF/u6Cqp4vIxFI8Seo7lONapPowHXJRX9Q=;
        b=UFE5Ta6GLl7hzfGcNzgSoBKu4tx7XM2qIJYMRkhF2V7ILSlZO3GZCsNpUE/c6/uwMS
         tzpCMe5FTwNwxGTp4WuX+HBcvtDwn6dn15J/cLo0Hhhe21uU0L0csEyzHdpqRlVBeYVW
         jXkK7PjyegsNXLwc0T+Uy4sakZ+k+Gyy/JFReAA27brZDjJkaKR0Xy3HaWEUAi52/GIv
         uI66EYf9/qiugQP6pgYfvPCD+nsPZxWymE/mX0+BcUdrJGmfGntMfPOUkIMnhMOQO31x
         vzoMSc5j7Erm9F0LxdZw2rCvdSaACHxFOE+SxsqApu/qMrHlNMNaKehcsbVT9esiCOdW
         LwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585923; x=1710190723;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAKiJjKzkoF/u6Cqp4vIxFI8Seo7lONapPowHXJRX9Q=;
        b=Y8YRBCZ8oA0+h8nXoV8+nVmIeVlX5JdVAe0WTRq2pkRzW15Req1bHJORlPEYD//7HZ
         lDO3TfC55WNJCdeg2B2Iyw/IIVW8ggh+tSJs6d/ErCvP8HelS+iXV5IB1HJfMPg3ydw7
         wKJ3oOOgzJiaJIH6DaEOEqs9PMH4Hj6EUyN/B3Ggs4txDnzw8+ESnJCxRr2Ixav4rAo/
         UBTsj2S1v0a3FOSwGjCD7oJShJwZkDAkwa48cNqWmJN3Tu13l7UhCsZvt2czX3D5shmq
         8Wh8oumVhJPwY8j5rg99cecSst6uUZcD/8zSn85Pn1gAWS7rROJrKADZB+zTp/wMav0v
         CESg==
X-Forwarded-Encrypted: i=1; AJvYcCWyoVJq2gkrHILZbboBed7kixcnzvweWm0eH8EmYWNwQb0DrnaFpaIO2rDEbbHEvKyYwXfX5XD1xaKfnVkc4CAN7dGPFbaQtTql+JYidc+j0EmnXSeCIbBvCmO5dvUgLdsHsXHsMadB
X-Gm-Message-State: AOJu0YyzIvPe1F6qqfOIguasugOb0QgJOv/5jRpVtMZeIOIvuv9faf+S
	0fyHTN7U9x6Idc9+En4pIIy2htwypsS18ROtoHhyCeH4U9YN+ZgM
X-Google-Smtp-Source: AGHT+IERTIuCnFy6Kbt2pz7susxoL6wkvGlnwfuoi4fDKYvtI0GDRqKMMSb0yi0+8T/hEL/G58fS9g==
X-Received: by 2002:a05:6512:3fc:b0:512:eb68:d314 with SMTP id n28-20020a05651203fc00b00512eb68d314mr5948957lfq.37.1709585923308;
        Mon, 04 Mar 2024 12:58:43 -0800 (PST)
Received: from ?IPV6:2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64? (dynamic-2a01-0c23-c411-1a00-49f1-9fda-4d1e-4f64.c23.pool.telefonica.de. [2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64])
        by smtp.googlemail.com with ESMTPSA id tb25-20020a1709078b9900b00a4557115465sm1405531ejc.13.2024.03.04.12.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:58:42 -0800 (PST)
Message-ID: <107634e6-d9ad-4a9f-881d-1eb72ea1a5a7@gmail.com>
Date: Mon, 4 Mar 2024 21:58:46 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] ALSA: control-led: Integrate mute led trigger
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

This driver is the only one calling ledtrig_audio_set(), therefore
the LED audio trigger isn't usable standalone. So it makes sense
to fully integrate LED audio triger handling here.

The module aliases ensure that the driver is auto-loaded (if built
as module) if a LED device has one of the two audio triggers as
default trigger.

In addition disable building the old audio mute LED trigger.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- Ensure that audio mute trigger can't be built twice.
---
 drivers/leds/trigger/Kconfig  |  7 -------
 drivers/leds/trigger/Makefile |  1 -
 sound/core/Kconfig            |  1 -
 sound/core/control_led.c      | 20 +++++++++++++++++---
 4 files changed, 17 insertions(+), 12 deletions(-)

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
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 3d37e9fa7..061a8ea23 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -53,6 +53,7 @@ struct snd_ctl_led_ctl {
 
 static DEFINE_MUTEX(snd_ctl_led_mutex);
 static bool snd_ctl_led_card_valid[SNDRV_CARDS];
+static struct led_trigger *snd_ctl_ledtrig_audio[NUM_AUDIO_LEDS];
 static struct snd_ctl_led snd_ctl_leds[MAX_LED] = {
 	{
 		.name = "speaker",
@@ -174,8 +175,11 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 	case MODE_FOLLOW_ROUTE:	if (route >= 0) route ^= 1; break;
 	case MODE_FOLLOW_MUTE:	/* noop */ break;
 	}
-	if (route >= 0)
-		ledtrig_audio_set(led->trigger_type, route ? LED_OFF : LED_ON);
+	if (route >= 0) {
+		struct led_trigger *trig = snd_ctl_ledtrig_audio[led->trigger_type];
+
+		led_trigger_event(trig, route ? LED_OFF : LED_ON);
+	}
 }
 
 static struct snd_ctl_led_ctl *snd_ctl_led_find(struct snd_kcontrol *kctl, unsigned int ioff)
@@ -425,8 +429,9 @@ static ssize_t brightness_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
+	struct led_trigger *trig = snd_ctl_ledtrig_audio[led->trigger_type];
 
-	return sysfs_emit(buf, "%u\n", ledtrig_audio_get(led->trigger_type));
+	return sysfs_emit(buf, "%u\n", led_trigger_get_brightness(trig));
 }
 
 static DEVICE_ATTR_RW(mode);
@@ -716,6 +721,9 @@ static int __init snd_ctl_led_init(void)
 	struct snd_ctl_led *led;
 	unsigned int group;
 
+	led_trigger_register_simple("audio-mute", &snd_ctl_ledtrig_audio[LED_AUDIO_MUTE]);
+	led_trigger_register_simple("audio-micmute", &snd_ctl_ledtrig_audio[LED_AUDIO_MICMUTE]);
+
 	device_initialize(&snd_ctl_led_dev);
 	snd_ctl_led_dev.class = &sound_class;
 	snd_ctl_led_dev.release = snd_ctl_led_dev_release;
@@ -768,7 +776,13 @@ static void __exit snd_ctl_led_exit(void)
 	}
 	device_unregister(&snd_ctl_led_dev);
 	snd_ctl_led_clean(NULL);
+
+	led_trigger_unregister_simple(snd_ctl_ledtrig_audio[LED_AUDIO_MUTE]);
+	led_trigger_unregister_simple(snd_ctl_ledtrig_audio[LED_AUDIO_MICMUTE]);
 }
 
 module_init(snd_ctl_led_init)
 module_exit(snd_ctl_led_exit)
+
+MODULE_ALIAS("ledtrig:audio-mute");
+MODULE_ALIAS("ledtrig:audio-micmute");
-- 
2.44.0



