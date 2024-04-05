Return-Path: <linux-mips+bounces-2585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE0899959
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 11:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 967681C2113E
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 09:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA4E15FA9B;
	Fri,  5 Apr 2024 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDqRjjxG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83715FA9A;
	Fri,  5 Apr 2024 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308982; cv=none; b=PViiWr+rfWKWf+cSJah3ffvOEy5lx3NNP3v1hFUfzNaYNUqSwXdyiDANLBuuz8Dzc9D3cCfc1gOOCVny98IfRwTPZQRYIyVvLMOQqol9A+JC6BiFGvZaOJgdVBVektzi9HCrNkkMjgNJGatUlhrm+sltZfJyy/BFpI9OPjaoWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308982; c=relaxed/simple;
	bh=3ZuskFzn33/aCK7Jkdn1rVWi3XVf1KzYd4iZcT97pNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tL76eOOrDFGoHRYVqOEiL1MD5J5BIbEhDxPrrxXUOAkDMeVzYRjdAc7lzDXFjMcAUElOEQ/76WJLPLr33fAfAJCxKIEmFh1yMRCvzJ64BnU5eqI08QfhA9pxV8CD7z9lwK5ROEBBbFEunHqPRP/6BCA5UpDcpBnECl/TSAurnHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDqRjjxG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4702457ccbso265059766b.3;
        Fri, 05 Apr 2024 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712308979; x=1712913779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=noqD/5X0c5Dn8ZuUFAcFbdLma+HUeke+SMpKeYbbirA=;
        b=aDqRjjxGE9jaaWNn4o0jnifT37U1zs7cncw4O1sJ1qw0kkXLEzelGRIJhWds92/g6K
         kAypMpDAvFvMtryQQHtXCc+/yKFtsc/Jnd3svWJNIfNJw4syY34mOWOY4q0AX5spKVir
         NI36MPZnKolDfvxg5D5pgCAoT6iPjQi/1b1WcTJUHAfcVJkYA1E+Oy7L/UqpoCCZMP8Y
         MObTm8Pptb5zEjVUIkLQb+tubJFX9ozHSggzdGEmRk/2sgMGcn9ec+aheVQPmrcgzANo
         h6lgq/e5n9QygavjNQgWiuVFUls/fDWXxcJJAiPfn3p2cUEoMETeakdSUG9wuc2+qnoE
         kCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712308979; x=1712913779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noqD/5X0c5Dn8ZuUFAcFbdLma+HUeke+SMpKeYbbirA=;
        b=wynY5pqj14rqLVMC9vy+qDTuzbSfAVdT6qcPZeKGd4hjAzD9zPLZDxPAzNRFrXGtgG
         WBOnTl4YFx36ALbGbHuTG/3N8PJXJq97MAtLbNm1okPg5VwdGlnmxEJ2wkvj+NIDd75z
         8Z6NcRYT8X965Cm+ii+ZOcB5kqrAxGshKMll0I9uIP9eyra8lF4/Lm+PfiVB10wDtJa9
         UVAXdWnTsh2JTG9PW6pzSR4qlHNCvOu3g2qMR+Qo6S13Foe3UPGuQUXYfHtYEXxRnrQs
         MWPVX37Cxn81qGRovJo0YLSuFrhmf2lKmO6FcJEduDY2VYhueHDIkfiDQBTezVp6Q4Po
         f/cg==
X-Forwarded-Encrypted: i=1; AJvYcCV6lgcy4UUy00PPdI7oPsbTk4NjSqFuh1+ObOSVBiPBZ9dTPTVuSXrdsv6moTEWgUznGjgnOijuhSv2/jEEuDEeCG+dXh0SGk4pyyt6xLMfRJmcZH6xh7T/hRa9ijN88tKy82dIHxF9
X-Gm-Message-State: AOJu0Yy5mTuA958WEgFEzDXLWbAQWnD0pJMzXvQV38jFTf1eZwMJWaVr
	M5zTg7+O++6QZM2BfdC9ndlDG2Qr2XFvsqzr1UJuY+2EFEJB/GDB
X-Google-Smtp-Source: AGHT+IEgQddVqn3eIR/IcjcljU5/pt9BT7UF8+EoQj9V2Nd3SGUgkdY1anII0v6MlQwyQYIjUksQuQ==
X-Received: by 2002:a17:906:7c54:b0:a51:962d:e06b with SMTP id g20-20020a1709067c5400b00a51962de06bmr617313ejp.55.1712308978893;
        Fri, 05 Apr 2024 02:22:58 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72bb:b200:3c73:5b9d:154b:3af6? (dynamic-2a01-0c22-72bb-b200-3c73-5b9d-154b-3af6.c22.pool.telefonica.de. [2a01:c22:72bb:b200:3c73:5b9d:154b:3af6])
        by smtp.googlemail.com with ESMTPSA id jg29-20020a170907971d00b00a518bcb41c1sm609593ejc.126.2024.04.05.02.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 02:22:58 -0700 (PDT)
Message-ID: <6c0a1792-50a2-4208-8f6e-fbf0295110c0@gmail.com>
Date: Fri, 5 Apr 2024 11:22:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Pavel Machek <pavel@ucw.cz>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com> <20240328104232.GZ13211@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240328104232.GZ13211@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 11:42, Lee Jones wrote:
> On Tue, 05 Mar 2024, Lee Jones wrote:
> 
>> On Tue, 05 Mar 2024, Lee Jones wrote:
>>
>>> On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
>>>> If a simple trigger is assigned to a LED, then the LED may be off until
>>>> the next led_trigger_event() call. This may be an issue for simple
>>>> triggers with rare led_trigger_event() calls, e.g. power supply
>>>> charging indicators (drivers/power/supply/power_supply_leds.c).
>>>> Therefore persist the brightness value of the last led_trigger_event()
>>>> call and use this value if the trigger is assigned to a LED.
>>>> This change allows to use simple triggers in more cases.
>>>> As a first use case simplify handling of the mute audio trigger.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] leds: trigger: Store brightness set by led_trigger_event()
>>>       commit: 575129855dee0e364af7df84a77ab5cca54b1442
>>> [2/3] ALSA: control-led: Integrate mute led trigger
>>>       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
>>> [3/3] leds: trigger: audio: Remove this trigger
>>>       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
>>
>> Submitted for build testing.
>>
>> Once succeeded, a PR will follow for other maintainers to pull from.
> 
> Rebased onto v6.9-rc1 and resubmitted for build testing.
> 
Can the series be expected soon in linux-next for broader testing?


