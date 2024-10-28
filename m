Return-Path: <linux-mips+bounces-6531-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038909B3A92
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 20:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4CDF2824C7
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD8818873F;
	Mon, 28 Oct 2024 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4bNcoQh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AC186616
	for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730144442; cv=none; b=m2prikw3ZwhOWxtahz6qAfd8y4DK+wQETVtQEI2LexWF2sk30cX3CAR66fBpOUx9dkml/ugT/AOUS1b7KXqkOJpwoRSIzwPu4spD5uh8hvtDsWDXJ2DbzQZB02jmMiPiEeHfoVJtXvO1ohIfbM3xBiekbKzucNf7Sy3aX5CRi5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730144442; c=relaxed/simple;
	bh=qiXvLF3S+Unm89QsxQaNOyESbqGWkPfdMW2thCMLs0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLte6fTTqYvbCT7wFW2PrNEcdZimwOZrhrofy78GgKJo1QUZM/K/OR42Qo6wj3tlDJ4QLJEn9X7zSH2mpIrhktZ/VggdPtT2bAPiOG2VxrrlQMm4TsJFCXdnVZc++tMmYXulu0j2+u1ptJtiaJrzk21rLJaaE5ew9BzbR57GgAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4bNcoQh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso62593025e9.0
        for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730144439; x=1730749239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+kKUfoBX23Sor6KobG/qUnY9A1Z5gyX56cC+F+MFnk=;
        b=Q4bNcoQheKpgI9O1XViMybWE3TGHwXG51rteqGMStTEHaNFp8vkq+B6rW1NVqZ61Cf
         QQaBp6IibOmXunIMd2oiuf+aRqeHdC22JHOv227nH9EYtn1det96efNg5NkVJD2rFQY3
         0SknM73hMxcTnlblCRH6VUTe1iYRmF2NNhdmfAJxbMxaXBHNJQbHfrYoD1L6ihpshscU
         rMSphGhSwMrxYFxg69veNzBXKx9bPD3bYRJ8ju7ctl4C5/JYndYF4f+PHAU15SzUfpxM
         KKnXF8LA11yPERMB/kfk/88icDeom4ZfpJp9WL+PAgfZvB8NTzsneGg8jrqrw7e9pxVz
         FYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144439; x=1730749239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+kKUfoBX23Sor6KobG/qUnY9A1Z5gyX56cC+F+MFnk=;
        b=sq55dmhnr59IMa/F0jwe0UOEpsr+yJocP3QGsMgA/PrN7r2zedWz62w6bINMU1H51X
         9mmes4DTNN5zr+uTsLy5zGo2utvMUVL5baAZOVnVirxC4XgN0fiQiDR0SybduurWHc+z
         4VX1IqOq+clTjbANNqBPKj/XneGheWguFEcrv2G2bkzP108+zzaQ4VCuY0Gx3P9YEOPu
         iecTCBbwXWl3Tbll2I9NVugr1w/dNUHT0jj5mdoCo2b7ePFw1SR04mZ6Y6LhkTmodz96
         6iSoi1OM0iDGy8scvT6CRgEpuYBRFtk6wkGAwP9PCHxLvlwpYyR5G4s82MG/0PZcIv8I
         vpxg==
X-Gm-Message-State: AOJu0Yx8UIqTeRw967pqrehThgE27K/GWzHtVMwM5tEhOBVdyWxz11WA
	HNLDGbKcMEtCRjkTSC/l5fPbD6j2BLooiu51jRjX+nLFIz2n87c7qPBIqBkx4fM=
X-Google-Smtp-Source: AGHT+IEU4tu9B1TDjT+VrZOb8r9GoSjG4dzAgGM46tX/RCMYrZ0ctNgYBnf/BeKoq66hA4H6UcNOWQ==
X-Received: by 2002:a05:600c:19c8:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-4319ac6f6b7mr88553215e9.4.1730144438685;
        Mon, 28 Oct 2024 12:40:38 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4318b5707e8sm149734565e9.36.2024.10.28.12.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 12:40:37 -0700 (PDT)
Message-ID: <061c84bf-5e47-4ee8-9e78-40f0d4d02fd0@linaro.org>
Date: Mon, 28 Oct 2024 20:40:36 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clocksource: Add Ralink System Tick Counter driver
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de,
 tsbogend@alpha.franken.de, john@phrozen.org, linux-kernel@vger.kernel.org,
 yangshiji66@outlook.com
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
 <20240920075306.704665-2-sergio.paracuellos@gmail.com>
 <b7ebc645-3b3b-41a0-80e4-1537f7d41205@linaro.org>
 <CAMhs-H-vYFGbjJ163_ZA8ieamAHb3TWQdaDj4JLrHw0xuJv-vA@mail.gmail.com>
 <e21c00b0-a8ce-48f3-9ec9-72540701a78b@linaro.org>
 <CAMhs-H9-QdfiuajhmiAJN_BWi4Hc_9A_cq7Fc8XxZXiDJdaYTA@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAMhs-H9-QdfiuajhmiAJN_BWi4Hc_9A_cq7Fc8XxZXiDJdaYTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2024 20:02, Sergio Paracuellos wrote:
> Hi Daniel,
> 
> Thanks a lot for the detailed explanation. It was really helpful.
> 
> On Mon, Oct 28, 2024 at 7:44 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On 28/10/2024 19:04, Sergio Paracuellos wrote:
>>> Hi Daniel,
>>>
>>> Thanks for reviewing this.
>>>
>>> On Mon, Oct 28, 2024 at 5:29 PM Daniel Lezcano
>>> <daniel.lezcano@linaro.org> wrote:
>>>>
>>>> On 20/09/2024 09:53, Sergio Paracuellos wrote:
>>>>> System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
>>>>> driver has been in 'arch/mips/ralink' directory since the beggining of
>>>>> Ralink architecture support. However, it can be moved into a more proper
>>>>> place in 'drivers/clocksource'. Hence add it here adding also support for
>>>>> compile test targets.
>>>>>
>>>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>>>> ---
>>>>>     drivers/clocksource/Kconfig        |  10 ++
>>>>>     drivers/clocksource/Makefile       |   1 +
>>>>>     drivers/clocksource/timer-ralink.c | 150 +++++++++++++++++++++++++++++
>>>>>     3 files changed, 161 insertions(+)
>>>>>     create mode 100644 drivers/clocksource/timer-ralink.c
>>>>>
>>>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>>>> index 95dd4660b5b6..50339f4d3201 100644
>>>>> --- a/drivers/clocksource/Kconfig
>>>>> +++ b/drivers/clocksource/Kconfig
>>>>> @@ -753,4 +753,14 @@ config EP93XX_TIMER
>>>>>           Enables support for the Cirrus Logic timer block
>>>>>           EP93XX.
>>>>>
>>>>> +config CLKSRC_RALINK
>>>>
>>>> It is a timer
>>>>
>>>>           RALINK_TIMER
>>>
>>> Sure, I will change to RALINK_TIMER instead.
>>>
>>>>
>>>>> +     bool "Ralink System Tick Counter"
>>>>
>>>> Silent option please if possible.
>>>>
>>>> Let the platform Kconfig selects the driver
>>>>
>>>>> +     depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
>>>>> +     default y if SOC_RT305X || SOC_MT7620
>>>>
>>>> You should have something similar the RISCV option, no default option
>>>
>>> Sorry, I am not the best with Kconfig so I am not sure what you are
>>> exactly expecting here.MT7620
>>> Does the following work for you?
>>>
>>> config RALINK_TIMER
>>>      bool "Ralink System Tick Counter" if COMPILE_TEST
>>>      depends on SOC_RT305X || SOC_MT7620
>>>      select CLKSRC_MMIO
>>>      select TIMER_OF
>>>      help
>>>        Enables support for system tick counter present on
>>>        Ralink SoCs RT3352 and MT7620.
>>
>> Basically the idea is to have the platform's Kconfig selecting the
>> RALINK_TIMER. If I'm not wrong the Kconfig in arch/riscv/ralink should
>> select RALINK_TIMER under the "config SOC_RT305X" and "config
>> SOC_MT7620". The block "config CLKEVT_RT3352" has to be removed.
>>
>> Then this (clocksource) Kconfig option is a silent option. The user
>> won't have to figure out which option to enable because that will be
>> done directly when selecting RT305X or MT7620.
>>
>> The only reason to not have it silent is if you really want to opt-out
>> this timer because it is not present on a different version of RT305X or
>> MT7620.
> 
> Ok, then I don't want to silence it since those ralink's platform
> SOC_RT305X and SOC_MT7620 includes other SoCs models that do not have
> this timer (rt3050, mt7628 for example). Only models
> rt3352 and mt7620 include this. So I guess having this is the correct
> thing to do:
> 
> config RALINK_TIMER
>      bool "Ralink System Tick Counter" if COMPILE_TEST
>      depends on SOC_RT305X || SOC_MT7620
>      select CLKSRC_MMIO
>      select TIMER_OF
>      help
>         Enables support for system tick counter present on
>         Ralink SoCs RT3352 and MT7620.
> 
> Are you ok with this?


No because it is a compile test option only. You may want to do the same as:

https://lore.kernel.org/all/20241001-arm64-vexpress-sp804-v3-1-0a2d3f7883e4@kernel.org/

It should be:

config RALINK_TIMER
	bool "Ralink System Tick Counter"
	depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
	select CLKSRC_MMIO
	select TIMER_OF
	help
	  Enables support for system tick counter present on
	  Ralink SoCs RT3352 and MT7620.

so very similar to the initial patch except no default is needed as it 
should be set from SOC_RT305X or SOC_MT7620


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

