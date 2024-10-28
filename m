Return-Path: <linux-mips+bounces-6501-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B69B331D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 15:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CDCCB229B1
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525971DD550;
	Mon, 28 Oct 2024 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0f1ndXY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41A1DA631
	for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125001; cv=none; b=k7CyTwcjlUst40Z8oW+nHzxCbm0mO1PaMoi8IS04d0DbqBDwZnc52VItW9SQtWfDDeFzp89xUt2V8LY1hKqQlSTR1mj2R3PpfnFmCyKRp4lFtreSttX0hdOYOVJzZXX9SGu1tpTznvcV3xS4zUqJ82pdfwz8+O7uxsyZaQKuj6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125001; c=relaxed/simple;
	bh=Z/1tooQXxbcK4lVGwo/4bZ6ga1NIJM4QYTPFDM9Mo3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sd49CHhzdiccEhLXwoeckaJYlXvqEwh3EsEd+0Jk8tWbrRFepCVMO1QsTtBOnHQ/sG+OkV0J9ydrV/PlVZ3PeRDRochPLF5LNb++xAhi99pTsYwD0+t5XnveY+wZrsosqeRwn7q+8bnBJGG4RblfKbJLqs0CXLSw0w/C9/bxPeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0f1ndXY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d47eff9acso3231943f8f.3
        for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730124996; x=1730729796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quqfrl+ntrh5+Sv/MCcmT5/a0XinSFOWiABW7uGEUZM=;
        b=u0f1ndXYwhLC6eiCBEqmAgakM+GGinhRHxTXsaCoIpZHM9yOE5XR0CCs4iw1yTJfK7
         eoBtPtHlaPUwaIR2b2k2G4TVc4fBWQbvu5n8dHvi97cO80/1aqMSxmxcvTBscgoArp66
         qWRV7cHaGwBirI9mPPiHkXw6w2CRL2xq/fb2EBdKdg+ndI9o3gkLBU3Vh4Ozyhh2UDnr
         +UIoI+bnXuOjg109K7SqgRo75PRq1vMVwrI+HuBYN1OVB9HK5a9kMOVwzRJBzqvIDp7u
         4M0/bqGSFjSoHjtiMNIIXaaY0XcPoezQQKVluKLZtASq0rZPOUSGVVmjgnNIaMb2wvqY
         mIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124996; x=1730729796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quqfrl+ntrh5+Sv/MCcmT5/a0XinSFOWiABW7uGEUZM=;
        b=K5LeOYQZlazMfPtfXr0QPoWQaBDy4XpXBXvv9L6X9R0jScmHlXR1JCUcwV21KmXBhC
         IjxYUH9Iaq0qS5DWBl1AvVjSMohlSKgiS1gWMbxDO+l6Ygnvj4+0wl75xLv5vrDhquoa
         1wuTJ6P825aIOEUHeTofQvIdot1+65hON7Sm5GvuyO4w7ys7YtpsXebGgerquau1wr9i
         W3yprpfTiYJiIaYK74qsIhISBfez2CvBJSX7BsJ0xfyp7icX8qVUiZ5tl1fsXT+GMabv
         +UqVW5RK7BlatpAj3TMbAx67P0gXerG3qGZDtCx8ErfvPb+lljOZfWVAWPzxKm4gy96c
         UcIw==
X-Forwarded-Encrypted: i=1; AJvYcCVxdlGKEbqpP6jrfr8Z/Um0R4tBM96x8dpgZasdInPx3FpNc4BqzJbQCMeyWEorWH0UhGPrLPCJt0Pq@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9PZdXmYVza3Rt8Vzj6ckeVMOKD3Yvua60WJmqJ9YbJrv5qbE
	KLRs5nP6+wcM1hGvxrGErwn6iQMPqXQJjeLCTM9tTNOso2KCSsYRwQ149Zi5Bkc=
X-Google-Smtp-Source: AGHT+IEZY+k0aXn5tfgk7XRpaz73GX3fpQstWkbVAp4n6D3wdTEULhrWgfBHQTYZF4C9BVFIPagq6Q==
X-Received: by 2002:a5d:4748:0:b0:37d:51bc:3229 with SMTP id ffacd0b85a97d-3806120b1b0mr4859262f8f.51.1730124996070;
        Mon, 28 Oct 2024 07:16:36 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b1cc0asm9715947f8f.10.2024.10.28.07.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 07:16:35 -0700 (PDT)
Message-ID: <4f4572c2-8436-41a6-8c8d-4811da8231b1@linaro.org>
Date: Mon, 28 Oct 2024 15:16:34 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clocksource: move System Tick Counter from
 'arch/mips/ralink'
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, tsbogend@alpha.franken.de, john@phrozen.org,
 linux-kernel@vger.kernel.org, yangshiji66@outlook.com
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-ChXQSZ_6EBiTKtD7ve2j2QsVvgVm0B5O1O7BfGwKFmQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAMhs-H-ChXQSZ_6EBiTKtD7ve2j2QsVvgVm0B5O1O7BfGwKFmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2024 15:14, Sergio Paracuellos wrote:
> On Fri, Sep 20, 2024 at 9:53 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>>
>> Hi Daniel,
>>
>> System Tick Counter is present in RT3352 and MT7620 Ralink SoCs. This driver has
>> been in 'arch/mips/ralink' from the beggining and can be easily moved into a more
>> accurate place in 'drivers/clocksource' folder. This makes easier to enable it
>> for compile test targets as well as reduce LOC in architecture specific folders.
>> Bindings are already mainlined and can be located here [0].
>>
>> Thanks in advance for your time.
>>
>> Best regards,
>>     Sergio Paracuellos
>>
>> [0]: https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/timer/ralink,cevt-systick.yaml
>>
>> Sergio Paracuellos (2):
>>    clocksource: Add Ralink System Tick Counter driver
>>    MIPS: ralink: remove System Tick Counter driver
>>
>>   arch/mips/ralink/Kconfig                              |  7 -------
>>   arch/mips/ralink/Makefile                             |  2 --
>>   drivers/clocksource/Kconfig                           | 10 ++++++++++
>>   drivers/clocksource/Makefile                          |  1 +
>>   .../clocksource/timer-ralink.c                        | 11 ++++-------
>>   5 files changed, 15 insertions(+), 16 deletions(-)
>>   rename arch/mips/ralink/cevt-rt3352.c => drivers/clocksource/timer-ralink.c (91%)
> 
> Gentle ping on this patch series :-)

I'm on it


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

