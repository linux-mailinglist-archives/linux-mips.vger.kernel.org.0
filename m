Return-Path: <linux-mips+bounces-1523-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B501857C6E
	for <lists+linux-mips@lfdr.de>; Fri, 16 Feb 2024 13:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E01E31F22AE6
	for <lists+linux-mips@lfdr.de>; Fri, 16 Feb 2024 12:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAA97868B;
	Fri, 16 Feb 2024 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG2wadRw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64B54F92;
	Fri, 16 Feb 2024 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708085944; cv=none; b=Wiw2y9TtI0SMl8+asedt9mp8JPiC/srR0MeEGWuf5NQMfrsAeAn0vu2C56sFYsM3K2Ou8QfyuiBc1CD5T+/ENUn1JVPPUwsj6YQw2RudLzJUhwhMCwz5C8lML7SrQwn+Rc9tbaN393ChYKW212t2KCTELnX4A1ahnXV54OI+WpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708085944; c=relaxed/simple;
	bh=nRtBoipuC2lN/FfO4vJ6VZ3ZiVkzzR++4vGwTeteKRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAFtYNaZzyiokTIyRgPZFGSupx8AdhHHBIqeAdL5oCQXrPc3gRHLi75/+wasekmewUa/UgWN20wNUunpOZhuCZkqT3SkHR4D9MjfpEZNGonDTQfHke9pEJnqGqf0VH5O8Y9nJx78VsPOWgPSZEDmfKkVossChT3LU0KjAres5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG2wadRw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-563cc707c7cso2293274a12.1;
        Fri, 16 Feb 2024 04:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708085941; x=1708690741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CK1ttpHB+fvv9h0WCx+2J9EaroMX79kz3Ca/aXzuVyk=;
        b=FG2wadRwVSt+h+B7iGfDCclKrlDHrBtSuEaUkkZCFM4YPqgiiRKvAG+v0a11auG1TR
         0/ayQmFffDZxv5gbabGD1M94TFnFqD4OUepPKHG0MeEDVwQTJGwpP2EqFNJQUwCM6Ryv
         tlPhUTS1b+8HavgIguECHzN50+0q07+xot+l5PJ6uTD+b14sEfQUrQ1H/1aL1ff4y1Kq
         Hn0IBw9fLbWoYbzoyzqvAD4VJwEHFsViqGKNnHZdx036FU67YvhI+DQC8SmoQp+sYEvW
         nsOuO1nG3ErFKD7435AU6T3KWTWLbBjhhqqSplsdmVgi7GeFcmrQvdmZiUUQXc3fTO5Z
         bNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708085941; x=1708690741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK1ttpHB+fvv9h0WCx+2J9EaroMX79kz3Ca/aXzuVyk=;
        b=QX+w8RrRu39Ps4vDR/XnzKBgSXrzC3DCv0sOCUOEVEvojVLbZUjY2QZL9eJmcKgkO0
         +Uq7vABY0aCdLesAFG9kEUBV1YmXq8INjQB899pf9EcDXjDyLc26PAEgUvtOBvq4cQ0V
         0vjCp9lUir/0UkbcFy636f+ekUJg4hIw7IjooBIibTnBZlcMD6I/KW5b0pNYxFLzkhHu
         M2DRIxfy1/G5v1LMqQhfHtBh3Pb/8yJqwcUfQjbLSdgHEcMeuKNaWlv3iFzAJMEVakbA
         eky/WKlijYtgZgrlwbnWuScurq/42nnRpCC4Tfok4GNptEtZR71kIUkGwojUjPDrGixy
         O6pA==
X-Forwarded-Encrypted: i=1; AJvYcCUlQg1dfx+Kyl5NExM+8r6/LXnHqI2wtKyP0unS+xJAk8Zvm/QKqIQbuKEqJuQQoutasfE8AbMk++Tyh1krI8giuDIVEWUuCKJX42SzGJo0DhDPJoEdvSsygS8WH/TM1jtLmLMdU4EORmIXzahR9Zp7RgpKWMoQJpiBrJnXMBw5E3cLo59zZPKPsp4bb7Bwuw30px6Ox/G9cZm10V7RY3mF
X-Gm-Message-State: AOJu0YwDbMHtu4OcIGIryQpVdiq9ax54/fZFobRFjY0Si3W9q2R3lvo4
	98TAjpFMtfLiWWmT51iD38lg/eQd/mwDhB6Qae/QhvLwKu5t03rF
X-Google-Smtp-Source: AGHT+IGoj1qUAyyNrxxXOGBu2/LtRcMVvE9Sa7HjD6iHbil381l457DQVnhG48DBiCF0VygBxcshbA==
X-Received: by 2002:a05:6402:5384:b0:55f:cc6d:29b5 with SMTP id ew4-20020a056402538400b0055fcc6d29b5mr6281407edb.21.1708085940864;
        Fri, 16 Feb 2024 04:19:00 -0800 (PST)
Received: from ?IPV6:2a01:c22:73a8:7a00:dc5a:d3b4:cb75:f027? (dynamic-2a01-0c22-73a8-7a00-dc5a-d3b4-cb75-f027.c22.pool.telefonica.de. [2a01:c22:73a8:7a00:dc5a:d3b4:cb75:f027])
        by smtp.googlemail.com with ESMTPSA id n21-20020a05640205d500b0056104738371sm1435095edx.65.2024.02.16.04.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 04:19:00 -0800 (PST)
Message-ID: <2f8bc745-bbae-4c3d-b618-2b6a38f21e63@gmail.com>
Date: Fri, 16 Feb 2024 13:18:59 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
To: Takashi Iwai <tiwai@suse.de>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 linux-sound@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-mips@vger.kernel.org
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <87zfw1ewrd.wl-tiwai@suse.de>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <87zfw1ewrd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 13:29, Takashi Iwai wrote:
> On Tue, 13 Feb 2024 08:30:30 +0100,
> Heiner Kallweit wrote:
>>
>> If a simple trigger is assigned to a LED, then the LED may be off until
>> the next led_trigger_event() call. This may be an issue for simple
>> triggers with rare led_trigger_event() calls, e.g. power supply
>> charging indicators (drivers/power/supply/power_supply_leds.c).
>> Therefore persist the brightness value of the last led_trigger_event()
>> call and use this value if the trigger is assigned to a LED.
>> This change allows to use simple triggers in more cases.
>> As a first use case simplify handling of the mute audio trigger.
>>
>> This series touches few subsystems. I'd propose to handle it via
>> the LED subsystem.
>>
>> Heiner Kallweit (4):
>>   leds: trigger: Store brightness set by led_trigger_event()
>>   ALSA: control-led: Integrate mute led trigger
>>   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
>>   leds: trigger: audio: Remove this trigger
> 
> LGTM.
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> One thing I'm not 100% sure is the movement from ledtrig:audio-mute
> and ledtrig:audio-micmute alias into snd-ctl-led module.  Who would
> use/process those aliases?  I don't think this would be a problem, but
> it might change the loading order.
> 
The ledtrig:% aliases are used when a LED device is registered that has
a default trigger. Like in the case here with the input leds (patch 3).
There might also be DT-defined LEDs with a audio mute default trigger.
snd-ctl-led has a dependency on snd, so at least wrt snd the load order
doesn't change.

> 
> Thanks!
> 
> Takashi

Heiner

