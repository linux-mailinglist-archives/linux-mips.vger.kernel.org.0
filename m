Return-Path: <linux-mips+bounces-1417-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C10398529EF
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 08:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739012833BF
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 07:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9D517590;
	Tue, 13 Feb 2024 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbL8Xi7l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB614291;
	Tue, 13 Feb 2024 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809553; cv=none; b=QrJXFy/Fza9CaKwURwfq9pOCgmT99+0PUr4lTl4PgFe9xg17Nujbptc9sLbELmvLPfyjoKjJsXcgR9fGPLDOyzGsC30t/UrAsPTuzuW0FApRKSAlX86lzB/lie3MZu4HGK5OxmItIFeGFsCMbQYmZFFt0mh36boHNw6QkFmwQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809553; c=relaxed/simple;
	bh=NajG3i6+q3PjrLOiV0Moz2Vg8qd5eN29XdfIyf14FXc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dJAFI+gvDKyhZ+hco/2HOzh0uX3SsCADmJkzy3jTsYG8QYihCCj6ouzLOEoF4x1VsGX1NOJEEeXqrSHEorR/MODR5xWSOivJRcq27wm4KyVJqb7ZzoIEUaold2C6NES6bziDRKgQWS8XX8FG7TO2bVXPXl50kt2O2fNfeNcd+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbL8Xi7l; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a38271c0bd5so497136866b.0;
        Mon, 12 Feb 2024 23:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707809549; x=1708414349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Obr7s4SU8ucDOWXyyEnl/wXENLxRIoz08KK3pAwpxf4=;
        b=AbL8Xi7lRigy97JGBXK5nn4z1gohdrFhyQduqNYvQzzMKXFxwN9cY6eGlB+Bf0597W
         gPY2zPiDc20TT7I7fD0YlfEj7gtGVak7yJ+GHc0NjBTdamALEODPgknED82QWKAhDhSW
         lI4hOADlBeMHLIpGWGhLU/I55vr4XnImwVvrksP0nOltR/DKKvCo0tHoMEthdm/FsN/3
         /Vjwmh/eWnSEurhqTLkTYrHIA/M2xCAPTnlD5F23D+vVKVinfd80ctdWgl4h6tbnIrOv
         +SKJ/M49vP65SVAUd6xmt3Hhrw23PWy0M3qEqprtcWq1XwT19tKR1wpN6at6cRhz4FJu
         xp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809549; x=1708414349;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Obr7s4SU8ucDOWXyyEnl/wXENLxRIoz08KK3pAwpxf4=;
        b=GheSvIzTiMoRrAUkPYKbnSmpWI6P2gdBtXByohUVG+C/93pyI7/Wlhq251tU5FVfTO
         hXolQcHf2/1NUfK3yfPYqxkctmherWFp7FW+x0cdBtprAzK9IMbh4yYfqotsDOkISqqb
         3zmot+vRhsaGOaOexirK6yQjbmt/KpxwKOpFYkRUex7vUOQ5RRTC8osnYu5AJ9XXOfZo
         pDI0p/GKz2TsoCkd+rEu3o5OUjac/LO4iyKgXpNJdgI439RpCEanVLoxgDHFZRLENh2/
         i2MSH8lyvKzC7dINgwt1qZiC2Plf/rdz0CDc5gWKGF2wf0nrTrXJB/UGtx0s+W288MhU
         xXlA==
X-Forwarded-Encrypted: i=1; AJvYcCVPdFEdrthA42ijmandW6bbPDeBoUniub1CaMg8wa/ASemUk1swvKomZ2UvfkC5aCayq91juSrcMJYIJzAC5YL64mE5rJNhXv8QHqhpf6gFY0QOKGqqo6vwWCTfZpVYh3K/DP2hbehzXphUN4Fzy06jTQxNAj8IBvpgNJL9pwtg6Un3gA0=
X-Gm-Message-State: AOJu0YzCdpiSGNLSE6pDyi2dJ6V0A7YEGyIvgvZjrzfWwJL7VI4vlZTB
	dgjIKckigHre1cBuENTnMcPfXDgr22ZlLHquwHJZeNfgOUSdMs9b
X-Google-Smtp-Source: AGHT+IEltaiHsMtSZennMcjIkW+E5kBbU1CFi+QWneGyD05yJ8UhbSGoo36/aRJTrplqSyXAa57izA==
X-Received: by 2002:a17:906:c57:b0:a3d:57f:5b91 with SMTP id t23-20020a1709060c5700b00a3d057f5b91mr464217ejf.74.1707809549230;
        Mon, 12 Feb 2024 23:32:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpjA9HaAeQ94rYYPvufxgYEHK0joPd0rqN0ndcsS6VeQ0fAP1JDErxQJ1/vNy/Oy6qNi3MT8v2NcHZh7EHakXgtAZ65kw5U2hcVbzIxIB8f/hmfpuchQii9akmiNznruUpbT2CnquU/1vbCVWBZaJ99S1OKX1j1jB4XlvZMb4t4C86HXRPsx1Ii/yx9Po9p7ni7K/UN4ocAl1yw+v0FIa4MWUYPXDy0AsW8TvXR6AfuKSgrjqoseIXqBAplJBp8rKsUKIP1ZleQEzAXPazqiAg0WvGEbhbhLYdWbqD30XUhjvWQuPCS2Dhj4k=
Received: from ?IPV6:2a01:c23:bdaf:b200:457b:b235:98c6:f76b? (dynamic-2a01-0c23-bdaf-b200-457b-b235-98c6-f76b.c23.pool.telefonica.de. [2a01:c23:bdaf:b200:457b:b235:98c6:f76b])
        by smtp.googlemail.com with ESMTPSA id vh2-20020a170907d38200b00a3d08f3283fsm251555ejc.104.2024.02.12.23.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:32:28 -0800 (PST)
Message-ID: <1e1dfb3a-f808-43a4-8df9-6f861f56eec9@gmail.com>
Date: Tue, 13 Feb 2024 08:32:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] ALSA: control-led: Integrate mute led trigger
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

This driver is the only one calling ledtrig_audio_set(), therefore
the LED audio trigger isn't usable standalone. So it makes sense
to fully integrate LED audio triger handling here.

The module aliases ensure that the driver is auto-loaded (if built
as module) if a LED device has one of the two audio triggers as
default trigger.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/core/control_led.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index a78eb4892..b9d650380 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -53,6 +53,7 @@ struct snd_ctl_led_ctl {
 
 static DEFINE_MUTEX(snd_ctl_led_mutex);
 static bool snd_ctl_led_card_valid[SNDRV_CARDS];
+static struct led_trigger *snd_ctl_ledtrig_audio[NUM_AUDIO_LEDS];
 static struct snd_ctl_led snd_ctl_leds[MAX_LED] = {
 	{
 		.name = "speaker",
@@ -176,8 +177,11 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
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
@@ -442,8 +446,9 @@ static ssize_t brightness_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
+	struct led_trigger *trig = snd_ctl_ledtrig_audio[led->trigger_type];
 
-	return sysfs_emit(buf, "%u\n", ledtrig_audio_get(led->trigger_type));
+	return sysfs_emit(buf, "%u\n", led_trigger_get_brightness(trig));
 }
 
 static DEVICE_ATTR_RW(mode);
@@ -736,6 +741,9 @@ static int __init snd_ctl_led_init(void)
 	struct snd_ctl_led *led;
 	unsigned int group;
 
+	led_trigger_register_simple("audio-mute", &snd_ctl_ledtrig_audio[LED_AUDIO_MUTE]);
+	led_trigger_register_simple("audio-micmute", &snd_ctl_ledtrig_audio[LED_AUDIO_MICMUTE]);
+
 	device_initialize(&snd_ctl_led_dev);
 	snd_ctl_led_dev.class = &sound_class;
 	snd_ctl_led_dev.release = snd_ctl_led_dev_release;
@@ -788,7 +796,13 @@ static void __exit snd_ctl_led_exit(void)
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
2.43.1



