Return-Path: <linux-mips+bounces-1712-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFC8623EE
	for <lists+linux-mips@lfdr.de>; Sat, 24 Feb 2024 10:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C116D2841C4
	for <lists+linux-mips@lfdr.de>; Sat, 24 Feb 2024 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A77210E4;
	Sat, 24 Feb 2024 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5KNT+Ua"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89620DE7;
	Sat, 24 Feb 2024 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708767082; cv=none; b=btudwmb4AXjz3kRwsO4VQYfMLcvNgFtZw1FyjbXrujjDSNW/319xAzIPa9PKDbJKxdr/iLr+2gmohbm9jcKpF8urGxjT/LPcliYh4wNrgLzOX2fNfsQNQKxzB1LpMu1IEiLt+CL7lfV7bReWpn3MoJJH71GMZJT8WIN03npNsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708767082; c=relaxed/simple;
	bh=/L53cUu2X5VzPObLSmGTDTR4rIa3cudp/UPh4B4duoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxNP6QhB3mFYkBreZ0hhTw4Kx6bjZxKWHVAbA35IzDHi+jR9Dw5esQ13GMX5WmGmEss/01bO82b3TEdw8qxzJAE7ZbdyaLkMjtJ8YlpjSft7abyP6OzgKCco8hhVv5uQWbN8e/Bba1LlBSWkLp5YMHw5vkwNJYl7GJRYBTM+L0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5KNT+Ua; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4129e842463so899265e9.3;
        Sat, 24 Feb 2024 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708767079; x=1709371879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KVlnr8SW+InTlVSVHJjypAYwg6ejM0Zqr/tHf29TOTs=;
        b=L5KNT+UaYQv0wkaDICdAS2KyMTLoYuyj6iV0xDVEL2LOPVr9OShXfDNWRh8Opj3AkY
         LnTiWjXoki43Z/Tn16Zkx/IcG8Q0IY1TX0LItExb/MBSaDLQbfs2/oRnEe/QVPyzk8az
         vfW8SDOToS+J3IgwmHatvK2I+kanrMCa/uwUtqKBKXGjKF39gaRRrQL4kL+23tMw6ufI
         2MzFs8qO6dWTjeteBa65F2mYgzkMKSPnX8FpyvDdMdFiMC9sXpdl+RDIkAhIsqfmJ+Me
         D8se+uYBPHMXTyVwuoXvx/9Ce+0ItbJBxgfPp4P/Jb7essUXb1vOo2cAYD+Ag75desrg
         ecVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708767079; x=1709371879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVlnr8SW+InTlVSVHJjypAYwg6ejM0Zqr/tHf29TOTs=;
        b=HHwlEPJop164+Id+3WNGLofjbxCuGOjO5Yxqn8gPIxVGAUDvUFBnhnoxMZ48Mw3xNp
         gB34W/u6HDD1oN1HiusmwQM2SZlxEwlj+W3VGbY9C1lf8mCcWuUsmj7kjI7+lQzArszI
         UWZGsGmZYihycteMvz3a0uJwcL9TboR7w3GyMq4xCfMA9MLmtxsMXlm6E4kJorPeY931
         q6pRQdLAxy5mmwEMaOdJLFK3bO39Rkfw8JNk/Te6OF0yOdcqAi8qzhvAY6YfAj27tyKZ
         zjt8N8nn96i790tvZsckVMP3FH2uvaF1gC1qEwEc0Mn3sjetqx8Jux7fx5kdf2MZBsWA
         YPnw==
X-Forwarded-Encrypted: i=1; AJvYcCVHh0L4Vg0tkkTGKpdDFRDaSt419/FebqIQBBuMGNMMXuJZSLLFkCUFMEZg61lFkPOGoKU2asSTohgnaBIgHXcp6i+44BRyH/e1cZ5J1X8YE1U97zeeWWVfXACl/BY7I3KZVl/MCaD0qJ/DkPf3c8pGnR6ve+s9LRosXRAWUZ18X7AtnYrFOmur9x9ij7uts/Xierlp4jcopgjUnJO3PPZo
X-Gm-Message-State: AOJu0Ywh1WIluViL1zp/Hg0+FP93BPU57QyCem/r3omDGVNj987BTB58
	c0Qsv3Nl7USDxjE5QAm2eVpfmV/pnzViTXvpp1hxzTh3s52o8yz6
X-Google-Smtp-Source: AGHT+IG+AJK0T6zjd0snuVVt/hB3DKdyP4pBX/OLu82cOPDxdNr/AHlZY4K+1wWh1HnQ51EgCkO1Sg==
X-Received: by 2002:a05:600c:4fcd:b0:412:7721:ba87 with SMTP id o13-20020a05600c4fcd00b004127721ba87mr1266319wmq.31.1708767078389;
        Sat, 24 Feb 2024 01:31:18 -0800 (PST)
Received: from ?IPV6:2a01:c23:c187:500:893c:36f9:b9d8:f1cb? (dynamic-2a01-0c23-c187-0500-893c-36f9-b9d8-f1cb.c23.pool.telefonica.de. [2a01:c23:c187:500:893c:36f9:b9d8:f1cb])
        by smtp.googlemail.com with ESMTPSA id h6-20020a05600c314600b0041291a02bd2sm1560114wmo.48.2024.02.24.01.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 01:31:17 -0800 (PST)
Message-ID: <a2544b2b-265d-499b-b235-e4075a9ef398@gmail.com>
Date: Sat, 24 Feb 2024 10:31:17 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Input: leds: Prepare for removal of config option
 LEDS_AUDIO_TRIGGER
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-mips@vger.kernel.org
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <e5ef576b-70ee-4781-88e3-e728c1e7cb9c@gmail.com>
 <Zdko7JAFw_TBV-63@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zdko7JAFw_TBV-63@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2024 00:23, Dmitry Torokhov wrote:
> On Tue, Feb 13, 2024 at 08:33:24AM +0100, Heiner Kallweit wrote:
>> In a follow-up patch handling of the LED audio trigger will be changed,
>> including removal of config symbol LEDS_AUDIO_TRIGGER. Therefore set
>> the default trigger unconditionally to "audio-mute". It does no harm
>> if a default trigger doesn't exist.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/input/input-leds.c | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
>> index b16fc8194..176f1da7f 100644
>> --- a/drivers/input/input-leds.c
>> +++ b/drivers/input/input-leds.c
>> @@ -18,12 +18,6 @@
>>  #define VT_TRIGGER(_name)	.trigger = NULL
>>  #endif
>>  
>> -#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
> 
> Should it be simply changed to CONFIG_SND_CTL_LED?
> 
This would be another option. What is better IMO is a matter of
personal taste. Setting the default trigger unconditionally may
cause a negligible runtime overhead when the LED is instantiated,
on the other hand it results in less code to be maintained.
Do you have a preference?

>> -#define AUDIO_TRIGGER(_name)	.trigger = _name
>> -#else
>> -#define AUDIO_TRIGGER(_name)	.trigger = NULL
>> -#endif
>> -
>>  static const struct {
>>  	const char *name;
>>  	const char *trigger;
>> @@ -35,7 +29,7 @@ static const struct {
>>  	[LED_KANA]	= { "kana", VT_TRIGGER("kbd-kanalock") },
>>  	[LED_SLEEP]	= { "sleep" } ,
>>  	[LED_SUSPEND]	= { "suspend" },
>> -	[LED_MUTE]	= { "mute", AUDIO_TRIGGER("audio-mute") },
>> +	[LED_MUTE]	= { "mute", "audio-mute" },
>>  	[LED_MISC]	= { "misc" },
>>  	[LED_MAIL]	= { "mail" },
>>  	[LED_CHARGING]	= { "charging" },
>> -- 
>> 2.43.1
>>
>>
> 
> Thanks.
> 


