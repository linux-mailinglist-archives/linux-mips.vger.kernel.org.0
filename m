Return-Path: <linux-mips+bounces-4189-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87E92A76C
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 18:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34169B20C23
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 16:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549BD146A77;
	Mon,  8 Jul 2024 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNRjkqbl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D8145FED
	for <linux-mips@vger.kernel.org>; Mon,  8 Jul 2024 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720456574; cv=none; b=fMCaVqbzHXXA/UHmPJbXVBzZxAXQUoNeVPX4VxjY6VDhaC58bgEeqnWWwYUrtjLm86KqCMMGQzpAiBTEKLCCNjLBLOdtIhRxjmq6r4WLCP2xcwXqvdfhevYM2RkC4zXs+iyF9ayg7hn8h3vJlra9ljudQyInN0t05EsmIblSvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720456574; c=relaxed/simple;
	bh=kF79k4M0wfI5NybhocxG/V7HbuwRgXY/PbwykoiZ0u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NapL4CKC8a9TgmmNYufvuvFv5D9zQKVD8GjWWnIHU5wSYkwMh4f704y9SWMpvBkN29obg17lGL9nz470DedhqbmyKF/I7HpzCwFEgrM8R0xmdfBq4ryi4yg2T5bOh88hXvGi+FgsaNqLyUuqHLg7mSKZAEYz4YUDSzjJkVB8sMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNRjkqbl; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so20145771fa.1
        for <linux-mips@vger.kernel.org>; Mon, 08 Jul 2024 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720456569; x=1721061369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXr0BWZGWxSKsJl1B6BOaJ9LQX+PHNjm3zoOsNxl8ZY=;
        b=WNRjkqbloxri6luzKllXA5AfQc2ky71ytz6BqIkRQk96rqQG8aW5AeOcwXWA1G580x
         4KmMK0RygLZK463xytq8u9eVTEjv9FkSV1nXd7yHorchpyMAkh8nsj7ysZIdYFbRh02u
         uvg7DpyYAwiDhQgZa40yHx97o5+OC8yrxwERODd81iDXIYoRP51cW5MLuzZuKONz/4AX
         wmYUqmn4Sqh0jWijlKsngzCecWEi5hXnUG+pRKD8C0ygEqiFYCRtVLb5irzRkGpYa5tq
         y95Gt5nY5s7YxxalWjJ6UVhhs9bcP6NzcZMu6ur87JlrcZyKQ7vgrdYs1SmjvgsMqa71
         DjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720456569; x=1721061369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXr0BWZGWxSKsJl1B6BOaJ9LQX+PHNjm3zoOsNxl8ZY=;
        b=p+42Be+ueyZsFNZh0u2xS4WYh+WHyMAO+qOKH7GYaCt4tcC9ST57Dc89dJbVyXq4RH
         4gguquJ06lC4xRMUBpivRzJm8MH+ZEhRnkiwPlAkjBtowWRBdlX9hGHttF65qzrJiSYM
         JPilKIWk+rWnIjngfUcvXPJk7xaDEI0DvH4WcSyL2pnQAdABGyYCemqJVu1R5f2gjkjc
         yQ1GkSqJLgKwLcMhWutULlgw8Ma3jfzeDSiBLBltr3L9V/IheCHEkaj88VHrsNKPAeNU
         /+0YuIDWh530BEWvEWk3EX/oy3OLtMjpz8ycAv8xZYbMRz3gPZXwvolIKqLv5Q1aGULI
         D2tA==
X-Forwarded-Encrypted: i=1; AJvYcCVEAwmGYAFqK6ZSIKI4/Q13EQMmRFaKjGzJpch0+5w6enjuVGbGfYhWTKcrwaDYCShkbe7fW9qSs6dk4G5C8gCh/goWQAlpd7sslg==
X-Gm-Message-State: AOJu0YzTnfQo0q+w73WmHldNXvv2a+dTtp9MYgdGcGB/njp3y/tQKXn0
	nfE+WNb7blayNtuFfhiMAAZPwTTonDUtUTbaGfJVJEd76iwCoX9sei6MixpIUHgheTW4K7VLYqD
	Y
X-Google-Smtp-Source: AGHT+IFwhURRS94WBKV1QcWHN4yHD3pCaXhUL3ZA3yoqhHrsgcoWidzDCWKI/z1AIwjXQyKRTVK+EA==
X-Received: by 2002:a2e:a792:0:b0:2ec:4f0c:36f9 with SMTP id 38308e7fff4ca-2eeb3169f11mr2339051fa.36.1720456569321;
        Mon, 08 Jul 2024 09:36:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf24:cce:17df:12ab? ([2a05:6e02:1041:c10:cf24:cce:17df:12ab])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5f51sm5021515e9.25.2024.07.08.09.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:36:08 -0700 (PDT)
Message-ID: <bf4a45e9-4ed3-4d3b-bb96-add20a71b04c@linaro.org>
Date: Mon, 8 Jul 2024 18:36:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] clocksource: mips-gic-timer: Always use cluster
 0 counter as clocksource
To: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Serge Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-8-aleksandar.rikalo@syrmia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240511104341.151550-8-aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/05/2024 12:43, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> In a multi-cluster MIPS system we have multiple GICs - one in each
> cluster - each of which has its own independent counter. The counters in
> each GIC are not synchronised in any way, so they can drift relative to
> one another through the lifetime of the system. This is problematic for
> a clocksource which ought to be global.
> 
> Avoid problems by always accessing cluster 0's counter, using
> cross-cluster register access. This adds overhead so we only do so on
> systems where we actually have CPUs present in multiple clusters.
> For now, be extra conservative and don't use gic counter for vdso or
> sched_clock in this case.
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> ---

Applied patch 7 and 8

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


