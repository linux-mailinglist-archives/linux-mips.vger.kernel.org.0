Return-Path: <linux-mips+bounces-4212-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD792BEAD
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 17:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5061128575D
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 15:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076101534F8;
	Tue,  9 Jul 2024 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dIejPo47"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2844AEF5
	for <linux-mips@vger.kernel.org>; Tue,  9 Jul 2024 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720539950; cv=none; b=YHWFo94o6GqdV6YWor2DpMJFYKWEA/kG0lsvI0H9DXG06vj8OLRB6hJrAXMxlMUukxRxn0vaFWR98uPYJ8TKLhIEs+9Ll84D3+JbWIwdLREziBOdAuptHWS7lwY2FQou+502YIPguBeqwAkerux5pVkjLRstMr8lL0Eyc7/Y++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720539950; c=relaxed/simple;
	bh=Kow0Kh24AuKtPvlxmcW7w5kWbM0ZjwJheuA5qfIhBGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6GuLceoTB6Y+p5purLefmbx2NID3yjO3DDfbp5KNJwqy0RGLHLywI0pqyoZen8YXQEZTR7jvjVZDoD1+B70eG0gjAYWr04GwSX/tFnRaZjMiZyd+9xKtIFmMB6mo+V7FI6Y1do1wqXIkcIwpwYQRdDD6jHvBgknFixQPaIWJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dIejPo47; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so11619155e9.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Jul 2024 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720539948; x=1721144748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clrWidEGWWb7l5qAYeI3OPed/nSTgBQ7vf4x2SNX1dg=;
        b=dIejPo47zvyMKRvFOa6K9tLPkzr0pZF2jPqABGPM2hxAEmY/xEDCN982g83/Qapcz2
         NIjTlAWv9Ju44grvWwA/DUVi5FEdQ/Z8pzXkc0l7bHgUGDYXbMi358abXRrhJAOPmBfg
         cG05Nxmkj5jft4Oc6lAdKyeoG/utMNzJF7/+QverOuUl2KtylXMnpk7Gml9matnmlerE
         wqI12lBZBWrHlGnE3X3HRczbf/XukBeCd6NLco9B1rNDi+opLsVb+tj7/BHYt+uBJqyG
         aASODmQLhfYaaJBJXNDya4RfBz39ljap78s3wwMvY3GR+WSbrGLEGklgBRSlJhOurCu2
         OQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539948; x=1721144748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clrWidEGWWb7l5qAYeI3OPed/nSTgBQ7vf4x2SNX1dg=;
        b=k9njX7TBtLZgZfmhVuNHJd3DLqMTthKZMmVGSoc3XZmCOFRWtHSbHt6tTlyu06ZISo
         zH+abUSbrEQp6QEdsZ+vYK4CduFxxhb6pHR64jQZpiUIH6WUMUl2R13Xj7xpulwCFa6k
         UYKNgjDT5qIgh+ZCiL90sxfhnu9nADtKqSPOFPUPfUEF6+1p/I1NfkBtthSTVTBl6XwE
         TN3qq0GVQclAovWg9Qo6GuO9ILfmqdpJXVWSlG8cOdNTsHYk6tCjbXSnmFY1SCKIn0MJ
         66RsmFmquhN6//LsjxvdEarMqLUJ2iUbdaMXeQEqP19B1Du2kyDtdf2nik/7Bw/BSkDI
         nTYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZhN8midNI70kNhhTect3i6+AEIRD6b5FYRnb4kblDeRs9CdgGBxJFq4tlUKrj3n7der0Q9HuJCBvehi4NBOZQdbZQCeehmNTjrw==
X-Gm-Message-State: AOJu0Yy1neE8T0Mr1K2M9g1SApXCRrAXe4DvOuxulECplaksjWYTX9rE
	flhKPgH8qK9Itt6jBppjLSkeAPmb9NDUJ3OzK9Nemhu15YqF0FJ2Um3Rr4DRkEA=
X-Google-Smtp-Source: AGHT+IFLpPh9rDHh+Cj/f7TeYnsUSsIQHZnBJ26pWs4umPfFjYOH+my5M+Njgcp2s1ifcefyktakbA==
X-Received: by 2002:a5d:6288:0:b0:367:9ab5:2c80 with SMTP id ffacd0b85a97d-367cead86f8mr1762676f8f.57.1720539947806;
        Tue, 09 Jul 2024 08:45:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf24:cce:17df:12ab? ([2a05:6e02:1041:c10:cf24:cce:17df:12ab])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367cdfb2281sm2889772f8f.115.2024.07.09.08.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 08:45:47 -0700 (PDT)
Message-ID: <2101ef47-0000-4f88-9b57-8ebd5de32791@linaro.org>
Date: Tue, 9 Jul 2024 17:45:46 +0200
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
 <1bd8c455-567c-4523-8d8e-0e7cbc8210fd@linaro.org>
 <6b4d33cd-35b5-4f34-8ef5-14fb34b2ceaf@alliedtelesis.co.nz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <6b4d33cd-35b5-4f34-8ef5-14fb34b2ceaf@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/07/2024 23:30, Chris Packham wrote:
> Hi Daniel,
> 
> On 8/07/24 21:53, Daniel Lezcano wrote:
>> On 05/07/2024 04:15, Chris Packham wrote:
>>> The timer/counter block on the Realtek SoCs provides up to 5 timers. It
>>> also includes a watchdog timer which is handled by the
>>> realtek_otto_wdt.c driver.
>>>
>>> One timer will be used per CPU as a local clock event generator. An
>>> additional timer will be used as an overal stable clocksource.
>>
>> Does the mips arch have a local timer per cpu timer and a broadcast 
>> timer already integrated in the GIC ?
> 
> I'm far from an expert but as best I can tell no. This SoC doesn't use 
> the mti,gic it uses realtek,rtl-intc instead.


Ok, thanks for clarifying


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


