Return-Path: <linux-mips+bounces-4214-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8F92BEE5
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 17:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3DD1F218D8
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 15:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB57719D89D;
	Tue,  9 Jul 2024 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MM4sPECc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23796158A0D
	for <linux-mips@vger.kernel.org>; Tue,  9 Jul 2024 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540561; cv=none; b=Wltlb1hBZXUQLpN7skYg2AchnVLVFdXLC66KKUaHBixvg4TCO3d6W8/ErSCG5rhsR2S2QUT0698IjQXDc5BDDer8Kq8ejkGR6MRscQSSFsq5z3jV18qi91t9XCG9Vb2GIyXj+6rvQ+3VeBpNYuvMwUjpWfnjProvwImb2/Wd6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540561; c=relaxed/simple;
	bh=XEnjqKzZBzYWAQR9CwjdJSaL+DHE3+UQikxNM+smtTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLJgGtUqmz53lLg2Hfb4e4EpJTVExYrrwdciS2Jke0XXN/OAqTtSXb+d01cppwtZZw4BWktHcz2pfHakBaBb5Nyn6bkAVA7uEMaeim/iBJds+8dfyam92GnuZKSFHDSzX+51Qk9ASMcXZ80z5BaJ8a4hF4ZaNV/IVT4eRpvvXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MM4sPECc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso6373749e87.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Jul 2024 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720540558; x=1721145358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kb8hNs2hghjQ2m4soHqnNroceNfOKpKVZ1P76gG8ZLw=;
        b=MM4sPECc3Q/+kbq8qNTfJVV2w4OGZ5DgKEB48s9rK/QLvtZwiyqUhWfZa+oKRdjWJ8
         GJqNI67GZxu/aamk/CfDIbAm+lcl5Sv3FZybtdqmH9iUC18kQhnJAtXvhUJrAy103Z7L
         pN5LxqtMx/LXj/haAEAe2tH5j9PoOD43SQ/2JCymqX9bMDZkVBEnm/dCMdwmS3AMDacM
         Qsi2MKZlvrhvpj08A+9OUllvjf9VRjlJK4hxipDI1qhv6K2OjYvhllIIE0WNQxesjZg5
         IENLkZ9pRDz2PyVkumS+nLUF3xtyNkSqyWHzfaKJDQ8ir2QUjVzpbMYrxFFkr7ttYEZL
         xERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540558; x=1721145358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb8hNs2hghjQ2m4soHqnNroceNfOKpKVZ1P76gG8ZLw=;
        b=WTqx6hQ5+E1hrKRX0nMFPn2eVinn7i0EnebQJb9rV0K/Ziy86YZxwFFt9Y2WZ2X/NM
         HG0Ehgbu48FEnVvL+jj2qhzH5Gty1Z6GOLcEo6VI+aeguDWBa5XmBI/7l72vg5F7+X+m
         Uom94hKqy4PTlKmgaiPLhlwg7iRF2ZT8L7Q8FuEi2t/yut0xIFAl0zB+yXyr8ks4j55j
         3uONZu959CbRHJXWEPx8cVQiwsE29PTuL/Yn2UiB2tGAU95GDj1fhNUM0sXb9TRUppk0
         508fZ4CnBa6wQORMgry3//caAORooUVKw7fjTR7eNRQFsMhQYf2sh3xTFXmuMolcAEQ0
         xwRw==
X-Forwarded-Encrypted: i=1; AJvYcCXCjDwp8Lwq+mzqZDeRHZ00neXVguuSrW041p9sQgNSPSPKTdW5JrJbrVt65XHbFj2RQJC4HXNQ9HfIOVOAfEy72shCunW/poxJBQ==
X-Gm-Message-State: AOJu0YwAcMLmbO5/Xv9T0XTLNpbhZxbfxZPq/iYdVtUB7UmR/7j1bkd4
	202L8u8CW1u1g6eqoOJCLnbxOM5bQ1TjIzdBETRZy2H9Zprk0D43UMeCx7Vo3m4=
X-Google-Smtp-Source: AGHT+IG4bemecMAsKEDijoZ6HieHROjC0kyQfAlSqxupPftR6S/IFNAB3A7X4FibcRnKEA197tCEBQ==
X-Received: by 2002:a05:6512:1051:b0:52b:c0b1:ab9e with SMTP id 2adb3069b0e04-52eb999124fmr1787618e87.5.1720540558327;
        Tue, 09 Jul 2024 08:55:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf24:cce:17df:12ab? ([2a05:6e02:1041:c10:cf24:cce:17df:12ab])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5a32sm46822925e9.24.2024.07.09.08.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 08:55:57 -0700 (PDT)
Message-ID: <6806bceb-33c9-4417-aa99-f34dd325d24f@linaro.org>
Date: Tue, 9 Jul 2024 17:55:57 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, paulburton@kernel.org, peterz@infradead.org,
 mail@birger-koblitz.de, bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
 <20240705021520.2737568-8-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705021520.2737568-8-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 04:15, Chris Packham wrote:
> The timer/counter block on the Realtek SoCs provides up to 5 timers. It
> also includes a watchdog timer which is handled by the
> realtek_otto_wdt.c driver.
> 
> One timer will be used per CPU as a local clock event generator. An
> additional timer will be used as an overal stable clocksource.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>      This is derrived from openwrt[1],[2]. I've retained the original signoff
>      and added my own.
>      
>      [1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob_plain;f=target/linux/realtek/files-5.15/drivers/clocksource/timer-rtl-otto.c;hb=HEAD
>      [2] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob_plain;f=target/linux/realtek/patches-5.15/302-clocksource-add-otto-driver.patch;hb=HEAD
>      
>      Changes in v4:
>      - Reword comment about watchdog timer
>      - Add includes for cpumask.h, io.h, jiffies.h and printk.h
>      - Remove unnecessary casts
>      Changes in v3:
>      - Remove unnecessary select COMMON_CLK
>      - Use %p when printing pointer
>      Changes in v2
>      - None
> 
>   drivers/clocksource/Kconfig          |  10 +
>   drivers/clocksource/Makefile         |   1 +
>   drivers/clocksource/timer-rtl-otto.c | 291 +++++++++++++++++++++++++++
>   include/linux/cpuhotplug.h           |   1 +
>   4 files changed, 303 insertions(+)
>   create mode 100644 drivers/clocksource/timer-rtl-otto.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 34faa0320ece..70ba57210862 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -134,6 +134,16 @@ config RDA_TIMER
>   	help
>   	  Enables the support for the RDA Micro timer driver.
>   
> +config REALTEK_OTTO_TIMER
> +	bool "Clocksource/timer for the Realtek Otto platform"
> +	select TIMER_OF
> +	help
> +	  This driver adds support for the timers found in the Realtek RTL83xx
> +	  and RTL93xx SoCs series. This includes chips such as RTL8380, RTL8381
> +	  and RTL832, as well as chips from the RTL839x series, such as RTL8390
> +	  RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x series
> +	  such as RTL9301, RTL9302 or RTL9303.

Please make this option silent and selected by the platform. You can 
refer to the different options in the Kconfig.

eg.

config REALTEK_OTTO_TIMER
	bool "Clocksource/timer for the Realtek Otto platform" if COMPILE_TEST

...

The rest of the code looks fine to me. Thanks for commenting your code.

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


