Return-Path: <linux-mips+bounces-3329-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F578D000C
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 14:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42E07B211B2
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 12:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056F615DBD1;
	Mon, 27 May 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsIexbuJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B038FA6
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813116; cv=none; b=PKe6z7zWe362xHgdwgV/gmFxZr00M0nbu2V/qcRVtFycbRB8g0mpcDT4Xm8+vBRBejf6YsGDF00GdBmOHxVQbLySOLnfBQiMxE3eolqQDIqlXs0MRt8oS/rGtv8Ehms7g5GLD87bNmy6vzo+MtXaT8rwh9Wx1VxR8mr4iGaVg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813116; c=relaxed/simple;
	bh=Pg81kNExncHYgEH65vSq7ojtlVX7662uOZgf0mLJfUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQtaAC7+QOVZ4Rqfl69NEX+fK6BDrYklv0V/1/EkwE+ecGfqvrP2+8kL1LgBKsbWcR+yjKm0Bas9kcI4n/ej2Vgc/LqWZvKqedxgu2vEaPelCoZrl9gbsd4RgvUlcq3khf8Pnt/ejDzD2FUICCgz4WBGbh3+BDw6RDcIbwAS7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsIexbuJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4202ca70289so78943295e9.1
        for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813113; x=1717417913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqjqewY/IWqR8PihupcnQhLFobAiXFGUHx0dGRIGDiE=;
        b=rsIexbuJjyNEa/dKDfM1aRwhZGAtmS5ZClYc1zegIOXlHOVE7QuNCoSsXSr7VRKRLw
         GefYKXyHyEZT8KCVRLzM5lwAJzgUPsHK8cSkLw+CiCOpM9ENBUe2SO7BZa8lOepAa1Qb
         I7EixgpxRQQ8Bd3elXEcs2Em9w6BDOe1WTni3iFb+6/0s6kKC7C5X700RjBURAm9XOGG
         PROYpSDrqWJU0fNXghfj4Lu0mbSHUKPlrLO6+rQSe/9Ury54n/n4WC5gVD5EJqiQtNb/
         /VQ7WEI+oTW8xatO7yh9yFi6ACxFZbfTIripFQ5wBQD+E1t+18f183DrX3IO9ca4KbvK
         AYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813113; x=1717417913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqjqewY/IWqR8PihupcnQhLFobAiXFGUHx0dGRIGDiE=;
        b=jpruDqdYubOwZP/vOEal9NLYE7Mj5wIWlURJHxe6cY53QAGD0Q4zr4NtCHT+Ek6pMO
         SAQVPgY/XQakY6cPebfvnZPb2vlklbHQvt0RBeXfeB8lVoHbxeciIA/QI8LCIp2yWaJX
         LQTcj9nC5yFJDz5MTg6bW7xQCjwekXhH2PMRkpyxerVLyvL48y8flLtLpuzN2ZAHjlu7
         L8YZRNxjauf8Z/bANB2FbIP1jTYY0f4k8J33QWTU7ZqBVyrqqRbrHk/k5ZBKYzlm56Tg
         REJnoMVo1HA3jHoOR2FYbeN+7fSRUKXSahLbZOOxcCNVhQjZc/+Lz/LIYCsEefnRL3yw
         g4eA==
X-Forwarded-Encrypted: i=1; AJvYcCWAHhUK03cDBEJRa+sOFgEe9U0g0eL4BfMebxXYhWNMgbEG5oORMwFlWQ8MX+4QAK5g8cnb7FBiUc8hpk/IMJey6m89KBC9Uizl1Q==
X-Gm-Message-State: AOJu0YzqAqtIwDrOHqyEAvR2qAYP7WTU0AU+ox0IiObBXb1meWqQjV5o
	NerT9LMs2+3QaPgKvlEjbVzaJbVviDl5r1CXz6paNqdLX9tx42Ga/Ytw0YuiUXq3VeAYwUKCe3V
	9H7U=
X-Google-Smtp-Source: AGHT+IH4Kh0h4/Hczoc0Zp0xPOSEe6v0ZhamuCceNxDEYLUCUwyJEorjIWlpkcHWZTjNRoyxbVymmg==
X-Received: by 2002:adf:f801:0:b0:354:eb62:3653 with SMTP id ffacd0b85a97d-3552fdc8090mr6257038f8f.53.1716813092584;
        Mon, 27 May 2024 05:31:32 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-356c8daef27sm6814638f8f.115.2024.05.27.05.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:31:32 -0700 (PDT)
Message-ID: <06b06b65-8eb7-43f6-8fb5-e5663876edb5@linaro.org>
Date: Mon, 27 May 2024 14:31:29 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/14] clocksource: mips-gic-timer: Enable counter when
 CPUs start
To: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Serge Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-9-aleksandar.rikalo@syrmia.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240511104341.151550-9-aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 12:43, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> In multi-cluster MIPS I6500 systems we have a GIC in each cluster, each
> with its own counter. When a cluster powers up the counter will be
> stopped, with the COUNTSTOP bit set in the GIC_CONFIG register.
> 
> In single cluster systems it has been fine for us to clear COUNTSTOP
> once in gic_clocksource_of_init() in order to start the counter, since
> with only one cluster we know that we won't be resetting that cluster's
> GIC at any point (ignoring suspend/resume cycles which would need to
> handle clearing COUNTSTOP in the resume path). Once we support
> multi-cluster systems this will only have started the counter in the
> boot cluster, and any CPUs in other clusters will find their counter
> stopped which will break the GIC clock_event_device.
> 
> Resolve this by having CPUs clear the COUNTSTOP bit when they come
> online, using the existing gic_starting_cpu() CPU hotplug callback. This
> will allow CPUs in secondary clusters to ensure that the cluster's GIC
> counter is running as expected.
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> ---
>   drivers/clocksource/mips-gic-timer.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


