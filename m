Return-Path: <linux-mips+bounces-6505-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0259B34B8
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 16:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E9B51C21F0D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 15:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15E01DE3D1;
	Mon, 28 Oct 2024 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tq/YRZe6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410901DE3C3
	for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128981; cv=none; b=L9v/ANE7AF8LowFr5xNrFN7HnKqCia2GL6vFfiq8eUlMymVcjqz8V96EDZVy2RM4/DScJPCaWbjoofIyoerxYer7XTi+MSSB3o9TmyVDSPZ3TLUHt09swjSqLNGt2UEz7VuPUfP6TKLKa8d3pSmLhrSFolozjSQ6EOSOfWyUXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128981; c=relaxed/simple;
	bh=EhGA/w6VqPqGH4ru+TU5o22hT12tmtN1Fy7doR4H670=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuQC7IPJySn95AaHO0dn5s4Jnki4Qfq3j0P9tquCIrXBUs0dvfdw2+fhRuZTXk/gDsWZlSqJ1iEmD8ShN3FrC7vhll8yJ4fYJUqVHpMvrmlZfOgFggMVO9CftC5MA9wfQQhHDQzvBpC5TEK4RlA/5YfUqZbHk9E8H5fmA8l0/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tq/YRZe6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so45932545e9.2
        for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730128976; x=1730733776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hkXXAhpHynUOugoTbYUD7dUzU/PyL/JmJdDYDXegZA=;
        b=Tq/YRZe6k63akPD8f21mBuq4JXLYND0R5pLzZFyvMWgiU+rwS/J9XX3yH0FYua4MUj
         FOco5epZVo+cb9pqkWfSPi5y+FdfvQohQZuehNvRUx6swTkhv/pT6Hb3ndCzY4A/Sxpw
         YqovCSr2rJ+ZGB7EwITKTnQ2BTMxLfkUFpXrKsmQPSnFaLmrYEZl0Qt7Aq+k7nws+3LV
         1qEfpzCSt94LjQX/4zRI2vKoZjRK6avVZqXl1HjpV+wUVA1CNIp0wvBF3kTRqFsyksr9
         U6wRE0fIn2MMxNSFHR4i4pdggLF+7+292vTYU0MQfgOecEAAW6AAKYpLHqsNHDBbOVh8
         BLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128976; x=1730733776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hkXXAhpHynUOugoTbYUD7dUzU/PyL/JmJdDYDXegZA=;
        b=Khzn4k8WnhUV3ouxBMC1Fi1BIhitMKt09MCcRJsfILEy4U9xfAPmUizK+WCy2IMjoO
         kAoMj6c4tnCrNn3wn1FnRI7KR0Rdq43d7piercEKvMiEoPDgp3socSUo9GNXbMALmVDA
         jSDnyDeA8DCbG8BaQ9d5otQC0t+vQpivPOOUtBQ6LYOW05GvO8MikV0s0Rt6UmJrH98O
         1aA7C/KXu3qxq+Acah+DMpGXk+tXkjnzh44SEbbRvy7Gphl+rfaEDVG/dHAAaX/qs2ND
         1HiUm/yDp2BmDIfqjBuwW72cRkU4KPW/25a/FDz9BCfAPnSiorMs8jxX7s+Zu84ozNqD
         LVPg==
X-Forwarded-Encrypted: i=1; AJvYcCUMXNkf2n8aaw6PUH1LdrxcERWg5ZxnX+xLli5lzghky9zl4Vo5GiMNs9h64DmqrNCS/OBZnkKg3vYI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0uikob2PkbcWxnNu/McBzWc2R/ob3xfKAjjDjHrIkmhPZ8n7
	oHAzuzKYASdvxkdyTiZGIZPANb51yemqlIy059xyJaVsn7heYn8/wlz92hd+tRQ=
X-Google-Smtp-Source: AGHT+IFjfsCpRopIrxevt0qMq87ZyoBVAYz3eL9HnP4zBNZP/+ipXQpaMCoWpzrRvsMANonvUGeBNw==
X-Received: by 2002:a05:600c:3b86:b0:430:5356:ac92 with SMTP id 5b1f17b1804b1-4319ac7642emr76052185e9.7.1730128976419;
        Mon, 28 Oct 2024 08:22:56 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-431935a5943sm115111375e9.25.2024.10.28.08.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 08:22:56 -0700 (PDT)
Message-ID: <afda1ccc-d9fc-4025-b114-bd2ddf5f7ec1@linaro.org>
Date: Mon, 28 Oct 2024 16:22:55 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] clocksource: mips-gic-timer: Always use cluster
 0 counter as clocksource
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Serge Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
 <20241019071037.145314-6-arikalo@gmail.com>
 <3c98775b-b61b-478f-838e-59f8e1cf8aed@linaro.org>
 <Zx+qrRVdv5EGXbCF@alpha.franken.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Zx+qrRVdv5EGXbCF@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2024 16:15, Thomas Bogendoerfer wrote:
> On Mon, Oct 28, 2024 at 03:54:48PM +0100, Daniel Lezcano wrote:
>> On 19/10/2024 09:10, Aleksandar Rikalo wrote:
>>> From: Paul Burton <paulburton@kernel.org>
>>>
>>> In a multi-cluster MIPS system, there are multiple GICs - one in each
>>> cluster - each of which has its independent counter. The counters in
>>> each GIC are not synchronized in any way, so they can drift relative
>>> to one another through the lifetime of the system. This is problematic
>>> for a clock source which ought to be global.
>>>
>>> Avoid problems by always accessing cluster 0's counter, using
>>> cross-cluster register access. This adds overhead so it is applied only
>>> on multi-cluster systems.
>>>
>>> Signed-off-by: Paul Burton <paulburton@kernel.org>
>>> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
>>> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
>>> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
>>> Tested-by: Serge Semin <fancer.lancer@gmail.com>
>>> ---
>>
>> May I take this patch through the clocksource tree ?
> 
> sure, should be the best option.

Ok, thanks

Can you add your tag ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

