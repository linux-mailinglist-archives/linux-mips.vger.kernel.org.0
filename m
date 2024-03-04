Return-Path: <linux-mips+bounces-2043-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985B870BF6
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 21:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20AC28290D
	for <lists+linux-mips@lfdr.de>; Mon,  4 Mar 2024 20:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4585F107B6;
	Mon,  4 Mar 2024 20:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgU74Kp+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4379C5;
	Mon,  4 Mar 2024 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585850; cv=none; b=p1dvMmOk+d/BwhK+6PCzjXJuzQUH+sbwvHaE0hqOjkjsBTnAGrKUeSUNWRcF39Lv/aZBnnH/KLmJuFh0lmM03H9EaQ6wklY3brn3yrz8Up4Lov6HojS0ZKxR/AqDSRGGrZu6RzOc2vRsZdCasXghf16Ql+pNCWolToOtikFfyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585850; c=relaxed/simple;
	bh=0C5AIARYE7ZrixcSlBzuBcnRP4eA/Z5t61W6FTyuiGY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KO5O9IyuwPoGiFo5AGIXhQyHia8Tfbo9aiy2Fdw/lgXX+6znq3l1pAAToIwLPSoTEgfciuJvTtfr+VeBJ+wok1uKYX2JCbI5951ZML1iS/aS1iLxoi10ANgDF5YMdCYBTd33gVGyDufIkD1rYQZBfGFlMW4wo2aSZq6sHJtXJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgU74Kp+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so344899866b.2;
        Mon, 04 Mar 2024 12:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709585847; x=1710190647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gFQR/AFrpovdJ4AHvgbfyhxiV8vZD2gYhps9jOOIpRQ=;
        b=HgU74Kp+GkvDU1E2x9/dUSQCv+uBKGRheiAL9uMiDX3fchrsr+fRYcMzw8wwq+4jzD
         HtmMigEDJXNqBeySUNkjcJ26QB2LaeicSgAwKdrodQn7JTM0u1iaiqhla2H0LFETEusC
         S82kZzUgSi1cwol8Y6wleubwuXxcSwSc+CLCSm2K7V7HtfIUW+Jxot5NEZ3+Gx0b5/TH
         JJUUIMms5fNqNRZmNKsH+hU95MFxzoFtfP7MgEjJxE326vUEOE8K3Up50r6eReJ8I54L
         mOXaI41l3Ew6uIcL5Fm9G++Az7IDjYgpJVwHyqt0tK7kjKRKW7tkmdjSY1UQARXUv3T9
         T0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585847; x=1710190647;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFQR/AFrpovdJ4AHvgbfyhxiV8vZD2gYhps9jOOIpRQ=;
        b=PLM0NhEEjkk8L7sgNaG483SCXDEONGU0KkS1JsraYBx/xe/NNp5GmiRqjJEPNsonU3
         VznokBVbawUTlkhZKus7xPEkOzYc0iSRPUJfLtekYfrpgupCI2Kl38mSiXjPAX/2uuDZ
         2/pWFrfpd3uA9sI6F4h1XghtSwmR0Hb9xT770Q137D1EHK+K8DRqpRktRcNfQ2O5o/q4
         QTR5GI9brZtBtwhVVzukeDlnUbgHFW9DLc4xk76kzerf/M+EUWWTdqb7TB+KsPBdKoke
         lXjfYBhsLcS89TENhaZgPvPVI/6BFBJKojH0sjdkjmut4AjEcsVw/mViminm6CeRsP4F
         +idw==
X-Forwarded-Encrypted: i=1; AJvYcCW3a1mLdwH+UOkKrrnnUZSPPDPZXk1XcBCQFLwFqXVG425+zsZbyrAiKMfTHuJlbNeH0YxIful0o6QfaTtIhIL+xb9tnhTgGzTJtZDYS44bMVarsmAuXNLI7T8zIRQBdUubz/iTA4K8
X-Gm-Message-State: AOJu0YzcTZ8LuV73YKkcZ7838UUFNHr1mgsy6ibYzExcsSHICYu9gsk7
	TjvmbAQbNyrb0N1EA8swpyI2gQ3CNJMrUzaVr/9A6v1arK54VA2MnEM+wcyJ
X-Google-Smtp-Source: AGHT+IHcRgokN478DyE7VYlOnbXKw9hscMGgoMLLwZlC2zULD/22mb6Dq/SuZ67dMlLiIlNy0je2Wg==
X-Received: by 2002:a17:906:a197:b0:a43:af0b:c1c0 with SMTP id s23-20020a170906a19700b00a43af0bc1c0mr7769070ejy.16.1709585846799;
        Mon, 04 Mar 2024 12:57:26 -0800 (PST)
Received: from ?IPV6:2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64? (dynamic-2a01-0c23-c411-1a00-49f1-9fda-4d1e-4f64.c23.pool.telefonica.de. [2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64])
        by smtp.googlemail.com with ESMTPSA id tb25-20020a1709078b9900b00a4557115465sm1405531ejc.13.2024.03.04.12.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:57:26 -0800 (PST)
Message-ID: <b1358b25-3f30-458d-8240-5705ae007a8a@gmail.com>
Date: Mon, 4 Mar 2024 21:57:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] leds: trigger: Store brightness set by
 led_trigger_event()
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

If a simple trigger is assigned to a LED, then the LED may be off until
the next led_trigger_event() call. This may be an issue for simple
triggers with rare led_trigger_event() calls, e.g. power supply
charging indicators (drivers/power/supply/power_supply_leds.c).
Therefore persist the brightness value of the last led_trigger_event()
call and use this value if the trigger is assigned to a LED.
In addition add a getter for the trigger brightness value.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c |  6 ++++--
 include/linux/leds.h        | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 0f5ac3005..b1b323b19 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -194,11 +194,11 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		spin_unlock(&trig->leddev_list_lock);
 		led_cdev->trigger = trig;
 
+		ret = 0;
 		if (trig->activate)
 			ret = trig->activate(led_cdev);
 		else
-			ret = 0;
-
+			led_set_brightness(led_cdev, trig->brightness);
 		if (ret)
 			goto err_activate;
 
@@ -387,6 +387,8 @@ void led_trigger_event(struct led_trigger *trig,
 	if (!trig)
 		return;
 
+	trig->brightness = brightness;
+
 	rcu_read_lock();
 	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list)
 		led_set_brightness(led_cdev, brightness);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 7598d4729..48fff5980 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -455,6 +455,9 @@ struct led_trigger {
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
 
+	/* Brightness set by led_trigger_event */
+	enum led_brightness brightness;
+
 	/* LED-private triggers have this set */
 	struct led_hw_trigger_type *trigger_type;
 
@@ -508,6 +511,12 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 	return led_cdev->trigger_data;
 }
 
+static inline enum led_brightness
+led_trigger_get_brightness(const struct led_trigger *trigger)
+{
+	return trigger ? trigger->brightness : LED_OFF;
+}
+
 #define module_led_trigger(__led_trigger) \
 	module_driver(__led_trigger, led_trigger_register, \
 		      led_trigger_unregister)
@@ -544,6 +553,12 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 	return NULL;
 }
 
+static inline enum led_brightness
+led_trigger_get_brightness(const struct led_trigger *trigger)
+{
+	return LED_OFF;
+}
+
 #endif /* CONFIG_LEDS_TRIGGERS */
 
 /* Trigger specific enum */
-- 
2.44.0



