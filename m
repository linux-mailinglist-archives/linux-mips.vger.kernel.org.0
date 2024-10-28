Return-Path: <linux-mips+bounces-6529-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AC59B395E
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32DF21F22E20
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927041DF97B;
	Mon, 28 Oct 2024 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VHLu9/KW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36E3A268
	for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141062; cv=none; b=XuiHZr+jh81lVxeBabuWEpHzWXgw6f5+kl5KeoSfDSSLjCOSo7fUMK2NBODF5a5WBwuYhV2DjoAkHEJKPJwMpORxHyXRDM5EY79kDCzYBlp/C0fkPhtanBtz32eTDn2+rhAZlXJg1S2cNNRYcy0IfF9VkMRJFbSzm5NldM7fn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141062; c=relaxed/simple;
	bh=eGLknz0to+KIt5b2yo7My7iCtxVZEvuhx7zXgnShmCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRe+L2p1tswJCVrx9xvensHReQlLoidhM3nogW/F4MtO7ez2ZZxF/VfLbn8haXn/YUtVl+j44uG2M6+jl3tEmh0CLp4n0oPjajLSxZM8AjtDU3hEG5mMNHWNldqM3BobgwoKohmIv2F5Gk9m3A2wl+jboPBn3yZpqxwsTPH9EDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VHLu9/KW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37f52925fc8so3303153f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730141058; x=1730745858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAtEeSGAjrsFYw9uy9+Ovuk1gVJpL2L0PPMVxqRvvQE=;
        b=VHLu9/KWnmBQJ4QqFS/H9qnskV0J4Z6zYO16be7FRmseQ/B6BeVckdguKKX6EYI92m
         JJpXeQgGOvyx361m/pTi39YMyHo9gRTuHx5L5hahAspl4mfBiB7ATPVwQ9Fzx1gv3M5Q
         BtroUloYMeWVgS2O9c4HB25w7cW7igbCmwc7DQ5bAlH2UfihW6dNtP84poK/8S88+3tg
         eVABA13zlZGzNHOSSV5h7Od6JV8j/Nhv9astAGXaCWGALws6X8XJmYBShamVrUIWl1AU
         LigVgV6Q0A+dPVZbLHFXeAMJw5y4feNi60HbZFUO/Er3xt7hpIerBXhkONFbzQmDht0e
         wlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141058; x=1730745858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAtEeSGAjrsFYw9uy9+Ovuk1gVJpL2L0PPMVxqRvvQE=;
        b=mhXosI2Zk1cPr/8njbwLwHWii2RMgwgmgLH/A6w+LtXm8VMDKsRFgqpmUmC1gDBrTa
         K6y0tay4rF0WwCaImdC/Cun9b+ceFNJKhIlPuPgn8mMLLCwLZWSbns+CFMEyXPA56oBQ
         rLY9ASQQJeyLVxtexGqZ8IkVKAk6e4iX4FH6w5cfufu66tZ4xSeGP3L2WYtgWYjMVHl9
         Ic/t5Zz/LEiycDvJkY7XR3A//8fnRYjk9494q7BYISen5GVQ9hIf2DQdTkQZC2Ba2ejN
         QywTTOE8heuckEEvCeQCg37+GezLOBn5RqdR6Nfq6/DqjfVdpqrRzqXiILHxeI2lKXgQ
         sjYA==
X-Gm-Message-State: AOJu0YxUOjltcBdKmlRN2dO0YaiiaOre2kV1K2x+l/rpTH1HKVkgrCHL
	XaXfJP2r5AdQI583G3amEll7bKEkKQYXafi+t1EFQadwV9g77R+SFHuNLWxW5z0=
X-Google-Smtp-Source: AGHT+IGZ+LDc+okoYCRIrK1nRtbI9iVL2QgwWa3Huh2mv1fCwQSr8tPjupet4a85YkUgt0w8Rjc0pw==
X-Received: by 2002:adf:a1c9:0:b0:36c:ff0c:36d7 with SMTP id ffacd0b85a97d-380610f8443mr6510613f8f.2.1730141057753;
        Mon, 28 Oct 2024 11:44:17 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b4000dsm10346187f8f.45.2024.10.28.11.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 11:44:17 -0700 (PDT)
Message-ID: <e21c00b0-a8ce-48f3-9ec9-72540701a78b@linaro.org>
Date: Mon, 28 Oct 2024 19:44:16 +0100
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAMhs-H-vYFGbjJ163_ZA8ieamAHb3TWQdaDj4JLrHw0xuJv-vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2024 19:04, Sergio Paracuellos wrote:
> Hi Daniel,
> 
> Thanks for reviewing this.
> 
> On Mon, Oct 28, 2024 at 5:29 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On 20/09/2024 09:53, Sergio Paracuellos wrote:
>>> System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
>>> driver has been in 'arch/mips/ralink' directory since the beggining of
>>> Ralink architecture support. However, it can be moved into a more proper
>>> place in 'drivers/clocksource'. Hence add it here adding also support for
>>> compile test targets.
>>>
>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> ---
>>>    drivers/clocksource/Kconfig        |  10 ++
>>>    drivers/clocksource/Makefile       |   1 +
>>>    drivers/clocksource/timer-ralink.c | 150 +++++++++++++++++++++++++++++
>>>    3 files changed, 161 insertions(+)
>>>    create mode 100644 drivers/clocksource/timer-ralink.c
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> index 95dd4660b5b6..50339f4d3201 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -753,4 +753,14 @@ config EP93XX_TIMER
>>>          Enables support for the Cirrus Logic timer block
>>>          EP93XX.
>>>
>>> +config CLKSRC_RALINK
>>
>> It is a timer
>>
>>          RALINK_TIMER
> 
> Sure, I will change to RALINK_TIMER instead.
> 
>>
>>> +     bool "Ralink System Tick Counter"
>>
>> Silent option please if possible.
>>
>> Let the platform Kconfig selects the driver
>>
>>> +     depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
>>> +     default y if SOC_RT305X || SOC_MT7620
>>
>> You should have something similar the RISCV option, no default option
> 
> Sorry, I am not the best with Kconfig so I am not sure what you are
> exactly expecting here.MT7620
> Does the following work for you?
> 
> config RALINK_TIMER
>     bool "Ralink System Tick Counter" if COMPILE_TEST
>     depends on SOC_RT305X || SOC_MT7620
>     select CLKSRC_MMIO
>     select TIMER_OF
>     help
>       Enables support for system tick counter present on
>       Ralink SoCs RT3352 and MT7620.

Basically the idea is to have the platform's Kconfig selecting the 
RALINK_TIMER. If I'm not wrong the Kconfig in arch/riscv/ralink should 
select RALINK_TIMER under the "config SOC_RT305X" and "config 
SOC_MT7620". The block "config CLKEVT_RT3352" has to be removed.

Then this (clocksource) Kconfig option is a silent option. The user 
won't have to figure out which option to enable because that will be 
done directly when selecting RT305X or MT7620.

The only reason to not have it silent is if you really want to opt-out 
this timer because it is not present on a different version of RT305X or 
MT7620.

IOW, this option should be:

config RALINK_TIMER
      bool "Ralink System Tick Counter" if COMPILE_TEST
      select CLKSRC_MMIO
      select TIMER_OF
      help
        Enables support for system tick counter present on
        Ralink SoCs RT3352 and MT7620.

The option COMPILE_TEST is to compile on different platforms, thus 
increasing the compilation test coverage. At the first glance, the 
driver does not seem to pull arch dependent code except definitions 
which look compatible with other archs, so it should be fine.


>>> +     select CLKSRC_MMIO
>>> +     select TIMER_OF
>>> +     help
>>> +       Enables support for system tick counter present on
>>> +       Ralink SoCs RT3352 and MT7620.
>>> +
>>>    endmenu
>>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>>> index 22743785299e..c9214afcb712 100644
>>> --- a/drivers/clocksource/Makefile
>>
>> You should use git mv
>>
>> Otherwise the code is like submitting a new driver
> 
> Ok, i will squash two patches in one performing the git mv then.
> 
> Thanks,
>      Sergio Paracuellos
>>
>>
>>
>> --
>> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

