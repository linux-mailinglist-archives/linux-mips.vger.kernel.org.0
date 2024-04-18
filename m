Return-Path: <linux-mips+bounces-2792-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0FD8A9B6A
	for <lists+linux-mips@lfdr.de>; Thu, 18 Apr 2024 15:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 275991C2302F
	for <lists+linux-mips@lfdr.de>; Thu, 18 Apr 2024 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E068F1607B1;
	Thu, 18 Apr 2024 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBe7sZli"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34A84D02
	for <linux-mips@vger.kernel.org>; Thu, 18 Apr 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713447484; cv=none; b=n9XJbwVuO5r27YmDlwWsBYauLHgixLxvblqmz8DKrDX1z72qvqTkds4oNNxJbV/8tsDDjJGk9G6dMBd/lpugmfz9k3yrZ7omIcu4DOxIrWWiym83prM0uhCNMs8BUE3h0407mxA++10Er/IlSMk4qcsSX0yNs/oWbtONk5gl/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713447484; c=relaxed/simple;
	bh=4hjplUlSINU/7vUpvdsZ49nq4pYPWpHaCsB+ygdVKuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwB0H/10utMjL0BJkKTORCpuNv5bo5HpfsOOgBF9peFcZrrVYZWFq0nM138SWepe+XMN+nG2OdgBx0eMODpq0fS7JxMp+LSSE1m8LjdlM+F46vT3G70AlIQVM60bxb3UlNYfFMHOXsCwed79b7bjqD7di46R0ipqSI7IM/+bCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBe7sZli; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-518931f8d23so855594e87.3
        for <linux-mips@vger.kernel.org>; Thu, 18 Apr 2024 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713447481; x=1714052281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9+0LMiqya8BHuNPxYT08/6EM9gAsFbYCDS1Bf/hZvc=;
        b=tBe7sZliHYEdIs1t9pZC8kswaj756Q4fGZvzTqkq4qAVs2MB44r1W44YVFTPUjaWAR
         +fvksdSUtBUmHtcrse0hB6tRpl036vtN93dy4/Jvw0RUIllXgnEuhC6YrhKENlv9SBOo
         as+kVbjFKTtLrWCcff7onRh5FexH5f4vDz3N1doCg4Jhk5mdlyc4O+pAtW3ljRbk7UfE
         g+B+F9AWev+8frn6fNQmRTs2euEj0J4jjQoZ5fP5+sQ8a2zvZq1Qo5yiW5lcvqeR5ZHX
         aWiG+MHrJUf8nUgq3AFiOogqJDN81AgZjcAGQWI+O3NWMgMZTSqorYkErErHV0dkltKM
         SC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713447481; x=1714052281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9+0LMiqya8BHuNPxYT08/6EM9gAsFbYCDS1Bf/hZvc=;
        b=N9UWO1iJxn3exTel1eQQmEI67D/is6nwINiqCxf5VpAZ2sr6muS8kxm58r2ZDvRhrP
         ArYW3f0lggKGpiHpA6m9DJCZNrkmiJaekex8JYESVPhZ3E60Sx3g3MWsQ807q4QL2aJw
         y0rQfY7diIwpHNIMWhUCXWAti8Rn4Q6Lmg3wOP/mQUfk9P9ZuH9Jlao46A71DJWBp0wD
         LcWVbsFu/e5o+Je2W/dYfze4oFPINNR16ePxDp9zSkb7A/XaBuxORvebeZggEK2R9P3p
         pO2StGACBzk47HpUJFAQy7N22hWsZG73H9yYQW/XBtVlOv33tgfZ5gxa5gnKIg5W5zqE
         DcYA==
X-Forwarded-Encrypted: i=1; AJvYcCVoSRK1jr74AoIWk6C6Q38zsunSRDnQCvzeACijGZOsdQ+QKGmENmJN4/KK0qKHm2o7wrlgBFav0U59AOXG8Ws+Ov5HG+UwCsq+iw==
X-Gm-Message-State: AOJu0Yxo5eUOLtkDaV+XdaBMNpMx3d/FcTi/b428xlXVa3IC72NVubvF
	BkQa2qGq/Rb5Rt0GR7wHIns1k7E7YA6bnjGyu7K3LvwBCPHtUvG9MN4p+GMqwuY5oHeLJFY5Vbx
	/
X-Google-Smtp-Source: AGHT+IGB38BuDP29A3iEAISCkTP6Ro2q8oS06IBiYeWlANMwwe5QEswXNqPg7+d9TKzxZOXxb2STLQ==
X-Received: by 2002:a19:6417:0:b0:517:dc07:612f with SMTP id y23-20020a196417000000b00517dc07612fmr1501445lfb.39.1713447481010;
        Thu, 18 Apr 2024 06:38:01 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id 25-20020a170906311900b00a52331a9bdasm905137ejx.48.2024.04.18.06.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 06:38:00 -0700 (PDT)
Message-ID: <fbbabdc6-2505-45d2-a46a-c80c1eca6ee8@linaro.org>
Date: Thu, 18 Apr 2024 15:37:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: SGI-IP30: Use bitmap API when iterating over bitmap
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
References: <20240417071830.47703-1-philmd@linaro.org>
 <ZiAGcb3eY/Nqamb9@yury-ThinkPad>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZiAGcb3eY/Nqamb9@yury-ThinkPad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/4/24 19:27, Yury Norov wrote:
> On Wed, Apr 17, 2024 at 09:18:29AM +0200, Philippe Mathieu-Daudé wrote:
>> Do not open-code bitmap_set(). Besides, <linux/bitmap.h> API
>> allows architecture specific optimizations, so prefer it.
>>
>> Use the HEART_NUM_IRQS definition to express the end of the
>> HEART bitmap.
>>
>> Inspired-by: Yury Norov <yury.norov@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   arch/mips/sgi-ip30/ip30-irq.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
>> index 423c32cb66ed..bdafff076191 100644
>> --- a/arch/mips/sgi-ip30/ip30-irq.c
>> +++ b/arch/mips/sgi-ip30/ip30-irq.c
>> @@ -264,7 +264,6 @@ void __init arch_init_irq(void)
>>   	struct irq_domain *domain;
>>   	struct fwnode_handle *fn;
>>   	unsigned long *mask;
>> -	int i;
>>   
>>   	mips_cpu_irq_init();
>>   
>> @@ -300,8 +299,7 @@ void __init arch_init_irq(void)
>>   	set_bit(HEART_L3_INT_TIMER, heart_irq_map);
>>   
>>   	/* Reserve the error interrupts (#51 to #63). */
>> -	for (i = HEART_L4_INT_XWID_ERR_9; i <= HEART_L4_INT_HEART_EXCP; i++)
>> -		set_bit(i, heart_irq_map);
>> +	bitmap_set(heart_irq_map, HEART_L4_INT_XWID_ERR_9, HEART_NUM_IRQS);
> 
> This function has a signature
>          bitmap_set(map, start, length)

Doh, I thought it was (map, from_inc, to_exc), my bad.

> So this should be a:
>          bitmap_set(heart_irq_map, HEART_L4_INT_XWID_ERR_9,
>                     HEART_NUM_IRQS - HEART_L4_INT_XWID_ERR_9 + 1)
> 
> Also on the above group of set_bit(). It should be 2 bitmap_set()
> calls to me. HEART_L0_INT [0, 2] is the first one, and HEART_L2_INT
> to HEART_L4_INT [46, 63] is the other. Isn't?

Please disregard this patch, sorry for the noise.

Regards,

Phil.

