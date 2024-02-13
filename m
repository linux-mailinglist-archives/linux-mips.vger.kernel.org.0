Return-Path: <linux-mips+bounces-1418-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06D8529F3
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 08:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33217282EE2
	for <lists+linux-mips@lfdr.de>; Tue, 13 Feb 2024 07:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2852613AE8;
	Tue, 13 Feb 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRPvLJvH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6441757B;
	Tue, 13 Feb 2024 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809607; cv=none; b=pZ5LguAQddWmHEF+xoHW/+xpPO0uNKHdXX65MZpFk6Y51l51QBz9s1xExaT+FFOWM4PPv85RcNBClycB/Y1EOQLiirhcMFbZa8W9bfqhb3Wdp46nboLJKqFvEYgAreLBeFewkT6ZhqddLGQ09fO1Z7zIyXyCVww/Kio0zmSKtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809607; c=relaxed/simple;
	bh=SEML+0TPkSCmWBIBFvxbSaih2xERndEmc1I8Koj7DxI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SnNGCf/waKIgYMKaf+3a4w99AwxGZquXr1tfMvx4oKKMHDUCHyPG9SJGhEIn3aANZriplVY88UUxCoC1Fm/zus7Cu360GNzZ6ul0/Tc2MIRVJK+ZDEpjjQzf+F1jVSEBA8j/HoK7EZJPfnNokGSf57QYq4Q0u6jXmHm0/HM7ZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRPvLJvH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a30f7c9574eso69071466b.0;
        Mon, 12 Feb 2024 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707809603; x=1708414403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eA4K5JikTKOOhX+zkD3OEmddfXb7zVrNQEOiJut+G2o=;
        b=BRPvLJvH0L7RbO1pZSKNAdGnhR3u+ZKAR1VOx03qj6iG8sx3Z9doylM9hzQ97n8Ugo
         hj5uwq/CfyHqKlhHlvvAW88vDdjQwNS7w22Lsiss8/sFQoE7vwV4pfCwpNlzHhUfrt31
         8p//mOXWRucTL70nG2LR6q0oYab54npsYR+NcuVLBSW8V4sDiu8vRl3YsqlmZOmevebe
         7Gja9bLjtyufYo3nksixvcMGfoavCArre7aYmZkfIGqU3PhwMlV6G7NoaZ87KklkwD1e
         PDiTyoWXUN3qK3Mzbil4kY/B+uyr7BQa7+EWGhtM+0qGpAAuj9HTnxGtf0yv7y9UvQFN
         G1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809603; x=1708414403;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA4K5JikTKOOhX+zkD3OEmddfXb7zVrNQEOiJut+G2o=;
        b=uAVFPTON1rJxXg9hl6f/YcGWi2YEmrzgHWXbk7Q1gVtFv2jIhQXh36iBE6q9DyW2RV
         UnjA4nkJDRda/McgpB35B9MvHs9TI8ggDjvCzscS0msMAe//HPEV4+KfQCNa8Ja3CvWQ
         H4PwvnF32myChcAABhteItnc+zehw3Y7HLSUq3ZLju/dRdJ/W8rdZlmPylwChi90HK/4
         AT2pbQtJH3W9Hhd2cgMMuadEh0Z8+QeMUXQrSt/VLwLF6odZgikwCrc+yFR9DVh4GBtK
         TWQGgaf3VeCKNKDhachE3i5muWRndDGEZ8ZLJPmUOA1g7WWiLuWWaqk+MPYrnOIK+Api
         XJLA==
X-Forwarded-Encrypted: i=1; AJvYcCXgnR0M4AND/84kezmdvPJ5v52JcOPp/lW73FbKP22UhUbDY+a/k+R7eBKtXOxLudlt6phWoYgxL0IGPcsxc1sypYQvWJ2gjCq58W7BwED5tm3A1/gmGT4L1f3SCBNWd8zludMbaMTemeq7wA1myaU4UDEM5ZeI2RN9vOy207pWsfZG+sU=
X-Gm-Message-State: AOJu0Yy4YBkT7gS+VbA5DsZ2W0qWHr7x2l2dN9VBBG+i65NlB0Wgyumj
	K6CnTDFeCLTWnJDiA2zcWVr9KvD1ni7idznIBfY+/mKOYOpOImuc
X-Google-Smtp-Source: AGHT+IG9qhurMCbNaYom5yQcrUj8srNmhS+wiT0qd7jNFQwq9Uwz572+Mnee3XUurgTA+4fZ9r2LJw==
X-Received: by 2002:a17:906:e0d1:b0:a3c:ceff:e83 with SMTP id gl17-20020a170906e0d100b00a3cceff0e83mr2295219ejb.74.1707809603330;
        Mon, 12 Feb 2024 23:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFcdTjOhzgIlC8PyQ4I4+WnW7eFksdn5gTDmKJ8FjB6MUs6nHWMQdhPfHZDV75p+tw9hpE5UMCRMG+VUq/CsteKvRreh2kti8/mImn1vRIxFBc2LFPSIy8Yhh8L1aR2dzGTK/Gl9oRYXJe2o5hzi2a24+2dnbVaniItoTyVqWmRKDD4oRt+u6Ab6V1NqwgRhAY8cJnA+ui6GZh/qe7U8TrNDYMbNNGl0q3kCvUOEHwir67gl+p4XC1LPSY8TcFuOmqPxfBoA1C+BjSnwMeSCxkcqDZRB5YTRyvGG70iNrCBQUMA2C8dtkjLFg=
Received: from ?IPV6:2a01:c23:bdaf:b200:457b:b235:98c6:f76b? (dynamic-2a01-0c23-bdaf-b200-457b-b235-98c6-f76b.c23.pool.telefonica.de. [2a01:c23:bdaf:b200:457b:b235:98c6:f76b])
        by smtp.googlemail.com with ESMTPSA id vh2-20020a170907d38200b00a3d08f3283fsm251555ejc.104.2024.02.12.23.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:33:23 -0800 (PST)
Message-ID: <e5ef576b-70ee-4781-88e3-e728c1e7cb9c@gmail.com>
Date: Tue, 13 Feb 2024 08:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] Input: leds: Prepare for removal of config option
 LEDS_AUDIO_TRIGGER
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

In a follow-up patch handling of the LED audio trigger will be changed,
including removal of config symbol LEDS_AUDIO_TRIGGER. Therefore set
the default trigger unconditionally to "audio-mute". It does no harm
if a default trigger doesn't exist.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/input/input-leds.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index b16fc8194..176f1da7f 100644
--- a/drivers/input/input-leds.c
+++ b/drivers/input/input-leds.c
@@ -18,12 +18,6 @@
 #define VT_TRIGGER(_name)	.trigger = NULL
 #endif
 
-#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
-#define AUDIO_TRIGGER(_name)	.trigger = _name
-#else
-#define AUDIO_TRIGGER(_name)	.trigger = NULL
-#endif
-
 static const struct {
 	const char *name;
 	const char *trigger;
@@ -35,7 +29,7 @@ static const struct {
 	[LED_KANA]	= { "kana", VT_TRIGGER("kbd-kanalock") },
 	[LED_SLEEP]	= { "sleep" } ,
 	[LED_SUSPEND]	= { "suspend" },
-	[LED_MUTE]	= { "mute", AUDIO_TRIGGER("audio-mute") },
+	[LED_MUTE]	= { "mute", "audio-mute" },
 	[LED_MISC]	= { "misc" },
 	[LED_MAIL]	= { "mail" },
 	[LED_CHARGING]	= { "charging" },
-- 
2.43.1



